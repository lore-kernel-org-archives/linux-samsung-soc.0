From: Heiko =?utf-8?q?St=C3=BCbner?= <heiko@sntech.de>
Subject: [PATCH v4 0/5] move s3c24xx-irq to drivers/irqchip and add dt support
Date: Fri, 22 Mar 2013 18:43:37 +0100
Message-ID: <201303221843.37668.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:42466 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1422689Ab3CVRnt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 22 Mar 2013 13:43:49 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Thomas Abraham <thomas.abraham@linaro.org>, Arnd Bergmann <arnd@arndb.de>, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

As suggested by Rob Herring move back to get the parent releationship from dt
like in the first versions, but set the handler from the interrupt property
rather than from a specific list.

This version also implements (hopefully correctly) an idea from him and
Arnd Bergmann to have the parent relationship not described in the controller
node but the device nodes instead.

Therefore the main controller continues to use a two-cell descriptor to set
hwirq and trigger type but the sub-controller switches to a three-cell
descriptor where the third bit describes the hwirq of its parent irq in the
main controller.

As a result a serial node would then look like:
	serial@50000000 {
		compatible = "samsung,s3c2410-uart";
		reg = <0x50000000 0x4000>;
		interrupt-parent = <&subintc>;
		interrupts = <0 4 28>, <1 4 28>;
	};

Tested on a s3c2416-based board.

As it depends on changes already pending for 3.10 it should probably go thru
the samsung tree.


Heiko Stuebner (5):
  ARM: S3C24XX: move irq driver to drivers/irqchip
  irqchip: s3c24xx: fix comments on some camera interrupts
  irqchip: s3c24xx: fix irqlist of second s3c2416 controller
  irqchip: s3c24xx: add irq_set_type callback for basic interrupt types
  irqchip: s3c24xx: add devicetree support

 .../interrupt-controller/samsung,s3c24xx-irq.txt   |   64 ++++++
 arch/arm/mach-s3c24xx/Makefile                     |    2 +-
 drivers/irqchip/Makefile                           |    1 +
 .../irq.c => drivers/irqchip/irq-s3c24xx.c         |  218 +++++++++++++++++++-
 4 files changed, 277 insertions(+), 8 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/samsung,s3c24xx-irq.txt
 rename arch/arm/mach-s3c24xx/irq.c => drivers/irqchip/irq-s3c24xx.c (87%)

-- 
1.7.2.3
