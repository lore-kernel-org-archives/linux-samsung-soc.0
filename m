From: Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v4 0/4] Initial Device Tree support for S3C64xx
Date: Sat,  9 Mar 2013 21:29:31 +0100
Message-ID: <1362860975-18635-1-git-send-email-tomasz.figa@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, kwangwoo.lee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, mcuelenaere-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, augulis.darius-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

This series adds Device Tree support for Samsung S3C64xx SoC series.

It fixes several problems preventing from booting an S3C64xx-based system
using Device Tree, adds all the infrastructure for Device Tree-based board
support, including mach-s3c64xx-dt and dts include files for S3C64xx SoCs, and
(very) basic device tree source for FriendlyARM Mini6410 board.

Current support is very limited and allows only basic bootup with UART and
SDHCI, but should be fine as a start and will be extended in future, hopefully
with help of S3C64xx board maintainers.

This series depends on my other series reworking samsung-time for multiplatform:
[PATCH v3 00/12] ARM: samsung-time: Prepare for multiplatform support
http://thread.gmane.org/gmane.linux.kernel.samsung-soc/16664

Changes since v3:
 - Rebased onto current for-next branch of Kgene's tree
 - Updated timer node for next version of samsung-time patches
 - Replaced local s3c64xx_dt_init_irq with irqchip_init

Changes since v2:
 - Updated timer node for next version of samsung-time patches

Changes since v1:
 - Dropped two VIC-related patches that are no longer necessary
 - Added Device Tree-based instantation of system timers
 - Corrected VIC interrupt specifiers
 - Adjusted CPU compatible values and dropped @id

Tomasz Figa (4):
  ARM: common: vic: Parse interrupt and resume masks from device tree
  ARM: s3c64xx: Add board file for boot using Device Tree
  ARM: dts: Add basic dts include files for Samsung S3C64xx SoCs
  ARM: dts: Add dts file for S3C6410-based Mini6410 board

 Documentation/devicetree/bindings/arm/vic.txt |   6 ++
 arch/arm/boot/dts/Makefile                    |   1 +
 arch/arm/boot/dts/s3c6400.dtsi                |  33 ++++++++
 arch/arm/boot/dts/s3c6410-mini6410.dts        |  50 ++++++++++++
 arch/arm/boot/dts/s3c6410.dtsi                |  33 ++++++++
 arch/arm/boot/dts/s3c64xx.dtsi                | 106 ++++++++++++++++++++++++++
 arch/arm/mach-s3c64xx/Kconfig                 |  14 ++++
 arch/arm/mach-s3c64xx/Makefile                |   1 +
 arch/arm/mach-s3c64xx/mach-s3c64xx-dt.c       |  83 ++++++++++++++++++++
 drivers/irqchip/irq-vic.c                     |   7 +-
 10 files changed, 333 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/s3c6400.dtsi
 create mode 100644 arch/arm/boot/dts/s3c6410-mini6410.dts
 create mode 100644 arch/arm/boot/dts/s3c6410.dtsi
 create mode 100644 arch/arm/boot/dts/s3c64xx.dtsi
 create mode 100644 arch/arm/mach-s3c64xx/mach-s3c64xx-dt.c

-- 
1.8.1.5
