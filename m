From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH v2] ARM: s5pv210_defconfig: Update for removing
	s5pc110_defconfig
Date: Wed, 14 Jul 2010 22:23:53 +0900
Message-ID: <AANLkTinj3ENr1dcv-HWKwx54kij0iIpyYNRFqkIdXC2f@mail.gmail.com>
References: <1278987726-10803-1-git-send-email-kgene.kim@samsung.com>
	<00c801cb2356$a1b2f290$e518d7b0$%szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-px0-f174.google.com ([209.85.212.174]:42656 "EHLO
	mail-px0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757108Ab0GNNXz convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Jul 2010 09:23:55 -0400
Received: by pxi14 with SMTP id 14so2721794pxi.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Jul 2010 06:23:54 -0700 (PDT)
In-Reply-To: <00c801cb2356$a1b2f290$e518d7b0$%szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

On Wed, Jul 14, 2010 at 10:15 PM, Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
> Hello,
>
> On Tuesday, July 13, 2010 4:22 AM Kukjin Kim wrote:
>
>> Now that S5PC110 machines and S5PV210 machines can be built into
>> one kernel, update mach-s5pv210/Kconfig and s5pv210_defconfig.
>>
>> Tested on SMDKC110(S5PC110) and SMDKV210(S5PV210).
>> Note that GONI machine ID is not included in the kernel.
>
> Russell finally updated mach-types in his latest kernel tree:
> http://ftp.arm.linux.org.uk/pub/linux/arm/kernel/git-cur/linux-2.6-ar=
m.git/
> (master branch).
>
> I've tested this patch with Aquila and GONI boards and it's ok.
>
>> Created and tested against linux-2.6.35-rc5.
>>
>> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
>
> Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
>
>> ---
>> Changes since v1:
>> - This patch re-based against linux-2.6.35-rc5 which includes
>> =A0 'ARM: reduce defconfigs' from Uwe Kleine-Konig.

No need to update board_defconfig since the latest merge removes the
all arm *_defconfig.

Thank you,
Kyungmin Park

>>
>> =A0arch/arm/configs/s5pc110_defconfig | =A0 66 ---------------------=
-----------
>> ----
>> =A0arch/arm/configs/s5pv210_defconfig | =A0 =A04 ++
>> =A0arch/arm/mach-s5pv210/Kconfig =A0 =A0 =A0| =A0 28 +++++++++------
>> =A03 files changed, 21 insertions(+), 77 deletions(-)
>> =A0delete mode 100644 arch/arm/configs/s5pc110_defconfig
>>
>> diff --git a/arch/arm/configs/s5pc110_defconfig
>> b/arch/arm/configs/s5pc110_defconfig
>> deleted file mode 100644
>> index 22c2d14..0000000
>> --- a/arch/arm/configs/s5pc110_defconfig
>> +++ /dev/null
>> @@ -1,66 +0,0 @@
>> -CONFIG_EXPERIMENTAL=3Dy
>> -CONFIG_SYSFS_DEPRECATED_V2=3Dy
>> -CONFIG_BLK_DEV_INITRD=3Dy
>> -CONFIG_KALLSYMS_ALL=3Dy
>> -CONFIG_MODULES=3Dy
>> -CONFIG_MODULE_UNLOAD=3Dy
>> -# CONFIG_BLK_DEV_BSG is not set
>> -CONFIG_ARCH_S5PV210=3Dy
>> -CONFIG_S3C_LOWLEVEL_UART_PORT=3D1
>> -CONFIG_MACH_SMDKC110=3Dy
>> -CONFIG_VMSPLIT_2G=3Dy
>> -CONFIG_PREEMPT=3Dy
>> -CONFIG_AEABI=3Dy
>> -CONFIG_CMDLINE=3D"root=3D/dev/ram0 rw ramdisk=3D8192 initrd=3D0x208=
00000,8M
>> console=3DttySAC1,115200 init=3D/linuxrc"
>> -CONFIG_VFP=3Dy
>> -CONFIG_NEON=3Dy
>> -CONFIG_UEVENT_HELPER_PATH=3D"/sbin/hotplug"
>> -CONFIG_BLK_DEV_LOOP=3Dy
>> -CONFIG_BLK_DEV_RAM=3Dy
>> -CONFIG_BLK_DEV_RAM_SIZE=3D8192
>> -# CONFIG_MISC_DEVICES is not set
>> -CONFIG_SCSI=3Dy
>> -CONFIG_BLK_DEV_SD=3Dy
>> -CONFIG_CHR_DEV_SG=3Dy
>> -CONFIG_INPUT_EVDEV=3Dy
>> -# CONFIG_INPUT_KEYBOARD is not set
>> -# CONFIG_INPUT_MOUSE is not set
>> -CONFIG_INPUT_TOUCHSCREEN=3Dy
>> -CONFIG_SERIAL_8250=3Dy
>> -CONFIG_SERIAL_SAMSUNG=3Dy
>> -CONFIG_SERIAL_SAMSUNG_CONSOLE=3Dy
>> -CONFIG_HW_RANDOM=3Dy
>> -# CONFIG_HWMON is not set
>> -# CONFIG_VGA_CONSOLE is not set
>> -# CONFIG_HID_SUPPORT is not set
>> -# CONFIG_USB_SUPPORT is not set
>> -CONFIG_EXT2_FS=3Dy
>> -CONFIG_INOTIFY=3Dy
>> -CONFIG_MSDOS_FS=3Dy
>> -CONFIG_VFAT_FS=3Dy
>> -CONFIG_TMPFS=3Dy
>> -CONFIG_TMPFS_POSIX_ACL=3Dy
>> -CONFIG_CRAMFS=3Dy
>> -CONFIG_ROMFS_FS=3Dy
>> -CONFIG_PARTITION_ADVANCED=3Dy
>> -CONFIG_BSD_DISKLABEL=3Dy
>> -CONFIG_SOLARIS_X86_PARTITION=3Dy
>> -CONFIG_NLS_CODEPAGE_437=3Dy
>> -CONFIG_NLS_ASCII=3Dy
>> -CONFIG_NLS_ISO8859_1=3Dy
>> -CONFIG_MAGIC_SYSRQ=3Dy
>> -CONFIG_DEBUG_KERNEL=3Dy
>> -# CONFIG_DEBUG_PREEMPT is not set
>> -CONFIG_DEBUG_RT_MUTEXES=3Dy
>> -CONFIG_DEBUG_SPINLOCK=3Dy
>> -CONFIG_DEBUG_MUTEXES=3Dy
>> -CONFIG_DEBUG_SPINLOCK_SLEEP=3Dy
>> -CONFIG_DEBUG_INFO=3Dy
>> -# CONFIG_RCU_CPU_STALL_DETECTOR is not set
>> -CONFIG_SYSCTL_SYSCALL_CHECK=3Dy
>> -CONFIG_DEBUG_USER=3Dy
>> -CONFIG_DEBUG_ERRORS=3Dy
>> -CONFIG_DEBUG_LL=3Dy
>> -CONFIG_EARLY_PRINTK=3Dy
>> -CONFIG_DEBUG_S3C_UART=3D1
>> -CONFIG_CRC_CCITT=3Dy
>> diff --git a/arch/arm/configs/s5pv210_defconfig
>> b/arch/arm/configs/s5pv210_defconfig
>> index 1753836..b2fbbff 100644
>> --- a/arch/arm/configs/s5pv210_defconfig
>> +++ b/arch/arm/configs/s5pv210_defconfig
>> @@ -7,6 +7,10 @@ CONFIG_MODULE_UNLOAD=3Dy
>> =A0# CONFIG_BLK_DEV_BSG is not set
>> =A0CONFIG_ARCH_S5PV210=3Dy
>> =A0CONFIG_S3C_LOWLEVEL_UART_PORT=3D1
>> +CONFIG_S3C_DEV_FB=3Dy
>> +CONFIG_S5PV210_SETUP_FB_24BPP=3Dy
>> +CONFIG_MACH_AQUILA=3Dy
>> +CONFIG_MACH_SMDKC110=3Dy
>> =A0CONFIG_MACH_SMDKV210=3Dy
>> =A0CONFIG_VMSPLIT_2G=3Dy
>> =A0CONFIG_PREEMPT=3Dy
>> diff --git a/arch/arm/mach-s5pv210/Kconfig b/arch/arm/mach-s5pv210/K=
config
>> index 7e2e1eb..e7b98bf 100644
>> --- a/arch/arm/mach-s5pv210/Kconfig
>> +++ b/arch/arm/mach-s5pv210/Kconfig
>> @@ -43,10 +43,10 @@ config S5PV210_SETUP_SDHCI_GPIO
>> =A0 =A0 =A0 help
>> =A0 =A0 =A0 =A0 Common setup code for SDHCI gpio.
>>
>> -# machine support
>> +menu "S5PC110 Machines"
>>
>> =A0config MACH_AQUILA
>> - =A0 =A0 bool "Samsung Aquila"
>> + =A0 =A0 bool "Aquila"
>> =A0 =A0 =A0 select CPU_S5PV210
>> =A0 =A0 =A0 select ARCH_SPARSEMEM_ENABLE
>> =A0 =A0 =A0 select S5PV210_SETUP_FB_24BPP
>> @@ -64,11 +64,25 @@ config MACH_GONI
>> =A0 =A0 =A0 =A0 Machine support for Samsung GONI board
>> =A0 =A0 =A0 =A0 S5PC110(MCP) is one of package option of S5PV210
>>
>> +config MACH_SMDKC110
>> + =A0 =A0 bool "SMDKC110"
>> + =A0 =A0 select CPU_S5PV210
>> + =A0 =A0 select ARCH_SPARSEMEM_ENABLE
>> + =A0 =A0 select S3C_DEV_WDT
>> + =A0 =A0 select HAVE_S3C2410_WATCHDOG
>> + =A0 =A0 help
>> + =A0 =A0 =A0 Machine support for Samsung SMDKC110
>> + =A0 =A0 =A0 S5PC110(MCP) is one of package option of S5PV210
>> +
>> +endmenu
>> +
>> =A0config S5PC110_DEV_ONENAND
>> =A0 =A0 =A0 bool
>> =A0 =A0 =A0 help
>> =A0 =A0 =A0 =A0 Compile in platform device definition for OneNAND1 c=
ontroller
>>
>> +menu "S5PV210 Machines"
>> +
>> =A0config MACH_SMDKV210
>> =A0 =A0 =A0 bool "SMDKV210"
>> =A0 =A0 =A0 select CPU_S5PV210
>> @@ -80,14 +94,6 @@ config MACH_SMDKV210
>> =A0 =A0 =A0 help
>> =A0 =A0 =A0 =A0 Machine support for Samsung SMDKV210
>>
>> -config MACH_SMDKC110
>> - =A0 =A0 bool "SMDKC110"
>> - =A0 =A0 select CPU_S5PV210
>> - =A0 =A0 select ARCH_SPARSEMEM_ENABLE
>> - =A0 =A0 select S3C_DEV_WDT
>> - =A0 =A0 select HAVE_S3C2410_WATCHDOG
>> - =A0 =A0 help
>> - =A0 =A0 =A0 Machine support for Samsung SMDKC110
>> - =A0 =A0 =A0 S5PC110(MCP) is one of package option of S5PV210
>> +endmenu
>>
>> =A0endif
>> --
>> 1.6.2.5
>
>
> Best regards
> --
> Marek Szyprowski
> Samsung Poland R&D Center
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
