From: Abhilash Kesavan <a.kesavan@samsung.com>
Subject: [PATCH v2 0/5] Add initial support for pinctrl on Exynos7
Date: Tue, 23 Sep 2014 13:46:04 +0530
Message-ID: <1411460169-30536-1-git-send-email-a.kesavan@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:10571 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753294AbaIWIQ0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 23 Sep 2014 04:16:26 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: naveenkrishna.ch@gmail.com, linux-samsung-soc@vger.kernel.org, catalin.marinas@arm.com, devicetree@vger.kernel.org

Changes since v1:
	- Marked the newly created irq_chip instances as __initdata
	- Used kmemdup to keep a copy of the irq_chip
	- Change the pinctrl name from sd0_rdqs to sd0_ds as per UM
	- Moved the pinctrl enablement for exynos7 into a separate patch
	- Added tested-by and reviewed-by tags from Thomas Abraham

Following patches have been tested on linux-next (20140922).
https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/
 
Following patches are required for this series:
1) "tty/serial: fix config dependencies for samsung serial"
   https://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg36208.html
2) "dts, kbuild: Implement support for dtb vendor subdirs" patchset 
   http://comments.gmane.org/gmane.linux.kbuild.devel/12131
3) "arch: arm64: enable support for Samsung Exynos7 SoC" patchset (v5)
   http://www.spinics.net/lists/arm-kernel/msg364014.html
