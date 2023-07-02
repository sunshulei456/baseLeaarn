#!/bin/bash
a=456
test1(b) {
echo $a
echo b
}
test1(1);

echo "执行结束"
