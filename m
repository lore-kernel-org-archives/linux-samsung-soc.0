From: Abhilash Kesavan <a.kesavan@samsung.com>
Subject: [PATCH v7 1/7] arm64: dts: add <dt-bindings/> symlink
Date: Sun,  9 Nov 2014 09:50:28 +0530
Message-ID: <1415506834-8180-2-git-send-email-a.kesavan@samsung.com>
References: <1415506834-8180-1-git-send-email-a.kesavan@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f43.google.com ([209.85.220.43]:61201 "EHLO
	mail-pa0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751263AbaKIEUw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 8 Nov 2014 23:20:52 -0500
In-Reply-To: <1415506834-8180-1-git-send-email-a.kesavan@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, catalin.marinas@arm.com, robh@kernel.org, devicetree@vger.kernel.org, olof@lixom.net, arnd@arndb.de, tomasz.figa@gmail.com, kesavan.abhilash@gmail.com, lorenzo.pieralisi@arm.com

From: Pankaj Dubey <pankaj.dubey@samsung.com>

Add symlink to include/dt-bindings from arch/arm64/boot/dts/include/ to
match the ones in ARM architectures so that preprocessed device
tree files can include various useful constant definitions.

See commit c58299aa8754 ("kbuild: create an "include chroot" for DT bindings")
merged in v3.10-rc1 for details.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
Reviewed-by: Thomas Abraham <thomas.ab@samsung.com>
Tested-by: Thomas Abraham <thomas.ab@samsung.com>
---
 arch/arm64/boot/dts/include/dt-bindings | 1 +
 1 file changed, 1 insertion(+)
 create mode 120000 arch/arm64/boot/dts/include/dt-bindings

diff --git a/arch/arm64/boot/dts/include/dt-bindings b/arch/arm64/boot/dts/include/dt-bindings
new file mode 120000
index 0000000..08c00e4
--- /dev/null
+++ b/arch/arm64/boot/dts/include/dt-bindings
@@ -0,0 +1 @@
+../../../../../include/dt-bindings
\ No newline at end of file
-- 
2.1.0
