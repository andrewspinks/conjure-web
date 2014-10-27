(function(){"use strict";angular.module("conjureApp",["ngAnimate","ngCookies","ngResource","ngRoute","ngSanitize","ngTouch"]).config(["$routeProvider",function(a){return a.when("/adjectives",{templateUrl:"views/adjectives.html",controller:"AdjectivesCtrl"}).when("/verbs",{templateUrl:"views/verbs.html",controller:"VerbsCtrl"}).otherwise({redirectTo:"/verbs"})}]).run(["$rootScope","$location",function(a,b){return a.isActive=function(a){return a===b.path()}}])}).call(this),function(){"use strict";angular.module("conjureApp").controller("AdjectivesCtrl",["$scope","$http","AdjectivesService",function(a,b,c){var d;return a.guess="",a.numberCorrect=0,a.numberIncorrect=0,a.answerbox="views/question.html",a.adjectives="active",a.$on("correctAnswer",function(b,c){return console.log("guessed correctly: "+c),a.numberCorrect+=1,a.guess=c,a.answerbox="views/result.html",a.currentQuestion.correct=!0}),a.$on("incorrectAnswer",function(b,c){return console.log("guessed incorrectly: "+c),a.numberIncorrect+=1,a.answerbox="views/result.html",a.guess=c,a.currentQuestion.correct=!1}),a.$on("nextQuestion",function(){return d()}),d=function(){return a.currentQuestion=c.nextQuestion(),a.answerbox="views/question.html"},c.startSession().then(function(){return a.numberOfQuestions=c.numberOfQuestions(),d()})}])}.call(this),function(){"use strict";angular.module("conjureApp").controller("VerbsCtrl",["$scope","$http","VerbsService",function(a,b,c){var d;return a.guess="",a.numberCorrect=0,a.numberIncorrect=0,a.answerbox="views/question.html",a.verbs="active",a.$on("correctAnswer",function(b,c){return console.log("guessed correctly: "+c),a.numberCorrect+=1,a.guess=c,a.answerbox="views/result.html",a.currentQuestion.correct=!0}),a.$on("incorrectAnswer",function(b,c){return console.log("guessed incorrectly: "+c),a.numberIncorrect+=1,a.answerbox="views/result.html",a.guess=c,a.currentQuestion.correct=!1}),a.$on("nextQuestion",function(){return d()}),d=function(){return a.currentQuestion=c.nextQuestion(),a.answerbox="views/question.html"},c.startSession().then(function(){return a.numberOfQuestions=c.numberOfQuestions(),d()})}])}.call(this),function(){"use strict";angular.module("conjureApp").directive("ngEnter",function(){return{restrict:"A",link:function(a,b,c){return b.focus(),b.bind("keydown keypress",function(b){return 13===b.which?(a.$apply(function(){return a.$eval(c.ngEnter)}),b.preventDefault()):void 0})}}})}.call(this),function(){"use strict";angular.module("conjureApp").controller("QuestionCtrl",["$scope",function(a){var b;return a.guess="",a.answer=function(){return console.log(a.guess+" >>> "+a.currentQuestion.answers),b(a.guess)?a.$emit("correctAnswer",a.guess):a.$emit("incorrectAnswer",a.guess)},b=function(b){var c,d,e,f;for(f=a.currentQuestion.answers,d=0,e=f.length;e>d;d++)if(c=f[d],c===b)return!0;return!1}}])}.call(this),function(){"use strict";angular.module("conjureApp").controller("ResultCtrl",["$scope",function(a){return a.nextQuestion=function(){return a.$emit("nextQuestion")},a.corrections=function(){var b,c,d,e,f;for(c="",f=a.currentQuestion.answers,d=0,e=f.length;e>d;d++)b=f[d],c=c?""+c+" or "+b:b;return c}}])}.call(this),function(){"use strict";angular.module("conjureApp").service("AdjectivesService",["$http",function(a){var b,c,d;return b=null,d=0,c=function(){return a.get("http://hidden-eyrie-6211.herokuapp.com/adjectives")},{numberOfQuestions:function(){return b.length},startSession:function(){return c().then(function(a){return b=a.data.questions})},nextQuestion:function(){var a;return d===b.length-1?!1:(d++,a=b[d])}}}])}.call(this),function(){"use strict";angular.module("conjureApp").service("VerbsService",["$http",function(a){var b,c,d;return c=null,b=0,d=function(){return a.get("http://localhost:9393/verbs")},{numberOfQuestions:function(){return c.length},startSession:function(){return d().then(function(a){return c=a.data.questions})},nextQuestion:function(){var a;return b===c.length-1?!1:(b++,a=c[b])}}}])}.call(this);