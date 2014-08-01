From: =?ISO-8859-1?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Subject: Re: [PATCH V6 0/8] drm/exynos: few patches to enhance bridge chip
 support
Date: Fri, 01 Aug 2014 14:13:01 +0200
Message-ID: <53DB844D.2000307@suse.de>
References: <1406316130-4744-1-git-send-email-ajaykumar.rs@samsung.com>	<53D5435B.8030305@suse.de>	<CAEC9eQPW-Z4craCC15M7oTp8eSD09AGxdTFEWaAWqn3Up4eJUg@mail.gmail.com>	<53D783CC.2080108@suse.de>	<CAEC9eQOpS90U9kWmY8YdcAtdxQYKoM9ikoWpkwMs6T2udLeZHA@mail.gmail.com>	<53D9484A.1070905@suse.de>	<CAEC9eQOFWQ8t1zzOVrHm2=aS4+N94EW6LSjBUG2fH51aFs0GLQ@mail.gmail.com>	<53DA0513.3080602@suse.de>	<20140731102348.GC7458@ulmo>	<53DA5120.7080709@suse.de> <CAEC9eQMoMC9Py+nvUANw_yHQX84tmpNCzEAQfFAhaN2GkeDwHw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------060402090209090001090207"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:53103 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751008AbaHAMNJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 1 Aug 2014 08:13:09 -0400
In-Reply-To: <CAEC9eQMoMC9Py+nvUANw_yHQX84tmpNCzEAQfFAhaN2GkeDwHw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ajay kumar <ajaynumb@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Ajay Kumar <ajaykumar.rs@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, InKi Dae <inki.dae@samsung.com>, Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Sean Paul <seanpaul@google.com>, Jingoo Han <jg1.han@samsung.com>, sunil joshi <joshi@samsung.com>, Prashanth G <prashanth.g@samsung.com>, Doug Anderson <dianders@chromium.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>

This is a multi-part message in MIME format.
--------------060402090209090001090207
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit

Hi Ajay,

Am 01.08.2014 09:02, schrieb Ajay kumar:
> On Thu, Jul 31, 2014 at 7:52 PM, Andreas Färber <afaerber@suse.de> wrote:
>> So, with simplefb reverted in U-Boot and ...
>>
>> * with just the v6 applied (...~2), I get only a black screen from
>> Linux, no penguins, but the backlight seems on. System comes up okay,
>> ssh available, and nothing stands out in dmesg.
>>
>> * with the two iommu patches on top, something breaks badly, no
>> backlight, no USB/network, system inaccessible.
>> I.e. U-Boot had no noticeable impact on these symptoms.
>>
>> * with the iommu patches, but dp-controller, ps8622, panel commented
>> out, I do get backlight but USB/network not working, system inaccessible.
>>
>> With simplefb support in U-Boot and with just v6 applied, but
>> dp-controller, ps8622, panel commented out, things work as well as
>> before, i.e. this series has no bad side effects. Note that I never
>> claimed Ajay's series were broken, just reported that things regressed
>> for me from v4, which may well be DT-related.
>>
>> The iommu patches interfere with my USB somehow (none or not all devices
>> powered; with v4, plugging my wifi dongle led to oops but ethernet
>> dongle worked, so not entirely new symptom), which is bad since my
>> rootfs is on USB. The internal SDIO-connected Wifi is not enabled yet,
>> so USB based network is my only alternative to a working display once we
>> reach userspace.
> Well, there are 2 variants here:
> 1) Bootloader
> 2) config
> 
> Type of the bootloader should not matter unless its switching on
> FET1 and FET6 of tps65090 for you.
> 
> But, config can be different!
> I have attached a config i used to get display with your latest
> spring-bridge.v6.
> Uncomment the DT nodes for DP and bridge chip and you should
> be able to get display and also the login.
> 
> I think that you have not selected all the configs needed for IOMMU to
> work properly. When I deselected few IOMMU configs, I could see system
> crashing when FIMD + DP path was being initialized. May be, that is why your
> USB stops working. Even I have root file system on USB drive.

Find attached a diff between our configs. The following stand out:

* I have LPAE enabled
* you don't have DMA enabled
* I have CMA enabled (like in the new defconfigs)
* I have the arch timer disabled (which you suggested earlier for delay)
* I have more devices enabled (SPI, PWM, cpufreq, watchdog, ...)

Andreas

-- 
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 Nürnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imendörffer; HRB 16746 AG Nürnberg

--------------060402090209090001090207
Content-Type: text/x-patch;
 name="config-ajay.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="config-ajay.diff"

--- .config	2014-08-01 14:03:18.255022463 +0200
+++ ../config-ajay.txt	2014-08-01 13:19:01.875021197 +0200
@@ -34,7 +34,7 @@
 CONFIG_CROSS_COMPILE=""
 # CONFIG_COMPILE_TEST is not set
 CONFIG_LOCALVERSION=""
-# CONFIG_LOCALVERSION_AUTO is not set
+CONFIG_LOCALVERSION_AUTO=y
 CONFIG_HAVE_KERNEL_GZIP=y
 CONFIG_HAVE_KERNEL_LZMA=y
 CONFIG_HAVE_KERNEL_XZ=y
@@ -51,7 +51,7 @@
 CONFIG_SYSVIPC_SYSCTL=y
 # CONFIG_POSIX_MQUEUE is not set
 CONFIG_CROSS_MEMORY_ATTACH=y
-CONFIG_FHANDLE=y
+# CONFIG_FHANDLE is not set
 CONFIG_USELIB=y
 # CONFIG_AUDIT is not set
 CONFIG_HAVE_ARCH_AUDITSYSCALL=y
@@ -106,19 +106,10 @@
 # CONFIG_TREE_RCU_TRACE is not set
 # CONFIG_RCU_BOOST is not set
 # CONFIG_RCU_NOCB_CPU is not set
-CONFIG_IKCONFIG=y
-CONFIG_IKCONFIG_PROC=y
+# CONFIG_IKCONFIG is not set
 CONFIG_LOG_BUF_SHIFT=17
 CONFIG_GENERIC_SCHED_CLOCK=y
-CONFIG_CGROUPS=y
-# CONFIG_CGROUP_DEBUG is not set
-# CONFIG_CGROUP_FREEZER is not set
-# CONFIG_CGROUP_DEVICE is not set
-# CONFIG_CPUSETS is not set
-# CONFIG_CGROUP_CPUACCT is not set
-# CONFIG_RESOURCE_COUNTERS is not set
-# CONFIG_CGROUP_SCHED is not set
-# CONFIG_BLK_CGROUP is not set
+# CONFIG_CGROUPS is not set
 # CONFIG_CHECKPOINT_RESTORE is not set
 CONFIG_NAMESPACES=y
 CONFIG_UTS_NS=y
