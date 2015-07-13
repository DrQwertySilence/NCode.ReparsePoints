using System;
using System.IO;
using System.Runtime.InteropServices;
using FILETIME = System.Runtime.InteropServices.ComTypes.FILETIME;

namespace NCode.ReparsePoints.Win32
{
	[Serializable]
	[StructLayout(LayoutKind.Sequential, CharSet = CharSet.Auto)]
	internal struct WIN32_FIND_DATA
	{
		public FileAttributes FileAttributes;
		public FILETIME CreationTime;
		public FILETIME LastAccessTime;
		public FILETIME LastWriteTime;
		public int FileSizeHigh;
		public int FileSizeLow;
		public uint Reserved0;
		public uint Reserved1;
		[MarshalAs(UnmanagedType.ByValTStr, SizeConst = Win32Constants.MaxPath)]
		public string FileName;
		[MarshalAs(UnmanagedType.ByValTStr, SizeConst = 14)]
		public string AlternateFileName;
	}
}