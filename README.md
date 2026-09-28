# server-performance-stats

https://roadmap.sh/projects/server-stats

# Linux System Monitoring

Some basic Linux commands to check system resource usage.

## CPU Usage

Shows the overall CPU usage.

```bash
top -bn1 | grep "Cpu(s)"
```

## Memory Usage

Shows total, used, free, and available memory.

```bash
free -m
```

`-m` displays the values in MB.

## Disk Usage

Shows disk space used and available on all mounted filesystems.

```bash
df -h --total
```

`-h` makes the output easier to read, and `--total` shows the total usage.

## Top 5 Processes by CPU

Shows the 5 processes currently using the most CPU.

```bash
ps -eo pid,ppid,cmd,%cpu,%mem --sort=-%cpu | head -n 6
```

## Top 5 Processes by Memory

Shows the 5 processes currently using the most memory.

```bash
ps -eo pid,ppid,cmd,%cpu,%mem --sort=-%mem | head -n 6
```

## Quick Reference

| Check                | Command                                                   |
| -------------------- | --------------------------------------------------------- |
| CPU usage            | `top -bn1 \| grep "Cpu(s)"`                               |
| Memory usage         | `free -m`                                                 |
| Disk usage           | `df -h --total`                                           |
| Top CPU processes    | `ps -eo pid,ppid,cmd,%cpu,%mem --sort=-%cpu \| head -n 6` |
| Top memory processes | `ps -eo pid,ppid,cmd,%cpu,%mem --sort=-%mem \| head -n 6` |
