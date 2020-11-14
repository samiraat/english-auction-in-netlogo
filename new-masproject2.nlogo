globals [list1 list2 list3 list4 lists1 listb1 list11 lists2 listb2 lists3 listb3 lists4 auction-number flag1 flag2 flag3 number-of-bidder maxbid1 maxbid2 maxbid3 startprice
rond1 rond2 rond3 rond4 rond5 rond6 offer1 offer3 offer2 winner-price plot-po maxabuy-eng maxbbuy-eng maxcbuy-eng maxasell-eng maxbsell-eng maxcsell-eng maxdsell-eng
maxabuy-vick maxbbuy-vick maxcbuy-vick maxasell-vick maxbsell-vick maxcsell-vick maxdsell-vick n mablaghejj mablaghejjvick plot1 plot2]
breed [object car]
breed [carexihi carexihibitor]
object-own [ cartype start-price sold who-buy who-sell ]
carexihi-own [car-type minprice bid maxbid agent-numbersell howmuchsell-eng howmuchsell-vick ]
to setup
  clear-all
  create-object 1 [
    setxy 0 4
    set size 3
    set shape "car"
    set color white
  ]
  create-carexihi 1 [
    setxy -4 0
    set size 3
    set shape "face happy"
    set color green
  ]
 create-carexihi 1 [
    setxy 0 0
    set size 3
    set shape "face happy"
    set color green
  ]
  create-carexihi 1 [
    setxy 4 0
    set size 3
    set shape "face happy"
    set color green
  ]
  create-carexihi 1 [
    setxy 8 0
    set size 3
    set shape "face happy"
    set color green
  ]
  set list1 []
  set list2 []
  set list3 []
  set list4 []
  set lists1 []
  set listb1 []
  set list11 []
  set lists2 []
  set listb2 []
  set lists3 []
  set listb3 []
  set lists4 []
  set auction-number 1

  ; read from files input1
 ask carexihibitor 1 [ file-open "input1.txt"
  while [not file-at-end?]
   [
    let line []
    set line file-read-line
   ;   show line
    set list11 lput line list11

  ]
    file-close ]
 ; print (word "list anget 1 " list11)

  ; read from files input2
 ask carexihibitor 2[ file-open "input2.txt"
  while [not file-at-end?]
   [
    let line []
    set line file-read-line
  ;  show line
    set list2 lput line list2
  ]
    file-close ]
   ; read from files input3
 ask carexihibitor 3 [ file-open "input3.txt"
  while [not file-at-end?]
   [
    let line []
    set line file-read-line
  ;  show line
    set list3 lput line list3
  ]
    file-close ]
   ; read from files input2
 ask carexihibitor 4 [ file-open "input4.txt"
  while [not file-at-end?]
   [
    let line []
    set line file-read-line
   ; show line
    set list4 lput line list4
  ]
    file-close ]
  ask carexihibitor 1 [set list1 [["BUY" "McLaren_570S" 11000] ["SELL" "Mazda_MX_5" 20000] [ "BUY" "Porsche_911_Carrera-S" 31000]]
    foreach list1 [ [x] -> ifelse item 0 x = "SELL" [ set lists1 lput x lists1
    ;  print (word " lists " lists1)
      ]
      [set listb1 lput x listb1
 ; print (word " listb " listb1 )
  ] ]]
  ask carexihibitor 2 [set list2 [["SELL" "McLaren_570S" 10000] ["BUY" "Mazda_MX_5" 21000]["SELL" "Porsche_911_Carrera-S" 30000] ["BUY" "BMW_M2" 19000] ["SELL" "Fiat_124_Spider" 10000]
                      ["BUY" "Mercedes_AMG_C63_Coupe" 51000]["SELL" "Porsche_Cayman" 40000] ["SELL" "Mercedes_AMG_GT" 50000] ["BUY" "Jaguar_F_Type" 59000] ["SELL" "Nissan_GT_R" 70000]
                      ["BUY" "Ferrari_California_T" 81000] ["SELL" "Bentley_Flying_Spur" 90000]]
                        foreach list2 [ [x] -> ifelse item 0 x = "SELL" [
                        set lists2 lput x lists2
                     ;  print (word " lists " lists1)
                              ]
                          [set listb2 lput x listb2
                  ; print (word " listb " listb1 )
                    ] ] ]
  ask carexihibitor 3 [set list3 [["BUY" "McLaren_570S" 11000] ["SELL" "Mazda_MX_5" 20000] ["BUY" "Porsche_911_Carrera-S" 29000]["SELL" "BMW_M2" 20000]["BUY" "Fiat_124_Spider" 11000]
                      ["SELL" "Mercedes_AMG_C63_Coupe" 50000]["BUY" "Porsche_Cayman" 41000]["BUY" "Mercedes_AMG_GT" 51000]["SELL" "Jaguar_F_Type" 60000]]
                         foreach list3 [ [x] -> ifelse item 0 x = "SELL" [
                          set lists3 lput x lists3
                         ;  print (word " lists " lists1)
                             ]
                       [set listb3 lput x listb3
                       ; print (word " listb " listb1 )
                         ] ]]
  ask carexihibitor 4 [set list4 [["SELL" "McLaren_570S" 10000]["SELL" "Mazda_MX_5" 20000]["SELL" "Porsche_911_Carrera-S" 30000]]
                       foreach list4 [ [x] -> if item 0 x = "SELL" [
                       set lists4 lput x lists4
                       ;  print (word " lists " lists1)
                         ]
                         ] ]

  set flag1 false
  set flag2 false
  set flag3 false
  set number-of-bidder 0
  set maxabuy-eng 0
  set maxbbuy-eng 0
  set maxcbuy-eng 0
  set maxasell-eng 0
  set maxbsell-eng 0
  set maxcsell-eng 0
  set maxdsell-eng 0
  set maxabuy-vick 0
  set maxbbuy-vick 0
  set maxcbuy-vick 0
  set maxasell-vick 0
  set maxbsell-vick 0
  set maxcsell-vick 0
  set maxdsell-vick 0
  set n 0
  set mablaghejj 0
  clear-all-plots
  reset-ticks
end

to go
  if (any? object with [color = pink ]) [stop]
  start-auction-eng
  start-auction-vickry

end
to start-auction-eng
  print ( " ****** start english Auction******")


    foreach lists1 [ [x] ->
       ask carexihibitor 1 [
      set car-type item 1 x
      set minprice item 2 x
      set agent-numbersell 1
      set howmuchsell-eng 0
      print (word "%%%%% auction starts : %%%%% " auction-number )
      print (word "minprice start with auctioneer : " minprice )
      print (word "for sale : " car-type )
      print (word "auction from car exihibitor number : " agent-numbersell )
      ask object [
        set label item 2 x
        set cartype item 1 x
        set start-price item 2 x
        set startprice item 2 x
        set who-sell 1  ]


    ]
    who-contribute item 1 x 1
  ]
  make-offer-win 1
  ask carexihi [set bid 0
                  set label 0]
  set maxasell-eng [howmuchsell-eng] of carexihibitor 1
  set mablaghejj [howmuchsell-eng] of carexihibitor 1 ;- startprice
  set-current-plot "how much money"
  plot mablaghejj
  set plot1 [howmuchsell-eng] of carexihibitor 1 - startprice
  set-current-plot "mablaghe jabeja shode"
  plot plot1
