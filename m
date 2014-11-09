From: Abhilash Kesavan <a.kesavan@samsung.com>
Subject: [PATCH v7 7/7] arm64: Enable Exynos7 SOC in the defconfig
Date: Sun,  9 Nov 2014 09:50:34 +0530
Message-ID: <1415506834-8180-8-git-send-email-a.kesavan@samsung.com>
References: <1415506834-8180-1-git-send-email-a.kesavan@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f173.google.com ([209.85.192.173]:35082 "EHLO
	mail-pd0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751263AbaKIEVV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 8 Nov 2014 23:21:21 -0500
In-Reply-To: <1415506834-8180-1-git-send-email-a.kesavan@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, catalin.marinas@arm.com, robh@kernel.org, devicetree@vger.kernel.org, olof@lixom.net, arnd@arndb.de, tomasz.figa@gmail.com, kesavan.abhilash@gmail.com, lorenzo.pieralisi@arm.com

From: Alim Akhtar <alim.akhtar@samsung.com>

Enable Exynos7 SOC in the arm64 defconfig. Also enable the
samsung serial driver needed by this SoC.

Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
---
 arch/arm64/configs/defconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 4ce602c..cc2aa19 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -32,6 +32,8 @@ CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 # CONFIG_BLK_DEV_BSG is not set
 # CONFIG_IOSCHED_DEADLINE is not set
+CONFIG_ARCH_EXYNOS=y
+CONFIG_ARCH_EXYNOS7=y
 CONFIG_ARCH_THUNDER=y
 CONFIG_ARCH_VEXPRESS=y
 CONFIG_ARCH_XGENE=y
@@ -84,6 +86,8 @@ CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
 CONFIG_SERIAL_AMBA_PL011=y
 CONFIG_SERIAL_AMBA_PL011_CONSOLE=y
+CONFIG_SERIAL_SAMSUNG=y
+CONFIG_SERIAL_SAMSUNG_CONSOLE=y
 CONFIG_SERIAL_OF_PLATFORM=y
 CONFIG_VIRTIO_CONSOLE=y
 # CONFIG_HW_RANDOM is not set
-- 
2.1.0