@@ -204,7 +195,6 @@
 CONFIG_HAVE_CONTEXT_TRACKING=y
 CONFIG_HAVE_VIRT_CPU_ACCOUNTING_GEN=y
 CONFIG_HAVE_IRQ_TIME_ACCOUNTING=y
-CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=y
 CONFIG_HAVE_MOD_ARCH_SPECIFIC=y
 CONFIG_MODULES_USE_ELF_REL=y
 CONFIG_CLONE_BACKWARDS=y
@@ -228,7 +218,7 @@
 CONFIG_STOP_MACHINE=y
 CONFIG_BLOCK=y
 CONFIG_LBDAF=y
-CONFIG_BLK_DEV_BSG=y
+# CONFIG_BLK_DEV_BSG is not set
 # CONFIG_BLK_DEV_BSGLIB is not set
 # CONFIG_BLK_DEV_INTEGRITY is not set
 # CONFIG_BLK_CMDLINE_PARSER is not set
@@ -267,7 +257,6 @@
 CONFIG_DEFAULT_CFQ=y
 # CONFIG_DEFAULT_NOOP is not set
 CONFIG_DEFAULT_IOSCHED="cfq"
-CONFIG_PREEMPT_NOTIFIERS=y
 CONFIG_UNINLINE_SPIN_UNLOCK=y
 CONFIG_ARCH_SUPPORTS_ATOMIC_RMW=y
 CONFIG_RWSEM_SPIN_ON_OWNER=y
@@ -323,7 +312,6 @@
 # CONFIG_ARCH_MULTI_CPU_AUTO is not set
 # CONFIG_ARCH_VIRT is not set
 # CONFIG_ARCH_MVEBU is not set
-# CONFIG_ARCH_AXXIA is not set
 # CONFIG_ARCH_BCM is not set
 # CONFIG_ARCH_BERLIN is not set
 # CONFIG_ARCH_HIGHBANK is not set
@@ -358,10 +346,11 @@
 CONFIG_SOC_EXYNOS4212=y
 CONFIG_SOC_EXYNOS4412=y
 CONFIG_SOC_EXYNOS5250=y
-# CONFIG_SOC_EXYNOS5260 is not set
-# CONFIG_SOC_EXYNOS5410 is not set
-# CONFIG_SOC_EXYNOS5420 is not set
-# CONFIG_SOC_EXYNOS5440 is not set
+CONFIG_SOC_EXYNOS5260=y
+CONFIG_SOC_EXYNOS5410=y
+CONFIG_SOC_EXYNOS5420=y
+CONFIG_SOC_EXYNOS5440=y
+CONFIG_SOC_EXYNOS5800=y
 CONFIG_PLAT_SAMSUNG=y
 
 #
@@ -405,8 +394,8 @@
 #
 # Processor Features
 #
-CONFIG_ARM_LPAE=y
-CONFIG_ARCH_PHYS_ADDR_T_64BIT=y
+# CONFIG_ARM_LPAE is not set
+# CONFIG_ARCH_PHYS_ADDR_T_64BIT is not set
 CONFIG_ARM_THUMB=y
 # CONFIG_ARM_THUMBEE is not set
 CONFIG_ARM_VIRT_EXT=y
@@ -456,7 +445,7 @@
 # CONFIG_SCHED_MC is not set
 # CONFIG_SCHED_SMT is not set
 CONFIG_HAVE_ARM_SCU=y
-# CONFIG_HAVE_ARM_ARCH_TIMER is not set
+CONFIG_HAVE_ARM_ARCH_TIMER=y
 # CONFIG_MCPM is not set
 # CONFIG_BIG_LITTLE is not set
 CONFIG_VMSPLIT_3G=y
@@ -483,29 +472,24 @@
 CONFIG_HAVE_ARCH_PFN_VALID=y
 CONFIG_HIGHMEM=y
 # CONFIG_HIGHPTE is not set
-CONFIG_SYS_SUPPORTS_HUGETLBFS=y
 CONFIG_ARCH_WANT_GENERAL_HUGETLB=y
 CONFIG_FLATMEM=y
 CONFIG_FLAT_NODE_MEM_MAP=y
 CONFIG_HAVE_MEMBLOCK=y
 CONFIG_NO_BOOTMEM=y
-CONFIG_MEMORY_ISOLATION=y
 # CONFIG_HAVE_BOOTMEM_INFO_NODE is not set
 CONFIG_PAGEFLAGS_EXTENDED=y
 CONFIG_SPLIT_PTLOCK_CPUS=4
 CONFIG_COMPACTION=y
 CONFIG_MIGRATION=y
-CONFIG_PHYS_ADDR_T_64BIT=y
+# CONFIG_PHYS_ADDR_T_64BIT is not set
 CONFIG_ZONE_DMA_FLAG=0
 CONFIG_BOUNCE=y
-CONFIG_MMU_NOTIFIER=y
-CONFIG_KSM=y
+# CONFIG_KSM is not set
 CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
-# CONFIG_TRANSPARENT_HUGEPAGE is not set
 # CONFIG_CLEANCACHE is not set
 # CONFIG_FRONTSWAP is not set
-CONFIG_CMA=y
-# CONFIG_CMA_DEBUG is not set
+# CONFIG_CMA is not set
 # CONFIG_ZBUD is not set
 # CONFIG_ZSMALLOC is not set
 CONFIG_FORCE_MAX_ZONEORDER=11
@@ -524,7 +508,10 @@
 # CONFIG_DEPRECATED_PARAM_STRUCT is not set
 CONFIG_ZBOOT_ROM_TEXT=0x0
 CONFIG_ZBOOT_ROM_BSS=0x0
-# CONFIG_ARM_APPENDED_DTB is not set
+CONFIG_ARM_APPENDED_DTB=y
+CONFIG_ARM_ATAG_DTB_COMPAT=y
+CONFIG_ARM_ATAG_DTB_COMPAT_CMDLINE_FROM_BOOTLOADER=y
+# CONFIG_ARM_ATAG_DTB_COMPAT_CMDLINE_EXTEND is not set
 CONFIG_CMDLINE="root=/dev/ram0 rw ramdisk=8192 initrd=0x41000000,8M console=ttySAC1,115200 init=/linuxrc mem=256M"
 CONFIG_CMDLINE_FROM_BOOTLOADER=y
 # CONFIG_CMDLINE_EXTEND is not set
@@ -540,44 +527,12 @@
 #
 # CPU Frequency scaling
 #
