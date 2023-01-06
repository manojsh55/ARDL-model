**Import Data ****
import delimited "C:\Users\Manoj\Desktop\Pesticides use\FAOSTAT_data_en_11-30-2022.csv"

***Covert wide to long data of FAOSTAT**********
reshape wide value, i(year country) j(indicators)

**Rename the labeling***
label variable useperarea "Use per area of cropland (kg/ha)"

label variable usepercapita "Use per capita (kg/ha)"

label variable usepervalueagproduction "Use per value of agricultural production (kg/1000 Int.$)"

**Graphing
xtline useperarea, overlay
xtline usepercapita, overlay
xtline usepervalueagproduction, overlay


**Graph with specific orders****

xtline useperarea, overlay plot1opts(lcolor("255 0 0") lwidth(medthick) lpattern(solid)) plot2opts(lwidth(medthick)) plot3opts(lwidth(medthick) lpattern(solid)) plot4opts(lwidth(medthick) lpattern(solid)) plot5opts(lwidth(medthick) lpattern(solid)) plot6opts(lwidth(medthick) lpattern(solid)) plot7opts(lwidth(medthick)) yscale(lwidth(vvvthick)) legend(on size(small) margin(zero) lalign(center) region(fcolor(none) margin(zero)) position(11) ring(0)) scheme(economist) scale(0.8)

xtline usepercapita, overlay plot1opts(lcolor("255 0 0") lwidth(medthick) lpattern(solid)) plot2opts(lwidth(medthick)) plot3opts(lwidth(medthick) lpattern(solid)) plot4opts(lwidth(medthick) lpattern(solid)) plot5opts(lwidth(medthick) lpattern(solid)) plot6opts(lwidth(medthick) lpattern(solid)) plot7opts(lwidth(medthick)) yscale(lwidth(vvvthick)) legend(on size(small) margin(zero) lalign(center) region(fcolor(none) margin(zero)) position(11) ring(0)) scheme(economist) scale(0.8)

xtline value3, overlay plot1opts(lcolor("255 0 0") lwidth(medthick) lpattern(solid)) plot2opts(lwidth(medthick)) plot3opts(lwidth(medthick) lpattern(solid)) plot4opts(lwidth(medthick) lpattern(solid)) plot5opts(lwidth(medthick) lpattern(solid)) plot6opts(lwidth(medthick) lpattern(solid)) plot7opts(lwidth(medthick)) yscale(lwidth(vvvthick)) legend(on size(small) margin(zero) lalign(center) region(fcolor(none) margin(zero)) position(11) ring(0)) scheme(economist) scale(0.8)

***Import the data of Nepal only**
import delimited "C:\Users\Manoj\Desktop\Pesticides use\Nepal pesticide use.csv"

import excel "C:\Users\Manoj\Desktop\Pesticides use\Pesticide Use_South Asia.xlsx", sheet("Sheet4") firstrow
import excel "C:\Users\Manoj\OneDrive - Kansas State University\Pesticides use\Pesticide Use_South Asia.xlsx", sheet("Sheet5") firstrow

tsset Year

**logarithmic conversion**

gen lnpesticide = ln(Pesticideuse)
gen labor = ln(Laborforcetotal)
gen livestock = ln(TotallivestockBuffalocattle)
gen cereal = ln( CerealsTotalproductiontonne)
gen fertilizer = ln(Fertilizerconsumptionkilogram)
gen emission = ln(EmissionsCO2eqAR5AG)
gen pesticide = log(Pesticideuse)
gen labor = log(Laborforcetotal)
gen livestock = log(TotallivestockBuffalocattle)
gen cereal = log( CerealsTotalproductiontonne)
gen fertilizer = log(Fertilizerconsumptionkilogram)
gen emission = log(EmissionsCO2eqAR5AG)
gen methane = log(EmissionsCO2eqfromCH4AR5)
gen N2O = log(EmissionsCO2eqfromN2OAR5)     
gen rice = log(AreaharvestedofRiceha)


                      

