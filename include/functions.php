<?php
function greet($name)
{
  return "👋 Hello, " . htmlspecialchars($name);
}

function getCurrentYear()
{
  return date("Y");
}

