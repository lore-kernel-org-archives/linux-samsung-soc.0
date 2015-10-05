From: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH 2/2] ARM: multi_v7_defconfig: Enable rtl8152 ethernet driver for Odroid-XU4
Date: Mon,  5 Oct 2015 06:29:30 +0000
Message-ID: <1444026570-14076-2-git-send-email-linux.amoon@gmail.com>
References: <1444026570-14076-1-git-send-email-linux.amoon@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1444026570-14076-1-git-send-email-linux.amoon@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>, Anand Moon <linux.amoon@gmail.com>, Lukasz Majewski <l.majewski@samsung.com>, Thierry Reding <treding@nvidia.com>, Andreas Faerber <afaerber@suse.de>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Geert Uytterhoeven <geert+renesas@glider.be>, Lee Jones <lee.jones@linaro.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Ray Jui <rjui@broadcom.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Enable CONFIG_USB_RTL8152 for Odroid-XU4.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
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
