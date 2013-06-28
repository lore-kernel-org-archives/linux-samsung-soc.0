From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH] ARM: EXYNOS: remove obsolete exynos4_defconfig
Date: Fri, 28 Jun 2013 11:48:30 +0200
Message-ID: <2326060.vKzrGtO1Cq@amdc1032>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:49065 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755024Ab3F1Jsh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 28 Jun 2013 05:48:37 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MP3007L5KKQCYH0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 28 Jun 2013 18:48:36 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Kyungmin Park <kyungmin.park@samsung.com>, linux-samsung-soc@vger.kernel.org

It hasn't been updated since Novemeber 2011 and exynos_defconfig
should be used instead.

Cc: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
---
 arch/arm/configs/exynos4_defconfig | 68 --------------------------------------
 1 file changed, 68 deletions(-)
 delete mode 100644 arch/arm/configs/exynos4_defconfig

diff --git a/arch/arm/configs/exynos4_defconfig b/arch/arm/configs/exynos4_defconfig
deleted file mode 100644
index bffe68e..0000000
--- a/arch/arm/configs/exynos4_defconfig
+++ /dev/null
@@ -1,68 +0,0 @@
-CONFIG_EXPERIMENTAL=y
-CONFIG_BLK_DEV_INITRD=y
-CONFIG_KALLSYMS_ALL=y
-CONFIG_MODULES=y
-CONFIG_MODULE_UNLOAD=y
-# CONFIG_BLK_DEV_BSG is not set
-CONFIG_ARCH_EXYNOS=y
-CONFIG_S3C_LOWLEVEL_UART_PORT=1
-CONFIG_MACH_SMDKC210=y
-CONFIG_MACH_ARMLEX4210=y
-CONFIG_MACH_UNIVERSAL_C210=y
-CONFIG_MACH_NURI=y
-CONFIG_MACH_ORIGEN=y
-CONFIG_MACH_SMDK4412=y
-CONFIG_NO_HZ=y
-CONFIG_HIGH_RES_TIMERS=y
-CONFIG_SMP=y
-CONFIG_NR_CPUS=2
-CONFIG_PREEMPT=y
-CONFIG_AEABI=y
-CONFIG_CMDLINE="root=/dev/ram0 rw ramdisk=8192 initrd=0x41000000,8M console=ttySAC1,115200 init=/linuxrc mem=256M"
-CONFIG_VFP=y
-CONFIG_NEON=y
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
-CONFIG_BLK_DEV_LOOP=y
-CONFIG_BLK_DEV_RAM=y
-CONFIG_BLK_DEV_RAM_SIZE=8192
-CONFIG_SCSI=y
-CONFIG_BLK_DEV_SD=y
-CONFIG_CHR_DEV_SG=y
-CONFIG_INPUT_EVDEV=y
-# CONFIG_INPUT_KEYBOARD is not set
-# CONFIG_INPUT_MOUSE is not set
-CONFIG_INPUT_TOUCHSCREEN=y
-CONFIG_SERIAL_8250=y
-CONFIG_SERIAL_SAMSUNG=y
-CONFIG_SERIAL_SAMSUNG_CONSOLE=y
-CONFIG_HW_RANDOM=y
-CONFIG_I2C=y
-# CONFIG_HWMON is not set
-# CONFIG_MFD_SUPPORT is not set
-# CONFIG_HID_SUPPORT is not set
-# CONFIG_USB_SUPPORT is not set
-CONFIG_EXT2_FS=y
-CONFIG_MSDOS_FS=y
-CONFIG_VFAT_FS=y
-CONFIG_TMPFS=y
-CONFIG_TMPFS_POSIX_ACL=y
-CONFIG_CRAMFS=y
-CONFIG_ROMFS_FS=y
-CONFIG_PARTITION_ADVANCED=y
-CONFIG_BSD_DISKLABEL=y
-CONFIG_SOLARIS_X86_PARTITION=y
-CONFIG_NLS_CODEPAGE_437=y
-CONFIG_NLS_ASCII=y
-CONFIG_NLS_ISO8859_1=y
-CONFIG_MAGIC_SYSRQ=y
-CONFIG_DEBUG_KERNEL=y
-CONFIG_DETECT_HUNG_TASK=y
-CONFIG_DEBUG_RT_MUTEXES=y
-CONFIG_DEBUG_SPINLOCK=y
-CONFIG_DEBUG_MUTEXES=y
-CONFIG_DEBUG_INFO=y
-CONFIG_SYSCTL_SYSCALL_CHECK=y
-CONFIG_DEBUG_USER=y
-CONFIG_DEBUG_LL=y
-CONFIG_EARLY_PRINTK=y
-CONFIG_CRC_CCITT=y
-- 
1.8.2.3
