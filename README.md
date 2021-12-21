# applications

A Flutter application For getting the application the user made. The application followed clean architecture and repository pattern.
It contains Unit Test.

## Getting Started

Min Api Level: 16

Build System: Gradle

## Table of Contents

- Architecture
- State Management
- Local Database
- Testing
- Libraries

## Architecture

The Application is split into a three layer architecture:

- Presentation
- Domain
- Data

This provides better abstractions between framework implementations and the underlying business logic.It requires a number of classes to get things running but the pros outweigh the cons in terms of building an app that should scale.

The 3 layered architectural approach is majorly guided by clean architecture which provides a clear separation of concerns with its Abstraction Principle.

Presentation
app contains the UI files and handles binding of DI components from other modules. Binding of data is facilitated by jetpacks data binding by serving data from the viewmodel to the UI.The data being received is part of a viewstate class that has properties contained in the relevant state.

Domain
The domain module contains domain model classes which represent the data we will be handling across presentation and data layer.

Use cases are also provided in the domain layer and orchestrate the flow of data from the data layer onto the presentation layer and a split into modular pieces serving one particular purpose.

The UseCases use a BaseUseCase interface that defines the parameters its taking in and output this helps in creating fakes using in testing.

Data
data-remote
Handles data interacting with the network and is later serverd up to the presentation layer through domain object

data-local
Handles persistence of object with Room ORM from.This module is responsible for handling all local related logic and serves up data to and from the presentation layer through domain objects.

With this separation we can easily swap in new or replace the database being used without causeing major ripples across the codebase.

Testing
Each module has its own tests except for the domain module which is catered for since its part of the behavior under test.

In the data-local module an in memory database is being used to run the tests,this makes it a little faster compared to an actual db.


## State Management

The application used getx as a state management system

The getx state management system is easy to use and very reliable to manage the UI's changes via data

And the performance is so good than set state system


## Libraries

Getx: Used for State Management System

Get Strorage : Used for local database

Cached Network Image: Used for saving network images for further load

Device App: Used to find out the application is installed in device

Url Launcher: Used to launch a web url to default device browser

Connectivity: Used to Identify internet data connection state

Flutter Test: Used for Unit test for the application't parts
