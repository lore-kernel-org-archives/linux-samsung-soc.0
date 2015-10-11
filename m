From: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCHv4 2/2] ARM: multi_v7_defconfig: Enable rtl8152 ethernet driver for Odroid-XU4
Date: Sun, 11 Oct 2015 17:36:00 +0000
Message-ID: <1444584960-2971-2-git-send-email-linux.amoon@gmail.com>
References: <1444584960-2971-1-git-send-email-linux.amoon@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1444584960-2971-1-git-send-email-linux.amoon@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>, Anand Moon <linux.amoon@gmail.com>, Lukasz Majewski <l.majewski@samsung.com>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Odroid XU4 has a RTL8153-CG gigabit Ethernet adapter, connected over
USB 3.0.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
Changes: Fixed the commit message thanks to Krzysztof KozlowskAdded reviewed by Krzysztof Kozlowski
         Added reviewed by Krzysztof Kozlowski
         Build as r8152 as module
---
 arch/arm/configs/multi_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 03deb7f..966ffc1 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -221,6 +221,7 @@ CONFIG_BROADCOM_PHY=y
 CONFIG_ICPLUS_PHY=y
 CONFIG_MICREL_PHY=y
 CONFIG_USB_PEGASUS=y
+CONFIG_USB_RTL8152=m
 CONFIG_USB_USBNET=y
 CONFIG_USB_NET_SMSC75XX=y
 CONFIG_USB_NET_SMSC95XX=y
-- 
2.1.4
