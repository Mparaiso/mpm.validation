mpm.validation
==============

[![Build Status](https://travis-ci.org/Mparaiso/mpm.validation.png?branch=master)](https://travis-ci.org/Mparaiso/mpm.validation)

validation framework for nodejs

mpm.validation help developpers validate data and support async and
sync validation, along with chain validation. developpers no longer
need to write their own validation framework.

license LGPL

author: mparaiso <mparaiso@online.fr>

####INSTALLATION

    npm install mpm.validation

####USAGE

    var validation = require('mpm.validation');
    var assert= require('assert');
    // instanciate an email validator
    var email = validation.Email();
    // using the async api
    email.validate('mparaiso@online.fr',function(error,result){
        assert(result==true);
    });
    email.validate('bogus@web',function(error,result){
            assert(error instanceOf validation.ValidationError);
            console.log(error.message);
    });
    // using the sync api
    assert(email.validateSync('mparaiso.online.fr'));
    assert(!email.validateSync('bogus@web'));
    console.log(email.getError().message); // should be an email

####Chain Validation
    // you can chain validators , the chain will stop at the first error
    var validation = require('mpm.validation');
    var chain = validation.Chain(
        validation.Email(),
        validation.MinLength(15)
    );
    chain.validate("mparaiso@online.fr",function(error,res){
        assert(res);
    });
    chain.validate("bob@web.com",function(error,res){
        assert(!res);
        assert(err instanceof Error);
        console.log(error.message);
    });


see test/index.test.js file for other examples

####Validators

    validation.MinLength(min) // min length for a string
    validation.MaxLength(max)// max length for a string
    validation.Length(min,max)// range for a string length
    validation.EqualTo(equalTo) // value should be equal to equalTo
    validation.Required()// value should not be null or undefined
    validation.Min(min)// number should be at least min
    validation.Max(max)//  number should be at most max
    validation.Range(min,max)//  number should be between min and max
    validation.Regexp(regexp)// value should match a regular expression
    validation.Email()// value should be an email
    validation.Any(values)// value should be in an array of values
    validation.None(values) // value should be none of the values
    validation.Chain(validators...) // chain multiple validators


####ChangeLog

- 0.0.8 empty validation.Chain fixed