-CONFIG_CPU_FREQ=y
-CONFIG_CPU_FREQ_GOV_COMMON=y
-CONFIG_CPU_FREQ_STAT=y
-# CONFIG_CPU_FREQ_STAT_DETAILS is not set
-CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE=y
-# CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE is not set
-# CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND is not set
-# CONFIG_CPU_FREQ_DEFAULT_GOV_CONSERVATIVE is not set
-CONFIG_CPU_FREQ_GOV_PERFORMANCE=y
-CONFIG_CPU_FREQ_GOV_POWERSAVE=y
-CONFIG_CPU_FREQ_GOV_USERSPACE=y
-CONFIG_CPU_FREQ_GOV_ONDEMAND=y
-CONFIG_CPU_FREQ_GOV_CONSERVATIVE=y
-# CONFIG_GENERIC_CPUFREQ_CPU0 is not set
-
-#
-# ARM CPU frequency scaling drivers
-#
-CONFIG_ARM_EXYNOS_CPUFREQ=y
-CONFIG_ARM_EXYNOS4210_CPUFREQ=y
-CONFIG_ARM_EXYNOS4X12_CPUFREQ=y
-CONFIG_ARM_EXYNOS5250_CPUFREQ=y
-# CONFIG_ARM_EXYNOS_CPU_FREQ_BOOST_SW is not set
-# CONFIG_ARM_KIRKWOOD_CPUFREQ is not set
+# CONFIG_CPU_FREQ is not set
 
 #
 # CPU Idle
 #
-CONFIG_CPU_IDLE=y
-# CONFIG_CPU_IDLE_MULTIPLE_DRIVERS is not set
-CONFIG_CPU_IDLE_GOV_LADDER=y
-CONFIG_CPU_IDLE_GOV_MENU=y
-
-#
-# ARM CPU Idle Drivers
-#
-# CONFIG_ARM_BIG_LITTLE_CPUIDLE is not set
-CONFIG_ARM_EXYNOS_CPUIDLE=y
+# CONFIG_CPU_IDLE is not set
 # CONFIG_ARCH_NEEDS_CPU_IDLE_COUPLED is not set
 
 #
@@ -721,8 +676,6 @@
 CONFIG_RPS=y
 CONFIG_RFS_ACCEL=y
 CONFIG_XPS=y
-# CONFIG_CGROUP_NET_PRIO is not set
-# CONFIG_CGROUP_NET_CLASSID is not set
 CONFIG_NET_RX_BUSY_POLL=y
 CONFIG_BQL=y
 # CONFIG_BPF_JIT is not set
@@ -738,23 +691,12 @@
 # CONFIG_BT is not set
 # CONFIG_AF_RXRPC is not set
 CONFIG_WIRELESS=y
-CONFIG_CFG80211=m
-# CONFIG_NL80211_TESTMODE is not set
-# CONFIG_CFG80211_DEVELOPER_WARNINGS is not set
-# CONFIG_CFG80211_REG_DEBUG is not set
-CONFIG_CFG80211_DEFAULT_PS=y
-# CONFIG_CFG80211_INTERNAL_REGDB is not set
-# CONFIG_CFG80211_WEXT is not set
+# CONFIG_CFG80211 is not set
 # CONFIG_LIB80211 is not set
-CONFIG_MAC80211=m
-CONFIG_MAC80211_HAS_RC=y
-CONFIG_MAC80211_RC_MINSTREL=y
-CONFIG_MAC80211_RC_MINSTREL_HT=y
-CONFIG_MAC80211_RC_DEFAULT_MINSTREL=y
-CONFIG_MAC80211_RC_DEFAULT="minstrel_ht"
-# CONFIG_MAC80211_MESH is not set
-# CONFIG_MAC80211_MESSAGE_TRACING is not set
-# CONFIG_MAC80211_DEBUG_MENU is not set
+
+#
+# CFG80211 needs to be enabled for MAC80211
+#
 # CONFIG_WIMAX is not set
 # CONFIG_RFKILL is not set
 CONFIG_RFKILL_REGULATOR=y
@@ -790,18 +732,6 @@
 CONFIG_REGMAP_MMIO=y
 CONFIG_REGMAP_IRQ=y
 CONFIG_DMA_SHARED_BUFFER=y
-CONFIG_DMA_CMA=y
-
-#
-# Default contiguous memory area size:
-#
-CONFIG_CMA_SIZE_MBYTES=64
-CONFIG_CMA_SIZE_SEL_MBYTES=y
-# CONFIG_CMA_SIZE_SEL_PERCENTAGE is not set
-# CONFIG_CMA_SIZE_SEL_MIN is not set
-# CONFIG_CMA_SIZE_SEL_MAX is not set
-CONFIG_CMA_ALIGNMENT=8
-CONFIG_CMA_AREAS=7
 
 #
 # Bus devices
@@ -861,11 +791,8 @@
 # CONFIG_SENSORS_APDS990X is not set
 # CONFIG_HMC6352 is not set
 # CONFIG_DS1682 is not set
-# CONFIG_TI_DAC7512 is not set
 # CONFIG_BMP085_I2C is not set
-# CONFIG_BMP085_SPI is not set
 # CONFIG_USB_SWITCH_FSA9480 is not set
-# CONFIG_LATTICE_ECP3_CONFIG is not set
 CONFIG_SRAM=y
 # CONFIG_C2PORT is not set
 
@@ -873,17 +800,14 @@
 # EEPROM support
 #
 # CONFIG_EEPROM_AT24 is not set
-# CONFIG_EEPROM_AT25 is not set
 # CONFIG_EEPROM_LEGACY is not set
 # CONFIG_EEPROM_MAX6875 is not set
 # CONFIG_EEPROM_93CX6 is not set
-# CONFIG_EEPROM_93XX46 is not set
 
 #
 # Texas Instruments shared transport line discipline
 #
 # CONFIG_TI_ST is not set
-# CONFIG_SENSORS_LIS3_SPI is not set
 # CONFIG_SENSORS_LIS3_I2C is not set
 
 #
@@ -943,37 +867,7 @@
 # CONFIG_SCSI_DEBUG is not set
 # CONFIG_SCSI_DH is not set
 # CONFIG_SCSI_OSD_INITIATOR is not set
-CONFIG_ATA=y
-# CONFIG_ATA_NONSTANDARD is not set
-CONFIG_ATA_VERBOSE_ERROR=y
-CONFIG_SATA_PMP=y
-
-#
-# Controllers with non-SFF native interface
-#
-CONFIG_SATA_AHCI_PLATFORM=y
-CONFIG_ATA_SFF=y
-
-#
-# SFF controllers with custom DMA interface
-#
-CONFIG_ATA_BMDMA=y
-
-#
-# SATA SFF controllers with BMDMA
-#
-
-#
-# PATA SFF controllers with BMDMA
-#
-
-#
-# PIO-only SFF controllers
-#
-
-#
-# Generic fallback / legacy drivers
-#
+# CONFIG_ATA is not set
 CONFIG_MD=y
 # CONFIG_BLK_DEV_MD is not set
 # CONFIG_BCACHE is not set
