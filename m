From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: RE: [PATCH v2] ARM: s5pv210_defconfig: Update for removing
 s5pc110_defconfig
Date: Wed, 14 Jul 2010 15:15:23 +0200
Message-ID: <00c801cb2356$a1b2f290$e518d7b0$%szyprowski@samsung.com>
References: <1278987726-10803-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:30516 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754253Ab0GNNQp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Jul 2010 09:16:45 -0400
Received: from epmmp2 (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L5J00LAJU7VEI10@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 14 Jul 2010 22:16:43 +0900 (KST)
Received: from AMDC159 ([106.116.37.153])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L5J00JE9U7PBA@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 14 Jul 2010 22:16:43 +0900 (KST)
In-reply-to: <1278987726-10803-1-git-send-email-kgene.kim@samsung.com>
Content-language: pl
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kukjin Kim' <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kyungmin.park@samsung.com
Cc: ben-linux@fluff.org

Hello,

On Tuesday, July 13, 2010 4:22 AM Kukjin Kim wrote:

> Now that S5PC110 machines and S5PV210 machines can be built into
> one kernel, update mach-s5pv210/Kconfig and s5pv210_defconfig.
> 
> Tested on SMDKC110(S5PC110) and SMDKV210(S5PV210).
> Note that GONI machine ID is not included in the kernel.

Russell finally updated mach-types in his latest kernel tree: 
http://ftp.arm.linux.org.uk/pub/linux/arm/kernel/git-cur/linux-2.6-arm.git/
(master branch).

I've tested this patch with Aquila and GONI boards and it's ok.
 
> Created and tested against linux-2.6.35-rc5.
> 
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>

Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>

> ---
> Changes since v1:
> - This patch re-based against linux-2.6.35-rc5 which includes
>   'ARM: reduce defconfigs' from Uwe Kleine-Konig.
> 
>  arch/arm/configs/s5pc110_defconfig |   66 --------------------------------
> ----
>  arch/arm/configs/s5pv210_defconfig |    4 ++
>  arch/arm/mach-s5pv210/Kconfig      |   28 +++++++++------
>  3 files changed, 21 insertions(+), 77 deletions(-)
>  delete mode 100644 arch/arm/configs/s5pc110_defconfig
> 
> diff --git a/arch/arm/configs/s5pc110_defconfig
> b/arch/arm/configs/s5pc110_defconfig
> deleted file mode 100644
> index 22c2d14..0000000
> --- a/arch/arm/configs/s5pc110_defconfig
> +++ /dev/null
> @@ -1,66 +0,0 @@
> -CONFIG_EXPERIMENTAL=y
> -CONFIG_SYSFS_DEPRECATED_V2=y
> -CONFIG_BLK_DEV_INITRD=y
> -CONFIG_KALLSYMS_ALL=y
> -CONFIG_MODULES=y
> -CONFIG_MODULE_UNLOAD=y
> -# CONFIG_BLK_DEV_BSG is not set
> -CONFIG_ARCH_S5PV210=y
> -CONFIG_S3C_LOWLEVEL_UART_PORT=1
> -CONFIG_MACH_SMDKC110=y
> -CONFIG_VMSPLIT_2G=y
> -CONFIG_PREEMPT=y
> -CONFIG_AEABI=y
> -CONFIG_CMDLINE="root=/dev/ram0 rw ramdisk=8192 initrd=0x20800000,8M
> console=ttySAC1,115200 init=/linuxrc"
> -CONFIG_VFP=y
> -CONFIG_NEON=y
> -CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
> -CONFIG_BLK_DEV_LOOP=y
> -CONFIG_BLK_DEV_RAM=y
> -CONFIG_BLK_DEV_RAM_SIZE=8192
> -# CONFIG_MISC_DEVICES is not set
> -CONFIG_SCSI=y
> -CONFIG_BLK_DEV_SD=y
> -CONFIG_CHR_DEV_SG=y
> -CONFIG_INPUT_EVDEV=y
> -# CONFIG_INPUT_KEYBOARD is not set
> -# CONFIG_INPUT_MOUSE is not set
> -CONFIG_INPUT_TOUCHSCREEN=y
> -CONFIG_SERIAL_8250=y
> -CONFIG_SERIAL_SAMSUNG=y
> -CONFIG_SERIAL_SAMSUNG_CONSOLE=y
> -CONFIG_HW_RANDOM=y
> -# CONFIG_HWMON is not set
> -# CONFIG_VGA_CONSOLE is not set
> -# CONFIG_HID_SUPPORT is not set
> -# CONFIG_USB_SUPPORT is not set
> -CONFIG_EXT2_FS=y
> -CONFIG_INOTIFY=y
> -CONFIG_MSDOS_FS=y
> -CONFIG_VFAT_FS=y
> -CONFIG_TMPFS=y
> -CONFIG_TMPFS_POSIX_ACL=y
> -CONFIG_CRAMFS=y
> -CONFIG_ROMFS_FS=y
> -CONFIG_PARTITION_ADVANCED=y
> -CONFIG_BSD_DISKLABEL=y
> -CONFIG_SOLARIS_X86_PARTITION=y
> -CONFIG_NLS_CODEPAGE_437=y
> -CONFIG_NLS_ASCII=y
> -CONFIG_NLS_ISO8859_1=y
> -CONFIG_MAGIC_SYSRQ=y
> -CONFIG_DEBUG_KERNEL=y
> -# CONFIG_DEBUG_PREEMPT is not set
> -CONFIG_DEBUG_RT_MUTEXES=y
> -CONFIG_DEBUG_SPINLOCK=y
> -CONFIG_DEBUG_MUTEXES=y
> -CONFIG_DEBUG_SPINLOCK_SLEEP=y
> -CONFIG_DEBUG_INFO=y
> -# CONFIG_RCU_CPU_STALL_DETECTOR is not set
> -CONFIG_SYSCTL_SYSCALL_CHECK=y
> -CONFIG_DEBUG_USER=y
> -CONFIG_DEBUG_ERRORS=y
> -CONFIG_DEBUG_LL=y
> -CONFIG_EARLY_PRINTK=y
> -CONFIG_DEBUG_S3C_UART=1
> -CONFIG_CRC_CCITT=y
> diff --git a/arch/arm/configs/s5pv210_defconfig
> b/arch/arm/configs/s5pv210_defconfig
> index 1753836..b2fbbff 100644
> --- a/arch/arm/configs/s5pv210_defconfig
> +++ b/arch/arm/configs/s5pv210_defconfig
> @@ -7,6 +7,10 @@ CONFIG_MODULE_UNLOAD=y
>  # CONFIG_BLK_DEV_BSG is not set
>  CONFIG_ARCH_S5PV210=y
>  CONFIG_S3C_LOWLEVEL_UART_PORT=1
> +CONFIG_S3C_DEV_FB=y
> +CONFIG_S5PV210_SETUP_FB_24BPP=y
> +CONFIG_MACH_AQUILA=y
> +CONFIG_MACH_SMDKC110=y
>  CONFIG_MACH_SMDKV210=y
>  CONFIG_VMSPLIT_2G=y
>  CONFIG_PREEMPT=y
> diff --git a/arch/arm/mach-s5pv210/Kconfig b/arch/arm/mach-s5pv210/Kconfig
> index 7e2e1eb..e7b98bf 100644
> --- a/arch/arm/mach-s5pv210/Kconfig
> +++ b/arch/arm/mach-s5pv210/Kconfig
> @@ -43,10 +43,10 @@ config S5PV210_SETUP_SDHCI_GPIO
>  	help
>  	  Common setup code for SDHCI gpio.
> 
> -# machine support
> +menu "S5PC110 Machines"
> 
>  config MACH_AQUILA
> -	bool "Samsung Aquila"
> +	bool "Aquila"
>  	select CPU_S5PV210
>  	select ARCH_SPARSEMEM_ENABLE
>  	select S5PV210_SETUP_FB_24BPP
> @@ -64,11 +64,25 @@ config MACH_GONI
>  	  Machine support for Samsung GONI board
>  	  S5PC110(MCP) is one of package option of S5PV210
> 
> +config MACH_SMDKC110
> +	bool "SMDKC110"
> +	select CPU_S5PV210
> +	select ARCH_SPARSEMEM_ENABLE
> +	select S3C_DEV_WDT
> +	select HAVE_S3C2410_WATCHDOG
> +	help
> +	  Machine support for Samsung SMDKC110
> +	  S5PC110(MCP) is one of package option of S5PV210
> +
> +endmenu
> +
>  config S5PC110_DEV_ONENAND
>  	bool
>  	help
>  	  Compile in platform device definition for OneNAND1 controller
> 
> +menu "S5PV210 Machines"
> +
>  config MACH_SMDKV210
>  	bool "SMDKV210"
>  	select CPU_S5PV210
> @@ -80,14 +94,6 @@ config MACH_SMDKV210
>  	help
>  	  Machine support for Samsung SMDKV210
> 
> -config MACH_SMDKC110
> -	bool "SMDKC110"
> -	select CPU_S5PV210
> -	select ARCH_SPARSEMEM_ENABLE
> -	select S3C_DEV_WDT
> -	select HAVE_S3C2410_WATCHDOG
> -	help
> -	  Machine support for Samsung SMDKC110
> -	  S5PC110(MCP) is one of package option of S5PV210
> +endmenu
> 
>  endif
> --
> 1.6.2.5


Best regards
--
Marek Szyprowski
Samsung Poland R&D Center
