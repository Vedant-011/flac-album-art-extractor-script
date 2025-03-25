# **FLAC Album Art Extractor Script**  

## **Description**  
This simple PowerShell script extracts album art from `.flac` files and saves each image with the same name as the corresponding `.flac` file. It processes all `.flac` files within the selected folder and its subdirectories.  

## **Requirements**  
- **Windows** with PowerShell  
- **metaflac** (part of FLAC tools)  

## **Installation**  
1. Download FLAC tools from the official website: [https://xiph.org/flac/download.html](https://xiph.org/flac/download.html)  
2. Extract the files and locate `metaflac.exe` inside the `Win64` or `Win32` folder.  
3. Add the folder containing `metaflac.exe` to the system **PATH** *(recommended)* or update the script to use its full path.  

## **Usage**  
### **Method 1: Run via PowerShell**  
1. **Move the script (`.ps1` file) to the same folder that contains your `.flac` files.**  
2. Open PowerShell in that folder.  
3. Temporarily allow script execution:  
   ```powershell
   Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
   ```
4. Run the script:  
   ```powershell
   .\extract-flac-covers.ps1
   ```

### **Method 2: Run via Right-Click**  
1. **Ensure the script is in the same folder as your `.flac` files.**  
2. Right-click `extract-flac-covers.ps1`.  
3. Select **Run with PowerShell**.  

## **Notes**  
- The script processes `.flac` files from the selected folder and **all subdirectories** automatically.  
- If `metaflac.exe` is not in the system PATH, modify the script to use its full path.
- Existing image files with the same name will not be overwritten.  