@@ -1047,11 +941,7 @@
 CONFIG_NET_VENDOR_MARVELL=y
 # CONFIG_MVMDIO is not set
 CONFIG_NET_VENDOR_MICREL=y
-# CONFIG_KS8842 is not set
-# CONFIG_KS8851 is not set
 # CONFIG_KS8851_MLL is not set
-CONFIG_NET_VENDOR_MICROCHIP=y
-# CONFIG_ENC28J60 is not set
 CONFIG_NET_VENDOR_NATSEMI=y
 CONFIG_NET_VENDOR_8390=y
 # CONFIG_AX88796 is not set
@@ -1101,7 +991,6 @@
 # CONFIG_MDIO_BITBANG is not set
 # CONFIG_MDIO_BUS_MUX_GPIO is not set
 # CONFIG_MDIO_BUS_MUX_MMIOREG is not set
-# CONFIG_MICREL_KS8995MA is not set
 # CONFIG_PPP is not set
 # CONFIG_SLIP is not set
 
@@ -1147,34 +1036,8 @@
 # CONFIG_USB_SIERRA_NET is not set
 # CONFIG_USB_VL600 is not set
 CONFIG_WLAN=y
-# CONFIG_LIBERTAS_THINFIRM is not set
-# CONFIG_AT76C50X_USB is not set
-# CONFIG_USB_ZD1201 is not set
-# CONFIG_USB_NET_RNDIS_WLAN is not set
-# CONFIG_RTL8187 is not set
-# CONFIG_MAC80211_HWSIM is not set
-# CONFIG_ATH_CARDS is not set
-# CONFIG_B43 is not set
-# CONFIG_B43LEGACY is not set
-# CONFIG_BRCMSMAC is not set
-# CONFIG_BRCMFMAC is not set
 # CONFIG_HOSTAP is not set
-# CONFIG_LIBERTAS is not set
-# CONFIG_P54_COMMON is not set
-# CONFIG_RT2X00 is not set
-CONFIG_RTL_CARDS=m
-CONFIG_RTL8192CU=m
-CONFIG_RTLWIFI=m
-CONFIG_RTLWIFI_USB=m
-CONFIG_RTLWIFI_DEBUG=y
-CONFIG_RTL8192C_COMMON=m
 # CONFIG_WL_TI is not set
-# CONFIG_ZD1211RW is not set
-CONFIG_MWIFIEX=m
-CONFIG_MWIFIEX_SDIO=m
-# CONFIG_MWIFIEX_USB is not set
-# CONFIG_CW1200 is not set
-# CONFIG_RSI_91X is not set
 
 #
 # Enable WiMAX (Networking options) to see the WiMAX drivers
@@ -1243,8 +1106,6 @@
 # CONFIG_INPUT_TABLET is not set
 CONFIG_INPUT_TOUCHSCREEN=y
 CONFIG_OF_TOUCHSCREEN=y
-# CONFIG_TOUCHSCREEN_ADS7846 is not set
-# CONFIG_TOUCHSCREEN_AD7877 is not set
 # CONFIG_TOUCHSCREEN_AD7879 is not set
 # CONFIG_TOUCHSCREEN_ATMEL_MXT is not set
 # CONFIG_TOUCHSCREEN_AUO_PIXCIR is not set
@@ -1276,7 +1137,6 @@
 # CONFIG_TOUCHSCREEN_USB_COMPOSITE is not set
 # CONFIG_TOUCHSCREEN_TOUCHIT213 is not set
 # CONFIG_TOUCHSCREEN_TSC_SERIO is not set
-# CONFIG_TOUCHSCREEN_TSC2005 is not set
 # CONFIG_TOUCHSCREEN_TSC2007 is not set
 # CONFIG_TOUCHSCREEN_ST1232 is not set
 # CONFIG_TOUCHSCREEN_SUR40 is not set
@@ -1323,7 +1183,6 @@
 CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_DEPRECATED_OPTIONS=y
 # CONFIG_SERIAL_8250_CONSOLE is not set
-CONFIG_SERIAL_8250_DMA=y
 CONFIG_SERIAL_8250_NR_UARTS=4
 CONFIG_SERIAL_8250_RUNTIME_UARTS=4
 # CONFIG_SERIAL_8250_EXTENDED is not set
@@ -1340,8 +1199,6 @@
 CONFIG_SERIAL_SAMSUNG_UARTS_4=y
 CONFIG_SERIAL_SAMSUNG_UARTS=4
 CONFIG_SERIAL_SAMSUNG_CONSOLE=y
-# CONFIG_SERIAL_MAX3100 is not set
-# CONFIG_SERIAL_MAX310X is not set
 CONFIG_SERIAL_CORE=y
 CONFIG_SERIAL_CORE_CONSOLE=y
 CONFIG_SERIAL_OF_PLATFORM=y
@@ -1349,7 +1206,6 @@
 # CONFIG_SERIAL_SC16IS7XX is not set
 # CONFIG_SERIAL_ALTERA_JTAGUART is not set
 # CONFIG_SERIAL_ALTERA_UART is not set
-# CONFIG_SERIAL_IFX6X60 is not set
 # CONFIG_SERIAL_XILINX_PS_UART is not set
 # CONFIG_SERIAL_ARC is not set
 # CONFIG_SERIAL_FSL_LPUART is not set
@@ -1417,37 +1273,12 @@
 #
 # Other I2C/SMBus bus drivers
 #
-CONFIG_I2C_CROS_EC_TUNNEL=y
+# CONFIG_I2C_CROS_EC_TUNNEL is not set
 # CONFIG_I2C_STUB is not set
 # CONFIG_I2C_DEBUG_CORE is not set
 # CONFIG_I2C_DEBUG_ALGO is not set
 # CONFIG_I2C_DEBUG_BUS is not set
-CONFIG_SPI=y
-# CONFIG_SPI_DEBUG is not set
-CONFIG_SPI_MASTER=y
-
-#
-# SPI Master Controller Drivers
-#
-# CONFIG_SPI_ALTERA is not set
-# CONFIG_SPI_BITBANG is not set
-# CONFIG_SPI_CADENCE is not set
-# CONFIG_SPI_GPIO is not set
-# CONFIG_SPI_FSL_SPI is not set
-# CONFIG_SPI_OC_TINY is not set
-# CONFIG_SPI_PL022 is not set
-# CONFIG_SPI_PXA2XX_PCI is not set
-CONFIG_SPI_S3C64XX=y
-# CONFIG_SPI_SC18IS602 is not set
-# CONFIG_SPI_XCOMM is not set
-# CONFIG_SPI_XILINX is not set
-# CONFIG_SPI_DESIGNWARE is not set
-
-#
-# SPI Protocol Masters
-#
-# CONFIG_SPI_SPIDEV is not set
-# CONFIG_SPI_TLE62X0 is not set
+# CONFIG_SPI is not set
 # CONFIG_SPMI is not set
 # CONFIG_HSI is not set
 