;  print ( word " mablagh " plot1 )
;  print ( word " how sell " [howmuchsell-eng] of carexihibitor 1 )
  set-current-plot "number of buy in a tick"
    plot 1
  set flag1 false
  set flag2 false
  set flag3 false
  set n 0

    foreach lists2 [ [x] ->
     ask carexihibitor 2 [
      set car-type item 1 x
      set minprice item 2 x
      set agent-numbersell 2
      set auction-number auction-number + 1
      print (word "%%%%% auction starts : %%%%% " auction-number )
      print (word "minprice start with auctioneer : " minprice )
      print (word "for sale : " car-type )
      print (word "auction from car exihibitor number : " agent-numbersell )
      ask object [
        set label item 2 x
        set cartype item 1 x
        set start-price item 2 x
        set startprice item 2 x
        set who-sell 2
        set sold 0 ]

    ]
    who-contribute item 1 x 2
    make-offer-win 2
     ifelse [howmuchsell-eng] of carexihibitor 2 = 0 [
      set mablaghejj 0
      set plot1 0
      set-current-plot "number of buy in a tick"
      plot 0]
    [set mablaghejj [howmuchsell-eng] of carexihibitor 2 ;- startprice
      set plot1 [howmuchsell-eng] of carexihibitor 2 - startprice
      set-current-plot "number of buy in a tick"
      plot 1]
    set-current-plot "how much money"
    plot mablaghejj
    set-current-plot "mablaghe jabeja shode"
    plot plot1
    set flag1 false
    set flag2 false
    set flag3 false
    set n 0
    ask carexihi [set bid 0
                  set label 0]

    set maxbsell-eng [howmuchsell-eng] of carexihibitor 2 + maxbsell-eng
;    print ( word " mablagh " plot1 )
;  print ( word " how sell " [howmuchsell-eng] of carexihibitor 2 )
  ]


  foreach lists3 [ [x] ->
     ask carexihibitor 3 [
      set car-type item 1 x
      set minprice item 2 x
      set agent-numbersell 3
      set auction-number auction-number + 1
      set howmuchsell-eng 0
      print (word "%%%%% auction starts : %%%%% " auction-number )
      print (word "minprice start with auctioneer : " minprice )
      print (word "for sale : " car-type )
      print (word "auction from car exihibitor number : " agent-numbersell )
      ask object [
        set label item 2 x
        set cartype item 1 x
        set start-price item 2 x
        set startprice item 2 x
        set who-sell 3
        set sold 0 ]

    ]
    who-contribute item 1 x 3
    make-offer-win 3
     ifelse [howmuchsell-eng] of carexihibitor 3 = 0 [
      set mablaghejj 0
      set plot1 0
       set-current-plot "number of buy in a tick"
        plot 0  ]
    [set mablaghejj [howmuchsell-eng] of carexihibitor 3 ;- startprice
      set plot1 [howmuchsell-eng] of carexihibitor 3 - startprice
       set-current-plot "number of buy in a tick"
        plot 1]
    set-current-plot "how much money"
    plot mablaghejj
     set-current-plot "mablaghe jabeja shode"
    plot plot1
 ;   print ( word " mablagh " plot1 )
 ; print ( word " how sell " [howmuchsell-eng] of carexihibitor 3 )
    set flag1 false
    set flag2 false
    set flag3 false
    set n 0
    set maxcsell-eng [howmuchsell-eng] of carexihibitor 3 + maxcsell-eng
    ask carexihi [set bid 0
                  set label 0]
  ]

   foreach lists4 [ [x] ->
     ask carexihibitor 4 [
      set car-type item 1 x
      set minprice item 2 x
      set agent-numbersell 4
      set howmuchsell-eng 0
      set auction-number auction-number + 1
      print (word "%%%%% auction starts : %%%%% " auction-number )
      print (word "minprice start with auctioneer : " minprice )
      print (word "for sale : " car-type )
      print (word "auction from car exihibitor number : " agent-numbersell )
      ask object [
        set label item 2 x
        set cartype item 1 x
        set start-price item 2 x
        set startprice item 2 x
        set who-sell 4
        set sold 0 ]

    ]
    who-contribute item 1 x 4
    make-offer-win 4
    set mablaghejj [howmuchsell-eng] of carexihibitor 4 ;- startprice
    set-current-plot "how much money"
    plot mablaghejj
    set-current-plot "number of buy in a tick"
    plot 1
    set plot1 [howmuchsell-eng] of carexihibitor 4 - startprice
    set-current-plot "mablaghe jabeja shode"
    plot plot1
;    print ( word " mablagh " plot1 )
;  print ( word " how sell " [howmuchsell-eng] of carexihibitor 4 )
    set maxdsell-eng [howmuchsell-eng] of carexihibitor 4 + maxdsell-eng
    set flag1 false
    set flag2 false
    set flag3 false
    set n 0
    ask carexihi [set bid 0
                  set label 0]
  ]
  ask object [set label 0
              ]
end
to who-contribute [ a b ]
 set number-of-bidder 0
  if b = 1 [
    ask carexihibitor 2[
      foreach listb2[
      [y] ->
      if  a = item 1 y [
        set flag2 true
        set maxbid item 2 y
        set maxbid2 item 2 y
        print ( "who participate : car-exihibitor 2" )
        set number-of-bidder number-of-bidder + 1 ]
    ]
  ]
  ask carexihibitor 3[
      foreach listb3[
      [y] ->
      if  a = item 1 y [
        set flag3 true
        set maxbid item 2 y
        set maxbid3 item 2 y
        print ( "who participate : car-exihibitor 3" )
        set number-of-bidder number-of-bidder + 1]
    ]
  ]
  ]
  if b = 2 [
    ask carexihibitor 1[
      foreach listb1[
      [y] ->
      if  a = item 1 y [
        set flag1 true
        set maxbid item 2 y
        set maxbid1 item 2 y
        print ( "who participate : car-exihibitor 1" )
        set number-of-bidder number-of-bidder + 1 ]
    ]
  ]
  ask carexihibitor 3[
      foreach listb3[
      [y] ->
      if  a = item 1 y [
        set flag3 true
        set maxbid item 2 y
        set maxbid3 item 2 y
        print ( "who participate : car-exihibitor 3" )
        set number-of-bidder number-of-bidder + 1]
    ]
  ]
  ]
  if b = 3 [
    ask carexihibitor 1[
      foreach listb1[
      [y] ->
      if  a = item 1 y [
        set flag1 true
        set maxbid item 2 y
        set maxbid1 item 2 y
        print ( "who participate : car-exihibitor 1" )
        set number-of-bidder number-of-bidder + 1 ]
    ]
  ]
  ask carexihibitor 2[
      foreach listb2[
      [y] ->
      if  a = item 1 y [
        set flag2 true
        set maxbid item 2 y
        set maxbid2 item 2 y
        print ( "who participate : car-exihibitor 2" )
        set number-of-bidder number-of-bidder + 1]
    ]
  ]
  ]

  if b = 4 [
    ask carexihibitor 1[
      foreach listb1[
      [y] ->
      if  a = item 1 y [
        set flag1 true
        set maxbid item 2 y
        set maxbid1 item 2 y
        print ( "who participate : car-exihibitor 1" )
        set number-of-bidder number-of-bidder + 1 ]
    ]
  ]
  ask carexihibitor 2[
      foreach listb2[
      [y] ->
      if  a = item 1 y [
        set flag2 true
        set maxbid item 2 y
        set maxbid2 item 2 y
        print ( "who participate : car-exihibitor 2" )
        set number-of-bidder number-of-bidder + 1]
    ]
  ]
     ask carexihibitor 3[
      foreach listb3[
      [y] ->
      if  a = item 1 y [
        set flag3 true
        set maxbid item 2 y
        set maxbid3 item 2 y
        print ( "who participate : car-exihibitor 3" )
        set number-of-bidder number-of-bidder + 1]
    ]
  ]
  ]

   print (word "number of bidder that participate : " number-of-bidder )
  if number-of-bidder = 0 [
    tick
    print (" No one Want to buy   ")
    ask carexihi [ set howmuchsell-eng 0
                    set howmuchsell-vick 0]
    set-current-plot "number of buy in a tick"
    plot 0
    set-current-plot "number of buy in vick"
    plot 0
    set-current-plot "how much money"
    plot 0
    set-current-plot "mablaghe jabeja shode"
    plot 0
    set-current-plot "how much money vick"
    plot 0
    set-current-plot "mablaghe jabeja shode vick"
     plot 0
    ask object [ set sold 0 ]
  ]
;  set number-of-bidder 0

