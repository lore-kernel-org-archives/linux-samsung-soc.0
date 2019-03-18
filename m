From: Anand Moon <linux.amoon@gmail.com>
Subject: Odroid U3 - Upgrade to latest u-boot kernel load fails.
Date: Mon, 18 Mar 2019 18:02:26 +0530
Message-ID: <CANAwSgR8SNYT4JmGu_U-wGGJcEtkEmBnWaSMae1MEPYh07vbXg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Krzysztof Kozlowski <krzk@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: U-Boot Mailing List <u-boot@lists.denx.de>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Krzysztof / Marek,

After I update the latest u-boot on my Odroud U3+ it fails to load the
kernel it hangs.
I am using Archlinux on Odroid U3.

U-Boot 2019.04-rc3-00131-g8303467e80d-dirty (Mar 18 2019 - 12:12:23 +0000)

CPU:   Exynos4412 @ 1 GHz
Model: Odroid based on Exynos4412
Type:  u3
DRAM:  2 GiB
LDO20@VDDQ_EMMC_1.8V: set 1800000 uV; enabling
LDO22@VDDQ_EMMC_2.8V: set 2800000 uV; enabling
LDO21@TFLASH_2.8V: set 2800000 uV; enabling
MMC:   SAMSUNG SDHCI: 1, EXYNOS DWMMC: 0
Loading Environment from MMC... Card did not respond to voltage select!
*** Warning - No block device, using default environment

Net:   No ethernet found.
Hit any key to stop autoboot:  0
switch to partitions #0, OK
mmc1 is current device
Scanning mmc 1:1...
Found U-Boot script /boot/boot.scr
769 bytes read in 6 ms (125 KiB/s)
## Executing script at 42000000
6901856 bytes read in 253 ms (26 MiB/s)
53078 bytes read in 19 ms (2.7 MiB/s)
6590950 bytes read in 240 ms (26.2 MiB/s)
Kernel image @ 0x41000000 [ 0x000000 - 0x695060 ]
## Flattened Device Tree blob at 40800000
   Booting using the fdt blob at 0x40800000
   Loading Ramdisk to 4f9b6000, end 4ffff1e6 ... OK
   Loading Device Tree to 4f9a6000, end 4f9b5f55 ... OK

Starting kernel ...

Old u-boot boots fine see the logs below.
--------------------------------------------------------------------------------------------------
U-Boot 2018.01-1 (Feb 13 2018 - 02:19:55 +0000) Arch Linux ARM

CPU:   Exynos4412 @ 1 GHz
Model: Odroid based on Exynos4412
Board: Odroid based on Exynos4412
Type:  u3
DRAM:  2 GiB
LDO20@VDDQ_EMMC_1.8V: set 1800000 uV; enabling
LDO22@VDDQ_EMMC_2.8V: set 2800000 uV; enabling
LDO21@TFLASH_2.8V: set 2800000 uV; enabling
MMC:   sdhci@12530000 - probe failed: -19

*** Warning - bad CRC, using default environment

Net:   No ethernet found.
Hit any key to stop autoboot:  0
no mmc device at slot 1
switch to partitions #0, OK
mmc0(part 0) is current device
Scanning mmc 0:1...
Found U-Boot script /boot/boot.scr
770 bytes read in 31 ms (23.4 KiB/s)
## Executing script at 50000000
6625416 bytes read in 267 ms (23.7 MiB/s)
72531 bytes read in 483 ms (146.5 KiB/s)
6590888 bytes read in 256 ms (24.6 MiB/s)
Kernel image @ 0x42000000 [ 0x000000 - 0x651888 ]
## Flattened Device Tree blob at 43000000
   Booting using the fdt blob at 0x43000000
   Loading Ramdisk to 4f9b6000, end 4ffff1a8 ... OK
   Loading Device Tree to 4f9a1000, end 4f9b5b52 ... OK

Starting kernel ...

[    0.000000] Booting Linux on physical CPU 0xa00
[    0.000000] Linux version 5.0.1-1-ARCH (builduser@leming) (gcc
version 8.2.1 20181127 (GCC)) #1 SMP PREEMPT Tue Mar 12 04:09:35 UTC
2019
[    0.000000] CPU: ARMv7 Processor [413fc090] revision 0 (ARMv7), cr=10c5387d
[    0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing
instruction cache
[    0.000000] OF: fdt: Machine model: Hardkernel ODROID-U3 board
based on Exynos4412
[    0.000000] Memory policy: Data cache writealloc
[    0.000000] Reserved memory: created DMA memory pool at 0xbf700000,
size 8 MiB
[    0.000000] OF: reserved mem: initialized node region_mfc_right,
compatible id shared-dma-pool
[    0.000000] Reserved memory: created DMA memory pool at 0xbd300000,
size 36 MiB

Please could you share the details on how to debug this issue or how to resolve.

Best Regards
-Anand