@@ -1482,6 +1313,7 @@
 # CONFIG_PINCTRL_SINGLE is not set
 CONFIG_PINCTRL_SAMSUNG=y
 CONFIG_PINCTRL_EXYNOS=y
+CONFIG_PINCTRL_EXYNOS5440=y
 CONFIG_ARCH_HAVE_CUSTOM_GPIO_H=y
 CONFIG_ARCH_WANT_OPTIONAL_GPIOLIB=y
 CONFIG_ARCH_REQUIRE_GPIOLIB=y
@@ -1521,10 +1353,7 @@
 #
 # SPI GPIO expanders:
 #
-# CONFIG_GPIO_MAX7301 is not set
 # CONFIG_GPIO_MCP23S08 is not set
-# CONFIG_GPIO_MC33880 is not set
-# CONFIG_GPIO_74X164 is not set
 
 #
 # AC97 GPIO expanders:
@@ -1543,75 +1372,11 @@
 # USB GPIO expanders:
 #
 # CONFIG_W1 is not set
-CONFIG_POWER_SUPPLY=y
-CONFIG_POWER_SUPPLY_DEBUG=y
-# CONFIG_PDA_POWER is not set
-# CONFIG_TEST_POWER is not set
-# CONFIG_BATTERY_DS2780 is not set
-# CONFIG_BATTERY_DS2781 is not set
-# CONFIG_BATTERY_DS2782 is not set
-CONFIG_BATTERY_SBS=y
-# CONFIG_BATTERY_BQ27x00 is not set
-# CONFIG_BATTERY_MAX17040 is not set
-# CONFIG_BATTERY_MAX17042 is not set
-# CONFIG_CHARGER_ISP1704 is not set
-# CONFIG_CHARGER_MAX8903 is not set
-# CONFIG_CHARGER_LP8727 is not set
-# CONFIG_CHARGER_GPIO is not set
-CONFIG_CHARGER_MANAGER=y
-# CONFIG_CHARGER_MAX8997 is not set
-# CONFIG_CHARGER_BQ2415X is not set
-# CONFIG_CHARGER_BQ24190 is not set
-# CONFIG_CHARGER_BQ24735 is not set
-# CONFIG_CHARGER_SMB347 is not set
-CONFIG_CHARGER_TPS65090=y
-CONFIG_POWER_RESET=y
-CONFIG_POWER_RESET_GPIO=y
-# CONFIG_POWER_RESET_RESTART is not set
+# CONFIG_POWER_SUPPLY is not set
 # CONFIG_POWER_AVS is not set
 # CONFIG_HWMON is not set
-CONFIG_THERMAL=y
-CONFIG_THERMAL_OF=y
-CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE=y
-# CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE is not set
-# CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE is not set
-# CONFIG_THERMAL_GOV_FAIR_SHARE is not set
-CONFIG_THERMAL_GOV_STEP_WISE=y
-# CONFIG_THERMAL_GOV_USER_SPACE is not set
-# CONFIG_CPU_THERMAL is not set
-# CONFIG_THERMAL_EMULATION is not set
-
-#
-# Texas Instruments thermal drivers
-#
-# CONFIG_TI_SOC_THERMAL is not set
-
-#
-# Samsung thermal drivers
-#
-CONFIG_EXYNOS_THERMAL=y
-CONFIG_EXYNOS_THERMAL_CORE=y
-CONFIG_WATCHDOG=y
-CONFIG_WATCHDOG_CORE=y
-# CONFIG_WATCHDOG_NOWAYOUT is not set
-
-#
-# Watchdog Device Drivers
-#
-# CONFIG_SOFT_WATCHDOG is not set
-# CONFIG_GPIO_WATCHDOG is not set
-# CONFIG_XILINX_WATCHDOG is not set
-# CONFIG_ARM_SP805_WATCHDOG is not set
-CONFIG_HAVE_S3C2410_WATCHDOG=y
-CONFIG_S3C2410_WATCHDOG=y
-# CONFIG_DW_WATCHDOG is not set
-# CONFIG_MAX63XX_WATCHDOG is not set
-# CONFIG_MEN_A21_WDT is not set
-
-#
-# USB-based Watchdog Cards
-#
-# CONFIG_USBPCWATCHDOG is not set
+# CONFIG_THERMAL is not set
+# CONFIG_WATCHDOG is not set
 CONFIG_SSB_POSSIBLE=y
 
 #
@@ -1637,14 +1402,11 @@
 # CONFIG_MFD_AXP20X is not set
 CONFIG_MFD_CROS_EC=y
 CONFIG_MFD_CROS_EC_I2C=y
-CONFIG_MFD_CROS_EC_SPI=y
 # CONFIG_MFD_ASIC3 is not set
 # CONFIG_PMIC_DA903X is not set
-# CONFIG_MFD_DA9052_SPI is not set
 # CONFIG_MFD_DA9052_I2C is not set
 # CONFIG_MFD_DA9055 is not set
 # CONFIG_MFD_DA9063 is not set
-# CONFIG_MFD_MC13XXX_SPI is not set
 # CONFIG_MFD_MC13XXX_I2C is not set
 # CONFIG_HTC_EGPIO is not set
 # CONFIG_HTC_PASIC3 is not set
@@ -1660,7 +1422,6 @@
 # CONFIG_MFD_MAX8925 is not set
 CONFIG_MFD_MAX8997=y
 # CONFIG_MFD_MAX8998 is not set
-# CONFIG_EZX_PCAP is not set
 # CONFIG_MFD_VIPERBOARD is not set
 # CONFIG_MFD_RETU is not set
 # CONFIG_MFD_PCF50633 is not set
@@ -1688,7 +1449,6 @@
 # CONFIG_MFD_TPS65910 is not set
 # CONFIG_MFD_TPS65912 is not set
 # CONFIG_MFD_TPS65912_I2C is not set
-# CONFIG_MFD_TPS65912_SPI is not set
 # CONFIG_MFD_TPS80031 is not set
 # CONFIG_TWL4030_CORE is not set
 # CONFIG_TWL6040_CORE is not set
@@ -1700,14 +1460,12 @@
 # CONFIG_MFD_TC6387XB is not set
 # CONFIG_MFD_TC6393XB is not set
 # CONFIG_MFD_ARIZONA_I2C is not set
