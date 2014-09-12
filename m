From: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Subject: [PATCH v4 8/8] arm64: dts: add <dt-bindings/> symlink
Date: Fri, 12 Sep 2014 20:56:32 +0530
Message-ID: <1410535592-5782-10-git-send-email-ch.naveen@samsung.com>
References: <1410535592-5782-1-git-send-email-ch.naveen@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:51357 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751685AbaILPeP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 12 Sep 2014 11:34:15 -0400
In-reply-to: <1410535592-5782-1-git-send-email-ch.naveen@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: naveenkrishna.ch@gmail.com, linux-samsung-soc@vger.kernel.org, catalin.marinas@arm.com, robh@kernel.org, devicetree@vger.kernel.org, tomasz.figa@gmail.com, kgene.kim@samsung.com, gregkh@linuxfoundation.org, Pankaj Dubey <pankaj.dubey@samsung.com>

From: Pankaj Dubey <pankaj.dubey@samsung.com>

Add symlink to include/dt-bindings from arch/arm64/boot/dts/include/ to
match the ones in ARM architectures so that preprocessed device
tree files can include various useful constant definitions.

See commit c58299aa8754 ("kbuild: create an "include chroot" for DT bindings")
merged in v3.10-rc1 for details.

CC: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
---
 arch/arm64/boot/dts/include/dt-bindings |    1 +
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
1.7.9.5
