From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH] ARM: s5pv210_defconfig: Update for removing
	s5pc110_defconfig
Date: Wed, 16 Jun 2010 09:07:25 +0900
Message-ID: <AANLkTilROdCkyX1Q0rMYYhhNxzdj5Mf3F4PWRGxG0DXO@mail.gmail.com>
References: <1276645344-16623-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vw0-f46.google.com ([209.85.212.46]:61591 "EHLO
	mail-vw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752888Ab0FPAH0 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 Jun 2010 20:07:26 -0400
Received: by vws13 with SMTP id 13so1906789vws.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 15 Jun 2010 17:07:26 -0700 (PDT)
In-Reply-To: <1276645344-16623-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

Acked-by: Kyungmin Park <kyungmin.park@samsung.com>

P.s. How about the define C110_COMMON select to reduce Kconfig lines?
in case of c110 has almost same features. sparemem, 24 fb, rtc, and so
on.

On Wed, Jun 16, 2010 at 8:42 AM, Kukjin Kim <kgene.kim@samsung.com> wro=
te:
> Now that S5PC110 machines and S5PV210 machines can be built into
> one kernel, update mach-s5pv210/Kconfig and s5pv210_defconfig.
>
> Tested on SMDKC110(S5PC110) and SMDKV210(S5PV210).
> Note that GONI machine ID is not included in the kernel.
>
> Created and tested against linux-2.6.35-rc3.
>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
> =A0arch/arm/configs/s5pc110_defconfig | =A0924 ----------------------=
--------------
> =A0arch/arm/configs/s5pv210_defconfig | =A0 30 +-
> =A0arch/arm/mach-s5pv210/Kconfig =A0 =A0 =A0| =A0 28 +-
> =A03 files changed, 39 insertions(+), 943 deletions(-)
> =A0delete mode 100644 arch/arm/configs/s5pc110_defconfig
>
> diff --git a/arch/arm/configs/s5pc110_defconfig b/arch/arm/configs/s5=
pc110_defconfig
> deleted file mode 100644
> index c4de360..0000000
> --- a/arch/arm/configs/s5pc110_defconfig
> +++ /dev/null
> @@ -1,924 +0,0 @@
> -#
> -# Automatically generated make config: don't edit
> -# Linux kernel version: 2.6.34
> -# Wed May 26 19:04:37 2010
> -#
> -CONFIG_ARM=3Dy
> -CONFIG_SYS_SUPPORTS_APM_EMULATION=3Dy
> -CONFIG_GENERIC_GPIO=3Dy
> -CONFIG_GENERIC_TIME=3Dy
> -CONFIG_ARCH_USES_GETTIMEOFFSET=3Dy
> -CONFIG_HAVE_PROC_CPU=3Dy
> -CONFIG_NO_IOPORT=3Dy
> -CONFIG_GENERIC_HARDIRQS=3Dy
> -CONFIG_STACKTRACE_SUPPORT=3Dy
> -CONFIG_HAVE_LATENCYTOP_SUPPORT=3Dy
> -CONFIG_LOCKDEP_SUPPORT=3Dy
> -CONFIG_TRACE_IRQFLAGS_SUPPORT=3Dy
> -CONFIG_HARDIRQS_SW_RESEND=3Dy
> -CONFIG_GENERIC_IRQ_PROBE=3Dy
> -CONFIG_RWSEM_GENERIC_SPINLOCK=3Dy
> -CONFIG_GENERIC_HWEIGHT=3Dy
> -CONFIG_GENERIC_CALIBRATE_DELAY=3Dy
> -CONFIG_NEED_DMA_MAP_STATE=3Dy
> -CONFIG_GENERIC_HARDIRQS_NO__DO_IRQ=3Dy
> -CONFIG_ARM_L1_CACHE_SHIFT_6=3Dy
> -CONFIG_VECTORS_BASE=3D0xffff0000
> -CONFIG_DEFCONFIG_LIST=3D"/lib/modules/$UNAME_RELEASE/.config"
> -CONFIG_CONSTRUCTORS=3Dy
> -
> -#
> -# General setup
> -#
> -CONFIG_EXPERIMENTAL=3Dy
> -CONFIG_BROKEN_ON_SMP=3Dy
> -CONFIG_LOCK_KERNEL=3Dy
> -CONFIG_INIT_ENV_ARG_LIMIT=3D32
> -CONFIG_LOCALVERSION=3D""
> -CONFIG_LOCALVERSION_AUTO=3Dy
> -CONFIG_HAVE_KERNEL_GZIP=3Dy
> -CONFIG_HAVE_KERNEL_LZMA=3Dy
> -CONFIG_HAVE_KERNEL_LZO=3Dy
> -CONFIG_KERNEL_GZIP=3Dy
> -# CONFIG_KERNEL_BZIP2 is not set
> -# CONFIG_KERNEL_LZMA is not set
> -# CONFIG_KERNEL_LZO is not set
> -CONFIG_SWAP=3Dy
> -# CONFIG_SYSVIPC is not set
> -# CONFIG_BSD_PROCESS_ACCT is not set
> -
> -#
> -# RCU Subsystem
> -#
> -CONFIG_TREE_RCU=3Dy
> -# CONFIG_TREE_PREEMPT_RCU is not set
> -# CONFIG_TINY_RCU is not set
> -# CONFIG_RCU_TRACE is not set
> -CONFIG_RCU_FANOUT=3D32
> -# CONFIG_RCU_FANOUT_EXACT is not set
> -# CONFIG_TREE_RCU_TRACE is not set
> -# CONFIG_IKCONFIG is not set
> -CONFIG_LOG_BUF_SHIFT=3D17
> -# CONFIG_CGROUPS is not set
> -CONFIG_SYSFS_DEPRECATED=3Dy
> -CONFIG_SYSFS_DEPRECATED_V2=3Dy
> -# CONFIG_RELAY is not set
> -CONFIG_NAMESPACES=3Dy
> -# CONFIG_UTS_NS is not set
> -# CONFIG_USER_NS is not set
> -# CONFIG_PID_NS is not set
> -CONFIG_BLK_DEV_INITRD=3Dy
> -CONFIG_INITRAMFS_SOURCE=3D""
> -CONFIG_RD_GZIP=3Dy
> -CONFIG_RD_BZIP2=3Dy
> -CONFIG_RD_LZMA=3Dy
> -CONFIG_RD_LZO=3Dy
> -CONFIG_CC_OPTIMIZE_FOR_SIZE=3Dy
> -CONFIG_SYSCTL=3Dy
> -CONFIG_ANON_INODES=3Dy
> -# CONFIG_EMBEDDED is not set
> -CONFIG_UID16=3Dy
> -CONFIG_SYSCTL_SYSCALL=3Dy
> -CONFIG_KALLSYMS=3Dy
> -CONFIG_KALLSYMS_ALL=3Dy
> -# CONFIG_KALLSYMS_EXTRA_PASS is not set
> -CONFIG_HOTPLUG=3Dy
> -CONFIG_PRINTK=3Dy
> -CONFIG_BUG=3Dy
> -CONFIG_ELF_CORE=3Dy
> -CONFIG_BASE_FULL=3Dy
> -CONFIG_FUTEX=3Dy
> -CONFIG_EPOLL=3Dy
> -CONFIG_SIGNALFD=3Dy
> -CONFIG_TIMERFD=3Dy
> -CONFIG_EVENTFD=3Dy
> -CONFIG_SHMEM=3Dy
> -CONFIG_AIO=3Dy
> -CONFIG_HAVE_PERF_EVENTS=3Dy
> -CONFIG_PERF_USE_VMALLOC=3Dy
> -
> -#
> -# Kernel Performance Events And Counters
> -#
> -# CONFIG_PERF_EVENTS is not set
> -# CONFIG_PERF_COUNTERS is not set
> -CONFIG_VM_EVENT_COUNTERS=3Dy
> -CONFIG_SLUB_DEBUG=3Dy
> -CONFIG_COMPAT_BRK=3Dy
> -# CONFIG_SLAB is not set
> -CONFIG_SLUB=3Dy
> -# CONFIG_SLOB is not set
> -# CONFIG_PROFILING is not set
> -CONFIG_HAVE_OPROFILE=3Dy
> -# CONFIG_KPROBES is not set
> -CONFIG_HAVE_KPROBES=3Dy
> -CONFIG_HAVE_KRETPROBES=3Dy
> -CONFIG_HAVE_CLK=3Dy
> -
> -#
> -# GCOV-based kernel profiling
> -#
> -# CONFIG_SLOW_WORK is not set
> -CONFIG_HAVE_GENERIC_DMA_COHERENT=3Dy
> -CONFIG_SLABINFO=3Dy
> -CONFIG_RT_MUTEXES=3Dy
> -CONFIG_BASE_SMALL=3D0
> -CONFIG_MODULES=3Dy
> -# CONFIG_MODULE_FORCE_LOAD is not set
> -CONFIG_MODULE_UNLOAD=3Dy
> -# CONFIG_MODULE_FORCE_UNLOAD is not set
> -# CONFIG_MODVERSIONS is not set
> -# CONFIG_MODULE_SRCVERSION_ALL is not set
> -CONFIG_BLOCK=3Dy
> -CONFIG_LBDAF=3Dy
> -# CONFIG_BLK_DEV_BSG is not set
> -# CONFIG_BLK_DEV_INTEGRITY is not set
> -
> -#
> -# IO Schedulers
> -#
> -CONFIG_IOSCHED_NOOP=3Dy
> -CONFIG_IOSCHED_DEADLINE=3Dy
> -CONFIG_IOSCHED_CFQ=3Dy
> -# CONFIG_DEFAULT_DEADLINE is not set
> -CONFIG_DEFAULT_CFQ=3Dy
> -# CONFIG_DEFAULT_NOOP is not set
> -CONFIG_DEFAULT_IOSCHED=3D"cfq"
> -# CONFIG_INLINE_SPIN_TRYLOCK is not set
> -# CONFIG_INLINE_SPIN_TRYLOCK_BH is not set
> -# CONFIG_INLINE_SPIN_LOCK is not set
> -# CONFIG_INLINE_SPIN_LOCK_BH is not set
> -# CONFIG_INLINE_SPIN_LOCK_IRQ is not set
> -# CONFIG_INLINE_SPIN_LOCK_IRQSAVE is not set
> -# CONFIG_INLINE_SPIN_UNLOCK is not set
> -# CONFIG_INLINE_SPIN_UNLOCK_BH is not set
> -# CONFIG_INLINE_SPIN_UNLOCK_IRQ is not set
> -# CONFIG_INLINE_SPIN_UNLOCK_IRQRESTORE is not set
> -# CONFIG_INLINE_READ_TRYLOCK is not set
> -# CONFIG_INLINE_READ_LOCK is not set
> -# CONFIG_INLINE_READ_LOCK_BH is not set
> -# CONFIG_INLINE_READ_LOCK_IRQ is not set
> -# CONFIG_INLINE_READ_LOCK_IRQSAVE is not set
> -# CONFIG_INLINE_READ_UNLOCK is not set
> -# CONFIG_INLINE_READ_UNLOCK_BH is not set
> -# CONFIG_INLINE_READ_UNLOCK_IRQ is not set
> -# CONFIG_INLINE_READ_UNLOCK_IRQRESTORE is not set
> -# CONFIG_INLINE_WRITE_TRYLOCK is not set
> -# CONFIG_INLINE_WRITE_LOCK is not set
> -# CONFIG_INLINE_WRITE_LOCK_BH is not set
> -# CONFIG_INLINE_WRITE_LOCK_IRQ is not set
> -# CONFIG_INLINE_WRITE_LOCK_IRQSAVE is not set
> -# CONFIG_INLINE_WRITE_UNLOCK is not set
> -# CONFIG_INLINE_WRITE_UNLOCK_BH is not set
> -# CONFIG_INLINE_WRITE_UNLOCK_IRQ is not set
> -# CONFIG_INLINE_WRITE_UNLOCK_IRQRESTORE is not set
> -# CONFIG_MUTEX_SPIN_ON_OWNER is not set
> -# CONFIG_FREEZER is not set
> -
> -#
> -# System Type
> -#
> -CONFIG_MMU=3Dy
> -# CONFIG_ARCH_AAEC2000 is not set
> -# CONFIG_ARCH_INTEGRATOR is not set
> -# CONFIG_ARCH_REALVIEW is not set
> -# CONFIG_ARCH_VERSATILE is not set
> -# CONFIG_ARCH_VEXPRESS is not set
> -# CONFIG_ARCH_AT91 is not set
> -# CONFIG_ARCH_BCMRING is not set
> -# CONFIG_ARCH_CLPS711X is not set
> -# CONFIG_ARCH_CNS3XXX is not set
> -# CONFIG_ARCH_GEMINI is not set
> -# CONFIG_ARCH_EBSA110 is not set
> -# CONFIG_ARCH_EP93XX is not set
> -# CONFIG_ARCH_FOOTBRIDGE is not set
> -# CONFIG_ARCH_MXC is not set
> -# CONFIG_ARCH_STMP3XXX is not set
> -# CONFIG_ARCH_NETX is not set
> -# CONFIG_ARCH_H720X is not set
> -# CONFIG_ARCH_IOP13XX is not set
> -# CONFIG_ARCH_IOP32X is not set
> -# CONFIG_ARCH_IOP33X is not set
> -# CONFIG_ARCH_IXP23XX is not set
> -# CONFIG_ARCH_IXP2000 is not set
> -# CONFIG_ARCH_IXP4XX is not set
> -# CONFIG_ARCH_L7200 is not set
> -# CONFIG_ARCH_DOVE is not set
> -# CONFIG_ARCH_KIRKWOOD is not set
> -# CONFIG_ARCH_LOKI is not set
> -# CONFIG_ARCH_MV78XX0 is not set
> -# CONFIG_ARCH_ORION5X is not set
> -# CONFIG_ARCH_MMP is not set
> -# CONFIG_ARCH_KS8695 is not set
> -# CONFIG_ARCH_NS9XXX is not set
> -# CONFIG_ARCH_W90X900 is not set
> -# CONFIG_ARCH_NUC93X is not set
> -# CONFIG_ARCH_PNX4008 is not set
> -# CONFIG_ARCH_PXA is not set
> -# CONFIG_ARCH_MSM is not set
> -# CONFIG_ARCH_SHMOBILE is not set
> -# CONFIG_ARCH_RPC is not set
> -# CONFIG_ARCH_SA1100 is not set
> -# CONFIG_ARCH_S3C2410 is not set
> -# CONFIG_ARCH_S3C64XX is not set
> -# CONFIG_ARCH_S5P6440 is not set
> -# CONFIG_ARCH_S5P6442 is not set
> -# CONFIG_ARCH_S5PC100 is not set
> -CONFIG_ARCH_S5PV210=3Dy
> -# CONFIG_ARCH_SHARK is not set
> -# CONFIG_ARCH_LH7A40X is not set
> -# CONFIG_ARCH_U300 is not set
> -# CONFIG_ARCH_U8500 is not set
> -# CONFIG_ARCH_NOMADIK is not set
> -# CONFIG_ARCH_DAVINCI is not set
> -# CONFIG_ARCH_OMAP is not set
> -# CONFIG_PLAT_SPEAR is not set
> -CONFIG_PLAT_SAMSUNG=3Dy
> -
> -#
> -# Boot options
> -#
> -# CONFIG_S3C_BOOT_ERROR_RESET is not set
> -CONFIG_S3C_BOOT_UART_FORCE_FIFO=3Dy
> -CONFIG_S3C_LOWLEVEL_UART_PORT=3D1
> -CONFIG_SAMSUNG_CLKSRC=3Dy
> -CONFIG_SAMSUNG_IRQ_VIC_TIMER=3Dy
> -CONFIG_SAMSUNG_IRQ_UART=3Dy
> -CONFIG_SAMSUNG_GPIOLIB_4BIT=3Dy
> -CONFIG_S3C_GPIO_CFG_S3C24XX=3Dy
> -CONFIG_S3C_GPIO_CFG_S3C64XX=3Dy
> -CONFIG_S3C_GPIO_PULL_UPDOWN=3Dy
> -CONFIG_S5P_GPIO_DRVSTR=3Dy
> -CONFIG_SAMSUNG_GPIO_EXTRA=3D0
> -CONFIG_S3C_GPIO_SPACE=3D0
> -CONFIG_S3C_GPIO_TRACK=3Dy
> -# CONFIG_S3C_ADC is not set
> -CONFIG_S3C_DEV_WDT=3Dy
> -CONFIG_S3C_PL330_DMA=3Dy
> -
> -#
> -# Power management
> -#
> -CONFIG_PLAT_S5P=3Dy
> -CONFIG_S5P_EXT_INT=3Dy
> -CONFIG_CPU_S5PV210=3Dy
> -# CONFIG_MACH_AQUILA is not set
> -# CONFIG_MACH_GONI is not set
> -# CONFIG_MACH_SMDKV210 is not set
> -CONFIG_MACH_SMDKC110=3Dy
> -
> -#
> -# Processor Type
> -#
> -CONFIG_CPU_32v6K=3Dy
> -CONFIG_CPU_V7=3Dy
> -CONFIG_CPU_32v7=3Dy
> -CONFIG_CPU_ABRT_EV7=3Dy
> -CONFIG_CPU_PABRT_V7=3Dy
> -CONFIG_CPU_CACHE_V7=3Dy
> -CONFIG_CPU_CACHE_VIPT=3Dy
> -CONFIG_CPU_COPY_V6=3Dy
> -CONFIG_CPU_TLB_V7=3Dy
> -CONFIG_CPU_HAS_ASID=3Dy
> -CONFIG_CPU_CP15=3Dy
> -CONFIG_CPU_CP15_MMU=3Dy
> -
> -#
> -# Processor Features
> -#
> -CONFIG_ARM_THUMB=3Dy
> -# CONFIG_ARM_THUMBEE is not set
> -# CONFIG_CPU_ICACHE_DISABLE is not set
> -# CONFIG_CPU_DCACHE_DISABLE is not set
> -# CONFIG_CPU_BPREDICT_DISABLE is not set
> -CONFIG_HAS_TLS_REG=3Dy
> -CONFIG_ARM_L1_CACHE_SHIFT=3D6
> -CONFIG_ARM_DMA_MEM_BUFFERABLE=3Dy
> -CONFIG_CPU_HAS_PMU=3Dy
> -# CONFIG_ARM_ERRATA_430973 is not set
> -# CONFIG_ARM_ERRATA_458693 is not set
> -# CONFIG_ARM_ERRATA_460075 is not set
> -CONFIG_ARM_VIC=3Dy
> -CONFIG_ARM_VIC_NR=3D2
> -CONFIG_PL330=3Dy
> -
> -#
> -# Bus support
> -#
> -# CONFIG_PCI_SYSCALL is not set
> -# CONFIG_ARCH_SUPPORTS_MSI is not set
> -# CONFIG_PCCARD is not set
> -
> -#
> -# Kernel Features
> -#
> -# CONFIG_VMSPLIT_3G is not set
> -CONFIG_VMSPLIT_2G=3Dy
> -# CONFIG_VMSPLIT_1G is not set
> -CONFIG_PAGE_OFFSET=3D0x80000000
> -# CONFIG_PREEMPT_NONE is not set
> -# CONFIG_PREEMPT_VOLUNTARY is not set
> -CONFIG_PREEMPT=3Dy
> -CONFIG_HZ=3D200
> -# CONFIG_THUMB2_KERNEL is not set
> -CONFIG_AEABI=3Dy
> -CONFIG_OABI_COMPAT=3Dy
> -CONFIG_ARCH_SPARSEMEM_ENABLE=3Dy
> -CONFIG_ARCH_SPARSEMEM_DEFAULT=3Dy
> -# CONFIG_ARCH_SELECT_MEMORY_MODEL is not set
> -# CONFIG_HIGHMEM is not set
> -CONFIG_SELECT_MEMORY_MODEL=3Dy
> -# CONFIG_FLATMEM_MANUAL is not set
> -# CONFIG_DISCONTIGMEM_MANUAL is not set
> -CONFIG_SPARSEMEM_MANUAL=3Dy
> -CONFIG_SPARSEMEM=3Dy
> -CONFIG_HAVE_MEMORY_PRESENT=3Dy
> -CONFIG_SPARSEMEM_EXTREME=3Dy
> -CONFIG_SPLIT_PTLOCK_CPUS=3D999999
> -# CONFIG_PHYS_ADDR_T_64BIT is not set
> -CONFIG_ZONE_DMA_FLAG=3D0
> -CONFIG_VIRT_TO_BUS=3Dy
> -# CONFIG_KSM is not set
> -CONFIG_DEFAULT_MMAP_MIN_ADDR=3D4096
> -CONFIG_ALIGNMENT_TRAP=3Dy
> -# CONFIG_UACCESS_WITH_MEMCPY is not set
> -
> -#
> -# Boot options
> -#
> -CONFIG_ZBOOT_ROM_TEXT=3D0
> -CONFIG_ZBOOT_ROM_BSS=3D0
> -CONFIG_CMDLINE=3D"root=3D/dev/ram0 rw ramdisk=3D8192 initrd=3D0x2080=
0000,8M console=3DttySAC1,115200 init=3D/linuxrc"
> -# CONFIG_CMDLINE_FORCE is not set
> -# CONFIG_XIP_KERNEL is not set
> -# CONFIG_KEXEC is not set
> -
> -#
> -# CPU Power Management
> -#
> -# CONFIG_CPU_IDLE is not set
> -
> -#
> -# Floating point emulation
> -#
> -
> -#
> -# At least one emulation must be selected
> -#
> -# CONFIG_FPE_NWFPE is not set
> -# CONFIG_FPE_FASTFPE is not set
> -CONFIG_VFP=3Dy
> -CONFIG_VFPv3=3Dy
> -CONFIG_NEON=3Dy
> -
> -#
> -# Userspace binary formats
> -#
> -CONFIG_BINFMT_ELF=3Dy
> -# CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
> -CONFIG_HAVE_AOUT=3Dy
> -# CONFIG_BINFMT_AOUT is not set
> -# CONFIG_BINFMT_MISC is not set
> -
> -#
> -# Power management options
> -#
> -# CONFIG_PM is not set
> -CONFIG_ARCH_SUSPEND_POSSIBLE=3Dy
> -# CONFIG_NET is not set
> -
> -#
> -# Device Drivers
> -#
> -
> -#
> -# Generic Driver Options
> -#
> -CONFIG_UEVENT_HELPER_PATH=3D"/sbin/hotplug"
> -# CONFIG_DEVTMPFS is not set
> -CONFIG_STANDALONE=3Dy
> -CONFIG_PREVENT_FIRMWARE_BUILD=3Dy
> -CONFIG_FW_LOADER=3Dy
> -CONFIG_FIRMWARE_IN_KERNEL=3Dy
> -CONFIG_EXTRA_FIRMWARE=3D""
> -# CONFIG_DEBUG_DRIVER is not set
> -# CONFIG_DEBUG_DEVRES is not set
> -# CONFIG_SYS_HYPERVISOR is not set
> -# CONFIG_MTD is not set
> -# CONFIG_PARPORT is not set
> -CONFIG_BLK_DEV=3Dy
> -# CONFIG_BLK_DEV_COW_COMMON is not set
> -CONFIG_BLK_DEV_LOOP=3Dy
> -# CONFIG_BLK_DEV_CRYPTOLOOP is not set
> -
> -#
> -# DRBD disabled because PROC_FS, INET or CONNECTOR not selected
> -#
> -CONFIG_BLK_DEV_RAM=3Dy
> -CONFIG_BLK_DEV_RAM_COUNT=3D16
> -CONFIG_BLK_DEV_RAM_SIZE=3D8192
> -# CONFIG_BLK_DEV_XIP is not set
> -# CONFIG_CDROM_PKTCDVD is not set
> -# CONFIG_MG_DISK is not set
> -# CONFIG_MISC_DEVICES is not set
> -CONFIG_HAVE_IDE=3Dy
> -# CONFIG_IDE is not set
> -
> -#
> -# SCSI device support
> -#
> -CONFIG_SCSI_MOD=3Dy
> -# CONFIG_RAID_ATTRS is not set
> -CONFIG_SCSI=3Dy
> -CONFIG_SCSI_DMA=3Dy
> -# CONFIG_SCSI_TGT is not set
> -# CONFIG_SCSI_NETLINK is not set
> -CONFIG_SCSI_PROC_FS=3Dy
> -
> -#
> -# SCSI support type (disk, tape, CD-ROM)
> -#
> -CONFIG_BLK_DEV_SD=3Dy
> -# CONFIG_CHR_DEV_ST is not set
> -# CONFIG_CHR_DEV_OSST is not set
> -# CONFIG_BLK_DEV_SR is not set
> -CONFIG_CHR_DEV_SG=3Dy
> -# CONFIG_CHR_DEV_SCH is not set
> -# CONFIG_SCSI_MULTI_LUN is not set
> -# CONFIG_SCSI_CONSTANTS is not set
> -# CONFIG_SCSI_LOGGING is not set
> -# CONFIG_SCSI_SCAN_ASYNC is not set
> -CONFIG_SCSI_WAIT_SCAN=3Dm
> -
> -#
> -# SCSI Transports
> -#
> -# CONFIG_SCSI_SPI_ATTRS is not set
> -# CONFIG_SCSI_FC_ATTRS is not set
> -# CONFIG_SCSI_SAS_LIBSAS is not set
> -# CONFIG_SCSI_SRP_ATTRS is not set
> -CONFIG_SCSI_LOWLEVEL=3Dy
> -# CONFIG_LIBFC is not set
> -# CONFIG_LIBFCOE is not set
> -# CONFIG_SCSI_DEBUG is not set
> -# CONFIG_SCSI_DH is not set
> -# CONFIG_SCSI_OSD_INITIATOR is not set
> -# CONFIG_ATA is not set
> -# CONFIG_MD is not set
> -# CONFIG_PHONE is not set
> -
> -#
> -# Input device support
> -#
> -CONFIG_INPUT=3Dy
> -# CONFIG_INPUT_FF_MEMLESS is not set
> -# CONFIG_INPUT_POLLDEV is not set
> -# CONFIG_INPUT_SPARSEKMAP is not set
> -
> -#
> -# Userland interfaces
> -#
> -CONFIG_INPUT_MOUSEDEV=3Dy
> -CONFIG_INPUT_MOUSEDEV_PSAUX=3Dy
> -CONFIG_INPUT_MOUSEDEV_SCREEN_X=3D1024
> -CONFIG_INPUT_MOUSEDEV_SCREEN_Y=3D768
> -# CONFIG_INPUT_JOYDEV is not set
> -CONFIG_INPUT_EVDEV=3Dy
> -# CONFIG_INPUT_EVBUG is not set
> -
> -#
> -# Input Device Drivers
> -#
> -# CONFIG_INPUT_KEYBOARD is not set
> -# CONFIG_INPUT_MOUSE is not set
> -# CONFIG_INPUT_JOYSTICK is not set
> -# CONFIG_INPUT_TABLET is not set
> -CONFIG_INPUT_TOUCHSCREEN=3Dy
> -# CONFIG_TOUCHSCREEN_AD7879 is not set
> -# CONFIG_TOUCHSCREEN_DYNAPRO is not set
> -# CONFIG_TOUCHSCREEN_HAMPSHIRE is not set
> -# CONFIG_TOUCHSCREEN_FUJITSU is not set
> -# CONFIG_TOUCHSCREEN_GUNZE is not set
> -# CONFIG_TOUCHSCREEN_ELO is not set
> -# CONFIG_TOUCHSCREEN_WACOM_W8001 is not set
> -# CONFIG_TOUCHSCREEN_MTOUCH is not set
> -# CONFIG_TOUCHSCREEN_INEXIO is not set
> -# CONFIG_TOUCHSCREEN_MK712 is not set
> -# CONFIG_TOUCHSCREEN_PENMOUNT is not set
> -# CONFIG_TOUCHSCREEN_TOUCHRIGHT is not set
> -# CONFIG_TOUCHSCREEN_TOUCHWIN is not set
> -# CONFIG_TOUCHSCREEN_TOUCHIT213 is not set
> -# CONFIG_TOUCHSCREEN_W90X900 is not set
> -# CONFIG_INPUT_MISC is not set
> -
> -#
> -# Hardware I/O ports
> -#
> -CONFIG_SERIO=3Dy
> -CONFIG_SERIO_SERPORT=3Dy
> -# CONFIG_SERIO_RAW is not set
> -# CONFIG_SERIO_ALTERA_PS2 is not set
> -# CONFIG_GAMEPORT is not set
> -
> -#
> -# Character devices
> -#
> -CONFIG_VT=3Dy
> -CONFIG_CONSOLE_TRANSLATIONS=3Dy
> -CONFIG_VT_CONSOLE=3Dy
> -CONFIG_HW_CONSOLE=3Dy
> -# CONFIG_VT_HW_CONSOLE_BINDING is not set
> -CONFIG_DEVKMEM=3Dy
> -# CONFIG_SERIAL_NONSTANDARD is not set
> -
> -#
> -# Serial drivers
> -#
> -CONFIG_SERIAL_8250=3Dy
> -# CONFIG_SERIAL_8250_CONSOLE is not set
> -CONFIG_SERIAL_8250_NR_UARTS=3D4
> -CONFIG_SERIAL_8250_RUNTIME_UARTS=3D4
> -# CONFIG_SERIAL_8250_EXTENDED is not set
> -
> -#
> -# Non-8250 serial port support
> -#
> -CONFIG_SERIAL_SAMSUNG=3Dy
> -CONFIG_SERIAL_SAMSUNG_UARTS_4=3Dy
> -CONFIG_SERIAL_SAMSUNG_UARTS=3D4
> -# CONFIG_SERIAL_SAMSUNG_DEBUG is not set
> -CONFIG_SERIAL_SAMSUNG_CONSOLE=3Dy
> -CONFIG_SERIAL_S5PV210=3Dy
> -CONFIG_SERIAL_CORE=3Dy
> -CONFIG_SERIAL_CORE_CONSOLE=3Dy
> -# CONFIG_SERIAL_TIMBERDALE is not set
> -# CONFIG_SERIAL_ALTERA_JTAGUART is not set
> -# CONFIG_SERIAL_ALTERA_UART is not set
> -CONFIG_UNIX98_PTYS=3Dy
> -# CONFIG_DEVPTS_MULTIPLE_INSTANCES is not set
> -CONFIG_LEGACY_PTYS=3Dy
> -CONFIG_LEGACY_PTY_COUNT=3D256
> -# CONFIG_IPMI_HANDLER is not set
> -CONFIG_HW_RANDOM=3Dy
> -# CONFIG_HW_RANDOM_TIMERIOMEM is not set
> -# CONFIG_R3964 is not set
> -# CONFIG_RAW_DRIVER is not set
> -# CONFIG_TCG_TPM is not set
> -# CONFIG_I2C is not set
> -# CONFIG_SPI is not set
> -
> -#
> -# PPS support
> -#
> -# CONFIG_PPS is not set
> -CONFIG_ARCH_REQUIRE_GPIOLIB=3Dy
> -CONFIG_GPIOLIB=3Dy
> -# CONFIG_DEBUG_GPIO is not set
> -# CONFIG_GPIO_SYSFS is not set
> -
> -#
> -# Memory mapped GPIO expanders:
> -#
> -# CONFIG_GPIO_IT8761E is not set
> -
> -#
> -# I2C GPIO expanders:
> -#
> -
> -#
> -# PCI GPIO expanders:
> -#
> -
> -#
> -# SPI GPIO expanders:
> -#
> -
> -#
> -# AC97 GPIO expanders:
> -#
> -# CONFIG_W1 is not set
> -# CONFIG_POWER_SUPPLY is not set
> -# CONFIG_HWMON is not set
> -# CONFIG_THERMAL is not set
> -# CONFIG_WATCHDOG is not set
> -CONFIG_HAVE_S3C2410_WATCHDOG=3Dy
> -CONFIG_SSB_POSSIBLE=3Dy
> -
> -#
> -# Sonics Silicon Backplane
> -#
> -# CONFIG_SSB is not set
> -
> -#
> -# Multifunction device drivers
> -#
> -# CONFIG_MFD_CORE is not set
> -# CONFIG_MFD_SM501 is not set
> -# CONFIG_MFD_ASIC3 is not set
> -# CONFIG_HTC_EGPIO is not set
> -# CONFIG_HTC_PASIC3 is not set
> -# CONFIG_MFD_TMIO is not set
> -# CONFIG_MFD_T7L66XB is not set
> -# CONFIG_MFD_TC6387XB is not set
> -# CONFIG_MFD_TC6393XB is not set
> -# CONFIG_REGULATOR is not set
> -# CONFIG_MEDIA_SUPPORT is not set
> -
> -#
> -# Graphics support
> -#
> -# CONFIG_VGASTATE is not set
> -# CONFIG_VIDEO_OUTPUT_CONTROL is not set
> -# CONFIG_FB is not set
> -# CONFIG_BACKLIGHT_LCD_SUPPORT is not set
> -
> -#
> -# Display device support
> -#
> -# CONFIG_DISPLAY_SUPPORT is not set
> -
> -#
> -# Console display driver support
> -#
> -# CONFIG_VGA_CONSOLE is not set
> -CONFIG_DUMMY_CONSOLE=3Dy
> -# CONFIG_SOUND is not set
> -# CONFIG_HID_SUPPORT is not set
> -# CONFIG_USB_SUPPORT is not set
> -# CONFIG_MMC is not set
> -# CONFIG_MEMSTICK is not set
> -# CONFIG_NEW_LEDS is not set
> -# CONFIG_ACCESSIBILITY is not set
> -CONFIG_RTC_LIB=3Dy
> -# CONFIG_RTC_CLASS is not set
> -# CONFIG_DMADEVICES is not set
> -# CONFIG_AUXDISPLAY is not set
> -# CONFIG_UIO is not set
> -# CONFIG_STAGING is not set
> -
> -#
> -# File systems
> -#
> -CONFIG_EXT2_FS=3Dy
> -# CONFIG_EXT2_FS_XATTR is not set
> -# CONFIG_EXT2_FS_XIP is not set
> -# CONFIG_EXT3_FS is not set
> -# CONFIG_EXT4_FS is not set
> -# CONFIG_REISERFS_FS is not set
> -# CONFIG_JFS_FS is not set
> -CONFIG_FS_POSIX_ACL=3Dy
> -# CONFIG_XFS_FS is not set
> -# CONFIG_GFS2_FS is not set
> -# CONFIG_BTRFS_FS is not set
> -# CONFIG_NILFS2_FS is not set
> -CONFIG_FILE_LOCKING=3Dy
> -CONFIG_FSNOTIFY=3Dy
> -CONFIG_DNOTIFY=3Dy
> -CONFIG_INOTIFY=3Dy
> -CONFIG_INOTIFY_USER=3Dy
> -# CONFIG_QUOTA is not set
> -# CONFIG_AUTOFS_FS is not set
> -# CONFIG_AUTOFS4_FS is not set
> -# CONFIG_FUSE_FS is not set
> -CONFIG_GENERIC_ACL=3Dy
> -
> -#
> -# Caches
> -#
> -# CONFIG_FSCACHE is not set
> -
> -#
> -# CD-ROM/DVD Filesystems
> -#
> -# CONFIG_ISO9660_FS is not set
> -# CONFIG_UDF_FS is not set
> -
> -#
> -# DOS/FAT/NT Filesystems
> -#
> -CONFIG_FAT_FS=3Dy
> -CONFIG_MSDOS_FS=3Dy
> -CONFIG_VFAT_FS=3Dy
> -CONFIG_FAT_DEFAULT_CODEPAGE=3D437
> -CONFIG_FAT_DEFAULT_IOCHARSET=3D"iso8859-1"
> -# CONFIG_NTFS_FS is not set
> -
> -#
> -# Pseudo filesystems
> -#
> -CONFIG_PROC_FS=3Dy
> -CONFIG_PROC_SYSCTL=3Dy
> -CONFIG_PROC_PAGE_MONITOR=3Dy
> -CONFIG_SYSFS=3Dy
> -CONFIG_TMPFS=3Dy
> -CONFIG_TMPFS_POSIX_ACL=3Dy
> -# CONFIG_HUGETLB_PAGE is not set
> -# CONFIG_CONFIGFS_FS is not set
> -CONFIG_MISC_FILESYSTEMS=3Dy
> -# CONFIG_ADFS_FS is not set
> -# CONFIG_AFFS_FS is not set
> -# CONFIG_HFS_FS is not set
> -# CONFIG_HFSPLUS_FS is not set
> -# CONFIG_BEFS_FS is not set
> -# CONFIG_BFS_FS is not set
> -# CONFIG_EFS_FS is not set
> -# CONFIG_LOGFS is not set
> -CONFIG_CRAMFS=3Dy
> -# CONFIG_SQUASHFS is not set
> -# CONFIG_VXFS_FS is not set
> -# CONFIG_MINIX_FS is not set
> -# CONFIG_OMFS_FS is not set
> -# CONFIG_HPFS_FS is not set
> -# CONFIG_QNX4FS_FS is not set
> -CONFIG_ROMFS_FS=3Dy
> -CONFIG_ROMFS_BACKED_BY_BLOCK=3Dy
> -# CONFIG_ROMFS_BACKED_BY_MTD is not set
> -# CONFIG_ROMFS_BACKED_BY_BOTH is not set
> -CONFIG_ROMFS_ON_BLOCK=3Dy
> -# CONFIG_SYSV_FS is not set
> -# CONFIG_UFS_FS is not set
> -
> -#
> -# Partition Types
> -#
> -CONFIG_PARTITION_ADVANCED=3Dy
> -# CONFIG_ACORN_PARTITION is not set
> -# CONFIG_OSF_PARTITION is not set
> -# CONFIG_AMIGA_PARTITION is not set
> -# CONFIG_ATARI_PARTITION is not set
> -# CONFIG_MAC_PARTITION is not set
> -CONFIG_MSDOS_PARTITION=3Dy
> -CONFIG_BSD_DISKLABEL=3Dy
> -# CONFIG_MINIX_SUBPARTITION is not set
> -CONFIG_SOLARIS_X86_PARTITION=3Dy
> -# CONFIG_UNIXWARE_DISKLABEL is not set
> -# CONFIG_LDM_PARTITION is not set
> -# CONFIG_SGI_PARTITION is not set
> -# CONFIG_ULTRIX_PARTITION is not set
> -# CONFIG_SUN_PARTITION is not set
> -# CONFIG_KARMA_PARTITION is not set
> -# CONFIG_EFI_PARTITION is not set
> -# CONFIG_SYSV68_PARTITION is not set
> -CONFIG_NLS=3Dy
> -CONFIG_NLS_DEFAULT=3D"iso8859-1"
> -CONFIG_NLS_CODEPAGE_437=3Dy
> -# CONFIG_NLS_CODEPAGE_737 is not set
> -# CONFIG_NLS_CODEPAGE_775 is not set
> -# CONFIG_NLS_CODEPAGE_850 is not set
> -# CONFIG_NLS_CODEPAGE_852 is not set
> -# CONFIG_NLS_CODEPAGE_855 is not set
> -# CONFIG_NLS_CODEPAGE_857 is not set
> -# CONFIG_NLS_CODEPAGE_860 is not set
> -# CONFIG_NLS_CODEPAGE_861 is not set
> -# CONFIG_NLS_CODEPAGE_862 is not set
> -# CONFIG_NLS_CODEPAGE_863 is not set
> -# CONFIG_NLS_CODEPAGE_864 is not set
> -# CONFIG_NLS_CODEPAGE_865 is not set
> -# CONFIG_NLS_CODEPAGE_866 is not set
> -# CONFIG_NLS_CODEPAGE_869 is not set
> -# CONFIG_NLS_CODEPAGE_936 is not set
> -# CONFIG_NLS_CODEPAGE_950 is not set
> -# CONFIG_NLS_CODEPAGE_932 is not set
> -# CONFIG_NLS_CODEPAGE_949 is not set
> -# CONFIG_NLS_CODEPAGE_874 is not set
> -# CONFIG_NLS_ISO8859_8 is not set
> -# CONFIG_NLS_CODEPAGE_1250 is not set
> -# CONFIG_NLS_CODEPAGE_1251 is not set
> -CONFIG_NLS_ASCII=3Dy
> -CONFIG_NLS_ISO8859_1=3Dy
> -# CONFIG_NLS_ISO8859_2 is not set
> -# CONFIG_NLS_ISO8859_3 is not set
> -# CONFIG_NLS_ISO8859_4 is not set
> -# CONFIG_NLS_ISO8859_5 is not set
> -# CONFIG_NLS_ISO8859_6 is not set
> -# CONFIG_NLS_ISO8859_7 is not set
> -# CONFIG_NLS_ISO8859_9 is not set
> -# CONFIG_NLS_ISO8859_13 is not set
> -# CONFIG_NLS_ISO8859_14 is not set
> -# CONFIG_NLS_ISO8859_15 is not set
> -# CONFIG_NLS_KOI8_R is not set
> -# CONFIG_NLS_KOI8_U is not set
> -# CONFIG_NLS_UTF8 is not set
> -
> -#
> -# Kernel hacking
> -#
> -# CONFIG_PRINTK_TIME is not set
> -CONFIG_ENABLE_WARN_DEPRECATED=3Dy
> -CONFIG_ENABLE_MUST_CHECK=3Dy
> -CONFIG_FRAME_WARN=3D1024
> -CONFIG_MAGIC_SYSRQ=3Dy
> -# CONFIG_STRIP_ASM_SYMS is not set
> -# CONFIG_UNUSED_SYMBOLS is not set
> -# CONFIG_DEBUG_FS is not set
> -# CONFIG_HEADERS_CHECK is not set
> -CONFIG_DEBUG_KERNEL=3Dy
> -# CONFIG_DEBUG_SHIRQ is not set
> -CONFIG_DETECT_SOFTLOCKUP=3Dy
> -# CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC is not set
> -CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC_VALUE=3D0
> -CONFIG_DETECT_HUNG_TASK=3Dy
> -# CONFIG_BOOTPARAM_HUNG_TASK_PANIC is not set
> -CONFIG_BOOTPARAM_HUNG_TASK_PANIC_VALUE=3D0
> -CONFIG_SCHED_DEBUG=3Dy
> -# CONFIG_SCHEDSTATS is not set
> -# CONFIG_TIMER_STATS is not set
> -# CONFIG_DEBUG_OBJECTS is not set
> -# CONFIG_SLUB_DEBUG_ON is not set
> -# CONFIG_SLUB_STATS is not set
> -# CONFIG_DEBUG_KMEMLEAK is not set
> -# CONFIG_DEBUG_PREEMPT is not set
> -CONFIG_DEBUG_RT_MUTEXES=3Dy
> -CONFIG_DEBUG_PI_LIST=3Dy
> -# CONFIG_RT_MUTEX_TESTER is not set
> -CONFIG_DEBUG_SPINLOCK=3Dy
> -CONFIG_DEBUG_MUTEXES=3Dy
> -# CONFIG_DEBUG_LOCK_ALLOC is not set
> -# CONFIG_PROVE_LOCKING is not set
> -# CONFIG_LOCK_STAT is not set
> -CONFIG_DEBUG_SPINLOCK_SLEEP=3Dy
> -# CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
> -# CONFIG_DEBUG_KOBJECT is not set
> -CONFIG_DEBUG_BUGVERBOSE=3Dy
> -CONFIG_DEBUG_INFO=3Dy
> -# CONFIG_DEBUG_VM is not set
> -# CONFIG_DEBUG_WRITECOUNT is not set
> -CONFIG_DEBUG_MEMORY_INIT=3Dy
> -# CONFIG_DEBUG_LIST is not set
> -# CONFIG_DEBUG_SG is not set
> -# CONFIG_DEBUG_NOTIFIERS is not set
> -# CONFIG_DEBUG_CREDENTIALS is not set
> -# CONFIG_BOOT_PRINTK_DELAY is not set
> -# CONFIG_RCU_TORTURE_TEST is not set
> -# CONFIG_RCU_CPU_STALL_DETECTOR is not set
> -# CONFIG_BACKTRACE_SELF_TEST is not set
> -# CONFIG_DEBUG_BLOCK_EXT_DEVT is not set
> -# CONFIG_DEBUG_FORCE_WEAK_PER_CPU is not set
> -# CONFIG_FAULT_INJECTION is not set
> -# CONFIG_LATENCYTOP is not set
> -CONFIG_SYSCTL_SYSCALL_CHECK=3Dy
> -# CONFIG_PAGE_POISONING is not set
> -CONFIG_HAVE_FUNCTION_TRACER=3Dy
> -CONFIG_TRACING_SUPPORT=3Dy
> -CONFIG_FTRACE=3Dy
> -# CONFIG_FUNCTION_TRACER is not set
> -# CONFIG_IRQSOFF_TRACER is not set
> -# CONFIG_PREEMPT_TRACER is not set
> -# CONFIG_SCHED_TRACER is not set
> -# CONFIG_ENABLE_DEFAULT_TRACERS is not set
> -# CONFIG_BOOT_TRACER is not set
> -CONFIG_BRANCH_PROFILE_NONE=3Dy
> -# CONFIG_PROFILE_ANNOTATED_BRANCHES is not set
> -# CONFIG_PROFILE_ALL_BRANCHES is not set
> -# CONFIG_STACK_TRACER is not set
> -# CONFIG_KMEMTRACE is not set
> -# CONFIG_WORKQUEUE_TRACER is not set
> -# CONFIG_BLK_DEV_IO_TRACE is not set
> -# CONFIG_ATOMIC64_SELFTEST is not set
> -# CONFIG_SAMPLES is not set
> -CONFIG_HAVE_ARCH_KGDB=3Dy
> -# CONFIG_KGDB is not set
> -CONFIG_ARM_UNWIND=3Dy
> -CONFIG_DEBUG_USER=3Dy
> -CONFIG_DEBUG_ERRORS=3Dy
> -# CONFIG_DEBUG_STACK_USAGE is not set
> -CONFIG_DEBUG_LL=3Dy
> -CONFIG_EARLY_PRINTK=3Dy
> -# CONFIG_DEBUG_ICEDCC is not set
> -# CONFIG_OC_ETM is not set
> -CONFIG_DEBUG_S3C_UART=3D1
> -
> -#
> -# Security options
> -#
> -# CONFIG_KEYS is not set
> -# CONFIG_SECURITY is not set
> -# CONFIG_SECURITYFS is not set
> -# CONFIG_DEFAULT_SECURITY_SELINUX is not set
> -# CONFIG_DEFAULT_SECURITY_SMACK is not set
> -# CONFIG_DEFAULT_SECURITY_TOMOYO is not set
> -CONFIG_DEFAULT_SECURITY_DAC=3Dy
> -CONFIG_DEFAULT_SECURITY=3D""
> -# CONFIG_CRYPTO is not set
> -# CONFIG_BINARY_PRINTF is not set
> -
> -#
> -# Library routines
> -#
> -CONFIG_BITREVERSE=3Dy
> -CONFIG_GENERIC_FIND_LAST_BIT=3Dy
> -CONFIG_CRC_CCITT=3Dy
> -# CONFIG_CRC16 is not set
> -# CONFIG_CRC_T10DIF is not set
> -# CONFIG_CRC_ITU_T is not set
> -CONFIG_CRC32=3Dy
> -# CONFIG_CRC7 is not set
> -# CONFIG_LIBCRC32C is not set
> -CONFIG_ZLIB_INFLATE=3Dy
> -CONFIG_LZO_DECOMPRESS=3Dy
> -CONFIG_DECOMPRESS_GZIP=3Dy
> -CONFIG_DECOMPRESS_BZIP2=3Dy
> -CONFIG_DECOMPRESS_LZMA=3Dy
> -CONFIG_DECOMPRESS_LZO=3Dy
> -CONFIG_HAS_IOMEM=3Dy
> -CONFIG_HAS_DMA=3Dy
> diff --git a/arch/arm/configs/s5pv210_defconfig b/arch/arm/configs/s5=
pv210_defconfig
> index e2f5bce..5d447c1 100644
> --- a/arch/arm/configs/s5pv210_defconfig
> +++ b/arch/arm/configs/s5pv210_defconfig
> @@ -1,7 +1,7 @@
> =A0#
> =A0# Automatically generated make config: don't edit
> -# Linux kernel version: 2.6.34
> -# Wed May 26 19:04:39 2010
> +# Linux kernel version: 2.6.35-rc3
> +# Wed Jun 16 08:03:01 2010
> =A0#
> =A0CONFIG_ARM=3Dy
> =A0CONFIG_SYS_SUPPORTS_APM_EMULATION=3Dy
> @@ -34,6 +34,7 @@ CONFIG_EXPERIMENTAL=3Dy
> =A0CONFIG_BROKEN_ON_SMP=3Dy
> =A0CONFIG_LOCK_KERNEL=3Dy
> =A0CONFIG_INIT_ENV_ARG_LIMIT=3D32
> +CONFIG_CROSS_COMPILE=3D""
> =A0CONFIG_LOCALVERSION=3D""
> =A0CONFIG_LOCALVERSION_AUTO=3Dy
> =A0CONFIG_HAVE_KERNEL_GZIP=3Dy
> @@ -253,6 +254,7 @@ CONFIG_SAMSUNG_GPIO_EXTRA=3D0
> =A0CONFIG_S3C_GPIO_SPACE=3D0
> =A0CONFIG_S3C_GPIO_TRACK=3Dy
> =A0# CONFIG_S3C_ADC is not set
> +CONFIG_S3C_DEV_FB=3Dy
> =A0CONFIG_S3C_DEV_WDT=3Dy
> =A0CONFIG_SAMSUNG_DEV_ADC=3Dy
> =A0CONFIG_SAMSUNG_DEV_TS=3Dy
> @@ -264,10 +266,19 @@ CONFIG_S3C_PL330_DMA=3Dy
> =A0CONFIG_PLAT_S5P=3Dy
> =A0CONFIG_S5P_EXT_INT=3Dy
> =A0CONFIG_CPU_S5PV210=3Dy
> -# CONFIG_MACH_AQUILA is not set
> +CONFIG_S5PV210_SETUP_FB_24BPP=3Dy
> +
> +#
> +# S5PC110 Machines
> +#
> +CONFIG_MACH_AQUILA=3Dy
> =A0# CONFIG_MACH_GONI is not set
> +CONFIG_MACH_SMDKC110=3Dy
> +
> +#
> +# S5PV210 Machines
> +#
> =A0CONFIG_MACH_SMDKV210=3Dy
> -# CONFIG_MACH_SMDKC110 is not set
>
> =A0#
> =A0# Processor Type
> @@ -567,6 +578,7 @@ CONFIG_HW_RANDOM=3Dy
> =A0# CONFIG_R3964 is not set
> =A0# CONFIG_RAW_DRIVER is not set
> =A0# CONFIG_TCG_TPM is not set
> +# CONFIG_RAMOOPS is not set
> =A0# CONFIG_I2C is not set
> =A0# CONFIG_SPI is not set
>
> @@ -599,6 +611,10 @@ CONFIG_GPIOLIB=3Dy
> =A0#
> =A0# AC97 GPIO expanders:
> =A0#
> +
> +#
> +# MODULbus GPIO expanders:
> +#
> =A0# CONFIG_W1 is not set
> =A0# CONFIG_POWER_SUPPLY is not set
> =A0# CONFIG_HWMON is not set
> @@ -611,10 +627,7 @@ CONFIG_SSB_POSSIBLE=3Dy
> =A0# Sonics Silicon Backplane
> =A0#
> =A0# CONFIG_SSB is not set
> -
> -#
> -# Multifunction device drivers
> -#
> +CONFIG_MFD_SUPPORT=3Dy
> =A0# CONFIG_MFD_CORE is not set
> =A0# CONFIG_MFD_SM501 is not set
> =A0# CONFIG_MFD_ASIC3 is not set
> @@ -624,6 +637,7 @@ CONFIG_SSB_POSSIBLE=3Dy
> =A0# CONFIG_MFD_T7L66XB is not set
> =A0# CONFIG_MFD_TC6387XB is not set
> =A0# CONFIG_MFD_TC6393XB is not set
> +# CONFIG_ABX500_CORE is not set
> =A0# CONFIG_REGULATOR is not set
> =A0# CONFIG_MEDIA_SUPPORT is not set
>
> diff --git a/arch/arm/mach-s5pv210/Kconfig b/arch/arm/mach-s5pv210/Kc=
onfig
> index 0761eac..8150480 100644
> --- a/arch/arm/mach-s5pv210/Kconfig
> +++ b/arch/arm/mach-s5pv210/Kconfig
> @@ -43,10 +43,10 @@ config S5PV210_SETUP_SDHCI_GPIO
> =A0 =A0 =A0 =A0help
> =A0 =A0 =A0 =A0 =A0Common setup code for SDHCI gpio.
>
> -# machine support
> +menu "S5PC110 Machines"
>
> =A0config MACH_AQUILA
> - =A0 =A0 =A0 bool "Samsung Aquila"
> + =A0 =A0 =A0 bool "Aquila"
> =A0 =A0 =A0 =A0select CPU_S5PV210
> =A0 =A0 =A0 =A0select ARCH_SPARSEMEM_ENABLE
> =A0 =A0 =A0 =A0select S5PV210_SETUP_FB_24BPP
> @@ -62,11 +62,25 @@ config MACH_GONI
> =A0 =A0 =A0 =A0 =A0Machine support for Samsung GONI board
> =A0 =A0 =A0 =A0 =A0S5PC110(MCP) is one of package option of S5PV210
>
> +config MACH_SMDKC110
> + =A0 =A0 =A0 bool "SMDKC110"
> + =A0 =A0 =A0 select CPU_S5PV210
> + =A0 =A0 =A0 select ARCH_SPARSEMEM_ENABLE
> + =A0 =A0 =A0 select S3C_DEV_WDT
> + =A0 =A0 =A0 select HAVE_S3C2410_WATCHDOG
> + =A0 =A0 =A0 help
> + =A0 =A0 =A0 =A0 Machine support for Samsung SMDKC110
> + =A0 =A0 =A0 =A0 S5PC110(MCP) is one of package option of S5PV210
> +
> +endmenu
> +
> =A0config S5PC110_DEV_ONENAND
> =A0 =A0 =A0 =A0bool
> =A0 =A0 =A0 =A0help
> =A0 =A0 =A0 =A0 =A0Compile in platform device definition for OneNAND1=
 controller
>
> +menu "S5PV210 Machines"
> +
> =A0config MACH_SMDKV210
> =A0 =A0 =A0 =A0bool "SMDKV210"
> =A0 =A0 =A0 =A0select CPU_S5PV210
> @@ -78,14 +92,6 @@ config MACH_SMDKV210
> =A0 =A0 =A0 =A0help
> =A0 =A0 =A0 =A0 =A0Machine support for Samsung SMDKV210
>
> -config MACH_SMDKC110
> - =A0 =A0 =A0 bool "SMDKC110"
> - =A0 =A0 =A0 select CPU_S5PV210
> - =A0 =A0 =A0 select ARCH_SPARSEMEM_ENABLE
> - =A0 =A0 =A0 select S3C_DEV_WDT
> - =A0 =A0 =A0 select HAVE_S3C2410_WATCHDOG
> - =A0 =A0 =A0 help
> - =A0 =A0 =A0 =A0 Machine support for Samsung SMDKC110
> - =A0 =A0 =A0 =A0 S5PC110(MCP) is one of package option of S5PV210
> +endmenu
>
> =A0endif
> --
> 1.6.2.5
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
