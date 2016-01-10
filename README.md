# Topic model of Helsingin Sanomat 1905


The material used for this topic model is the first full volume of Helsingin Sanomat newspaper. It was launched in July of 1904 after its predecessor Päivälehti was shut down, in the aftermath of the assassination of Finland’s General-Governor Bobrikov. 
The material is available for all to see in the Finnish National Library’s digitized archive. However I used the raw text material which is on the course server. 

The data was first downloaded to Rstudio in lemmatized form, and then cleaned up. Removing capital letters, numbers, punctuation and white space. Also, stopwords were removed. I actually added a few words to the stopword list that is included in the tm package. This was mostly done because there were few words that suffered so badly from OCR errors and that were so frequent in the data that they had to be removed. Although, even then the finnish stopword-list is not very comprehensive, and in retrospect I think that I should have added more words to the list.  I think that the results would have been more accurate if the data was a bit cleaner. Also, there was quite a bit of OCR errors in the data. 

After cleaning up the corpus, it was then transformed into a document term matrix to do the LDA on. There was however some lines or documents that were empty so the code didn’t work properly, so I had to remove the empty lines from the DTM. After doing so the code LDA worked fine. Although there were some problems, as I was running the code on the server set up for the course, and it ended up crashing a few times. 

All the steps on cleaning the data and doing the LDA, are based on the code that was introduced to us on the lecture on topic modeling. So in the end it is pretty much the same code with a few tweaks. 

==========================================================================

TOPICS

The topics I identified, I tried to name them as well as I could, but some of the topics were pretty ambiguous. Also, I'm not quite sure if I figured out how the relevance metric slider worked properly, or I'm not sure if I found the "sweet spot" on all of the topics. 

1. Finnish politics and news: hallituspuolue, kunnallinenasetus, lisäjäsen, kuntakokous, hallitusmies, piiritoimisto, kuntalainen, kouluhallitus. Also words probably relating to daily news: murha, syytös, kiihotus, soimaus, kieltäminen. Alhtough, some of these words might also be related to the politics aspect of this topic. 

2. religion / life: words such as: ihminen, jumala, sielu, sydän, maailma, nähdä, rakkaus, hymyillä, aurinko, lintu, elämä, lukea.

3. Mostly unintelligible words full of OCR errors. 

4. Education/education politics: Words like: Reaalilyseo, tiedekunta, sijainen, lyseo, apuraha, tyttökoulu, konsistori, koululaitos, filos, klassillinen, määräraha, senaatti, lehtori. The topic had also some irrelevant words for education, for example: surra, vainaja, rautatiehallitus. Most of the topic was related to education however. 

5. mostly grammatical words. However, some related to politics: puolue, senaatti. Depending on the position of the relevance metric slider suurlakko also comes up, but in that case most of the other words except joulu are full of OCR errors and thus unintelligible. 

6. crime and disease: poliisi, todistaja, poliisiasema, poliisitutkinto, puukotus, murhayritys, puukko, kurkkumätä, tuhkarokko, kirurginen, isorokko, keuhkotulehdus, poliisikuulustelu, kosntaapeli, punatauti, sikotauti etc. 

7. Russo-Japanese peace talks: Roosevelt, Portsmouth, rauhansopimus, rauhanehto. Some other political terms also, and quite a few different nations mentioned here. 

8. more national/local politics: lakko, kokous, perustuslaillinen, kansalliskaarti, komitea, suomi, päättää, äänioikeus, kansalainenkokous etc.

9. newspaper advertisements and announcements 

10. newspaper advertisements and announcements

11. business, education: kansakoulu, markka, rahatoimikamari, johtokunta, hakea, huutokauppakamari, virka, huutokauppa, asunto, koulu, miesopettaja etc.  

12. legal: varatuomari, asianajaja, lakiasiaintoimisto and some business advertisements. Mainly adresses and names, this suggests that these are announcements for legal counseling etc.

13.train timetables

