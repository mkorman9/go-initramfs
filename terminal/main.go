package main

import (
	"bufio"
	"fmt"
	"os"
	"strings"
	"syscall"
)

func printBanner() {
	binary, _ := os.Executable()
	pid := os.Getpid()
	uid := os.Geteuid()
	gid := os.Getegid()
	env := os.Environ()

	fmt.Printf("Welcome to a simplistic shell!\n")
	fmt.Printf("%s is running as PID %d, UID=%d GID=%d\n", binary, pid, uid, gid)
	fmt.Printf("Envs: %s\n", strings.Join(env, " "))
	fmt.Printf("Type 'exit' to power off\n")
	fmt.Println("")
}

func execLine(line string) {
	process, err := os.StartProcess("/bin/busybox", strings.Fields(line), &os.ProcAttr{
		Dir:   "/",
		Env:   os.Environ(),
		Files: []*os.File{os.Stdin, os.Stdout, os.Stderr},
	})
	if err != nil {
		fmt.Println(err)
	}

	process.Wait()
}

func main() {
	printBanner()

	scanner := bufio.NewScanner(os.Stdin)

	for {
		fmt.Printf("# ")

		if scanner.Scan() {
			line := scanner.Text()
			if line == "exit" {
				syscall.Reboot(syscall.LINUX_REBOOT_CMD_POWER_OFF)
			}

			execLine(line)
		}
	}
}