tsline lnpesticide labor livestock cereal fertilizer emission

gen arablelandpercent = log(Arablelandoflandarea)
gen arableland = log(Arablelandhectares)
gen population = log(Populationtotal)
gen AVApercent = log(Agricultureforestryandfishi)
gen CO2perkg = log(CO2emissionskgper2015USo)
gen CO2emission = log(CO2emissionsmetrictonsperc)
gen export = log(Exportsofgoodsandservices)
gen fertilizer = log(Fertilizerconsumptionkilogram)
gen GDP = log(GDPconstant2015US)
gen GDPpercapita = log(GDPpercapitaconstant2015US)
gen tradeopenness = log(TradeofGDP)
gen FDI = log(Foreigndirectinvestmentneti)
gen ruralpop = log(Ruralpopulation)
gen agmethane = log(Agriculturalmethaneemissions)
gen avaconstant = log(P)
gen methanefromfood = log(Methaneemmisionfromsolidfood)
gen labor = log(Laborforcetotal)
gen pesticideuse = log(Pesticideuse)
gen cereal = log( CerealsTotalproductiontonne)
gen livestock = log( TotallivestockBuffalocattle)
gen emision = log(EmissionsCO2eqAR5AG)
gen meat = log( MeatTotal)
gen milk = log( MilkTotal)
gen rainfall = log( Annualprecipitation)
gen maxtemp = log(Maximumtemperature)
gen mintemp = log(Minimumtemperature)
gen temp = log(Averageannualmeantemperature)
gen methane = log(EmissionsCO2eqfromCH4AR5)
gen N2O = log(EmissionsCO2eqfromN2OAR5)     
gen ricearea = log(AreaharvestedofRiceha)
gen riceprod = log(Riceproductiontonnes)

swilk Averageannualmeantemperature Annualprecipitation Maximumtemperature Minimumtemperature rainfall

**Stationarity test*** At level (with inntercept and trend+ intercept); AT first differences (with intercept and trend+intercept)
varsoc cereal
dfuller cereal, lags(3)
dfuller cereal, trend lags(3)
dfuller d.cereal, lags(3)
dfuller d.cereal, trend lags(3)

varsoc meat
dfuller meat, lags(1)
dfuller meat, trend lags(1)
dfuller d.meat, lags(1)
dfuller d.meat, trend lags(1)

dfuller agmethane, lags(0)
dfuller agmethane, trend lags(0)
dfuller agmethane, lags(1)
dfuller agmethane, trend lags(1)

dfuller mintemp, lags(0)
dfuller mintemp, trend lags(0)
dfuller mintemp, lags(1)
dfuller mintemp, trend lags(1)

dfuller maxtemp, lags(0)
dfuller maxtemp, trend lags(0)
dfuller maxtemp, lags(1)
dfuller maxtemp, trend lags(1)

dfuller temp, lags(0)
dfuller temp, trend lags(0)
dfuller temp, lags(1)
dfuller temp, trend lags(1)

dfuller rainfall, lags(0)
dfuller rainfall, trend lags(0)
dfuller rainfall, lags(1)
dfuller rainfall, trend lags(1)

dfuller fertilizer, lags(0)
dfuller fertilizer, trend lags(0)
dfuller fertilizer, lags(1)
dfuller fertilizer, trend lags(1)

dfuller pesticideuse, lags(0)
dfuller pesticideuse, trend lags(0)
dfuller pesticideuse, lags(1)
dfuller pesticideuse, trend lags(1)

dfuller emission, lags(0)
dfuller emmision, trend lags(0)
dfuller emmision, lags(1)
dfuller emmision, trend lags(1)



dfuller milk, lags(0)
dfuller milk, trend lags(0)
dfuller milk, lags(1)
dfuller milk, trend lags(1)