-# CONFIG_MFD_ARIZONA_SPI is not set
 # CONFIG_MFD_WM8400 is not set
 # CONFIG_MFD_WM831X_I2C is not set
-# CONFIG_MFD_WM831X_SPI is not set
 # CONFIG_MFD_WM8350_I2C is not set
 # CONFIG_MFD_WM8994 is not set
 CONFIG_REGULATOR=y
-CONFIG_REGULATOR_DEBUG=y
+# CONFIG_REGULATOR_DEBUG is not set
 CONFIG_REGULATOR_FIXED_VOLTAGE=y
 # CONFIG_REGULATOR_VIRTUAL_CONSUMER is not set
 # CONFIG_REGULATOR_USERSPACE_CONSUMER is not set
@@ -1739,7 +1497,6 @@
 # CONFIG_REGULATOR_TPS65023 is not set
 # CONFIG_REGULATOR_TPS6507X is not set
 CONFIG_REGULATOR_TPS65090=y
-# CONFIG_REGULATOR_TPS6524X is not set
 # CONFIG_MEDIA_SUPPORT is not set
 
 #
@@ -1750,7 +1507,6 @@
 # Direct Rendering Manager
 #
 CONFIG_DRM=y
-CONFIG_DRM_MIPI_DSI=y
 CONFIG_DRM_KMS_HELPER=y
 CONFIG_DRM_KMS_FB_HELPER=y
 # CONFIG_DRM_LOAD_EDID_FIRMWARE is not set
@@ -1772,15 +1528,13 @@
 CONFIG_DRM_EXYNOS_IOMMU=y
 CONFIG_DRM_EXYNOS_DMABUF=y
 CONFIG_DRM_EXYNOS_FIMD=y
-CONFIG_DRM_EXYNOS_DPI=y
-CONFIG_DRM_EXYNOS_DSI=y
+# CONFIG_DRM_EXYNOS_DPI is not set
+# CONFIG_DRM_EXYNOS_DSI is not set
 CONFIG_DRM_EXYNOS_DP=y
-CONFIG_DRM_EXYNOS_HDMI=y
-CONFIG_DRM_EXYNOS_VIDI=y
-CONFIG_DRM_EXYNOS_G2D=y
-CONFIG_DRM_EXYNOS_IPP=y
-CONFIG_DRM_EXYNOS_FIMC=y
-CONFIG_DRM_EXYNOS_ROTATOR=y
+# CONFIG_DRM_EXYNOS_HDMI is not set
+# CONFIG_DRM_EXYNOS_VIDI is not set
+# CONFIG_DRM_EXYNOS_G2D is not set
+# CONFIG_DRM_EXYNOS_IPP is not set
 # CONFIG_DRM_UDL is not set
 # CONFIG_DRM_ARMADA is not set
 # CONFIG_DRM_TILCDC is not set
@@ -1831,32 +1585,16 @@
 CONFIG_FB_SIMPLE=y
 CONFIG_EXYNOS_VIDEO=y
 CONFIG_EXYNOS_MIPI_DSI=y
-CONFIG_EXYNOS_LCD_S6E8AX0=y
 # CONFIG_FB_SSD1307 is not set
 CONFIG_BACKLIGHT_LCD_SUPPORT=y
-CONFIG_LCD_CLASS_DEVICE=y
-# CONFIG_LCD_L4F00242T03 is not set
-# CONFIG_LCD_LMS283GF05 is not set
-# CONFIG_LCD_LTV350QV is not set
-# CONFIG_LCD_ILI922X is not set
-# CONFIG_LCD_ILI9320 is not set
-# CONFIG_LCD_TDO24M is not set
-# CONFIG_LCD_VGG2432A4 is not set
-CONFIG_LCD_PLATFORM=y
-# CONFIG_LCD_S6E63M0 is not set
-# CONFIG_LCD_LD9040 is not set
-# CONFIG_LCD_AMS369FG06 is not set
-# CONFIG_LCD_LMS501KF03 is not set
-# CONFIG_LCD_HX8357 is not set
+CONFIG_LCD_CLASS_DEVICE=m
+# CONFIG_LCD_PLATFORM is not set
 CONFIG_BACKLIGHT_CLASS_DEVICE=y
 CONFIG_BACKLIGHT_GENERIC=y
-CONFIG_BACKLIGHT_PWM=y
 # CONFIG_BACKLIGHT_ADP8860 is not set
 # CONFIG_BACKLIGHT_ADP8870 is not set
-# CONFIG_BACKLIGHT_LM3630A is not set
 # CONFIG_BACKLIGHT_LM3639 is not set
-# CONFIG_BACKLIGHT_LP855X is not set
-CONFIG_BACKLIGHT_GPIO=y
+# CONFIG_BACKLIGHT_GPIO is not set
 # CONFIG_BACKLIGHT_LV5207LP is not set
 # CONFIG_BACKLIGHT_BD6107 is not set
 # CONFIG_VGASTATE is not set
@@ -1880,7 +1618,6 @@
 # HID support
 #
 CONFIG_HID=y
-# CONFIG_HID_BATTERY_STRENGTH is not set
 # CONFIG_HIDRAW is not set
 # CONFIG_UHID is not set
 CONFIG_HID_GENERIC=y
@@ -1963,7 +1700,7 @@
 CONFIG_USB_COMMON=y
 CONFIG_USB_ARCH_HAS_HCD=y
 CONFIG_USB=y
-CONFIG_USB_ANNOUNCE_NEW_DEVICES=y
+# CONFIG_USB_ANNOUNCE_NEW_DEVICES is not set
 
 #
 # Miscellaneous USB options
@@ -1978,8 +1715,7 @@
 # USB Host Controller Drivers
 #
 # CONFIG_USB_C67X00_HCD is not set
-CONFIG_USB_XHCI_HCD=y
-CONFIG_USB_XHCI_PLATFORM=y
+# CONFIG_USB_XHCI_HCD is not set
 CONFIG_USB_EHCI_HCD=y
 # CONFIG_USB_EHCI_ROOT_HUB_TT is not set
 CONFIG_USB_EHCI_TT_NEWSCHED=y
@@ -1991,10 +1727,7 @@
 # CONFIG_USB_ISP1362_HCD is not set
 # CONFIG_USB_FUSBH200_HCD is not set
 # CONFIG_USB_FOTG210_HCD is not set
-# CONFIG_USB_MAX3421_HCD is not set
-CONFIG_USB_OHCI_HCD=y
-CONFIG_USB_OHCI_EXYNOS=y
-# CONFIG_USB_OHCI_HCD_PLATFORM is not set
+# CONFIG_USB_OHCI_HCD is not set
 # CONFIG_USB_SL811_HCD is not set
 # CONFIG_USB_R8A66597_HCD is not set
 # CONFIG_USB_HCD_TEST_MODE is not set
