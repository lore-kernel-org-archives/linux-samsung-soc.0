From: Maurus Cuelenaere <mcuelenaere@gmail.com>
Subject: s3c-hsotg driver problem
Date: Sat, 16 Jan 2010 13:39:08 +0100
Message-ID: <4B51B36C.6040308@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------040201020902000906030304"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ew0-f219.google.com ([209.85.219.219]:33979 "EHLO
	mail-ew0-f219.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932126Ab0APMjM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 16 Jan 2010 07:39:12 -0500
Received: by ewy19 with SMTP id 19so1707271ewy.21
        for <linux-samsung-soc@vger.kernel.org>; Sat, 16 Jan 2010 04:39:10 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Ben Dooks <ben-linux@fluff.org>

This is a multi-part message in MIME format.
--------------040201020902000906030304
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I'm trying to get the USB OTG port working on my device (S3C6410 board), 
but am running into problems.
This board doesn't have a 48Mhz clock, so I set the reference clock in 
the USB PLL to a 12Mhz external crystal (see patch).

Still, I'm having trouble getting it to work; I'm seeing these messages 
(see attachment for full log):

s3c-hsotg s3c-hsotg: s3c_hsotg_rx_data: FIFO 8 bytes on ep0 but no req 
(DxEPCTl=0x00028000)
hub 1-0:1.0: connect-debounce failed, port 2 disabled

This looks like the hardware is configured correctly, but the 
currently-in-use gadget isn't setting up an EP0 RX transfer?
I've tried Mass Storage, serial, Ethernet, ... gadgets and they all give 
the same errors.

Any hints/pointers would be welcome!

Thanks,
Maurus Cuelenaere

--------------040201020902000906030304
Content-Type: text/plain;
 name="att1"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="att1"

