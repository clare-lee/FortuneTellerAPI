# Fortune Teller API

This is a comprehensive fortune teller divided into tarot based readings, tea readings, and general luck based divinations.

Allows GET, POST, PUT, and DELETE. 


<h2 align="center"> *.·:·.☽✧    Tarot    ✧☾.·:·.* </h2>
https://localhost:7267/api/Tarot


To get your Tarot reading (3 card spread)
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

To get a Tarot Yes/No/Maybe/Neither
> GET: api/Tarot/Love/YesNo/name

```
{
   "statusCode": 200,
   "statusDescription": "Success",
   "items": "Yes"
}
```

To get a specific Tarot Card # 1-78
> GET: api/Tarot/5

```
{
   "statusCode": 200,
   "statusDescription": "Success",
   "items": {
      "id": 5,
      "name": "The Emperor",
      "upMeaning": "Authority, structure, a father figure",
      "downMeaning": "Excessive control, rigidity, domination",
      "love": "You like being dominated?!",
      "yesNo": "Yes",
      "logs": []
   }
}
```
---
<h2 align="center"> *.·:·.☽✧    Tea    ✧☾.·:·.* </h2>

https://localhost:7267/api/Tea

To get your tea reading
> GET: api/Tea/name

```
{
   "statusCode": 200,
   "statusDescription": "Success",
   "items": {
      "readings": "Legato, rationality, sleep",
      "date": "2022-04-30T16:36:43.246213-04:00"
   }
}
```

To update a tea reading

To create a new tea reading

To delete a new rea reading 

Use Postman to make PUT/POST/DELETE requests

ex.
<p align="center">
<img  src="https://user-images.githubusercontent.com/56900294/166165032-f79abcbe-cf4f-41a4-826c-7c1a932cb5ed.png">  
</p>
   
```
{
    "statusCode": 200,
    "statusDescription": "Success",
    "items": {}
}
```

---

<h2 align="center"> *.·:·.☽✧    Luck    ✧☾.·:·.* </h2>

https://localhost:7267/api/Luck

To get a Magic 8 Ball Reading
> GET: api/Luck/Magic8Ball

```
{
   "statusCode": 200,
   "statusDescription": "Success",
   "items": "Cannot predict now"
}
```

To get a Magic H8 Ball Reading
> GET: api/Luck/MagicH8Ball

```
{
   "statusCode": 200,
   "statusDescription": "Success",
   "items": "I bet your parents change the subject when people ask about you."
}
```
To get a Lucky Lottery Numbers (first 5 #'s 1-70 last # 1-25)
> GET: api/Luck/Lucky

```
{
   "statusCode": 200,
   "statusDescription": "Success",
   "items": "17, 46, 69, 56, 32, 7"
}
```

To get a Coin flip
> GET: api/Luck/CoinFlip

```
{
   "statusCode": 200,
   "statusDescription": "Success",
   "items": "Tails!"
}
```

To let the fates choose for you
> POST: api/Luck/Pick

<p align="center">
<img src="https://user-images.githubusercontent.com/56900294/166121757-9cc4a666-606c-4873-9ee5-dfc541863fcc.png">
</p>

```
{
   "statusCode": 200,
   "statusDescription": "Success",
   "items": "Mo"
}
```

---
<h2 align="center"> *.·:·.☽✧    Log    ✧☾.·:·.* </h2>

To get a log of previous readings
> GET: api/Log/name

```
{
   "statusCode": 200,
   "statusDescription": "Success",
   "items": [
      {
         "id": 42,
         "name": "Tim",
         "date": "2022-04-30T16:48:37",
         "readings": "Lack of purpose, diversion, confusion, Imprisonment, entrapment, self-victimization, Curiosity, restlessness, mental energy",
         "type": "Tarot",
         "tarots": [],
         "teas": []
      },
      {
         "id": 43,
         "name": "Tim",
         "date": "2022-04-30T16:54:39",
         "readings": "Spice it up a little",
         "type": "Love",
         "tarots": [],
         "teas": []
      }
   ]
}
```
