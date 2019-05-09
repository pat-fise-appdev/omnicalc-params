# Omnicalc `params`

Dynamic web applications are more interesting than static websites for one reason: **user input.** Let's finally learn how to let our users give us input!

Your goal will be to build a simplified version of Omnicalc.

### [Here is the target you will ultimately build.](https://omnicalc-params.herokuapp.com/)

## Standard Workflow

 1. From [your Cloud9 repositories list](https://c9.io/account/repos), set up a workspace [as usual](https://guides.firstdraft.com/starting-on-a-project-in-cloud9).
 1. Set up the project: `bin/setup`
 1. Start the web server by clicking "Run Project".
 1. Navigate to your live application preview.
 1. As you work, remember to navigate to `/git` and **commit often as you work.**
 1. Make new branches freely to experiment! _Especially_ before starting on a new task.
 1. Run `rails grade` as often as you like to see how you are doing, but **make sure you test your app manually first to make sure it matches the target's behavior first**.

## Part I: Flexible Routes

The way it should work is:

 - If I visit any address of the pattern

    ```
    /flexible/square/[WHATEVER]
    ```

    And if put a number in the third segment of the path, I should see the square of the number.

 - If I visit any address of the pattern

   ```
   /flexible/square_root/[WHATEVER]
   ```

   And if put a number in the third segment of the path, I should see the square root of the number.

 - If I visit any address of the pattern

   ```
   /flexible/payment/[BASIS POINTS]/[NUMBER OF YEARS]/[PRESENT VALUE]
   ```

   I should see the **monthly** payment due, assuming that

   - the number in the third segment of the path is an _annual_ interest rate _in basis points_, or hundredths of a percent
   - the number in the fourth segment of the path is the number of _years_ remaining
   - the number in the fifth segment of the path is the present value

        ![Payment formula](payment_formula.gif?raw=true "Payment formula")

 - If I visit any address of the pattern

   ```
   /flexible/random/[SMALL NUMBER]/[BIG NUMBER]
   ```

   I should see a random number that falls between the numbers in the third and fourth segments of the path.

### Examples

 - If I visit `/flexible/square/5`, I should see something like

    > ## Flexible Square
    >
    > The square of 5 is 25.

 - If I visit `/flexible/square_root/8`, I should see something like

    > ## Flexible Square Root
    >
    > The square root of 8.0 is 2.83.

 - If I visit `/flexible/payment/410/30/250000`, I should see something like

    > ## Flexible Payment
    >
    > A 30 year loan of $250,000, with an annual interest rate of 4.10%, requires a monthly payment of $1,208.00.

 - If I visit `/flexible/random/50/100`, I should see something like

    > ## Flexible Random Number
    >
    > A random number between 50 and 100 is 87.

**All of these should work no matter what _integers_ I type into the flexible segments of the path.**

Remember:

 - **Rails places all user input in the `params` hash.**
 - You can use the `params` hash in your actions or your views.
 - Watch the server log to see what the `params` hash contains for any given request.

#### Your task: Build out flexible RCAVs so that all of these (infinitely many) URLs work.

## Part II: Forms

Now, let's build something a little more realistic. **We don't want to type input into the address bar; we want to type into forms!**

The way it should work is:

 - If I visit `/square/new`, I should see a form with a label and an input to enter a number. (Since we're no longer typing into the address bar, we can use decimals and are no longer limited to integers. Yay!)
    - If I submit that form, I should see the square of the number that I entered.
 - If I visit `/square_root/new`, I should see a form with a label and an input to enter a number.
    - If I submit that form, I should see the square root of the number that I entered.
 - If I visit `/payment/new`, I should see a form with labels and inputs to enter three values:
    - An APR (annual percentage rate). (Since our users are no longer limited to integers, we can avoid thinking in basis points. Phew!)
    - A number of _years_ remaining
    - The principal
    - If I submit that form, I should see the **monthly** payment due given the values that I entered.
 - If I visit `/random/new`, I should see a form with labels and inputs to enter two numbers, a minimum and a maximum.
    - If I submit that form, I should see a random number that falls between the numbers that I entered.

## Part III: More Practice

 - Add a link to each results page to go back and perform a new calculation.
 - Add global navigation to get from calculator to calculator.
 - Implement the following calculators (without any styling, just functionality):
    - [Word Count](http://omnicalc-target.herokuapp.com/word_count/new)
    - [Descriptive Statistics](http://omnicalc-target.herokuapp.com/descriptive_statistics/new)
