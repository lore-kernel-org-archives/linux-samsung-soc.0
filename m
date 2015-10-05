From: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCHv2 2/2] ARM: multi_v7_defconfig: Enable rtl8152 ethernet driver for Odroid-XU4
Date: Mon,  5 Oct 2015 09:00:29 +0000
Message-ID: <1444035629-1173-2-git-send-email-linux.amoon@gmail.com>
References: <1444035629-1173-1-git-send-email-linux.amoon@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1444035629-1173-1-git-send-email-linux.amoon@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>, Anand Moon <linux.amoon@gmail.com>, Lukasz Majewski <l.majewski@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Odroid XU4 supports RTL8152/RTL8153 Based USB 3.0 Ethernet Adapters.
Support speed upto 10/100/1000 Mbit Ethernet LAN.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>

---
Changes: Fixed the commit log.
---
 arch/arm/configs/multi_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 03deb7f..009d714 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -221,6 +221,7 @@ CONFIG_BROADCOM_PHY=y
 CONFIG_ICPLUS_PHY=y
 CONFIG_MICREL_PHY=y
 CONFIG_USB_PEGASUS=y
+CONFIG_USB_RTL8152=y
 CONFIG_USB_USBNET=y
 CONFIG_USB_NET_SMSC75XX=y
 CONFIG_USB_NET_SMSC95XX=y
-- 
2.1.4