14. Russia, news and culture: talonpoika, sato, Odessa, duuma, kasakka, puola, pietarinen, mellakka, taiteilija, näytellä, ilmestyä, runo, kirja, keskinkertainen. Mostly words concerning culture. 

15. unintelligible words full of OCR errors.

16. government: sääty, mietintö, puhemies, valiokunta, valtiosääty, istunto, kutsunta, pakkokeino, perustuslaki, hallitsija, eduskunta, majesteetti, yhteiskuntajärjestys. etc. 

17. Russo-Japanese war: japanilainen, armeija, risteilijä, taistelu, amiraali, tokio, kenraali, tappio, upseeri, sota, kiina, tykki, laivasto etc. 

18. court verdicts?: tuomio, syyttäjä, kantaja, vastaaja, tuomari, tuomiokunta, tuomita. Also a lot of names and titles. 

19. concerts, theatre & culture: musiikkidraama, pääsylippu, filharmooninen, torvisoittokunta, lippumyymälä, huvinäytelmä, palokunnantalo etc. Also, strangely the words that most often occurred in this topic were höyrylaiva and höyryl. Perhaps some events centered around launching of a new steamboat or so?

20. mail & health: postiasema, klinikka, postitoimisto, sisäänkirj, lähetys, kulkutauti, sairashuone, kirjelaatikko etc. 

====================================================================

A SHORT ANALYSIS

Some main points that came up in the topic model. 

First of all, I was quite surprised that the general strike in Finland that took place in the October through November was not more, or nearly at all visible in the topic model. I think that there was only a few occurrences of that in the material, and even then it was only to be seen if the relevance slider was positioned just right. Although, topic number 8 has some terms that could be considered as connected to the general strike. Such as: kansalliskaarti, komitea, lakko, kokous. This might be connected to the meetings held in Helsinki and Turku to form strike comities and national guard to keep the order after the russian police and gendarmes could not maintain public order anymore. But all in all the general strike was not very visible in the topic model. It can also be that the strike was so late in the year that it affects on how much the newspapers had time to report on it and its aftermath. So it could be that it might be more prominent topic if one would do a topic model of the newspapers in 1906. 

Politics seems to be probably the most prominent topic in the model, unsurprisingly. There are three topics centered around politics and government (1, 8, 16) these form about 18% of the whole model. Most of the politics seem to be about national or Finnish politics. In a way that is not a very big surprise as it is mainly a local newspaper however, Finland was a part of Russia at the time and there was a revolution in russia during 1905 to which the general strike is also connected. I'm a bit surprised that the Russian revolution did not feature in the model very much. On the other hand the Russo-Japanese war is found on two topics (7, 17) and makes up nearly 10% of the whole model. Most of it concerning the peace talks and the peace treaty signed in September of 1905. The peace treaty might also be one of the reasons why the model centers around Finnish politics mostly, as it meant, with the Russian revolution an end to the first period of oppression in Finnish history. 

Then there are everyday news concerning crime and disease, education, culture as one would expect to find in a newspaper. Also, quite a few topics were about advertisement. I think that topics 9 through 12 are mostly advertisements. Topics 9 and 10 are just pure advertisement. Topic 11 could be some bulletins from the chamber of commerce. Also, there is quite a lot of education related words there and some words concerning apartments. So it is not purely advertisement, but maybe more of classified advertisements. The 12th topic seems also to be classified ads, but probably for legal help and law firms. 

===========

CLOSING

In the end I feel that I probably could have done the model a bit better. The data was not properly cleaned because the list for finnish stopwords was not sufficient. I just could not figure out how to import a more comprehensive list of stopwords. I could have done it the way I added those few that bothered me the most when I first did the LDA (like "omorfiversiongnugplv" which was actually the most frequent word in the data somehow), but I think it would have taken me so much time that it would not have been very sensible. Inspite of that, I think that the topic model works fairly well and one can make some sort of analysis even though there are quite a lot of stopwords in the data left.

