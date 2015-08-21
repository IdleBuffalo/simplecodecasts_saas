$(document).ready(function() {
    Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content')); //retrieve stripe public key so we have permission to interact with stripe
    //Watch for a form submission
    $('#form-submit-btn').click(function(event) {
        event.preventDefault(); // prevents default submit function
        $('input[type=submit]').prop('disabled', true); //disables button so ppl cant click more times
        var error = false;
        var ccNum = $('#card_number').val(),     // grab values from credit card
            cvcNum = $('#card_code').val(),
            expMonth = $('#card_month').val(),
            expYear = $('#card_year').val();
            
        if (!error) {
            //Get stripe token:                     // send card info to Stripe
            Stripe.createToken ({        
                number: ccNum,
                cvc: cvcNum,
                exp_month: expMonth,
                exp_year: expYear
            }, stripeResponseHandler);
        }
        return false;
    }); //form submission
    
    function stripeResponseHandler(status, response) {      //Stripe send back a response which include a card token
        //Get a reference to the form
        var f = $("#new_user")
        
        //Get tje token from the response
        var token = response.id
        
        //Add tje token to the form
        f.append('<input-type="hidden" name="user[stripe_card_token]" value="' + token + '" />' );
        
        //Submit the form
        f.get(0).submit();
    }
});