dfuller tradeopenness, lags(0)
dfuller tradeopenness, trend lags(0)
dfuller tradeopenness, lags(1)
dfuller tradeopenness, trend lags(1)

dfuller GDP, lags(0)
dfuller GDP, trend lags(0)
dfuller GDP, lags(1)
dfuller GDP, trend lags(1)

dfuller GDPpercapita, lags(0)
dfuller GDPpercapita, trend lags(0)
dfuller GDPpercapita, lags(1)
dfuller GDPpercapita, trend lags(1)

dfuller CO2emission, lags(0)
dfuller CO2emission, trend lags(0)
dfuller CO2emission, lags(1)
dfuller CO2emission, trend lags(1)

dfuller CO2perkg, lags(0)
dfuller CO2perkg, trend lags(0)
dfuller CO2perkg, lags(1)
dfuller CO2perkg, trend lags(1)

dfuller AVApercent, lags(0)
dfuller AVApercent, trend lags(0)
dfuller AVApercent, lags(1)
dfuller AVApercent, trend lags(1)

dfuller labor, lags(0)
dfuller labor, trend lags(0)
dfuller labor, lags(1)
dfuller labor, trend lags(1)




dfuller agmethane, lags(0)
dfuller agmethane, trend lags(0)
dfuller agmethane, lags(1)
dfuller agmethane, trend lags(1)













dfuller avaconstant, lags(0)
dfuller avaconstant, trend lags(0)
dfuller avaconstant, lags(1)
dfuller avaconstant, trend lags(1)

dfuller methane, lags(0)
dfuller methane, trend lags(0)
dfuller methane, lags(1)
dfuller methane, trend lags(1)

dfuller rice, lags(0)
dfuller rice, trend lags(0)
dfuller rice, lags(1)
dfuller rice, trend lags(1)

dfuller livestock, lags(0)
dfuller livestock, trend lags(0)
dfuller livestock, lags(1)
dfuller livestock, trend lags(1)

dfuller rainfall, lags(0)
dfuller rainfall, trend lags(0)
dfuller rainfall, lags(1)
dfuller rainfall, trend lags(1)







##Figure
tsline logmeat
tsline cereal
tsline livestock
tsline emmision
tsline meat
tsline milk
tsline rainfall
tsline maxtemp
tsline mintemp


***ARDL modeling
ardl cereal mintemp maxtemp tradeopenness rainfall avaconstant pesticideuse, aic
ardl cereal mintemp maxtemp tradeopenness rainfall avaconstant pesticideuse, aic regstore (ecreg)
estimates restore ecreg
regress
estat dwatson
estat bgodfrey, lags(1)
estat imtest, white
cusum6 cereal mintemp maxtemp tradeopenness rainfall avaconstant pesticideuse, cs(cusum) lw(lower) uw(upper)
drop cusum upper lower


***ARDL modeling: Cereal = f(........)
ardl cereal mintemp maxtemp tradeopenness rainfall avaconstant pesticideuse, maxlags(2)
ardl cereal mintemp maxtemp tradeopenness rainfall avaconstant pesticideuse, lags(1 0 1 1 2 0 2) ec 
estat ectest
ardl cereal mintemp maxtemp tradeopenness rainfall avaconstant pesticideuse, lags(1 0 1 1 2 0 2) ec regstore (ecreg)
estimates restore ecreg
estat dwatson
estat bgodfrey, lags(1)
estat hettest
estat ovtest
estat vif
estat imtest, white
cusum6 cereal mintemp maxtemp tradeopenness rainfall avaconstant pesticideuse, cs(cusum) lw(lower) uw(upper)

