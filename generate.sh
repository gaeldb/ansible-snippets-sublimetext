#!/bin/bash

ansible_commands=$(ansible-doc -l | awk '{print $1;}')

for command in $ansible_commands; do
	echo "Generating $command"
	man=$(ansible-doc -s $command | sed -e '/^[ \t]*#/d' | sed -e 's/ *#.*$/ /')
	comment=$(cat <<< $man | head -n 1 | head -n 1 | sed -e 's/^- name: //')

	echo "<snippet>
	<scope>source.ansible,source.yaml</scope>
	<tabTrigger>$command</tabTrigger>
	<description>$comment</description>
	<content><![CDATA[
$man
]]>
	</content>
</snippet>" > ./snippets/ansible-${command}.sublime-snippet
done