[    0.000000] Linux version 2.6.33-rc2-00332-g244c196-dirty (mcuelenaere@wim2160) (gcc version 4.3.3 (GCC) ) #41 PREEMPT Sat Jan 16 02:17:53 CET 2010
[    0.000000] CPU: ARMv6-compatible processor [410fb766] revision 6 (ARMv7), cr=00c5387f
[    0.000000] CPU: VIPT nonaliasing data cache, VIPT nonaliasing instruction cache
[    0.000000] Machine: SmartQ 7
[    0.000000] Memory policy: ECC disabled, Data cache writeback
[    0.000000] On node 0 totalpages: 32768
[    0.000000] free_area_init_node: node 0, pgdat c0483bac, node_mem_map c04fc000
[    0.000000]   Normal zone: 256 pages used for memmap
[    0.000000]   Normal zone: 0 pages reserved
[    0.000000]   Normal zone: 32512 pages, LIFO batch:7
[    0.000000] CPU S3C6410 (id 0x36410101)
[    0.000000] s3c6410_init_clocks: initialising clocks
[    0.000000] S3C24XX Clocks, Copyright 2004 Simtec Electronics
[    0.000000] s3c6400_setup_clocks: registering clocks
[    0.000000] s3c6400_setup_clocks: clkdiv0 = 01043310
[    0.000000] s3c6400_setup_clocks: xtal is 12000000
[    0.000000] S3C64XX: PLL settings, A=666000000, M=532000000, E=96000000
[    0.000000] S3C64XX: HCLK2=266000000, HCLK=133000000, PCLK=66500000
[    0.000000] mout_apll: source is fout_apll (1), rate is 666000000
[    0.000000] mout_epll: source is epll (1), rate is 96000000
[    0.000000] mout_mpll: source is mpll (1), rate is 532000000
[    0.000000] mmc_bus: source is mout_epll (0), rate is 32000000
[    0.000000] mmc_bus: source is mout_epll (0), rate is 32000000
[    0.000000] mmc_bus: source is mout_epll (0), rate is 32000000
[    0.000000] usb-bus-host: source is mout_epll (1), rate is 48000000
[    0.000000] s3c64xx_clk_doutmpll_get_rate: parent is 532000000
[    0.000000] uclk1: source is dout_mpll (1), rate is 66500000
[    0.000000] spi-bus: source is mout_epll (0), rate is 48000000
[    0.000000] spi-bus: source is mout_epll (0), rate is 48000000
[    0.000000] audio-bus: source is mout_epll (0), rate is 48000000
[    0.000000] audio-bus: source is mout_epll (0), rate is 48000000
[    0.000000] irda-bus: source is mout_epll (0), rate is 48000000
[    0.000000] camera: source is hclk2 (0), rate is 266000000
[    0.000000] Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 32512
[    0.000000] Kernel command line: loglevel=6 rootwait console=ttySAC0,115200n8 ignore_loglevel root=/dev/mmcblk1p1
[    0.000000] debug: ignoring loglevel setting.
[    0.000000] PID hash table entries: 512 (order: -1, 2048 bytes)
[    0.000000] Dentry cache hash table entries: 16384 (order: 4, 65536 bytes)
[    0.000000] Inode-cache hash table entries: 8192 (order: 3, 32768 bytes)
[    0.000000] Memory: 128MB = 128MB total
[    0.000000] Memory: 124672KB available (4220K code, 704K data, 140K init, 0K highmem)
[    0.000000] SLUB: Genslabs=11, HWalign=32, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
[    0.000000] Hierarchical RCU implementation.
[    0.000000] NR_IRQS:246
[    0.000000] s3c64xx_init_irq: initialising interrupts
[    0.000000] VIC @f4000000: id 0x00041192, vendor 0x41
[    0.000000] VIC @f4010000: id 0x00041192, vendor 0x41
[    0.000000] timer tcon=00000000, tcnt 1b0f0, tcfg 00000201,00010000, usec 00001719
[    0.000000] Console: colour dummy device 80x30
[    0.000000] console [ttySAC0] enabled
[    0.010000] Calibrating delay loop... 665.19 BogoMIPS (lpj=3325952)
[    0.240000] Mount-cache hash table entries: 512
[    0.240000] CPU: Testing write buffer coherency: ok
[    0.250000] regulator: core version 0.5
[    0.250000] NET: Registered protocol family 16
[    0.370000] s3c64xx_dma_init: Registering DMA channels
[    0.370000] s3c64xx_dma_init1: registering DMA 0 (c8808100)
[    0.370000] s3c64xx_dma_init1: registering DMA 1 (c8808120)
[    0.380000] s3c64xx_dma_init1: registering DMA 2 (c8808140)
[    0.380000] s3c64xx_dma_init1: registering DMA 3 (c8808160)
[    0.390000] s3c64xx_dma_init1: registering DMA 4 (c8808180)
[    0.400000] s3c64xx_dma_init1: registering DMA 5 (c88081a0)
[    0.400000] s3c64xx_dma_init1: registering DMA 6 (c88081c0)
[    0.410000] s3c64xx_dma_init1: registering DMA 7 (c88081e0)
[    0.410000] PL080: IRQ 73, at c8808000
[    0.420000] s3c64xx_dma_init1: registering DMA 8 (c880c100)
[    0.420000] s3c64xx_dma_init1: registering DMA 9 (c880c120)
[    0.430000] s3c64xx_dma_init1: registering DMA 10 (c880c140)
[    0.430000] s3c64xx_dma_init1: registering DMA 11 (c880c160)
[    0.440000] s3c64xx_dma_init1: registering DMA 12 (c880c180)
[    0.440000] s3c64xx_dma_init1: registering DMA 13 (c880c1a0)
[    0.450000] s3c64xx_dma_init1: registering DMA 14 (c880c1c0)
[    0.460000] s3c64xx_dma_init1: registering DMA 15 (c880c1e0)
[    0.460000] PL080: IRQ 74, at c880c000
[    0.460000] S3C6410: Initialising architecture
[    0.470000] s3c24xx-pwm s3c24xx-pwm.1: tin at 33250000, tdiv at 33250000, tin=divclk, base 8
[    0.480000] s3c-adc s3c64xx-adc: attached adc driver
[    0.530000] bio: create slab <bio-0> at 0
[    0.530000] SCSI subsystem initialized
[    0.530000] usbcore: registered new interface driver usbfs
[    0.540000] usbcore: registered new interface driver hub
[    0.540000] usbcore: registered new device driver usb
[    0.560000] cfg80211: Calling CRDA to update world regulatory domain
[    0.580000] NET: Registered protocol family 2
[    0.580000] IP route cache hash table entries: 1024 (order: 0, 4096 bytes)
[    0.590000] TCP established hash table entries: 4096 (order: 3, 32768 bytes)
[    0.590000] TCP bind hash table entries: 4096 (order: 2, 16384 bytes)
[    0.600000] TCP: Hash tables configured (established 4096 bind 4096)
[    0.610000] TCP reno registered
[    0.610000] UDP hash table entries: 256 (order: 0, 4096 bytes)
[    0.620000] UDP-Lite hash table entries: 256 (order: 0, 4096 bytes)
[    0.620000] NET: Registered protocol family 1
[    0.680000] DLM (built Jan 14 2010 00:10:00) installed
[    0.690000] msgmni has been set to 243
[    0.690000] alg: No test for stdrng (krng)
[    0.690000] io scheduler noop registered
[    0.690000] io scheduler deadline registered
[    0.700000] io scheduler cfq registered (default)
[    0.730000] Console: switching to colour frame buffer device 100x30
[    0.750000] s3c-fb s3c-fb: window 0: fb
[    1.650000] s3c6400-uart.0: s3c2410_serial0 at MMIO 0x7f005000 (irq = 16) is a S3C6400/10
[    1.650000] s3c6400-uart.1: s3c2410_serial1 at MMIO 0x7f005400 (irq = 20) is a S3C6400/10
[    1.660000] s3c6400-uart.2: s3c2410_serial2 at MMIO 0x7f005800 (irq = 24) is a S3C6400/10
[    1.670000] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
[    1.680000] s3c2410-ohci s3c2410-ohci: S3C24XX OHCI
[    1.680000] s3c2410-ohci s3c2410-ohci: new USB bus registered, assigned bus number 1
[    1.690000] s3c2410-ohci s3c2410-ohci: irq 79, io mem 0x74300000
[    1.750000] usb usb1: New USB device found, idVendor=1d6b, idProduct=0001
[    1.750000] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    1.760000] usb usb1: Product: S3C24XX OHCI
[    1.760000] usb usb1: Manufacturer: Linux 2.6.33-rc2-00332-g244c196-dirty ohci_hcd
[    1.770000] usb usb1: SerialNumber: s3c24xx
[    1.780000] hub 1-0:1.0: USB hub found
[    1.780000] hub 1-0:1.0: 2 ports detected
[    1.780000] Initializing USB Mass Storage driver...
[    1.790000] usbcore: registered new interface driver usb-storage
[    1.790000] USB Mass Storage support registered.
[    1.800000] s3c-hsotg s3c-hsotg: regs c8820000, irq 90
[    1.800000] s3c-hsotg s3c-hsotg: GRXFSIZ=0x00001800, GNPTXFSIZ=0x18001800
[    1.810000] s3c-hsotg s3c-hsotg: DCFG=0x00200000, DCTL=0x00000000, DIEPMSK=0000000f
[    1.820000] s3c-hsotg s3c-hsotg: GAHBCFG=0x00000000, 0x44=0x00000000
[    1.820000] s3c-hsotg s3c-hsotg: GRXFSIZ=0x00000800, GNPTXFSIZ=0x01c00800
[    1.830000] s3c-hsotg s3c-hsotg: DPTx[1] FSize=768, StAddr=0x00001000
[    1.840000] s3c-hsotg s3c-hsotg: DPTx[2] FSize=768, StAddr=0x00003300
[    1.840000] s3c-hsotg s3c-hsotg: DPTx[3] FSize=768, StAddr=0x00003600
[    1.850000] s3c-hsotg s3c-hsotg: DPTx[4] FSize=768, StAddr=0x00003900
[    1.860000] s3c-hsotg s3c-hsotg: DPTx[5] FSize=768, StAddr=0x00003c00
[    1.860000] s3c-hsotg s3c-hsotg: DPTx[6] FSize=768, StAddr=0x00003f00
[    1.870000] s3c-hsotg s3c-hsotg: DPTx[7] FSize=768, StAddr=0x00004200
[    1.870000] s3c-hsotg s3c-hsotg: DPTx[8] FSize=768, StAddr=0x00004500
[    1.880000] s3c-hsotg s3c-hsotg: DPTx[9] FSize=768, StAddr=0x00004800
[    1.890000] s3c-hsotg s3c-hsotg: DPTx[10] FSize=768, StAddr=0x00004b00
[    1.890000] s3c-hsotg s3c-hsotg: DPTx[11] FSize=768, StAddr=0x00004e00
[    1.900000] s3c-hsotg s3c-hsotg: DPTx[12] FSize=768, StAddr=0x00005100
[    1.910000] s3c-hsotg s3c-hsotg: DPTx[13] FSize=768, StAddr=0x00005400
[    1.910000] s3c-hsotg s3c-hsotg: DPTx[14] FSize=768, StAddr=0x00005700
[    1.920000] s3c-hsotg s3c-hsotg: DPTx[15] FSize=768, StAddr=0x00005a00
[    1.930000] s3c-hsotg s3c-hsotg: ep0-in: EPCTL=0x00008000, SIZ=0x00000000, DMA=0x00000000
[    1.930000] s3c-hsotg s3c-hsotg: ep0-out: EPCTL=0x00008000, SIZ=0x00000000, DMA=0x00000000
[    1.940000] s3c-hsotg s3c-hsotg: ep1-in: EPCTL=0x00000000, SIZ=0x00000000, DMA=0x00000000
[    1.950000] s3c-hsotg s3c-hsotg: ep1-out: EPCTL=0x00000000, SIZ=0x00000000, DMA=0x00000000
[    1.960000] s3c-hsotg s3c-hsotg: ep2-in: EPCTL=0x00000000, SIZ=0x00000000, DMA=0x00000000
[    1.970000] s3c-hsotg s3c-hsotg: ep2-out: EPCTL=0x00000000, SIZ=0x00000000, DMA=0x00000000
[    1.980000] s3c-hsotg s3c-hsotg: ep3-in: EPCTL=0x00000000, SIZ=0x00000000, DMA=0x00000000
[    1.980000] s3c-hsotg s3c-hsotg: ep3-out: EPCTL=0x00000000, SIZ=0x00000000, DMA=0x00000000
[    1.990000] s3c-hsotg s3c-hsotg: ep4-in: EPCTL=0x00000000, SIZ=0x00000000, DMA=0x00000000
[    2.000000] s3c-hsotg s3c-hsotg: ep4-out: EPCTL=0x00000000, SIZ=0x00000000, DMA=0x00000000
[    2.010000] s3c-hsotg s3c-hsotg: ep5-in: EPCTL=0x00000000, SIZ=0x00000000, DMA=0x00000000
[    2.020000] s3c-hsotg s3c-hsotg: ep5-out: EPCTL=0x00000000, SIZ=0x00000000, DMA=0x00000000
[    2.020000] s3c-hsotg s3c-hsotg: ep6-in: EPCTL=0x00000000, SIZ=0x00000000, DMA=0x00000000
[    2.030000] s3c-hsotg s3c-hsotg: ep6-out: EPCTL=0x00000000, SIZ=0x00000000, DMA=0x00000000
[    2.040000] s3c-hsotg s3c-hsotg: ep7-in: EPCTL=0x00000000, SIZ=0x00000000, DMA=0x00000000
[    2.050000] s3c-hsotg s3c-hsotg: ep7-out: EPCTL=0x00000000, SIZ=0x00000000, DMA=0x00000000
[    2.060000] s3c-hsotg s3c-hsotg: ep8-in: EPCTL=0x00000000, SIZ=0x00000000, DMA=0x00000000
[    2.070000] s3c-hsotg s3c-hsotg: ep8-out: EPCTL=0x00000000, SIZ=0x00000000, DMA=0x00000000
[    2.070000] s3c-hsotg s3c-hsotg: ep9-in: EPCTL=0x00000000, SIZ=0x00000000, DMA=0x00000000
[    2.080000] s3c-hsotg s3c-hsotg: ep9-out: EPCTL=0x00000000, SIZ=0x00000000, DMA=0x00000000
[    2.090000] s3c-hsotg s3c-hsotg: ep10-in: EPCTL=0x00000000, SIZ=0x00000000, DMA=0x00000000
[    2.100000] s3c-hsotg s3c-hsotg: ep10-out: EPCTL=0x00000000, SIZ=0x00000000, DMA=0x00000000
[    2.110000] s3c-hsotg s3c-hsotg: ep11-in: EPCTL=0x00000000, SIZ=0x00000000, DMA=0x00000000
[    2.110000] s3c-hsotg s3c-hsotg: ep11-out: EPCTL=0x00000000, SIZ=0x00000000, DMA=0x00000000
[    2.120000] s3c-hsotg s3c-hsotg: ep12-in: EPCTL=0x00000000, SIZ=0x00000000, DMA=0x00000000
[    2.130000] s3c-hsotg s3c-hsotg: ep12-out: EPCTL=0x00000000, SIZ=0x00000000, DMA=0x00000000
[    2.140000] s3c-hsotg s3c-hsotg: ep13-in: EPCTL=0x00000000, SIZ=0x00000000, DMA=0x00000000
[    2.150000] s3c-hsotg s3c-hsotg: ep13-out: EPCTL=0x00000000, SIZ=0x00000000, DMA=0x00000000
[    2.160000] s3c-hsotg s3c-hsotg: ep14-in: EPCTL=0x00000000, SIZ=0x00000000, DMA=0x00000000
[    2.160000] s3c-hsotg s3c-hsotg: ep14-out: EPCTL=0x00000000, SIZ=0x00000000, DMA=0x00000000
[    2.170000] s3c-hsotg s3c-hsotg: DVBUSDIS=0x000017d7, DVBUSPULSE=000005b8
[    2.180000] g_serial gadget: Gadget Serial v2.4
[    2.180000] g_serial gadget: g_serial ready
[    2.190000] s3c-hsotg s3c-hsotg: EP0: DIEPCTL0=0x00008000, DOEPCTL0=0x00008000
[    2.200000] s3c-hsotg s3c-hsotg: DCTL=0x00000002
[    2.200000] s3c-hsotg s3c-hsotg: EP0: DIEPCTL0=0x00008000, DOEPCTL0=0x80008000
[    2.210000] s3c-hsotg s3c-hsotg: S3C_GINTSTS_USBSusp
[    2.210000] s3c-hsotg s3c-hsotg: s3c_hsotg_irq: USBRst
[    2.220000] s3c-hsotg s3c-hsotg: GNPTXSTS=000801c0
[    2.220000] s3c-hsotg s3c-hsotg: bound driver g_serial
[    2.230000] mice: PS/2 mouse device common for all mice
[    2.230000] input: gpio-keys as /devices/platform/gpio-keys.0/input/input0
[    2.240000] i2c /dev entries driver
[    2.250000] i2c-gpio i2c-gpio.0: using pins 139 (SDA) and 138 (SCL)
[    2.250000] APM Battery Driver
[    2.250000] cpuidle: using governor ladder
[    2.260000] s3c-hsotg s3c-hsotg: new device is high-speed
[    2.260000] s3c-hsotg s3c-hsotg: S3C_GINTSTS_USBSusp
[    2.270000] sdhci: Secure Digital Host Controller Interface driver
[    2.270000] sdhci: Copyright(c) Pierre Ossman
[    2.280000] s3c-sdhci s3c-sdhci.1: clock source 0: hsmmc (133000000 Hz)
[    2.280000] s3c-sdhci s3c-sdhci.1: clock source 1: hsmmc (133000000 Hz)
[    2.290000] s3c-sdhci s3c-sdhci.1: clock source 2: mmc_bus (32000000 Hz)
[    2.300000] Registered led device: mmc0::
[    2.300000] mmc0: SDHCI controller on samsung-hsmmc [s3c-sdhci.1] using PIO
[    2.310000] s3c-sdhci s3c-sdhci.0: clock source 0: hsmmc (133000000 Hz)
[    2.310000] s3c-sdhci s3c-sdhci.0: clock source 1: hsmmc (133000000 Hz)
[    2.320000] s3c-sdhci s3c-sdhci.0: clock source 2: mmc_bus (32000000 Hz)
[    2.330000] Registered led device: mmc1::
[    2.330000] mmc1: SDHCI controller on samsung-hsmmc [s3c-sdhci.0] using PIO
[    2.340000] s3c-sdhci s3c-sdhci.2: clock source 0: hsmmc (133000000 Hz)
[    2.350000] s3c-sdhci s3c-sdhci.2: clock source 1: hsmmc (133000000 Hz)
[    2.350000] s3c-sdhci s3c-sdhci.2: clock source 2: mmc_bus (32000000 Hz)
[    2.360000] mmc0: Minimum clock frequency too high for identification mode
[    2.370000] s3c6410_setup_sdhci0_cfg_card: CTRL 2=c0004100, 3=80808080
[    2.370000] Registered led device: mmc2::
[    2.380000] mmc2: SDHCI controller on samsung-hsmmc [s3c-sdhci.2] using PIO
[    2.380000] Registered led device: red
[    2.390000] Registered led device: green
[    2.400000] Advanced Linux Sound Architecture Driver Version 1.0.21.
[    2.400000] ALSA device list:
[    2.400000]   No soundcards found.
[    2.410000] TCP cubic registered
[    2.410000] NET: Registered protocol family 17
[    2.410000] SCTP: Hash tables configured (established 4096 bind 8192)
[    2.420000] lib80211: common routines for IEEE802.11 drivers
[    2.420000] lib80211_crypt: registered algorithm 'NULL'
[    2.430000] VFP support v0.3: implementor 41 architecture 1 part 20 variant b rev 5
[    2.440000] drivers/rtc/hctosys.c: unable to open rtc device (rtc0)
[    2.440000] Waiting for root device /dev/mmcblk1p1...
[    2.490000] s3c6410_setup_sdhci0_cfg_card: CTRL 2=c0004100, 3=00008080
[    2.490000] mmc0: new high speed SD card at address d555
[    2.500000] blk_queue_max_sectors: set to minimum 8
[    2.500000] mmcblk0: mmc0:d555 ST01G 979 MiB
[    2.510000]  mmcblk0: p1 p2 p3
[    2.540000] mmc1: Minimum clock frequency too high for identification mode
[    2.540000] s3c6410_setup_sdhci0_cfg_card: CTRL 2=c0004100, 3=80808080
[    2.580000] s3c6410_setup_sdhci0_cfg_card: CTRL 2=c0004100, 3=00008080
[    2.580000] mmc1: new high speed SD card at address 0002
[    2.590000] blk_queue_max_sectors: set to minimum 8
[    2.590000] s3c-hsotg s3c-hsotg: s3c_hsotg_irq: USBRst
[    2.600000] s3c-hsotg s3c-hsotg: GNPTXSTS=000801c0
[    2.600000] mmcblk1: mmc1:0002 00000 1.90 GiB
[    2.610000] hub 1-0:1.0: unable to enumerate USB device on port 2
[    2.610000]  mmcblk1: p1 p2
[    2.640000] mmc2: Minimum clock frequency too high for identification mode
[    2.640000] s3c6410_setup_sdhci0_cfg_card: CTRL 2=c0004100, 3=80808080
[    2.640000] s3c-hsotg s3c-hsotg: new device is full-speed
[    2.680000] EXT3-fs (mmcblk1p1): mounted filesystem with writeback data mode
[    2.680000] VFS: Mounted root (ext3 filesystem) readonly on device 179:9.
[    2.690000] Freeing init memory: 140K
[    2.690000] kjournald starting.  Commit interval 5 seconds
[    2.700000] s3c-hsotg s3c-hsotg: s3c_hsotg_irq: USBRst
[    2.700000] s3c-hsotg s3c-hsotg: GNPTXSTS=010801c0
[    2.720000] s3c6410_setup_sdhci0_cfg_card: CTRL 2=c0004100, 3=00008080
[    2.720000] mmc2: new SDIO card at address 0001
[    2.750000] s3c-hsotg s3c-hsotg: new device is full-speed
[    2.800000] s3c-hsotg s3c-hsotg: new address 2
[    2.830000] s3c-hsotg s3c-hsotg: s3c_hsotg_rx_data: FIFO 8 bytes on ep0 but no req (DxEPCTl=0x00028000)
[    5.010000] hub 1-0:1.0: connect-debounce failed, port 2 disabled
[    7.440000] hub 1-0:1.0: connect-debounce failed, port 2 disabled
[    7.830000] s3c-hsotg s3c-hsotg: s3c_hsotg_rx_data: FIFO 8 bytes on ep0 but no req (DxEPCTl=0x00028000)
[    9.940000] hub 1-0:1.0: connect-debounce failed, port 2 disabled
[   12.440000] hub 1-0:1.0: connect-debounce failed, port 2 disabled
[   12.830000] s3c-hsotg s3c-hsotg: s3c_hsotg_rx_data: FIFO 8 bytes on ep0 but no req (DxEPCTl=0x00028000)
[   14.940000] hub 1-0:1.0: connect-debounce failed, port 2 disabled


