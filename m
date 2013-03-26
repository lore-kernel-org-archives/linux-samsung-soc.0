From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: [PATCH v6 0/7] move s3c24xx-irq to drivers/irqchip and add dt support
Date: Tue, 26 Mar 2013 23:05:49 +0100
Message-ID: <201303262305.49725.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:60954 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751761Ab3CZWFw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 26 Mar 2013 18:05:52 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Thomas Abraham <thomas.abraham@linaro.org>, Arnd Bergmann <arnd@arndb.de>, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

This v6 addresses more comments from Arnd Bergmann, setting the compatible
property to the first supported SoC (s3c2410) instead of using the s3c24xx
wildcard. It also switches the parent-irq and controller irq in the dt
irq descriptor bringing it to a format of

  <ctrl_num parent_irq ctrl_irq type>


Heiko Stuebner (7):
  ARM: S3C24XX: move irq driver to drivers/irqchip
  irqchip: s3c24xx: fix comments on some camera interrupts
  irqchip: s3c24xx: fix irqlist of second s3c2416 controller
  irqchip: s3c24xx: add irq_set_type callback for basic interrupt types
  irqchip: s3c24xx: globally keep track of the created intc instances
  irqchip: s3c24xx: make interrupt handling independent of irq_domain structure
  irqchip: s3c24xx: add devicetree support

 .../interrupt-controller/samsung,s3c24xx-irq.txt   |   53 +++
 arch/arm/mach-s3c24xx/Makefile                     |    2 +-
 drivers/irqchip/Makefile                           |    1 +
 .../irq.c => drivers/irqchip/irq-s3c24xx.c         |  388 ++++++++++++++++----
 4 files changed, 373 insertions(+), 71 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/samsung,s3c24xx-irq.txt
 rename arch/arm/mach-s3c24xx/irq.c => drivers/irqchip/irq-s3c24xx.c (78%)

-- 
1.7.10.4
