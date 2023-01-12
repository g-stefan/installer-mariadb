// Created by Grigore Stefan <g_stefan@yahoo.com>
// Public domain (Unlicense) <http://unlicense.org>
// SPDX-FileCopyrightText: 2022 Grigore Stefan <g_stefan@yahoo.com>
// SPDX-License-Identifier: Unlicense

Fabricare.include("vendor");

// ---

messageAction("make");

if (Shell.fileExists("temp/build.done.flag")) {
	return;
};

Shell.removeDirRecursivelyForce("output");
Shell.removeDirRecursivelyForce("temp");

Shell.mkdirRecursivelyIfNotExists("temp");
Shell.system("7z x \"vendor/mariadb-" + Project.version + "-winx64.zip\" -aoa -otemp");
Shell.rename("temp/mariadb-" + Project.version + "-winx64", "output");
Shell.removeDirRecursivelyForce("temp");

Shell.removeDirRecursivelyForce("output/include");
Shell.removeFile("output/bin/*.pdb");
Shell.removeFile("output/bin/*.lib");
Shell.removeFile("output/lib/*.pdb");
Shell.removeFile("output/lib/*.lib");

Shell.copyFile("source/mariadb.template.ini", "output/bin/my.ini");

Shell.mkdirRecursivelyIfNotExists("temp");
Shell.filePutContents("temp/build.done.flag", "done");
