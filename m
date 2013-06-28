From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH] ARM: EXYNOS: remove obsolete exynos4_defconfig
Date: Fri, 28 Jun 2013 11:51:23 +0200
Message-ID: <51CD5C9B.2010706@linaro.org>
References: <2326060.vKzrGtO1Cq@amdc1032>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f42.google.com ([74.125.83.42]:62512 "EHLO
	mail-ee0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755015Ab3F1JvK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 28 Jun 2013 05:51:10 -0400
Received: by mail-ee0-f42.google.com with SMTP id c4so946231eek.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 28 Jun 2013 02:51:08 -0700 (PDT)
In-Reply-To: <2326060.vKzrGtO1Cq@amdc1032>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Kyungmin Park <kyungmin.park@samsung.com>, linux-samsung-soc@vger.kernel.org

On 06/28/2013 11:48 AM, Bartlomiej Zolnierkiewicz wrote:
> It hasn't been updated since Novemeber 2011 and exynos_defconfig
> should be used instead.

Why ?

> Cc: Tomasz Figa <tomasz.figa@gmail.com>
> Cc: Kukjin Kim <kgene.kim@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> ---
>  arch/arm/configs/exynos4_defconfig | 68 ----------------------------=
----------
>  1 file changed, 68 deletions(-)
>  delete mode 100644 arch/arm/configs/exynos4_defconfig
>=20
> diff --git a/arch/arm/configs/exynos4_defconfig b/arch/arm/configs/ex=
ynos4_defconfig
> deleted file mode 100644
> index bffe68e..0000000
> --- a/arch/arm/configs/exynos4_defconfig
> +++ /dev/null
> @@ -1,68 +0,0 @@
> -CONFIG_EXPERIMENTAL=3Dy
> -CONFIG_BLK_DEV_INITRD=3Dy
> -CONFIG_KALLSYMS_ALL=3Dy
> -CONFIG_MODULES=3Dy
> -CONFIG_MODULE_UNLOAD=3Dy
> -# CONFIG_BLK_DEV_BSG is not set
> -CONFIG_ARCH_EXYNOS=3Dy
> -CONFIG_S3C_LOWLEVEL_UART_PORT=3D1
> -CONFIG_MACH_SMDKC210=3Dy
> -CONFIG_MACH_ARMLEX4210=3Dy
> -CONFIG_MACH_UNIVERSAL_C210=3Dy
> -CONFIG_MACH_NURI=3Dy
> -CONFIG_MACH_ORIGEN=3Dy
> -CONFIG_MACH_SMDK4412=3Dy
> -CONFIG_NO_HZ=3Dy
> -CONFIG_HIGH_RES_TIMERS=3Dy
> -CONFIG_SMP=3Dy
> -CONFIG_NR_CPUS=3D2
> -CONFIG_PREEMPT=3Dy
> -CONFIG_AEABI=3Dy
> -CONFIG_CMDLINE=3D"root=3D/dev/ram0 rw ramdisk=3D8192 initrd=3D0x4100=
0000,8M console=3DttySAC1,115200 init=3D/linuxrc mem=3D256M"
> -CONFIG_VFP=3Dy
> -CONFIG_NEON=3Dy
> -CONFIG_UEVENT_HELPER_PATH=3D"/sbin/hotplug"
> -CONFIG_BLK_DEV_LOOP=3Dy
> -CONFIG_BLK_DEV_RAM=3Dy
> -CONFIG_BLK_DEV_RAM_SIZE=3D8192
> -CONFIG_SCSI=3Dy
> -CONFIG_BLK_DEV_SD=3Dy
> -CONFIG_CHR_DEV_SG=3Dy
> -CONFIG_INPUT_EVDEV=3Dy
> -# CONFIG_INPUT_KEYBOARD is not set
> -# CONFIG_INPUT_MOUSE is not set
> -CONFIG_INPUT_TOUCHSCREEN=3Dy
> -CONFIG_SERIAL_8250=3Dy
> -CONFIG_SERIAL_SAMSUNG=3Dy
> -CONFIG_SERIAL_SAMSUNG_CONSOLE=3Dy
> -CONFIG_HW_RANDOM=3Dy
> -CONFIG_I2C=3Dy
> -# CONFIG_HWMON is not set
> -# CONFIG_MFD_SUPPORT is not set
> -# CONFIG_HID_SUPPORT is not set
> -# CONFIG_USB_SUPPORT is not set
> -CONFIG_EXT2_FS=3Dy
> -CONFIG_MSDOS_FS=3Dy
> -CONFIG_VFAT_FS=3Dy
> -CONFIG_TMPFS=3Dy
> -CONFIG_TMPFS_POSIX_ACL=3Dy
> -CONFIG_CRAMFS=3Dy
> -CONFIG_ROMFS_FS=3Dy
> -CONFIG_PARTITION_ADVANCED=3Dy
> -CONFIG_BSD_DISKLABEL=3Dy
> -CONFIG_SOLARIS_X86_PARTITION=3Dy
> -CONFIG_NLS_CODEPAGE_437=3Dy
> -CONFIG_NLS_ASCII=3Dy
> -CONFIG_NLS_ISO8859_1=3Dy
> -CONFIG_MAGIC_SYSRQ=3Dy
> -CONFIG_DEBUG_KERNEL=3Dy
> -CONFIG_DETECT_HUNG_TASK=3Dy
> -CONFIG_DEBUG_RT_MUTEXES=3Dy
> -CONFIG_DEBUG_SPINLOCK=3Dy
> -CONFIG_DEBUG_MUTEXES=3Dy
> -CONFIG_DEBUG_INFO=3Dy
> -CONFIG_SYSCTL_SYSCALL_CHECK=3Dy
> -CONFIG_DEBUG_USER=3Dy
> -CONFIG_DEBUG_LL=3Dy
> -CONFIG_EARLY_PRINTK=3Dy
> -CONFIG_CRC_CCITT=3Dy
>=20


--=20
 <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software for=
 ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
