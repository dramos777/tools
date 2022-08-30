#!/bin/bash

function lista() {
ls $1
}

function info() {
stat $1
}

lista $1
info $1