@@ -2082,7 +1815,7 @@
 # CONFIG_USB_ISIGHTFW is not set
 # CONFIG_USB_YUREX is not set
 # CONFIG_USB_EZUSB_FX2 is not set
-CONFIG_USB_HSIC_USB3503=y
+# CONFIG_USB_HSIC_USB3503 is not set
 
 #
 # USB Physical Layer drivers
@@ -2156,7 +1889,7 @@
 # CONFIG_RTC_DRV_HYM8563 is not set
 # CONFIG_RTC_DRV_MAX6900 is not set
 # CONFIG_RTC_DRV_MAX8997 is not set
-CONFIG_RTC_DRV_MAX77686=y
+# CONFIG_RTC_DRV_MAX77686 is not set
 # CONFIG_RTC_DRV_RS5C372 is not set
 # CONFIG_RTC_DRV_ISL1208 is not set
 # CONFIG_RTC_DRV_ISL12022 is not set
@@ -2174,24 +1907,11 @@
 # CONFIG_RTC_DRV_RX8025 is not set
 # CONFIG_RTC_DRV_EM3027 is not set
 # CONFIG_RTC_DRV_RV3029C2 is not set
-CONFIG_RTC_DRV_S5M=y
+# CONFIG_RTC_DRV_S5M is not set
 
 #
 # SPI RTC drivers
 #
-# CONFIG_RTC_DRV_M41T93 is not set
-# CONFIG_RTC_DRV_M41T94 is not set
-# CONFIG_RTC_DRV_DS1305 is not set
-# CONFIG_RTC_DRV_DS1343 is not set
-# CONFIG_RTC_DRV_DS1347 is not set
-# CONFIG_RTC_DRV_DS1390 is not set
-# CONFIG_RTC_DRV_MAX6902 is not set
-# CONFIG_RTC_DRV_R9701 is not set
-# CONFIG_RTC_DRV_RS5C348 is not set
-# CONFIG_RTC_DRV_DS3234 is not set
-# CONFIG_RTC_DRV_PCF2123 is not set
-# CONFIG_RTC_DRV_RX4581 is not set
-# CONFIG_RTC_DRV_MCP795 is not set
 
 #
 # Platform RTC drivers
@@ -2226,25 +1946,7 @@
 # HID Sensor RTC drivers
 #
 # CONFIG_RTC_DRV_HID_SENSOR_TIME is not set
-CONFIG_DMADEVICES=y
-# CONFIG_DMADEVICES_DEBUG is not set
-
-#
-# DMA Devices
-#
-# CONFIG_AMBA_PL08X is not set
-# CONFIG_DW_DMAC_CORE is not set
-# CONFIG_DW_DMAC is not set
-CONFIG_PL330_DMA=y
-# CONFIG_FSL_EDMA is not set
-CONFIG_DMA_ENGINE=y
-CONFIG_DMA_OF=y
-
-#
-# DMA Clients
-#
-# CONFIG_ASYNC_TX_DMA is not set
-# CONFIG_DMATEST is not set
+# CONFIG_DMADEVICES is not set
 # CONFIG_AUXDISPLAY is not set
 # CONFIG_UIO is not set
 # CONFIG_VFIO is not set
@@ -2258,42 +1960,7 @@
 #
 # Microsoft Hyper-V guest support
 #
-CONFIG_STAGING=y
-# CONFIG_USBIP_CORE is not set
-# CONFIG_W35UND is not set
-# CONFIG_PRISM2_USB is not set
-# CONFIG_COMEDI is not set
-# CONFIG_RTLLIB is not set
-# CONFIG_R8712U is not set
-# CONFIG_R8188EU is not set
-# CONFIG_TRANZPORT is not set
-# CONFIG_VT6656 is not set
-# CONFIG_USB_ENESTORAGE is not set
-# CONFIG_BCM_WIMAX is not set
-# CONFIG_FT1000 is not set
-
-#
-# Speakup console speech
-#
-# CONFIG_SPEAKUP is not set
-# CONFIG_TOUCHSCREEN_CLEARPAD_TM1217 is not set
-# CONFIG_TOUCHSCREEN_SYNAPTICS_I2C_RMI4 is not set
-# CONFIG_STAGING_MEDIA is not set
-
-#
-# Android
-#
-# CONFIG_ANDROID is not set
-# CONFIG_USB_WPAN_HCD is not set
-# CONFIG_WIMAX_GDM72XX is not set
-# CONFIG_LTE_GDM724X is not set
-# CONFIG_CED1401 is not set
-# CONFIG_DRM_IMX is not set
-# CONFIG_DGRP is not set
-# CONFIG_LUSTRE_FS is not set
-# CONFIG_XILLYBUS is not set
-# CONFIG_DGAP is not set
-# CONFIG_GS_FPGABOOT is not set
+# CONFIG_STAGING is not set
 
 #
 # SOC (System On Chip) specific Drivers
@@ -2308,7 +1975,7 @@
 CONFIG_COMMON_CLK_MAX77686=y
 # CONFIG_COMMON_CLK_SI5351 is not set
 # CONFIG_COMMON_CLK_SI570 is not set
-CONFIG_COMMON_CLK_S2MPS11=y
+# CONFIG_COMMON_CLK_S2MPS11 is not set
 # CONFIG_COMMON_CLK_QCOM is not set
 CONFIG_COMMON_CLK_SAMSUNG=y
 
@@ -2316,6 +1983,8 @@
 # Hardware Spinlock drivers
 #
 CONFIG_CLKSRC_OF=y
+CONFIG_ARM_ARCH_TIMER=y
+CONFIG_ARM_ARCH_TIMER_EVTSTREAM=y
 CONFIG_CLKSRC_EXYNOS_MCT=y
 CONFIG_CLKSRC_SAMSUNG_PWM=y
 # CONFIG_SH_TIMER_CMT is not set
@@ -2329,7 +1998,6 @@
 CONFIG_OF_IOMMU=y
 CONFIG_EXYNOS_IOMMU=y
 # CONFIG_EXYNOS_IOMMU_DEBUG is not set
-# CONFIG_ARM_SMMU is not set
 
 #
 # Remoteproc drivers
@@ -2339,34 +2007,11 @@
 #
 # Rpmsg drivers
 #
-CONFIG_PM_DEVFREQ=y
-
-#
-# DEVFREQ Governors
-#
-CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND=y
-# CONFIG_DEVFREQ_GOV_PERFORMANCE is not set
-# CONFIG_DEVFREQ_GOV_POWERSAVE is not set
-# CONFIG_DEVFREQ_GOV_USERSPACE is not set
-
-#
-# DEVFREQ Drivers
-#
-CONFIG_ARM_EXYNOS5_BUS_DEVFREQ=y
-CONFIG_EXTCON=y
-
-#
-# Extcon Device Drivers
-#
-# CONFIG_EXTCON_GPIO is not set
-# CONFIG_EXTCON_MAX8997 is not set
+# CONFIG_PM_DEVFREQ is not set
+# CONFIG_EXTCON is not set
 # CONFIG_MEMORY is not set
 # CONFIG_IIO is not set