***ARDL modeling: Cereal = f(........) without minimum and maximum temperature
ardl cereal temp tradeopenness rainfall avaconstant pesticideuse, maxlags(2)
ardl cereal temp tradeopenness rainfall avaconstant pesticideuse, lags(1 0 1 1 2 0 2) ec 
estat ectest
ardl cereal mintemp maxtemp tradeopenness rainfall avaconstant pesticideuse, lags(1 0 1 1 2 0 2) ec regstore (ecreg)
estimates restore ecreg
estat dwatson
estat bgodfrey, lags(1)
estat hettest
estat ovtest
estat vif
estat imtest, white
cusum6 cereal mintemp maxtemp tradeopenness rainfall avaconstant pesticideuse, cs(cusum) lw(lower) uw(upper)




ardl cereal agmethane mintemp maxtemp rainfall, maxlags(3) ec
estat btest
ardl agmethane mintemp maxtemp rainfall, maxlags(3) ec
estat btest
ardl meat agmethane mintemp maxtemp rainfall, maxlags(3) ec
estat btest
ardl agmethane mintemp maxtemp rainfall, maxlags(3) ec
estat btest



ardl cereal agmethane temp rainfall, lags(2 4 4 3) ec
estat btest
estat dwatson
estat durbinalt, lags(1/4) small
estat bgodfrey, lags(1/4) small
estat hettest
estat ovtest
estat vif
estat imtest, white
cusum6 cereal agmethane temp rainfall, cs(cusum) lw(lower) uw(upper)


ardl agmethane cereal temp rainfall, lags(3 3 3 3) ec
estat btest
estat dwatson
estat bgodfrey, lags(1)
estat hettest
estat ovtest
estat vif
estat imtest, white

ardl meat agmethane temp rainfall, lags(2 0 0 2) ec
estat btest
estat dwatson 
estat bgodfrey, lags(1)
estat hettest
estat ovtest
estat vif
estat imtest, white

ardl agmethane meat temp rainfall, lags(3 2 3 0) ec
estat btest
estat dwatson
estat bgodfrey, lags(1)
estat hettest
estat ovtest
estat vif
estat imtest, white
cusum6 agmethane meat temp rainfall, cs(cusum) lw(lower) uw(upper)

**Stationarity test***
pperron cereal 
pperron cereal, trend
pperron d.cereal
pperron d.cereal, trend

pperron meat 
pperron meat , trend
pperron d.meat 
pperron d.meat , trend

pperron temp 
pperron temp, trend
pperron d.temp
pperron d.temp, trend

pperron rainfall 
pperron rainfall, trend
pperron d.rainfall
pperron d.rainfall, trend

pperron agmethane 
pperron agmethane, trend
pperron d.agmethane
pperron d.agmethane, trend


ardl cereal agmethane temp rainfall, lags(4 2 4 4) ec
estat btest
estat dwatson
estat durbinalt, lags(1/4) small
estat bgodfrey, lags(1/4) small
estat hettest
estat ovtest


ardl cereal agmethane temp rainfall, lags(4 2 4 3) ec
estat btest
estat dwatson
estat durbinalt, lags(1/4) small
estat bgodfrey, lags(1/4) small
estat hettest
estat ovtest

ardl cereal agmethane temp rainfall, lags(1 4 4 3) ec
estat btest
estat dwatson
estat durbinalt, lags(1/4) small
estat bgodfrey, lags(1/4) small
estat hettest
estat ovtest

ardl cereal agmethane temp rainfall, lags(2 4 4 3) ec
estat btest
estat dwatson
estat durbinalt, lags(1/4) small
estat bgodfrey, lags(1/4) small
estat hettest
estat ovtest

ardl cereal agmethane temp rainfall, lags(3 1 4 3) ec
estat btest
estat dwatson
estat durbinalt, lags(1/4) small
estat bgodfrey, lags(1/4) small
estat hettest
estat ovtest

ardl cereal agmethane temp rainfall, lags(3 1 4 3) ec
estat btest
estat dwatson
estat durbinalt, lags(1/4) small
estat bgodfrey, lags(1/4) small
estat hettest
estat ovtest