end
to make-offer-win [ c]
  set rond1 0
  set rond2 0
  set rond3 0
  set rond4 0
  set rond5 0
  set rond6 0
  set offer1 0
  set offer3 0
  set winner-price 0
  set n 0


  if c = 1 [

  if flag2 = true  [
     tick

     ask carexihibitor 2 [
        ifelse maxbid2 > startprice [
           let temp random ( 200 )
          ;let temp random ( maxbid2 - startprice )
          set bid  ( temp ) + startprice
          set label bid
          set n n + 1
          print (word " offer agent 2 :" bid )
        ]
        [set bid maxbid2
          set n n + 1
          print (word " offer agent 2 :" bid )]
    ]
    set-current-plot "how much money"
    plot 0
    set-current-plot "mablaghe jabeja shode"
    plot 0
    set-current-plot "number of buy in a tick"
    plot 0
 ;     tick

 ;     set rond1 max[bid] of carexihi
  ;     if maxbid2 > startprice [
  ;    ask carexihibitor 2 [
  ;         let temp random ( 150 )
          ;let temp random ( maxbid3 - startprice )
  ;        set bid  ( temp ) + rond1
         ; set startprice bid
 ;         set label bid
 ;         print (word " offer agent 2 :" bid )
 ;   ]
 ;     ]
 ;     tick
 ;     set rond2 max[bid] of carexihi
 ;     ask carexihibitor 2 [
 ;        if maxbid2 > startprice [
 ;          let temp random ( 150 )
          ;let temp random ( maxbid3 - startprice )
 ;         set bid  ( temp ) + rond2
         ; set startprice bid
 ;         set label bid
 ;         print (word " offer agent 2 :" bid )
 ;   ]
 ;     ]
 ;     tick
 ;     set rond3 max[bid] of carexihi
 ;     ask carexihibitor 2 [
 ;        if maxbid2 > startprice [
 ;          let temp random ( 150 )
          ;let temp random ( maxbid3 - startprice )
;          set bid  ( temp ) + rond3
         ; set startprice bid
 ;         set label bid
 ;         print (word " offer agent 2 :" bid )
 ;   ]
 ;     ]
 ;     tick
 ;     set rond4 max[bid] of carexihi
 ;     ask carexihibitor 2 [
 ;        if maxbid2 > startprice [
 ;          let temp random ( 150 )
          ;let temp random ( maxbid3 - startprice )
 ;         set bid  ( temp ) + rond4
         ; set startprice bid
 ;         set label bid
 ;         print (word " offer agent 2 :" bid )
 ;   ]
 ;     ]
      tick
      if n = 1 [
      set winner-price [bid] of carexihibitor 2
      print ( "the winner is : car-exihibitor 2"  )
      print ( word "the final/sold price : " winner-price )
      set maxbbuy-eng winner-price + maxbbuy-eng
      ask carexihibitor 1 [set howmuchsell-eng winner-price]
      ask object [ set sold 1 ]
    ]
    ]

  ]
  if c = 2 [

    if flag1 = true and flag3 = true [
      tick
      ask carexihibitor 1 [
        ifelse maxbid1 > startprice [
           let temp random ( 200 )
          ;let temp random ( maxbid1 - startprice )
          set bid  ( temp ) + startprice
          set label bid
          set offer1 bid
          set n n + 1
          print (word " offer agent 1 :" bid )
        ]
          [set bid maxbid1
          set offer1 bid
          set n n + 1
          print (word " offer agent 1 :" bid ) ]
      ]
        ask carexihibitor 3 [
        ifelse maxbid3 > startprice [
           let temp random ( 200 )
          ;let temp random ( maxbid3 - startprice )
          set bid  ( temp ) + startprice
          set offer3 bid
          set n n + 1
          set label bid
          print (word " offer agent 3 :" bid )
        ]
        [ set bid maxbid3
          set offer3 bid
          set n n + 1
          print (word " offer agent 3 :" bid ) ]
      ]
    set-current-plot "how much money"
    plot 0
    set-current-plot "mablaghe jabeja shode"
    plot 0
    set-current-plot "number of buy in a tick"
    plot 0

      if [bid ] of carexihibitor 3 > startprice and n = 2[
      tick
     set rond1 max[bid] of carexihi
      if [bid ] of carexihibitor 1 > startprice [
       ask carexihibitor 1 [

           let temp random ( 200 )
          ;let temp random ( maxbid1 - startprice )
          set bid  ( temp ) + rond1
          set label bid
          print (word " offer agent 1 :" bid )

          ]
      ]
      if [bid ] of carexihibitor 3 > startprice [
        ask carexihibitor 3 [

           let temp random ( 200 )
          ;let temp random ( maxbid3 - startprice )
          set bid  ( temp ) + rond1
          set label bid
          print (word " offer agent 3 :" bid )
      ]
      ]
    set-current-plot "how much money"
    plot 0
    set-current-plot "mablaghe jabeja shode"
    plot 0
    set-current-plot "number of buy in a tick"
    plot 0
    tick

    set rond2 max[bid] of carexihi
       ask carexihibitor 1 [
           let temp random ( 200 )
          ;let temp random ( maxbid1 - startprice )
          set bid  ( temp ) + rond2
          set label bid
          print (word " offer agent 1 :" bid )

      ]
      if [bid ] of carexihibitor 3 > startprice [
        ask carexihibitor 3 [

           let temp random ( 200 )
          ;let temp random ( maxbid3 - startprice )
          set bid  ( temp ) + rond2
          set label bid
          print (word " offer agent 3 :" bid )
      ]
      ]
    set-current-plot "how much money"
    plot 0
    set-current-plot "mablaghe jabeja shode"
    plot 0
    set-current-plot "number of buy in a tick"
    plot 0
      tick

      set rond3 max[bid] of carexihi
       ask carexihibitor 1 [
           let temp random ( 200 )
          ;let temp random ( maxbid1 - startprice )
          set bid  ( temp ) + rond3
          set label bid
          print (word " offer agent 1 :" bid )

      ]
      if [bid ] of carexihibitor 3 > startprice [
        ask carexihibitor 3 [
           let temp random ( 200 )
          ;let temp random ( maxbid3 - startprice )
          set bid  ( temp ) + rond3
          set label bid
          print (word " offer agent 3 :" bid )
      ]
      ]
    set-current-plot "how much money"
    plot 0
    set-current-plot "mablaghe jabeja shode"
    plot 0
    set-current-plot "number of buy in a tick"
    plot 0
      tick

      set rond4 max[bid] of carexihi
       ask carexihibitor 1 [
           let temp random ( 200 )
          ;let temp random ( maxbid1 - startprice )
          set bid  ( temp ) + rond4
          set label bid
          set offer1 bid
          print (word " offer agent 1 :" bid )

      ]
      if [bid ] of carexihibitor 3 > startprice [
        ask carexihibitor 3 [
           let temp random ( 200 )
          ;let temp random ( maxbid3 - startprice )
          set bid  ( temp ) + rond4
          set label bid
           set offer3 bid
          print (word " offer agent 3 :" bid )
      ]
      ]
     set-current-plot "how much money"
    plot 0
    set-current-plot "mablaghe jabeja shode"
    plot 0
     set-current-plot "number of buy in a tick"
    plot 0
      ]
      tick
      ifelse offer1 >= offer3 [
        set winner-price offer1
        print ( "the winner is : car-exihibitor 1"  )
        print ( word "the final/sold price : " winner-price )
        set maxabuy-eng winner-price + maxabuy-eng
        ask carexihibitor 2 [set howmuchsell-eng winner-price]
        ask object [ set sold 1 ]
      ]
      [set winner-price offer3
        print ( "the winner is : car-exihibitor 3"  )
        print ( word "the final/sold price : " winner-price )
        set maxcbuy-eng winner-price + maxcbuy-eng
        ask carexihibitor 2 [set howmuchsell-eng winner-price]
        ask object [ set sold 1 ]
      ]

  ]
    if flag3 = true and flag1 = false [
      tick
     ask carexihibitor 3 [
        ifelse maxbid3 > startprice [
           let temp random ( 200 )
          ;let temp random ( maxbid3 - startprice )
          set bid  ( temp ) + startprice
          set label bid
          set n n + 1
          print (word " offer agent 3 :" bid )
        ]
        [set bid maxbid3
          set n n + 1
          print (word " offer agent 3 :" bid )]
    ]
       set-current-plot "how much money"
    plot 0
      set-current-plot "mablaghe jabeja shode"
    plot 0
      set-current-plot "number of buy in a tick"
    plot 0
;      tick
;      set rond1 max[bid] of carexihi
;       if maxbid3 > startprice [
;      ask carexihibitor 3 [
;           let temp random ( 150 )
          ;let temp random ( maxbid3 - startprice )
;          set bid  ( temp ) + rond1
         ; set startprice bid
;          set label bid
;          print (word " offer agent 3 :" bid )
;    ]
;      ]
;      tick
;      set rond2 max[bid] of carexihi
;      ask carexihibitor 3 [
;         if maxbid3 > startprice [
;           let temp random ( 150 )
          ;let temp random ( maxbid3 - startprice )
;          set bid  ( temp ) + rond2
         ; set startprice bid
;          set label bid
;          print (word " offer agent 3 :" bid )
;    ]
;      ]
;      tick
;      set rond3 max[bid] of carexihi
;      ask carexihibitor 3 [
;         if maxbid3 > startprice [
;           let temp random ( 150 )
          ;let temp random ( maxbid3 - startprice )
;          set bid  ( temp ) + rond3
         ; set startprice bid
;          set label bid
;          print (word " offer agent 3 :" bid )
;    ]
;      ]
;      tick
;      set rond4 max[bid] of carexihi
;      ask carexihibitor 3 [
;         if maxbid3 > startprice [
;           let temp random ( 150 )
          ;let temp random ( maxbid3 - startprice )
;          set bid  ( temp ) + rond4
         ; set startprice bid
;          set label bid
;          print (word " offer agent 3 :" bid )
;    ]
;      ]
      tick
      if n = 1[
      ifelse [bid] of carexihibitor 3 > startprice [
      set winner-price [bid] of carexihibitor 3
      print ( "the winner is : car-exihibitor 3"  )
      print ( word "the final/sold price : " winner-price )
      set maxcbuy-eng winner-price + maxcbuy-eng
      ask carexihibitor 2 [set howmuchsell-eng winner-price]
      ask object [ set sold 1 ]
    ]
      [print (" Not sold  , Not found a good buyer! ")
        ask carexihibitor 3 [set howmuchsell-eng 0] ]
      ]
    ]


      if flag1 = true and flag3 = false [
      tick
     ask carexihibitor 1 [
        ifelse maxbid1 > startprice [
           let temp random ( 200 )
          ;let temp random ( maxbid1 - startprice )
          set bid  ( temp ) + startprice
          set label bid
          set n n + 1
          print (word " offer agent 1 :" bid )
        ]
        [set bid maxbid1
          set n n + 1
          print (word " offer agent 1 :" bid )]
    ]
       set-current-plot "how much money"
    plot 0
      set-current-plot "mablaghe jabeja shode"
    plot 0
      set-current-plot "number of buy in a tick"
    plot 0
;      tick
;      set rond1 max[bid] of carexihi
;       if maxbid1 > startprice [
;      ask carexihibitor 1 [
;           let temp random ( 150 )
          ;let temp random ( maxbid3 - startprice )
;          set bid  ( temp ) + rond1
         ; set startprice bid
;          set label bid
;          print (word " offer agent 1 :" bid )
;    ]
;      ]
;      tick
;      set rond2 max[bid] of carexihi
;      ask carexihibitor 1 [
;         if maxbid1 > startprice [
;           let temp random ( 150 )
          ;let temp random ( maxbid3 - startprice )
;          set bid  ( temp ) + rond2
         ; set startprice bid
;          set label bid
;          print (word " offer agent 1 :" bid )
;    ]
;      ]
;      tick
;      set rond3 max[bid] of carexihi
;      ask carexihibitor 1 [
;         if maxbid1 > startprice [
;           let temp random ( 150 )
          ;let temp random ( maxbid3 - startprice )
;          set bid  ( temp ) + rond3
         ; set startprice bid
;          set label bid
;          print (word " offer agent 1 :" bid )
;    ]
;      ]
;     tick
;      set rond4 max[bid] of carexihi
;      ask carexihibitor 1 [
;         if maxbid1 > startprice [
;           let temp random ( 150 )
          ;let temp random ( maxbid3 - startprice )
;          set bid  ( temp ) + rond4
         ; set startprice bid
;          set label bid
;          print (word " offer agent 1 :" bid )
;    ]
;      ]

      tick
      if n = 1 [
        ifelse [bid] of carexihibitor 1 > startprice [
      set winner-price [bid] of carexihibitor 1
      print ( "the winner is : car-exihibitor 1"  )
        print ( word "the final/sold price : " winner-price )
      ask carexihibitor 2 [set howmuchsell-eng winner-price]
      set maxabuy-eng winner-price + maxabuy-eng
      ask object [ set sold 1 ]
        ]
        [print (" Not sold  , Not found a good buyer! ")
          ask carexihibitor 3 [set howmuchsell-eng 0] ]
    ]

    ]
    if flag1 = false and flag3 = false [
      tick
      print (" Not sold  , Not found a good buyer! ") ]
  ]

 if c = 3 [
    if flag2 = true and flag1 = false [
       tick
     ask carexihibitor 2 [
        ifelse maxbid2 > startprice [
           let temp random ( 200 )
          ;let temp random ( maxbid2 - startprice )
          set bid  ( temp ) + startprice
          set label bid
          set n n + 1
          print (word " offer agent 2 :" bid )
        ]
        [set bid maxbid2
          set n n + 1
         print (word " offer agent 2 :" bid ) ]
    ]
    set-current-plot "how much money"
    plot 0
    set-current-plot "mablaghe jabeja shode"
    plot 0
    set-current-plot "number of buy in a tick"
    plot 0
;      tick
;      set rond1 max[bid] of carexihi
;      if [bid] of carexihibitor 2 > startprice [
;      if maxbid2 > startprice [
;      ask carexihibitor 2 [
;           let temp random ( 150 )
          ;let temp random ( maxbid3 - startprice )
;          set bid  ( temp ) + rond1
         ; set startprice bid
;          set label bid
;          print (word " offer agent 2 :" bid )
;    ]
;      ]
;      ]
;      tick
;      set rond2 max[bid] of carexihi
;      if [bid] of carexihibitor 2 > startprice [
;      ask carexihibitor 2 [
;         if maxbid2 > startprice [
;           let temp random ( 150 )
          ;let temp random ( maxbid3 - startprice )
;          set bid  ( temp ) + rond2
         ; set startprice bid
;          set label bid
;          print (word " offer agent 2 :" bid )
;    ]
;      ]
;      ]
;      tick
;      set rond3 max[bid] of carexihi
;      if [bid] of carexihibitor 2 > startprice [
;      ask carexihibitor 2 [
;         if maxbid2 > startprice [
;           let temp random ( 150 )
          ;let temp random ( maxbid3 - startprice )
;          set bid  ( temp ) + rond3
         ; set startprice bid
;          set label bid
;          print (word " offer agent 2 :" bid )
;    ]
;      ]
;      ]
;      tick
;      set rond4 max[bid] of carexihi
;      ifelse [bid] of carexihibitor 2 > startprice [
;      ask carexihibitor 2 [
;         if maxbid2 > startprice [
;           let temp random ( 150 )
;          ;let temp random ( maxbid3 - startprice )
;          set bid  ( temp ) + rond4
;         ; set startprice bid
;          set label bid
;          print (word " offer agent 2 :" bid )
;    ]
;      ]

        tick
      if n = 1 [
      ifelse [bid] of carexihibitor 2 > startprice [
      set winner-price [bid] of carexihibitor 2
      print ( "the winner is : car-exihibitor 2"  )
      print ( word "the final/sold price : " winner-price )
        set maxbbuy-eng winner-price + maxbbuy-eng
        ask carexihibitor 3 [set howmuchsell-eng winner-price]
        ask object [ set sold 1 ]
        ]

      [
        print (" Not sold  , Not found a good buyer! ")
        ask carexihibitor 2 [set howmuchsell-eng 0]
      ]
      ]
  ]
  ]
 if c = 4 [

    if flag1 = true and flag3 = true [
      tick
      ask carexihibitor 1 [
        ifelse maxbid1 > startprice [
           let temp random ( 200 )
          ;let temp random ( maxbid1 - startprice )
          set bid  ( temp ) + startprice
          set label bid
          set n n + 1
          set offer1 bid
          print (word " offer agent 1 :" bid )
        ]
        [set bid maxbid1
          set offer1 bid
          set n n + 1
          print (word " offer agent 1 :" bid ) ]
      ]
        ask carexihibitor 3 [
        ifelse maxbid3 > startprice [
           let temp random ( 200 )
          ;let temp random ( maxbid3 - startprice )
          set bid  ( temp ) + startprice
          set label bid
          set n n + 1
          set offer3 bid
          print (word " offer agent 3 :" bid )
        ]
        [ set bid maxbid3
          set n n + 1
          set offer3 bid
          print (word " offer agent 3 :" bid ) ]
      ]
       set-current-plot "how much money"
    plot 0
      set-current-plot "mablaghe jabeja shode"
    plot 0
      set-current-plot "number of buy in a tick"
    plot 0

      if  [bid ] of carexihibitor 3 > startprice and n = 2 [
        tick
     set rond1 max[bid] of carexihi
      if [bid ] of carexihibitor 1 > startprice [
       ask carexihibitor 1 [

           let temp random ( 200 )
          ;let temp random ( maxbid1 - startprice )
          set bid  ( temp ) + rond1
          set label bid
          print (word " offer agent 1 :" bid )

      ]
      ]
      if [bid ] of carexihibitor 3 > startprice [
        ask carexihibitor 3 [

           let temp random ( 200 )
          ;let temp random ( maxbid3 - startprice )
          set bid  ( temp ) + rond1
          ;set startprice bid
          set label bid
          print (word " offer agent 3 :" bid )
      ]
      ]
    set-current-plot "how much money"
    plot 0
    set-current-plot "mablaghe jabeja shode"
    plot 0
    set-current-plot "number of buy in a tick"
    plot 0
    tick
    set rond2 max[bid] of carexihi
       ask carexihibitor 1 [
           let temp random ( 200 )
          ;let temp random ( maxbid1 - startprice )
          set bid  ( temp ) + rond2
          set label bid
          print (word " offer agent 1 :" bid )

      ]
      if [bid ] of carexihibitor 3 > startprice [
        ask carexihibitor 3 [

           let temp random ( 200 )
          ;let temp random ( maxbid3 - startprice )
          set bid  ( temp ) + rond2
          set label bid
          print (word " offer agent 3 :" bid )
      ]
      ]
    set-current-plot "how much money"
    plot 0
    set-current-plot "mablaghe jabeja shode"
    plot 0
    set-current-plot "number of buy in a tick"
    plot 0
      tick
      set rond3 max[bid] of carexihi
       ask carexihibitor 1 [
           let temp random ( 200 )
          ;let temp random ( maxbid1 - startprice )
          set bid  ( temp ) + rond3
          set label bid
          print (word " offer agent 1 :" bid )

      ]
      if [bid ] of carexihibitor 3 > startprice [
        ask carexihibitor 3 [
           let temp random ( 200 )
          ;let temp random ( maxbid3 - startprice )
          set bid  ( temp ) + rond3
          set label bid
          print (word " offer agent 3 :" bid )
      ]
      ]
      set-current-plot "how much money"
    plot 0
      set-current-plot "mablaghe jabeja shode"
    plot 0
      set-current-plot "number of buy in a tick"
    plot 0
      tick
      set rond4 max[bid] of carexihi
       ask carexihibitor 1 [
           let temp random ( 200 )
          ;let temp random ( maxbid1 - startprice )
          set bid  ( temp ) + rond4
          set label bid
          set offer1 bid
          print (word " offer agent 1 :" bid )

      ]
      if [bid ] of carexihibitor 3 > startprice [
        ask carexihibitor 3 [
           let temp random ( 200 )
          ;let temp random ( maxbid3 - startprice )
          set bid  ( temp ) + rond4
          set label bid
           set offer3 bid
          print (word " offer agent 3 :" bid )
      ]
      ]
      ]
      set-current-plot "how much money"
    plot 0
      set-current-plot "mablaghe jabeja shode"
    plot 0
      set-current-plot "number of buy in a tick"
    plot 0
      tick
      ifelse offer1 >= offer3 [
        set winner-price offer1
        print ( "the winner is : car-exihibitor 1"  )
        print ( word "the final/sold price : " winner-price )
        set maxabuy-eng winner-price + maxabuy-eng
        ask carexihibitor 4 [set howmuchsell-eng winner-price]
      ]
      [set winner-price offer3
        print ( "the winner is : car-exihibitor 3"  )
        print ( word "the final/sold price : " winner-price )
        set maxcbuy-eng winner-price + maxcbuy-eng
        ask carexihibitor 4 [set howmuchsell-eng winner-price]
      ]
      ask object [ set sold 1 ]

  ]
    if flag2 = true and flag1 = false and flag3 = false [
     tick
     ask carexihibitor 2 [
        ifelse maxbid2 > startprice [
           let temp random ( 200 )
          ;let temp random ( maxbid2 - startprice )
          set bid  ( temp ) + startprice
          set label bid
          set n n + 1
          print (word " offer agent 2 :" bid )
        ]
        [set bid maxbid2
          set n n + 1
          print (word " offer agent 2 :" bid )]
    ]
    set-current-plot "how much money"
    plot 0
    set-current-plot "mablaghe jabeja shode"
    plot 0
    set-current-plot "number of buy in a tick"
    plot 0
;      tick
;      set rond1 max[bid] of carexihi
;      ask carexihibitor 2 [
;         if maxbid2 > startprice [
;           let temp random ( 150 )
          ;let temp random ( maxbid3 - startprice )
;          set bid  ( temp ) + rond1
         ; set startprice bid
;          set label bid
;          print (word " offer agent 2 :" bid )
;    ]
;      ]
;      tick
;      set rond2 max[bid] of carexihi
;      ask carexihibitor 2 [
;         if maxbid2 > startprice [
;           let temp random ( 150 )
          ;let temp random ( maxbid3 - startprice )
;          set bid  ( temp ) + rond2
         ; set startprice bid
;          set label bid
;          print (word " offer agent 2 :" bid )
;    ]
;      ]
;      tick
;      set rond3 max[bid] of carexihi
;      ask carexihibitor 2 [
;         if maxbid2 > startprice [
;           let temp random ( 150 )
          ;let temp random ( maxbid3 - startprice )
;          set bid  ( temp ) + rond3
         ; set startprice bid
;          set label bid
;          print (word " offer agent 2 :" bid )
;    ]
;      ]
;      tick
;      set rond4 max[bid] of carexihi
;      ask carexihibitor 2 [
;         if maxbid2 > startprice [
;           let temp random ( 150 )
          ;let temp random ( maxbid3 - startprice )
;          set bid  ( temp ) + rond4
         ; set startprice bid
;          set label bid
;          print (word " offer agent 2 :" bid )
;    ]
;      ]
      tick
      if n = 1 [
        ifelse  [bid] of carexihibitor 2 > startprice [
      set winner-price [bid] of carexihibitor 2
      print ( "the winner is : car-exihibitor 2"  )
      print ( word "the final/sold price : " winner-price )
      set maxbbuy-eng winner-price + maxbbuy-eng
      ask carexihibitor 4 [set howmuchsell-eng winner-price]
      ask object [ set sold 1 ]
    ]
        [
        print (" Not sold  , Not found a good buyer! ")
        ask carexihibitor 2 [set howmuchsell-eng 0]
      ]
      ]
    ]
  ]
end

to-report who-maxbuy-eng
   if maxabuy-eng = 0 and maxbbuy-eng = 0 and maxcbuy-eng = 0 [
    report false
  ]
  if max (list  maxabuy-eng maxbbuy-eng maxcbuy-eng) = maxabuy-eng [
    report 1
  ]
  if max (list  maxabuy-eng maxbbuy-eng maxcbuy-eng) = maxbbuy-eng [
    report 2
  ]
  if max ( list  maxabuy-eng maxbbuy-eng maxcbuy-eng) = maxcbuy-eng [
    report 3
  ]

end

to-report who-maxsell-eng

  if maxasell-eng > maxbsell-eng and maxasell-eng > maxdsell-eng and maxasell-eng > maxcsell-eng   [
    report 1
  ]
  if  maxbsell-eng > maxcsell-eng and maxbsell-eng > maxasell-eng and maxbsell-eng > maxdsell-eng [
    report 2
  ]
    if  maxcsell-eng > maxbsell-eng and maxcsell-eng > maxdsell-eng and maxcsell-eng > maxasell-eng [
    report 3
  ]
   if  maxdsell-eng > maxbsell-eng and maxdsell-eng > maxasell-eng and maxdsell-eng > maxcsell-eng [
    report 4
  ]

end

to start-auction-vickry
    print ( " ****** start Vickry Auction******")
    set auction-number 1
    set flag1 false
    set flag2 false
    set flag3 false


    foreach lists1 [ [x] ->
     ask carexihibitor 1 [
      set car-type item 1 x
      set minprice item 2 x
      set agent-numbersell 1
      set howmuchsell-vick 0
      print (word "%%%%% auction starts : %%%%% " auction-number )
      print (word "minprice start with auctioneer : " minprice )
      print (word "for sale : " car-type )
      print (word "auction from car exihibitor number : " agent-numbersell )
      ask object [
        set label item 2 x
        set cartype item 1 x
        set start-price item 2 x
        set startprice item 2 x
        set who-sell 1  ]


    ]
    who-contribute item 1 x 1
  ]
  make-offer-win-vick 1
  ask carexihi [set bid 0
                  set label 0]
  set maxasell-vick [howmuchsell-vick] of carexihibitor 1
  set mablaghejjvick [howmuchsell-vick] of carexihibitor 1 ;- startprice
  set plot2 [howmuchsell-vick] of carexihibitor 1 - startprice
  set-current-plot "how much money vick"
  plot mablaghejjvick
  set-current-plot "number of buy in vick"
  plot 1
  set-current-plot "mablaghe jabeja shode vick"
  plot plot2
  set flag1 false
  set flag2 false
  set flag3 false
   print ( word"maxbbuy" maxbbuy-vick)

    foreach lists2 [ [x] ->
     ask carexihibitor 2 [
      set car-type item 1 x
      set minprice item 2 x
      set agent-numbersell 2
      set auction-number auction-number + 1
      print (word "%%%%% auction starts : %%%%% " auction-number )
      print (word "minprice start with auctioneer : " minprice )
      print (word "for sale : " car-type )
      print (word "auction from car exihibitor number : " agent-numbersell )
      ask object [
        set label item 2 x
        set cartype item 1 x
        set start-price item 2 x
        set startprice item 2 x
        set who-sell 2
        set sold 0 ]

    ]
    who-contribute item 1 x 2
    make-offer-win-vick 2
    set flag1 false
    set flag2 false
    set flag3 false
    ask carexihi [set bid 0
                  set label 0]
    ifelse [howmuchsell-vick] of carexihibitor 2 = 0 [
      set mablaghejjvick 0
      set plot2 0
       set-current-plot "number of buy in vick"
       plot 0]
    [set mablaghejjvick [howmuchsell-vick] of carexihibitor 2 ;- startprice
      set plot2 [howmuchsell-vick] of carexihibitor 2 - startprice
      set-current-plot "number of buy in vick"
       plot 1 ]
    set-current-plot "how much money vick"
    plot mablaghejjvick
    set-current-plot "mablaghe jabeja shode vick"
     plot plot2
    set maxbsell-vick [howmuchsell-vick] of carexihibitor 2 + maxbsell-vick
    print ( word"maxcbuy" maxcbuy-vick)
  ]

  foreach lists3 [ [x] ->
     ask carexihibitor 3 [
      set car-type item 1 x
      set minprice item 2 x
      set agent-numbersell 3
      set auction-number auction-number + 1
      set howmuchsell-vick 0
      print (word "%%%%% auction starts : %%%%% " auction-number )
      print (word "minprice start with auctioneer : " minprice )
      print (word "for sale : " car-type )
      print (word "auction from car exihibitor number : " agent-numbersell )
      ask object [
        set label item 2 x
        set cartype item 1 x
        set start-price item 2 x
        set startprice item 2 x
        set who-sell 3
        set sold 0 ]

    ]
    who-contribute item 1 x 3
    make-offer-win-vick 3
    set flag1 false
    set flag2 false
    set flag3 false
    ifelse [howmuchsell-vick] of carexihibitor 3 = 0 [
      set mablaghejjvick 0
      set plot2 0
       set-current-plot "number of buy in vick"
    plot 0 ]
    [set mablaghejjvick [howmuchsell-vick] of carexihibitor 3 ;- startprice
      set plot2 [howmuchsell-vick] of carexihibitor 3 - startprice
     set-current-plot "number of buy in vick"
    plot 1]
    set-current-plot "how much money vick"
    plot mablaghejjvick
     set-current-plot "mablaghe jabeja shode vick"
     plot plot2

     print ( word"maxbbuy" maxbbuy-vick)
    set maxcsell-vick [howmuchsell-vick] of carexihibitor 3 + maxcsell-vick
    ask carexihi [set bid 0
                  set label 0]
  ]

   foreach lists4 [ [x] ->
     ask carexihibitor 4 [
      set car-type item 1 x
      set minprice item 2 x
      set agent-numbersell 4
      set howmuchsell-vick 0
      set auction-number auction-number + 1
      print (word "%%%%% auction starts : %%%%% " auction-number )
      print (word "minprice start with auctioneer : " minprice )
      print (word "for sale : " car-type )
      print (word "auction from car exihibitor number : " agent-numbersell )
      ask object [
        set label item 2 x
        set cartype item 1 x
        set start-price item 2 x
        set startprice item 2 x
        set who-sell 4
        set sold 0 ]

    ]
    who-contribute item 1 x 4
    make-offer-win-vick 4
    set maxdsell-vick [howmuchsell-vick] of carexihibitor 4 + maxdsell-vick
    set flag1 false
    set flag2 false
    set flag3 false
    ask carexihi [set bid 0
                  set label 0]
     print ( word"maxbbuy" maxbbuy-vick)
    set mablaghejjvick [howmuchsell-vick] of carexihibitor 4 ;- startprice
    set-current-plot "how much money vick"
    plot mablaghejjvick
    set-current-plot "number of buy in vick"
    plot 1
    set plot2 [howmuchsell-vick] of carexihibitor 4 - startprice
    set-current-plot "mablaghe jabeja shode vick"
     plot plot2
  ]
  ask object [set label 0
              set color pink]
   print ( word"maxcbuy" maxcbuy-vick)
   print ( word"maxbbuy" maxbbuy-vick)
end

to make-offer-win-vick [ c ]
  set rond1 0
  set rond2 0
  set rond3 0
  set rond4 0
  set rond5 0
  set rond6 0
  set offer1 0
  set offer3 0
  set winner-price 0
  set n 0


  if c = 1 [

  if flag2 = true  [
     tick

     ask carexihibitor 2 [
        ifelse maxbid2 > startprice [
          ; let temp random ( 150 )
          let temp random ( maxbid2 - startprice )
          set bid  ( temp ) + startprice
          set label bid
          set n n + 1
          print (word " offer agent 2 :" bid )
        ]
        [ set bid maxbid2
          print (word " offer agent 2 :" bid )]

    ]
    set-current-plot "how much money vick"
    plot 0
    set-current-plot "mablaghe jabeja shode vick"
     plot 0
    set-current-plot "number of buy in vick"
    plot 0
    tick
      if n = 1 [
      set winner-price startprice
      print ( "the winner is : car-exihibitor 2"  )
      print ( word "the final/sold price : " winner-price )
      set maxbbuy-vick winner-price + maxbbuy-vick
      ask carexihibitor 1 [set howmuchsell-vick winner-price]
      ask object [ set sold 1 ]
    ]

    ]


  ]
  if c = 2 [

    if flag1 = true and flag3 = true [
      tick
      ask carexihibitor 1 [
        ifelse maxbid1 > startprice [
          let temp random ( maxbid1 - startprice )
          set bid  ( temp ) + startprice
          set label bid
          set offer1 bid
          set n n + 1
          print (word " offer agent 1 :" bid )
        ]
        [set bid maxbid1
          set offer1 bid
          set n n + 1
          print (word " offer agent 1 :" bid ) ]
      ]
        ask carexihibitor 3 [
        ifelse maxbid3 > startprice [
          let temp random ( maxbid3 - startprice )
          set bid  ( temp ) + startprice
          set label bid
          set offer3 bid
          set n n + 1
          print (word " offer agent 3 :" bid )
        ]
        [ set bid maxbid3
          set offer3 bid
          set n n + 1
          print (word " offer agent 3 :" bid ) ]
      ]
    set-current-plot "how much money vick"
    plot 0
      set-current-plot "mablaghe jabeja shode vick"
     plot 0
    set-current-plot "number of buy in vick"
    plot 0
      tick
      if n = 2 [
      ifelse [bid] of carexihibitor 3 < startprice [
        set winner-price startprice
        print ( "the winner is : car-exihibitor 1"  )
        print ( word "the final/sold price : " winner-price )
        set maxabuy-vick winner-price + maxabuy-vick
        ask carexihibitor 2 [set howmuchsell-vick winner-price]

      ]
      [ifelse offer1 >= offer3 [
        set winner-price offer3
        print ( "the winner is : car-exihibitor 1"  )
        print ( word "the final/sold price : " winner-price )
        set maxabuy-vick winner-price + maxabuy-vick
        ask carexihibitor 2 [set howmuchsell-vick winner-price]

      ]
      [set winner-price offer1
        print ( "the winner is : car-exihibitor 3"  )
        print ( word "the final/sold price : " winner-price )
        set maxcbuy-vick winner-price + maxcbuy-vick
        ask carexihibitor 2 [set howmuchsell-vick winner-price]

      ]
      ]
      ]

  ]
    if flag3 = true and flag1 = false [
      tick
     ask carexihibitor 3 [
        ifelse maxbid3 > startprice [
          let temp random ( maxbid3 - startprice )
          set bid  ( temp ) + startprice
          set label bid
          set n n + 1
          print (word " offer agent 3 :" bid )
        ]
        [ set bid maxbid3
          set offer3 bid
          print (word " offer agent 3 :" bid ) ]
    ]
    set-current-plot "how much money vick"
    plot 0
      set-current-plot "mablaghe jabeja shode vick"
     plot 0
    set-current-plot "number of buy in vick"
    plot 0
      tick
      if n = 1 [
      if maxbid3 > startprice [
      set winner-price startprice
      print ( "the winner is : car-exihibitor 3"  )
        print ( word "the final/sold price : " winner-price )
      ask carexihibitor 2 [set howmuchsell-vick winner-price]
      set maxcbuy-vick winner-price + maxcbuy-vick
      ask object [ set sold 1 ]
    ]
      ]

    ]
    if flag1 = false and flag3 = false [
      tick
      print (" Not sold  , Not found a good buyer! ")]
  ]

 if c = 3 [
    if flag2 = true and flag1 = false [
       tick
     ask carexihibitor 2 [
        ifelse maxbid2 > startprice [
          ; let temp random ( 150 )
          let temp random ( maxbid2 - startprice )
          set bid  ( temp ) + startprice
          set label bid
          set n n + 1
          print (word " offer agent 2 :" bid )
        ]
        [set bid maxbid2
          set n n + 1
         print (word " offer agent 2 :" bid ) ]
    ]
    set-current-plot "how much money vick"
    plot 0
      set-current-plot "mablaghe jabeja shode vick"
     plot 0
    set-current-plot "number of buy in vick"
    plot 0
      tick
      if n = 1[
      ifelse maxbid2 > startprice [
       set winner-price startprice
      print ( "the winner is : car-exihibitor 2"  )
      print ( word "the final/sold price : " winner-price )
        set maxbbuy-vick winner-price + maxbbuy-vick
        ask carexihibitor 3 [set howmuchsell-vick winner-price]
        ask object [ set sold 1 ]
    ]
      [
        print (" Not sold  , Not found a good buyer! ")
        ask carexihibitor 3 [set howmuchsell-vick 0]
        ]
      ]

  ]
  ]
 if c = 4 [

    if flag1 = true and flag3 = true [
      tick
      ask carexihibitor 1 [
        ifelse maxbid1 > startprice [
          ; let temp random ( 150 )
          let temp random ( maxbid1 - startprice )
          set bid  ( temp ) + startprice
          set label bid
          set offer1 bid
          set n n + 1
          print (word " offer agent 1 :" bid )
        ]
        [set bid maxbid1
          set offer1 bid
          set n n + 1
          print (word " offer agent 1 :" bid ) ]
      ]
        ask carexihibitor 3 [
        ifelse maxbid3 > startprice [
          ; let temp random ( 150 )
          let temp random ( maxbid3 - startprice )
          set bid  ( temp ) + startprice
          set label bid
          set offer3 bid
          set n n + 1
          print (word " offer agent 3 :" bid )
        ]
        [ set bid maxbid3
          set offer3 bid
          set n n + 1
          print (word " offer agent 3 :" bid ) ]
      ]
    set-current-plot "how much money vick"
    plot 0
      set-current-plot "mablaghe jabeja shode vick"
     plot 0
    set-current-plot "number of buy in vick"
    plot 0
      tick
      if n = 2 [
      if [bid] of carexihibitor 1 > startprice and [bid] of carexihibitor 3 > startprice [
      ifelse offer1 >= offer3 [
        set winner-price offer3
        print ( "the winner is : car-exihibitor 1"  )
        print ( word "the final/sold price : " winner-price )
        set maxabuy-vick winner-price + maxabuy-vick
        ask carexihibitor 4 [set howmuchsell-vick winner-price]
      ]
      [set winner-price offer1
        print ( "the winner is : car-exihibitor 3"  )
        print ( word "the final/sold price : " winner-price )
        set maxcbuy-vick winner-price + maxcbuy-vick
        ask carexihibitor 4 [set howmuchsell-vick winner-price]
      ]
      ]
      if [bid] of carexihibitor 1 > startprice and [bid] of carexihibitor 3 < startprice [

        set winner-price startprice
        print ( "the winner is : car-exihibitor 1"  )
        print ( word "the final/sold price : " winner-price )
        set maxabuy-vick winner-price + maxabuy-vick
        ask carexihibitor 4 [set howmuchsell-vick winner-price]
      ]
      ]

  ]

    if flag2 = true and flag1 = false and flag3 = false [
     tick
     ask carexihibitor 2 [
        if maxbid2 > startprice [
          ; let temp random ( 150 )
          let temp random ( maxbid2 - startprice )
          set bid  ( temp ) + startprice
          set label bid
          set n n + 1
          print (word " offer agent 2 :" bid )
        ]
    ]
    set-current-plot "how much money vick"
    plot 0
      set-current-plot "mablaghe jabeja shode vick"
     plot 0
    set-current-plot "number of buy in vick"
    plot 0
     tick
      if n = 1 [
      set winner-price startprice
      print ( "the winner is : car-exihibitor 2"  )
      print ( word "the final/sold price : " winner-price )
      set maxbbuy-vick winner-price + maxbbuy-vick
      ask carexihibitor 4 [set howmuchsell-vick winner-price]
      ask object [ set sold 1 ]
      ]

    ]

  ]

end
to-report who-maxbuy-vick
   if maxabuy-vick = 0 and maxbbuy-vick = 0 and maxcbuy-vick = 0 [
    report false
  ]
  if max (list  maxabuy-vick maxbbuy-vick maxcbuy-vick) = maxabuy-vick [
    report 1
  ]
  if max (list  maxabuy-vick maxbbuy-vick maxcbuy-vick) = maxbbuy-vick [
    report 2
  ]
  if max ( list  maxabuy-vick maxbbuy-vick maxcbuy-vick) = maxcbuy-vick [
    report 3
  ]

end
to-report who-maxsell-vick

  if maxasell-vick > maxbsell-vick and maxasell-vick > maxdsell-vick and maxasell-vick > maxcsell-vick   [
    report 1
  ]
  if  maxbsell-vick > maxcsell-vick and maxbsell-vick > maxasell-vick and maxbsell-vick > maxdsell-vick [
    report 2
  ]
    if  maxcsell-vick > maxbsell-vick and maxcsell-vick > maxdsell-vick and maxcsell-vick > maxasell-vick [
    report 3
  ]
   if  maxdsell-vick > maxbsell-vick and maxdsell-vick > maxasell-vick and maxdsell-vick > maxcsell-vick [
    report 4
  ]

end
@#$#@#$#@
GRAPHICS-WINDOW
210
10
647
448
-1
-1
13.0
1
10
1
1
1
0
1
1
1
-16
16
-16
16
0
0
1
ticks
30.0

BUTTON
83
34
146
67
NIL
setup
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
83
91
146
124
NIL
go
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

PLOT
659
30
859
180
number of buy in a tick
tick
number of buy
0.0
50.0
0.0
2.0
true
false
"" ""
PENS
"default" 1.0 0 -4699768 true "" ""

PLOT
892
30
1092
180
how much money
tick
money
0.0
50.0
0.0
51000.0
true
false
"" ""
PENS
"default" 1.0 0 -4699768 true "" ""

MONITOR
21
149
193
194
who most buy in eng
who-maxbuy-eng
17
1
11

MONITOR
21
214
186
259
who most sell in eng
who-maxsell-eng
17
1
11

PLOT
661
222
861
372
number of buy in vick
tick
number of buy
0.0
35.0
0.0
2.0
true
false
"" ""
PENS
"default" 1.0 0 -2674135 true "" ""

PLOT
883
221
1083
371
how much money vick
tick
money
0.0
35.0
0.0
51000.0
true
false
"" ""
PENS
"default" 1.0 0 -2674135 true "" ""

MONITOR
34
280
161
325
who most buy in vick
who-maxbuy-vick
17
1
11

MONITOR
35
340
159
385
who most sell in vick
who-maxsell-vick
17
1
11

PLOT
1109
29
1309
179
mablaghe jabeja shode
tick
money
0.0
50.0
0.0
1000.0
true
false
"" ""
PENS
"default" 1.0 0 -5825686 true "" ""

PLOT
1112
220
1312
370
mablaghe jabeja shode vick
tick
money
0.0
35.0
0.0
1000.0
true
false
"" ""
PENS
"default" 1.0 0 -2139308 true "" ""

@#$#@#$#@
## WHAT IS IT?

(a general understanding of what the model is trying to show or explain)

## HOW IT WORKS

(what rules the agents use to create the overall behavior of the model)

## HOW TO USE IT

(how to use the model, including a description of each of the items in the Interface tab)

## THINGS TO NOTICE

(suggested things for the user to notice while running the model)

## THINGS TO TRY

(suggested things for the user to try to do (move sliders, switches, etc.) with the model)

## EXTENDING THE MODEL

(suggested things to add or change in the Code tab to make the model more complicated, detailed, accurate, etc.)

## NETLOGO FEATURES

(interesting or unusual features of NetLogo that the model uses, particularly in the Code tab; or where workarounds were needed for missing features)

## RELATED MODELS

(models in the NetLogo Models Library and elsewhere which are of related interest)

## CREDITS AND REFERENCES

(a reference to the model's URL on the web if it has one, as well as any other necessary credits, citations, and links)
@#$#@#$#@
default
true
0
Polygon -7500403 true true 150 5 40 250 150 205 260 250

airplane
true
0
Polygon -7500403 true true 150 0 135 15 120 60 120 105 15 165 15 195 120 180 135 240 105 270 120 285 150 270 180 285 210 270 165 240 180 180 285 195 285 165 180 105 180 60 165 15

arrow
true
0
Polygon -7500403 true true 150 0 0 150 105 150 105 293 195 293 195 150 300 150

box
false
0
Polygon -7500403 true true 150 285 285 225 285 75 150 135
Polygon -7500403 true true 150 135 15 75 150 15 285 75
Polygon -7500403 true true 15 75 15 225 150 285 150 135
Line -16777216 false 150 285 150 135
Line -16777216 false 150 135 15 75
Line -16777216 false 150 135 285 75

bug
true
0
Circle -7500403 true true 96 182 108
Circle -7500403 true true 110 127 80
Circle -7500403 true true 110 75 80
Line -7500403 true 150 100 80 30
Line -7500403 true 150 100 220 30

butterfly
true
0
Polygon -7500403 true true 150 165 209 199 225 225 225 255 195 270 165 255 150 240
Polygon -7500403 true true 150 165 89 198 75 225 75 255 105 270 135 255 150 240
Polygon -7500403 true true 139 148 100 105 55 90 25 90 10 105 10 135 25 180 40 195 85 194 139 163
Polygon -7500403 true true 162 150 200 105 245 90 275 90 290 105 290 135 275 180 260 195 215 195 162 165
Polygon -16777216 true false 150 255 135 225 120 150 135 120 150 105 165 120 180 150 165 225
Circle -16777216 true false 135 90 30
Line -16777216 false 150 105 195 60
Line -16777216 false 150 105 105 60

car
false
0
Polygon -7500403 true true 300 180 279 164 261 144 240 135 226 132 213 106 203 84 185 63 159 50 135 50 75 60 0 150 0 165 0 225 300 225 300 180
Circle -16777216 true false 180 180 90
Circle -16777216 true false 30 180 90
Polygon -16777216 true false 162 80 132 78 134 135 209 135 194 105 189 96 180 89
Circle -7500403 true true 47 195 58
Circle -7500403 true true 195 195 58

circle
false
0
Circle -7500403 true true 0 0 300

circle 2
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240

cow
false
0
Polygon -7500403 true true 200 193 197 249 179 249 177 196 166 187 140 189 93 191 78 179 72 211 49 209 48 181 37 149 25 120 25 89 45 72 103 84 179 75 198 76 252 64 272 81 293 103 285 121 255 121 242 118 224 167
Polygon -7500403 true true 73 210 86 251 62 249 48 208
Polygon -7500403 true true 25 114 16 195 9 204 23 213 25 200 39 123

cylinder
false
0
Circle -7500403 true true 0 0 300

dot
false
0
Circle -7500403 true true 90 90 120

face happy
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 255 90 239 62 213 47 191 67 179 90 203 109 218 150 225 192 218 210 203 227 181 251 194 236 217 212 240

face neutral
false
0
Circle -7500403 true true 8 7 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Rectangle -16777216 true false 60 195 240 225

face sad
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 168 90 184 62 210 47 232 67 244 90 220 109 205 150 198 192 205 210 220 227 242 251 229 236 206 212 183

fish
false
0
Polygon -1 true false 44 131 21 87 15 86 0 120 15 150 0 180 13 214 20 212 45 166
Polygon -1 true false 135 195 119 235 95 218 76 210 46 204 60 165
Polygon -1 true false 75 45 83 77 71 103 86 114 166 78 135 60
Polygon -7500403 true true 30 136 151 77 226 81 280 119 292 146 292 160 287 170 270 195 195 210 151 212 30 166
Circle -16777216 true false 215 106 30

flag
false
0
Rectangle -7500403 true true 60 15 75 300
Polygon -7500403 true true 90 150 270 90 90 30
Line -7500403 true 75 135 90 135
Line -7500403 true 75 45 90 45

flower
false
0
Polygon -10899396 true false 135 120 165 165 180 210 180 240 150 300 165 300 195 240 195 195 165 135
Circle -7500403 true true 85 132 38
Circle -7500403 true true 130 147 38
Circle -7500403 true true 192 85 38
Circle -7500403 true true 85 40 38
Circle -7500403 true true 177 40 38
Circle -7500403 true true 177 132 38
Circle -7500403 true true 70 85 38
Circle -7500403 true true 130 25 38
Circle -7500403 true true 96 51 108
Circle -16777216 true false 113 68 74
Polygon -10899396 true false 189 233 219 188 249 173 279 188 234 218
Polygon -10899396 true false 180 255 150 210 105 210 75 240 135 240

house
false
0
Rectangle -7500403 true true 45 120 255 285
Rectangle -16777216 true false 120 210 180 285
Polygon -7500403 true true 15 120 150 15 285 120
Line -16777216 false 30 120 270 120

leaf
false
0
Polygon -7500403 true true 150 210 135 195 120 210 60 210 30 195 60 180 60 165 15 135 30 120 15 105 40 104 45 90 60 90 90 105 105 120 120 120 105 60 120 60 135 30 150 15 165 30 180 60 195 60 180 120 195 120 210 105 240 90 255 90 263 104 285 105 270 120 285 135 240 165 240 180 270 195 240 210 180 210 165 195
Polygon -7500403 true true 135 195 135 240 120 255 105 255 105 285 135 285 165 240 165 195

line
true
0
Line -7500403 true 150 0 150 300

line half
true
0
Line -7500403 true 150 0 150 150

pentagon
false
0
Polygon -7500403 true true 150 15 15 120 60 285 240 285 285 120

person
false
0
Circle -7500403 true true 110 5 80
Polygon -7500403 true true 105 90 120 195 90 285 105 300 135 300 150 225 165 300 195 300 210 285 180 195 195 90
Rectangle -7500403 true true 127 79 172 94
Polygon -7500403 true true 195 90 240 150 225 180 165 105
Polygon -7500403 true true 105 90 60 150 75 180 135 105

plant
false
0
Rectangle -7500403 true true 135 90 165 300
Polygon -7500403 true true 135 255 90 210 45 195 75 255 135 285
Polygon -7500403 true true 165 255 210 210 255 195 225 255 165 285
Polygon -7500403 true true 135 180 90 135 45 120 75 180 135 210
Polygon -7500403 true true 165 180 165 210 225 180 255 120 210 135
Polygon -7500403 true true 135 105 90 60 45 45 75 105 135 135
Polygon -7500403 true true 165 105 165 135 225 105 255 45 210 60
Polygon -7500403 true true 135 90 120 45 150 15 180 45 165 90

sheep
false
15
Circle -1 true true 203 65 88
Circle -1 true true 70 65 162
Circle -1 true true 150 105 120
Polygon -7500403 true false 218 120 240 165 255 165 278 120
Circle -7500403 true false 214 72 67
Rectangle -1 true true 164 223 179 298
Polygon -1 true true 45 285 30 285 30 240 15 195 45 210
Circle -1 true true 3 83 150
Rectangle -1 true true 65 221 80 296
Polygon -1 true true 195 285 210 285 210 240 240 210 195 210
Polygon -7500403 true false 276 85 285 105 302 99 294 83
Polygon -7500403 true false 219 85 210 105 193 99 201 83

square
false
0
Rectangle -7500403 true true 30 30 270 270

square 2
false
0
Rectangle -7500403 true true 30 30 270 270
Rectangle -16777216 true false 60 60 240 240

star
false
0
Polygon -7500403 true true 151 1 185 108 298 108 207 175 242 282 151 216 59 282 94 175 3 108 116 108

target
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240
Circle -7500403 true true 60 60 180
Circle -16777216 true false 90 90 120
Circle -7500403 true true 120 120 60

tree
false
0
Circle -7500403 true true 118 3 94
Rectangle -6459832 true false 120 195 180 300
Circle -7500403 true true 65 21 108
Circle -7500403 true true 116 41 127
Circle -7500403 true true 45 90 120
Circle -7500403 true true 104 74 152

triangle
false
0
Polygon -7500403 true true 150 30 15 255 285 255

triangle 2
false
0
Polygon -7500403 true true 150 30 15 255 285 255
Polygon -16777216 true false 151 99 225 223 75 224

truck
false
0
Rectangle -7500403 true true 4 45 195 187
Polygon -7500403 true true 296 193 296 150 259 134 244 104 208 104 207 194
Rectangle -1 true false 195 60 195 105
Polygon -16777216 true false 238 112 252 141 219 141 218 112
Circle -16777216 true false 234 174 42
Rectangle -7500403 true true 181 185 214 194
Circle -16777216 true false 144 174 42
Circle -16777216 true false 24 174 42
Circle -7500403 false true 24 174 42
Circle -7500403 false true 144 174 42
Circle -7500403 false true 234 174 42

turtle
true
0
Polygon -10899396 true false 215 204 240 233 246 254 228 266 215 252 193 210
Polygon -10899396 true false 195 90 225 75 245 75 260 89 269 108 261 124 240 105 225 105 210 105
Polygon -10899396 true false 105 90 75 75 55 75 40 89 31 108 39 124 60 105 75 105 90 105
Polygon -10899396 true false 132 85 134 64 107 51 108 17 150 2 192 18 192 52 169 65 172 87
Polygon -10899396 true false 85 204 60 233 54 254 72 266 85 252 107 210
Polygon -7500403 true true 119 75 179 75 209 101 224 135 220 225 175 261 128 261 81 224 74 135 88 99

wheel
false
0
Circle -7500403 true true 3 3 294
Circle -16777216 true false 30 30 240
Line -7500403 true 150 285 150 15
Line -7500403 true 15 150 285 150
Circle -7500403 true true 120 120 60
Line -7500403 true 216 40 79 269
Line -7500403 true 40 84 269 221
Line -7500403 true 40 216 269 79
Line -7500403 true 84 40 221 269

wolf
false
0
Polygon -16777216 true false 253 133 245 131 245 133
Polygon -7500403 true true 2 194 13 197 30 191 38 193 38 205 20 226 20 257 27 265 38 266 40 260 31 253 31 230 60 206 68 198 75 209 66 228 65 243 82 261 84 268 100 267 103 261 77 239 79 231 100 207 98 196 119 201 143 202 160 195 166 210 172 213 173 238 167 251 160 248 154 265 169 264 178 247 186 240 198 260 200 271 217 271 219 262 207 258 195 230 192 198 210 184 227 164 242 144 259 145 284 151 277 141 293 140 299 134 297 127 273 119 270 105
Polygon -7500403 true true -1 195 14 180 36 166 40 153 53 140 82 131 134 133 159 126 188 115 227 108 236 102 238 98 268 86 269 92 281 87 269 103 269 113

x
false
0
Polygon -7500403 true true 270 75 225 30 30 225 75 270
Polygon -7500403 true true 30 75 75 30 270 225 225 270
@#$#@#$#@
NetLogo 6.0.1
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
default
0.0
-0.2 0 0.0 1.0
0.0 1 1.0 0.0
0.2 0 0.0 1.0
link direction
true
0
Line -7500403 true 150 150 90 180
Line -7500403 true 150 150 210 180
@#$#@#$#@
0
@#$#@#$#@
