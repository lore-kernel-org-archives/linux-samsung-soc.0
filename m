From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH] ARM: EXYNOS: remove obsolete exynos4_defconfig
Date: Fri, 28 Jun 2013 17:23:38 +0200
Message-ID: <51CDAA7A.9030209@linaro.org>
References: <2326060.vKzrGtO1Cq@amdc1032> <51CD5C9B.2010706@linaro.org> <2247183.K8o4ATxfnz@amdc1032>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ea0-f177.google.com ([209.85.215.177]:47393 "EHLO
	mail-ea0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754518Ab3F1PXZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 28 Jun 2013 11:23:25 -0400
Received: by mail-ea0-f177.google.com with SMTP id j14so1111520eak.22
        for <linux-samsung-soc@vger.kernel.org>; Fri, 28 Jun 2013 08:23:23 -0700 (PDT)
In-Reply-To: <2247183.K8o4ATxfnz@amdc1032>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Kyungmin Park <kyungmin.park@samsung.com>, linux-samsung-soc@vger.kernel.org

On 06/28/2013 02:45 PM, Bartlomiej Zolnierkiewicz wrote:
> On Friday, June 28, 2013 11:51:23 AM Daniel Lezcano wrote:
>> On 06/28/2013 11:48 AM, Bartlomiej Zolnierkiewicz wrote:
>>> It hasn't been updated since Novemeber 2011 and exynos_defconfig
>>> should be used instead.
>>
>> Why ?
>=20
> After conversion to using device tree only (no board files) on
> mach-exynos using exynos4_defconfig results in unbootable kernel
> (I used next-20130626):

Ok, thanks for the clarification.

If the other one is usable in place of the exynos4_defconfig, that make=
s
sense to not keep a duplicate one.

With a more detailed changelog, you can add my:
Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>

Thanks
  -- Daniel

> ---
> Uncompressing Linux... done, booting the kernel.
> Booting Linux on physical CPU 0x900
> Linux version 3.10.0-rc7-next-20130626-dirty (bzolnier@amdc1032) (gcc=
 version 4.6.3 (Ubuntu/Linaro 4.6.3-1ubuntu5) ) 3
> CPU: ARMv7 Processor [412fc091] revision 1 (ARMv7), cr=3D10c5387d
> CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing instruction ca=
che
>=20
> Error: unrecognized/unsupported machine ID (r1 =3D 0x00000bad).
>=20
>=20
> Error: unrecognized/unsupported machine ID (r1 =3D 0x00000bad).
>=20
> Available machine support:
>=20
> ID (hex)        NAME
> Available machine support:
>=20
> ID (hex)        NAME
> ffffffff        Samsung Exynos4 (Flattened Device Tree)
> ffffffff        Samsung Exynos4 (Flattened Device Tree)
>=20
> Please check your kernel config and/or bootloader.
> ---
>=20
> There is no much point in trying to fix exynos4_defconfig because
> exynos_defconfig also works for EXYNOS4 SoCs, is being kept up to dat=
e
> (for the comparison the last exynos4_defconfig update was in November
> 2011) and has more useful stuff enabled (i.e. exynos4_defconfig doesn=
't
> even have EXT3 or EXT4 enabled, it only has EXT2 turned on).
>=20
> Another advantage of using one defconfig for both EXYNOS4 and EXYNOS5
> is that it makes development and testing easier. It should allow us
> to catch early EXYNOS4 regressions caused by EXYNOS5 changes and also
> EXYNOS4 changes that break EXYNOS5.
>=20
> Best regards,
> --
> Bartlomiej Zolnierkiewicz
> Samsung R&D Institute Poland
> Samsung Electronics
> =20
>>> Cc: Tomasz Figa <tomasz.figa@gmail.com>
>>> Cc: Kukjin Kim <kgene.kim@samsung.com>
>>> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
>>> Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
>>> ---
>>>  arch/arm/configs/exynos4_defconfig | 68 --------------------------=
------------
>>>  1 file changed, 68 deletions(-)
>>>  delete mode 100644 arch/arm/configs/exynos4_defconfig
>>>
>>> diff --git a/arch/arm/configs/exynos4_defconfig b/arch/arm/configs/=
exynos4_defconfig
>>> deleted file mode 100644
>>> index bffe68e..0000000
>>> --- a/arch/arm/configs/exynos4_defconfig
>>> +++ /dev/null
>>> @@ -1,68 +0,0 @@
>>> -CONFIG_EXPERIMENTAL=3Dy
>>> -CONFIG_BLK_DEV_INITRD=3Dy
>>> -CONFIG_KALLSYMS_ALL=3Dy
>>> -CONFIG_MODULES=3Dy
>>> -CONFIG_MODULE_UNLOAD=3Dy
>>> -# CONFIG_BLK_DEV_BSG is not set
>>> -CONFIG_ARCH_EXYNOS=3Dy
>>> -CONFIG_S3C_LOWLEVEL_UART_PORT=3D1
>>> -CONFIG_MACH_SMDKC210=3Dy
>>> -CONFIG_MACH_ARMLEX4210=3Dy
>>> -CONFIG_MACH_UNIVERSAL_C210=3Dy
>>> -CONFIG_MACH_NURI=3Dy
>>> -CONFIG_MACH_ORIGEN=3Dy
>>> -CONFIG_MACH_SMDK4412=3Dy
>>> -CONFIG_NO_HZ=3Dy
>>> -CONFIG_HIGH_RES_TIMERS=3Dy
>>> -CONFIG_SMP=3Dy
>>> -CONFIG_NR_CPUS=3D2
>>> -CONFIG_PREEMPT=3Dy
>>> -CONFIG_AEABI=3Dy
>>> -CONFIG_CMDLINE=3D"root=3D/dev/ram0 rw ramdisk=3D8192 initrd=3D0x41=
000000,8M console=3DttySAC1,115200 init=3D/linuxrc mem=3D256M"
>>> -CONFIG_VFP=3Dy
>>> -CONFIG_NEON=3Dy
>>> -CONFIG_UEVENT_HELPER_PATH=3D"/sbin/hotplug"
>>> -CONFIG_BLK_DEV_LOOP=3Dy
>>> -CONFIG_BLK_DEV_RAM=3Dy
>>> -CONFIG_BLK_DEV_RAM_SIZE=3D8192
>>> -CONFIG_SCSI=3Dy
>>> -CONFIG_BLK_DEV_SD=3Dy
>>> -CONFIG_CHR_DEV_SG=3Dy
>>> -CONFIG_INPUT_EVDEV=3Dy
>>> -# CONFIG_INPUT_KEYBOARD is not set
>>> -# CONFIG_INPUT_MOUSE is not set
>>> -CONFIG_INPUT_TOUCHSCREEN=3Dy
>>> -CONFIG_SERIAL_8250=3Dy
>>> -CONFIG_SERIAL_SAMSUNG=3Dy
>>> -CONFIG_SERIAL_SAMSUNG_CONSOLE=3Dy
>>> -CONFIG_HW_RANDOM=3Dy
>>> -CONFIG_I2C=3Dy
>>> -# CONFIG_HWMON is not set
>>> -# CONFIG_MFD_SUPPORT is not set
>>> -# CONFIG_HID_SUPPORT is not set
>>> -# CONFIG_USB_SUPPORT is not set
>>> -CONFIG_EXT2_FS=3Dy
>>> -CONFIG_MSDOS_FS=3Dy
>>> -CONFIG_VFAT_FS=3Dy
>>> -CONFIG_TMPFS=3Dy
>>> -CONFIG_TMPFS_POSIX_ACL=3Dy
>>> -CONFIG_CRAMFS=3Dy
>>> -CONFIG_ROMFS_FS=3Dy
>>> -CONFIG_PARTITION_ADVANCED=3Dy
>>> -CONFIG_BSD_DISKLABEL=3Dy
>>> -CONFIG_SOLARIS_X86_PARTITION=3Dy
>>> -CONFIG_NLS_CODEPAGE_437=3Dy
>>> -CONFIG_NLS_ASCII=3Dy
>>> -CONFIG_NLS_ISO8859_1=3Dy
>>> -CONFIG_MAGIC_SYSRQ=3Dy
>>> -CONFIG_DEBUG_KERNEL=3Dy
>>> -CONFIG_DETECT_HUNG_TASK=3Dy
>>> -CONFIG_DEBUG_RT_MUTEXES=3Dy
>>> -CONFIG_DEBUG_SPINLOCK=3Dy
>>> -CONFIG_DEBUG_MUTEXES=3Dy
>>> -CONFIG_DEBUG_INFO=3Dy
>>> -CONFIG_SYSCTL_SYSCALL_CHECK=3Dy
>>> -CONFIG_DEBUG_USER=3Dy
>>> -CONFIG_DEBUG_LL=3Dy
>>> -CONFIG_EARLY_PRINTK=3Dy
>>> -CONFIG_CRC_CCITT=3Dy


--=20
 <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software for=
 ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
