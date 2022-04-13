package kr.co.mlec.util;

import java.io.File;
import java.util.UUID;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class SesacFileNamePolicy implements FileRenamePolicy {

	@Override
	public File rename(File f) {
		String name = f.getName();
		String ext = "";
		int dot = name.lastIndexOf(".");
		if (dot != -1) {
			ext = name.substring(dot); //확장자 추출
		} else {
			ext = "";
		}
		String str = "sesac" + UUID.randomUUID(); // sesac이라는 이름을 무조건 붙임
		File renameFile = new File(f.getParent(), str + ext);
		return renameFile;
	}
}
