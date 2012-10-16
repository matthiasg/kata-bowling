expect = require("chai").expect
Bowling = require("../bowling")

describe "The bowling calculator", ->

    bowling = null

    beforeEach ()->
        bowling = new Bowling

    it "should score 0 when not rolled", ->
        expect(bowling.score()).to.equal(0)

    it "should score 0 when no rolls", ->
        bowling.roll([])
        expect(bowling.score()).to.equal(0)

    it "should score 0 when no pin has been hit", ->
        bowling.roll([0])
        expect(bowling.score()).to.equal(0)

    it "should score 5 when 5 pins have been hit", ->
        bowling.roll([5])
        expect(bowling.score()).to.equal(5)

    it "should score 9 when 5, 4 has been rolled", ->
        bowling.roll([5,4])
        expect(bowling.score()).to.equal(9)

    it "should score 28 when 10,5,4 has been rolled due to the strike", ->
        bowling.roll([10,5,4])
        expect(bowling.score()).to.equal(28)

    it "should score 13 when 5,5,1,1 has been rolled due to the spare", ->
        bowling.roll([5,5,1,1])
        expect(bowling.score()).to.equal(13)

    it "should score 61 when 9,1,10,2,6,5,2,3,5 has been rolled", ->
        bowling.roll([9,1,10,2,6,5,2,3,5])
        expect(bowling.score()).to.equal(61)
    
    it "should check spares only on a frame basis", ->
        bowling.roll([0,3,7,1])
        expect(bowling.score()).to.equal(11)

    it "should score a perfect game with 300", ->
        bowling.roll([10,10,10,10,10,10,10,10,10,10,10,10])
        expect(bowling.score()).to.equal(300)