--------------040201020902000906030304
Content-Type: text/plain;
 name="att2"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="att2"

diff --git a/drivers/usb/gadget/s3c-hsotg.c b/drivers/usb/gadget/s3c-hsotg.c
index 4b5dbd0..2bed3a8 100644
--- a/drivers/usb/gadget/s3c-hsotg.c
+++ b/drivers/usb/gadget/s3c-hsotg.c
@@ -2397,7 +2397,7 @@ static int s3c_hsotg_corereset(struct s3c_hsotg *hsotg)
 		return -EINVAL;
 	}
 
-	timeout = 1000;
+	timeout = 10000;
 
 	while (1) {
 		u32 grstctl = readl(hsotg->regs + S3C_GRSTCTL);
@@ -2698,7 +2698,8 @@ static void s3c_hsotg_otgreset(struct s3c_hsotg *hsotg)
 	writel(0, S3C_PHYPWR);
 	mdelay(1);
 
-	osc = hsotg->plat->is_osc ? S3C_PHYCLK_EXT_OSC : 0;
+	//osc = hsotg->plat->is_osc ? S3C_PHYCLK_EXT_OSC : 0;
+	osc = 0x02;
 
 	writel(osc | 0x10, S3C_PHYCLK);
 


--------------040201020902000906030304--
