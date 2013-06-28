From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: Re: [PATCH] ARM: EXYNOS: remove obsolete exynos4_defconfig
Date: Fri, 28 Jun 2013 14:45:30 +0200
Message-ID: <2247183.K8o4ATxfnz@amdc1032>
References: <2326060.vKzrGtO1Cq@amdc1032> <51CD5C9B.2010706@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:45569 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753756Ab3F1Mpi (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 28 Jun 2013 08:45:38 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MP300CUNSS0QZJ0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 28 Jun 2013 21:45:37 +0900 (KST)
In-reply-to: <51CD5C9B.2010706@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Kyungmin Park <kyungmin.park@samsung.com>, linux-samsung-soc@vger.kernel.org

On Friday, June 28, 2013 11:51:23 AM Daniel Lezcano wrote:
> On 06/28/2013 11:48 AM, Bartlomiej Zolnierkiewicz wrote:
> > It hasn't been updated since Novemeber 2011 and exynos_defconfig
> > should be used instead.
> 
> Why ?

After conversion to using device tree only (no board files) on
mach-exynos using exynos4_defconfig results in unbootable kernel
(I used next-20130626):

---
Uncompressing Linux... done, booting the kernel.
Booting Linux on physical CPU 0x900
Linux version 3.10.0-rc7-next-20130626-dirty (bzolnier@amdc1032) (gcc version 4.6.3 (Ubuntu/Linaro 4.6.3-1ubuntu5) ) 3
CPU: ARMv7 Processor [412fc091] revision 1 (ARMv7), cr=10c5387d
CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing instruction cache

Error: unrecognized/unsupported machine ID (r1 = 0x00000bad).


Error: unrecognized/unsupported machine ID (r1 = 0x00000bad).

Available machine support:

ID (hex)        NAME
Available machine support:

ID (hex)        NAME
ffffffff        Samsung Exynos4 (Flattened Device Tree)
ffffffff        Samsung Exynos4 (Flattened Device Tree)

Please check your kernel config and/or bootloader.
---

There is no much point in trying to fix exynos4_defconfig because
exynos_defconfig also works for EXYNOS4 SoCs, is being kept up to date
(for the comparison the last exynos4_defconfig update was in November
2011) and has more useful stuff enabled (i.e. exynos4_defconfig doesn't
even have EXT3 or EXT4 enabled, it only has EXT2 turned on).

Another advantage of using one defconfig for both EXYNOS4 and EXYNOS5
is that it makes development and testing easier. It should allow us
to catch early EXYNOS4 regressions caused by EXYNOS5 changes and also
EXYNOS4 changes that break EXYNOS5.

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics
 
> > Cc: Tomasz Figa <tomasz.figa@gmail.com>
> > Cc: Kukjin Kim <kgene.kim@samsung.com>
> > Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> > Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> > ---
> >  arch/arm/configs/exynos4_defconfig | 68 --------------------------------------
> >  1 file changed, 68 deletions(-)
> >  delete mode 100644 arch/arm/configs/exynos4_defconfig
> > 
> > diff --git a/arch/arm/configs/exynos4_defconfig b/arch/arm/configs/exynos4_defconfig
> > deleted file mode 100644
> > index bffe68e..0000000
> > --- a/arch/arm/configs/exynos4_defconfig
> > +++ /dev/null
> > @@ -1,68 +0,0 @@
> > -CONFIG_EXPERIMENTAL=y
> > -CONFIG_BLK_DEV_INITRD=y
> > -CONFIG_KALLSYMS_ALL=y
> > -CONFIG_MODULES=y
> > -CONFIG_MODULE_UNLOAD=y
> > -# CONFIG_BLK_DEV_BSG is not set
> > -CONFIG_ARCH_EXYNOS=y
> > -CONFIG_S3C_LOWLEVEL_UART_PORT=1
> > -CONFIG_MACH_SMDKC210=y
> > -CONFIG_MACH_ARMLEX4210=y
> > -CONFIG_MACH_UNIVERSAL_C210=y
> > -CONFIG_MACH_NURI=y
> > -CONFIG_MACH_ORIGEN=y
> > -CONFIG_MACH_SMDK4412=y
> > -CONFIG_NO_HZ=y
> > -CONFIG_HIGH_RES_TIMERS=y
> > -CONFIG_SMP=y
> > -CONFIG_NR_CPUS=2
> > -CONFIG_PREEMPT=y
> > -CONFIG_AEABI=y
> > -CONFIG_CMDLINE="root=/dev/ram0 rw ramdisk=8192 initrd=0x41000000,8M console=ttySAC1,115200 init=/linuxrc mem=256M"
> > -CONFIG_VFP=y
> > -CONFIG_NEON=y
> > -CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
> > -CONFIG_BLK_DEV_LOOP=y
> > -CONFIG_BLK_DEV_RAM=y
> > -CONFIG_BLK_DEV_RAM_SIZE=8192
> > -CONFIG_SCSI=y
> > -CONFIG_BLK_DEV_SD=y
> > -CONFIG_CHR_DEV_SG=y
> > -CONFIG_INPUT_EVDEV=y
> > -# CONFIG_INPUT_KEYBOARD is not set
> > -# CONFIG_INPUT_MOUSE is not set
> > -CONFIG_INPUT_TOUCHSCREEN=y
> > -CONFIG_SERIAL_8250=y
> > -CONFIG_SERIAL_SAMSUNG=y
> > -CONFIG_SERIAL_SAMSUNG_CONSOLE=y
> > -CONFIG_HW_RANDOM=y
> > -CONFIG_I2C=y
> > -# CONFIG_HWMON is not set
> > -# CONFIG_MFD_SUPPORT is not set
> > -# CONFIG_HID_SUPPORT is not set
> > -# CONFIG_USB_SUPPORT is not set
> > -CONFIG_EXT2_FS=y
> > -CONFIG_MSDOS_FS=y
> > -CONFIG_VFAT_FS=y
> > -CONFIG_TMPFS=y
> > -CONFIG_TMPFS_POSIX_ACL=y
> > -CONFIG_CRAMFS=y
> > -CONFIG_ROMFS_FS=y
> > -CONFIG_PARTITION_ADVANCED=y
> > -CONFIG_BSD_DISKLABEL=y
> > -CONFIG_SOLARIS_X86_PARTITION=y
> > -CONFIG_NLS_CODEPAGE_437=y
> > -CONFIG_NLS_ASCII=y
> > -CONFIG_NLS_ISO8859_1=y
> > -CONFIG_MAGIC_SYSRQ=y
> > -CONFIG_DEBUG_KERNEL=y
> > -CONFIG_DETECT_HUNG_TASK=y
> > -CONFIG_DEBUG_RT_MUTEXES=y
> > -CONFIG_DEBUG_SPINLOCK=y
> > -CONFIG_DEBUG_MUTEXES=y
> > -CONFIG_DEBUG_INFO=y
> > -CONFIG_SYSCTL_SYSCALL_CHECK=y
> > -CONFIG_DEBUG_USER=y
> > -CONFIG_DEBUG_LL=y
> > -CONFIG_EARLY_PRINTK=y
> > -CONFIG_CRC_CCITT=y