-CONFIG_PWM=y
-CONFIG_PWM_SYSFS=y
-# CONFIG_PWM_FSL_FTM is not set
-# CONFIG_PWM_PCA9685 is not set
-CONFIG_PWM_SAMSUNG=y
+# CONFIG_PWM is not set
 CONFIG_IRQCHIP=y
 CONFIG_ARM_GIC=y
 CONFIG_GIC_NON_BANKED=y
@@ -2381,7 +2026,7 @@
 CONFIG_PHY_EXYNOS_MIPI_VIDEO=y
 CONFIG_PHY_EXYNOS_DP_VIDEO=y
 # CONFIG_BCM_KONA_USB2_PHY is not set
-CONFIG_PHY_EXYNOS5250_SATA=y
+# CONFIG_PHY_EXYNOS5250_SATA is not set
 CONFIG_PHY_SAMSUNG_USB2=y
 CONFIG_PHY_EXYNOS4210_USB2=y
 CONFIG_PHY_EXYNOS4X12_USB2=y
@@ -2417,15 +2062,14 @@
 # CONFIG_BTRFS_FS is not set
 # CONFIG_NILFS2_FS is not set
 CONFIG_FS_POSIX_ACL=y
-CONFIG_EXPORTFS=y
 CONFIG_FILE_LOCKING=y
 CONFIG_FSNOTIFY=y
 CONFIG_DNOTIFY=y
 CONFIG_INOTIFY_USER=y
-CONFIG_FANOTIFY=y
+# CONFIG_FANOTIFY is not set
 # CONFIG_QUOTA is not set
 # CONFIG_QUOTACTL is not set
-CONFIG_AUTOFS4_FS=m
+# CONFIG_AUTOFS4_FS is not set
 # CONFIG_FUSE_FS is not set
 
 #
@@ -2460,7 +2104,6 @@
 CONFIG_TMPFS=y
 CONFIG_TMPFS_POSIX_ACL=y
 CONFIG_TMPFS_XATTR=y
-# CONFIG_HUGETLBFS is not set
 # CONFIG_HUGETLB_PAGE is not set
 # CONFIG_CONFIGFS_FS is not set
 CONFIG_MISC_FILESYSTEMS=y
@@ -2556,7 +2199,7 @@
 #
 CONFIG_PRINTK_TIME=y
 CONFIG_DEFAULT_MESSAGE_LOGLEVEL=4
-CONFIG_BOOT_PRINTK_DELAY=y
+# CONFIG_BOOT_PRINTK_DELAY is not set
 
 #
 # Compile-time checks and compiler options
@@ -2626,7 +2269,7 @@
 # CONFIG_DEBUG_KOBJECT is not set
 CONFIG_DEBUG_BUGVERBOSE=y
 # CONFIG_DEBUG_LIST is not set
-CONFIG_DEBUG_PI_LIST=y
+# CONFIG_DEBUG_PI_LIST is not set
 # CONFIG_DEBUG_SG is not set
 # CONFIG_DEBUG_NOTIFIERS is not set
 # CONFIG_DEBUG_CREDENTIALS is not set
@@ -2715,7 +2358,6 @@
 #
 CONFIG_CRYPTO_ALGAPI=y
 CONFIG_CRYPTO_ALGAPI2=y
-CONFIG_CRYPTO_AEAD=m
 CONFIG_CRYPTO_AEAD2=y
 CONFIG_CRYPTO_BLKCIPHER=y
 CONFIG_CRYPTO_BLKCIPHER2=y
@@ -2739,15 +2381,15 @@
 #
 # Authenticated Encryption with Associated Data
 #
-CONFIG_CRYPTO_CCM=m
+# CONFIG_CRYPTO_CCM is not set
 # CONFIG_CRYPTO_GCM is not set
-CONFIG_CRYPTO_SEQIV=m
+# CONFIG_CRYPTO_SEQIV is not set
 
 #
 # Block modes
 #
 CONFIG_CRYPTO_CBC=y
-CONFIG_CRYPTO_CTR=m
+# CONFIG_CRYPTO_CTR is not set
 # CONFIG_CRYPTO_CTS is not set
 # CONFIG_CRYPTO_ECB is not set
 # CONFIG_CRYPTO_LRW is not set
@@ -2789,7 +2431,7 @@
 CONFIG_CRYPTO_AES=y
 # CONFIG_CRYPTO_AES_ARM is not set
 # CONFIG_CRYPTO_ANUBIS is not set
-CONFIG_CRYPTO_ARC4=m
+# CONFIG_CRYPTO_ARC4 is not set
 # CONFIG_CRYPTO_BLOWFISH is not set
 # CONFIG_CRYPTO_CAMELLIA is not set
 # CONFIG_CRYPTO_CAST5 is not set
@@ -2819,7 +2461,7 @@
 # CONFIG_CRYPTO_USER_API_HASH is not set
 # CONFIG_CRYPTO_USER_API_SKCIPHER is not set
 CONFIG_CRYPTO_HW=y
-CONFIG_CRYPTO_DEV_S5P=y
+# CONFIG_CRYPTO_DEV_S5P is not set
 # CONFIG_BINARY_PRINTF is not set
 
 #
@@ -2873,7 +2515,7 @@
 CONFIG_DQL=y
 CONFIG_NLATTR=y
 CONFIG_ARCH_HAS_ATOMIC64_DEC_IF_POSITIVE=y
-CONFIG_AVERAGE=y
+# CONFIG_AVERAGE is not set
 # CONFIG_CORDIC is not set
 # CONFIG_DDR is not set
 CONFIG_LIBFDT=y
@@ -2889,11 +2531,4 @@
 # CONFIG_FONT_SUN8x16 is not set
 # CONFIG_FONT_SUN12x22 is not set
 # CONFIG_FONT_10x18 is not set
-CONFIG_HAVE_KVM_IRQCHIP=y
-CONFIG_KVM_MMIO=y
-CONFIG_HAVE_KVM_CPU_RELAX_INTERCEPT=y
-CONFIG_VIRTUALIZATION=y
-CONFIG_KVM=y
-CONFIG_KVM_ARM_HOST=y
-CONFIG_KVM_ARM_MAX_VCPUS=4
-CONFIG_KVM_ARM_VGIC=y
+# CONFIG_VIRTUALIZATION is not set

--------------060402090209090001090207--
