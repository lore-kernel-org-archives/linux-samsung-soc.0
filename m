From: =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
Subject: [PATCH 6/6] ARM: defconfig: s5pv210: Enable more drivers present on Samsung Aries
Date: Fri, 28 Dec 2018 17:18:19 +0100
Message-ID: <20181228161819.18931-7-pawel.mikolaj.chmiel@gmail.com>
References: <20181228161819.18931-1-pawel.mikolaj.chmiel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181228161819.18931-1-pawel.mikolaj.chmiel@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: krzk@kernel.org
Cc: kgene@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, pawel.mikolaj.chmiel@gmail.com, xc-racer2@live.ca, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

This commit enables following drivers:
- i2c support (using s3c2410 driver)
- s5p-jpeg
- s5p-mfc
- exynos drm rotator
- pwm support
- pwm vibrator
- fixed regulator
- syscon poweroff
- Atmel maXTouch touchscreen
- Broadcom BCM4329 bluetooth over uart0
- dma devices (so we can use pl330 dma driver)

Disable DEBUG_LL. It's currently set to uart1, but if we want to use
 it on Aries, we would need to switch uart2, to get any logs.

Signed-off-by: Paweł Chmiel <pawel.mikolaj.chmiel@gmail.com>
Signed-off-by: Jonathan Bakker <xc-racer2@live.ca>
---
 arch/arm/configs/s5pv210_defconfig | 41 ++++++++++++++++++++++--------
 1 file changed, 30 insertions(+), 11 deletions(-)

diff --git a/arch/arm/configs/s5pv210_defconfig b/arch/arm/configs/s5pv210_defconfig
index a077597369f1..951196bdf008 100644
--- a/arch/arm/configs/s5pv210_defconfig
+++ b/arch/arm/configs/s5pv210_defconfig
@@ -1,24 +1,24 @@
 CONFIG_SYSVIPC=y
 CONFIG_NO_HZ=y
 CONFIG_HIGH_RES_TIMERS=y
+CONFIG_PREEMPT=y
 CONFIG_CGROUPS=y
 CONFIG_SYSFS_DEPRECATED=y
 CONFIG_SYSFS_DEPRECATED_V2=y
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_KALLSYMS_ALL=y
-CONFIG_MODULES=y
-CONFIG_MODULE_UNLOAD=y
-# CONFIG_BLK_DEV_BSG is not set
-CONFIG_PARTITION_ADVANCED=y
-CONFIG_BSD_DISKLABEL=y
-CONFIG_SOLARIS_X86_PARTITION=y
 CONFIG_ARCH_S5PV210=y
 CONFIG_VMSPLIT_2G=y
-CONFIG_PREEMPT=y
 CONFIG_ARM_APPENDED_DTB=y
 CONFIG_CMDLINE="root=/dev/ram0 rw ramdisk=8192 initrd=0x20800000,8M console=ttySAC1,115200 init=/linuxrc"
 CONFIG_VFP=y
 CONFIG_NEON=y
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
+# CONFIG_BLK_DEV_BSG is not set
+CONFIG_PARTITION_ADVANCED=y
+CONFIG_BSD_DISKLABEL=y
+CONFIG_SOLARIS_X86_PARTITION=y
 CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
@@ -27,6 +27,11 @@ CONFIG_IP_PNP=y
 CONFIG_IP_PNP_DHCP=y
 CONFIG_IP_PNP_BOOTP=y
 CONFIG_IP_PNP_RARP=y
+CONFIG_BT=m
+CONFIG_BT_RFCOMM=y
+CONFIG_BT_BNEP=y
+CONFIG_BT_HCIUART=m
+CONFIG_BT_HCIUART_BCM=y
 CONFIG_CFG80211=m
 CONFIG_MAC80211=m
 CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
@@ -44,21 +49,35 @@ CONFIG_INPUT_EVDEV=y
 CONFIG_KEYBOARD_GPIO=y
 # CONFIG_INPUT_MOUSE is not set
 CONFIG_INPUT_TOUCHSCREEN=y
+CONFIG_TOUCHSCREEN_ATMEL_MXT=m
+CONFIG_INPUT_MISC=y
+CONFIG_INPUT_PWM_VIBRA=m
 CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_SAMSUNG=y
 CONFIG_SERIAL_SAMSUNG_CONSOLE=y
+CONFIG_SERIAL_DEV_BUS=y
 CONFIG_HW_RANDOM=y
 CONFIG_I2C_GPIO=y
+CONFIG_I2C_S3C2410=y
+CONFIG_POWER_RESET=y
+CONFIG_POWER_RESET_SYSCON_POWEROFF=y
 CONFIG_POWER_SUPPLY=y
 CONFIG_BATTERY_MAX17040=y
 # CONFIG_HWMON is not set
 CONFIG_MFD_MAX8998=y
 CONFIG_REGULATOR=y
+CONFIG_REGULATOR_FIXED_VOLTAGE=y
 CONFIG_REGULATOR_MAX8998=y
+CONFIG_MEDIA_SUPPORT=m
+CONFIG_MEDIA_CAMERA_SUPPORT=y
+CONFIG_V4L_MEM2MEM_DRIVERS=y
+CONFIG_VIDEO_SAMSUNG_S5P_JPEG=m
+CONFIG_VIDEO_SAMSUNG_S5P_MFC=m
 CONFIG_DRM=y
 CONFIG_DRM_EXYNOS=y
 CONFIG_DRM_EXYNOS_FIMD=y
 CONFIG_DRM_EXYNOS_DPI=y
+CONFIG_DRM_EXYNOS_ROTATOR=y
 CONFIG_USB=y
 CONFIG_USB_OTG=y
 CONFIG_USB_EHCI_HCD=y
@@ -72,6 +91,9 @@ CONFIG_MMC_SDHCI_S3C=y
 CONFIG_MMC_SDHCI_S3C_DMA=y
 CONFIG_RTC_CLASS=y
 CONFIG_RTC_DRV_MAX8998=m
+CONFIG_DMADEVICES=y
+CONFIG_PWM=y
+CONFIG_PWM_SAMSUNG=y
 CONFIG_PHY_SAMSUNG_USB2=m
 CONFIG_PHY_S5PV210_USB2=y
 CONFIG_EXT2_FS=y
@@ -87,6 +109,7 @@ CONFIG_NLS_CODEPAGE_437=y
 CONFIG_NLS_ASCII=y
 CONFIG_NLS_ISO8859_1=y
 CONFIG_NLS_UTF8=y
+CONFIG_CRC_CCITT=y
 CONFIG_DEBUG_INFO=y
 CONFIG_MAGIC_SYSRQ=y
 CONFIG_DEBUG_KERNEL=y
@@ -96,7 +119,3 @@ CONFIG_DEBUG_SPINLOCK=y
 CONFIG_DEBUG_MUTEXES=y
 CONFIG_DEBUG_ATOMIC_SLEEP=y
 CONFIG_DEBUG_USER=y
-CONFIG_DEBUG_LL=y
-CONFIG_DEBUG_S3C_UART1=y
-CONFIG_EARLY_PRINTK=y
-CONFIG_CRC_CCITT=y
-- 
2.17.1
