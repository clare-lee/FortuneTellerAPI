# Fortune Teller API

Compared to API ppt, there is an additional Luck(Decision helper) feature. Removed logging lucky numbers.

This is a comprehensive fortune teller divided into tarot based readings, tea readings, and general luck based divinations.
Allows GET, POST, PUT, and DELETE. 

### *.·:·.☽✧    Tarot    ✧☾.·:·.*
https://localhost:7267/api/Taro

To get your reading (3 card spread)
> GET: api/Tarot/name

```
{
   "statusCode":200,
   "statusDescription":"Success",
   "items":{
      "readings":"Courage, determination, joy , difficult choices, indecision, stalemate, Manipulation, illusions",
      "date":"2022-04-28T21:17:28.531472-04:00",
      "tarots":[
         "Queen of Wands",
         "Two of Swords",
         "The Magician"
      ]
   }
}
```

To get your love reading
> GET: api/Tarot/Love/name

```
{
   "statusCode": 200,
   "statusDescription": "Success",
   "items": "It's not serious"
}
```
To get Yes/No/Maybe/Neither
> GET: api/Tarot/Love/YesNo/name



### *.·:·.☽✧    Luck    ✧☾.·:·.*

https://localhost:7267/api/Luck

To get a Magic 8 Ball Reading
> GET: api/Luck/Magic8Ball

To get a Magic H8 Ball Reading
> GET: api/Luck/MagicH8Ball

{"statusCode":200,"statusDescription":"Success","items":"19, 54, 36, 60, 25, 1"}

### *.·:·.☽✧    Tea    ✧☾.·:·.*

https://localhost:7267/api/Tea

To get your tea reading
> GET: api/Tea/name

### *.·:·.☽✧    Log    ✧☾.·:·.*

To get a log of previous readings
> GET: api/Log/name
