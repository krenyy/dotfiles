#!/usr/bin/env rust-script

use std::fs;

fn main() -> Result<(), Box<dyn std::error::Error>> {
    const BATTERY_DIR: &str = "/sys/class/power_supply/BAT0";
    let current_now = fs::read_to_string(format!("{BATTERY_DIR}/current_now"))?
        .trim()
        .parse::<f64>()?;
    let voltage_now = fs::read_to_string(format!("{BATTERY_DIR}/voltage_now"))?
        .trim()
        .parse::<f64>()?;
    print!("{:.1}", (current_now * voltage_now) / 1000000000000.);
    Ok(())
}
