From: Abhilash Kesavan <a.kesavan@samsung.com>
Subject: [PATCH v5 8/8] arm64: dts: add <dt-bindings/> symlink
Date: Mon, 22 Sep 2014 10:17:08 +0530
Message-ID: <1411361228-18279-9-git-send-email-a.kesavan@samsung.com>
References: <1411361228-18279-1-git-send-email-a.kesavan@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:62394 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753184AbaIVErv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 22 Sep 2014 00:47:51 -0400
In-reply-to: <1411361228-18279-1-git-send-email-a.kesavan@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, catalin.marinas@arm.com
Cc: tomasz.figa@gmail.com, naveenkrishna.ch@gmail.com, kesavan.abhilash@gmail.com

From: Pankaj Dubey <pankaj.dubey@samsung.com>

Add symlink to include/dt-bindings from arch/arm64/boot/dts/include/ to
match the ones in ARM architectures so that preprocessed device
tree files can include various useful constant definitions.

See commit c58299aa8754 ("kbuild: create an "include chroot" for DT bindings")
merged in v3.10-rc1 for details.

CC: Catalin Marinas <catalin.marinas@arm.com>
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
index 0000000..1e89bce
--- /dev/null
+++ b/arch/arm64/boot/dts/include/dt-bindings
@@ -0,0 +1 @@
+../../../../../include/dt-bindings/
\ No newline at end of file
-- 
2.1.0
