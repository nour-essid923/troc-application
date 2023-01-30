
import 'package:flutter/material.dart';
import 'package:project_application/screens/login.dart';
import 'package:project_application/main.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Color.fromARGB(132,187,153,129),
      body: 
        Center (
    child:Column (
       mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            Image.asset("/images/troc.png", height: 500,    width: 500,),
            
            Text(
              "Welcome to our Troc application",
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          
            Text(
              "trade a lot of items .",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .color!
                    .withOpacity(0.64),
              ),
            ),
           
            FittedBox(
              child: TextButton(
                  onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Login(),
                        ),
                      ),
                  child: Row(
                    children: [
                      Text(
                        "START",
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 20,
                              color: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .color!
                                  .withOpacity(0.8),
                            ),
                      ),
                      SizedBox(width: 20.0 / 4),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                        color: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .color!
                            .withOpacity(0.8),
                      )
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}