# Bash Script Search Tool

This is a bash script tool to search for a pattern in one or more files.


## Usage

To use the script, run it with the following command:

```bash
./search_tool.sh <file_pattern> <search_pattern>
```
Where:

`<file_pattern>`: A pattern to match the name of the files to search. The pattern can include wildcards (*) to match multiple files.\
`<search_pattern>`: A string to search for in the contents of the files.


## Example

```bash
./search_tool.sh '*.txt' 'error'
```

## Options

`--help` or `-h` : Displays the help message.

## Script Logic

The script searches for a pattern in all files that match the given file pattern. It identifies the file type (text or gzip compressed) and searches for the pattern accordingly.

If the file is gzip compressed, it extracts the contents of the file in stdout and searches for the pattern in the extracted text. If the file is a text file, it directly searches for the pattern in the file contents.

If the file is not of type text or gzip compressed, it displays an error message.

## Note
This script searches only in the current directory, and does not search in sub-directories.