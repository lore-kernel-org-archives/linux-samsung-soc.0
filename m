Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794668817;
	b=0eKH44D8dpMvKCnqLxGPMqfXbX4IyJr7sc5KY7G2SH/kKrNt6PTNCimC6KVrtuol95rP
	 STcoqfnsXQpwFluQEr2UDLysK6NqPbA95KN+01feEt3MmCTao8Ivvlzf7aztUOxmHezi3
	 IdXCxxhuSwrYYLeKSszk7D/avb3M8MB2YDi442Qalebwu4PQZB0MI0SUnFOTaxOxUg2qe
	 8z9kV41QrTBLnYHZ+xfIvfCT+KL+FsBKWzXCcxN5l7VOuV1qhkjxMvQchg09oDkg1hOuf
	 Q1lzWqQMR2vZ4JFAeqAgAKCtsrm4IJ7/o3BAcgnIjeBKzV5W3OnXLxY825AmIlgHuVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794668817;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer;
	bh=dRpOUar3/A2OTZl8iBZElNpbYEDjmX2t4VhUaT9mo0w=;
	b=gX978y5Ts3VBTIOBwFAekDcDdjZ/zXgjozbed8ZhkmFB5E2G4rpazAdpdxiGf/S/G0j2
	 9x8Lla6Sa64pdZE6/3dtmPl5VoGFPm0d4L3UGVClrdDLgouawsy97Umfr71Xzip1xfomy
	 ChpYn8eSFTUpylFIbVLaWMupmGxYplfluxHV05GTxSEUph7qQa/WY8kRnL1l8BL1y1Hxm
	 Fv4GMeQLd3kvufwsa3wcTdNV6+MPZay7uBcnNRGqdCHRBB9tLbxKACy0KZLQj6PuwSTKX
	 SlQJrchDG0aUqYgmgKxdOYvqnPgkIZhgBwi6mydhPNhvZS2K4cW+7CI6YfduK19kqHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=X6PcKZyB;
	arc=none smtp.remote-ip=91.218.175.20
Received: from mta0.migadu.com (out-20.mta0.migadu.com [91.218.175.20])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D8D606A8A9
	for <linux-samsung-soc@vger.kernel.org>; Sat, 14 Nov 2026 15:06:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93D8D606A8A9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=X6PcKZyB
X-Envelope-To: linux-samsung-soc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=VXvcqBFBmi6kYCeFYxr5ZkHIbJ+sZbwrriCcxAhwqYI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794668811; v=1; x=1795273611;
 b=X6PcKZyBD744mpvpsca4M7WppwwYzirv0WFYoftDVrJp75Qpupk5Qg/O0+CLhO3BJrinOGGD
 zbwq6faHEPN9GV43AaIOvbwB1Hgz1xI4xG4S3811ljhn+0R+eRogfozuBFhmt6xWTr8w6XeGOKu
 PxtflB3H7zNBd1ZVXz/fvzzg=
X-Envelope-To: linux-samsung-soc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 0a5fc133cd58b542;
	Sat, 14 Nov 2026 15:06:51 +0000
X-Mizu-Trace-ID: 0a5fc133cd58b542
X-Migadu-Flow: FLOW_OUT
From: Peng Fan <peng.fan@linux.dev>
Date: Sat, 14 Nov 2026 23:06:15 +0800
Subject: [PATCH] irqchip: Convert chained handlers to guard_chained_irq()
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261114-irqchip-cleanup-api-v1-1-4a9d598b0bdb@nxp.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqAIBBA0avErBtopEK6SrQwm2ogzJQiEO+et
 HyL/xNEDsIRhipB4EeinK6A6grsbtzGKEsxqEb1RNSihMvu4tEebNzt0XhB1WmrGk3zQgyl9IF
 Xef/rOOX8Aa/2FdplAAAA
X-Change-ID: 20261114-irqchip-cleanup-api-258c2081bd1e
To: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Ryan Chen <ryan_chen@aspeedtech.com>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Billy Tsai <billy_tsai@aspeedtech.com>, 
 Tan Siewert <tan.siewert@9elements.com>, 
 Eddie James <eajames@linux.ibm.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Caleb James DeLisle <cjd@cjdns.fr>, Marc Zyngier <maz@kernel.org>, 
 Miodrag Dinic <miodrag.dinic@mips.com>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Herve Codina <herve.codina@bootlin.com>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Vladimir Zapolskiy <vz@mleia.com>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Samuel Holland <samuel.holland@sifive.com>, 
 Qin Jian <qinjian@cqplus1.com>, 
 Changhuang Liang <changhuang.liang@starfivetech.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, 
 Santosh Shilimkar <ssantosh@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Michal Simek <michal.simek@amd.com>, 
 Anirudha Sarangi <anirudha.sarangi@amd.com>, 
 Tushar Nimkar <tushar.nimkar@amd.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org, 
 openbmc@lists.ozlabs.org, linux-aspeed@lists.ozlabs.org, 
 linux-rpi-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
 imx@lists.linux.dev, loongarch@lists.linux.dev, 
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-sunxi@lists.linux.dev, git@amd.com, linux-arm-msm@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.3

From: Peng Fan <peng.fan@nxp.com>

Use the scope-based guard_chained_irq() helper in all chained handlers
under drivers/irqchip/ so that chained_irq_exit() is always invoked when
the handler returns. Handlers that duplicated the exit call on an error
path or jumped to a common exit label simply return now and rely on the
guard.

No functional changes.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
With [1] now merged in irq/drivers, convert the chained IRQ handlers in
drivers/irqchip/ to use guard_chained_irq(). This removes the explicit
chained_irq_exit() calls and the gotos that only existed to reach them,
reducing boilerplate.

I use a script to do the job, and after that, do mannual checking.

No functional changes.

[1] https://lore.kernel.org/all/179417458323.2093942.14330197609841896598.tip-bot2@tip-bot2/#t
---
 drivers/irqchip/exynos-combiner.c          | 7 ++-----
 drivers/irqchip/irq-aclint-sswi.c          | 4 +---
 drivers/irqchip/irq-armada-370-xp.c        | 4 +---
 drivers/irqchip/irq-aspeed-i2c-ic.c        | 4 +---
 drivers/irqchip/irq-aspeed-scu-ic.c        | 8 ++------
 drivers/irqchip/irq-ast2700-intc1.c        | 4 +---
 drivers/irqchip/irq-ath79-misc.c           | 5 +----
 drivers/irqchip/irq-bcm2836.c              | 4 +---
 drivers/irqchip/irq-bcm6345-l1.c           | 4 +---
 drivers/irqchip/irq-bcm7038-l1.c           | 4 +---
 drivers/irqchip/irq-bcm7120-l2.c           | 4 +---
 drivers/irqchip/irq-brcmstb-l2.c           | 4 +---
 drivers/irqchip/irq-dw-apb-ictl.c          | 4 +---
 drivers/irqchip/irq-econet-en751221.c      | 4 +---
 drivers/irqchip/irq-gic.c                  | 6 ++----
 drivers/irqchip/irq-goldfish-pic.c         | 4 +---
 drivers/irqchip/irq-idt3243x.c             | 4 +---
 drivers/irqchip/irq-imx-intmux.c           | 4 +---
 drivers/irqchip/irq-imx-irqsteer.c         | 7 ++-----
 drivers/irqchip/irq-imx-mu-msi.c           | 3 +--
 drivers/irqchip/irq-ingenic-tcu.c          | 4 +---
 drivers/irqchip/irq-lan966x-oic.c          | 3 +--
 drivers/irqchip/irq-loongarch-avec.c       | 4 +---
 drivers/irqchip/irq-loongson-eiointc.c     | 4 +---
 drivers/irqchip/irq-loongson-htpic.c       | 3 +--
 drivers/irqchip/irq-loongson-htvec.c       | 4 +---
 drivers/irqchip/irq-loongson-liointc.c     | 4 +---
 drivers/irqchip/irq-loongson-pch-lpc.c     | 3 +--
 drivers/irqchip/irq-lpc32xx.c              | 4 +---
 drivers/irqchip/irq-ls-scfg-msi.c          | 4 +---
 drivers/irqchip/irq-ls1x.c                 | 4 +---
 drivers/irqchip/irq-mmp.c                  | 7 ++-----
 drivers/irqchip/irq-mscc-ocelot.c          | 4 +---
 drivers/irqchip/irq-mvebu-pic.c            | 4 +---
 drivers/irqchip/irq-mvebu-sei.c            | 4 +---
 drivers/irqchip/irq-pruss-intc.c           | 4 +---
 drivers/irqchip/irq-realtek-rtl.c          | 7 ++-----
 drivers/irqchip/irq-riscv-aplic-direct.c   | 4 +---
 drivers/irqchip/irq-riscv-imsic-early.c    | 4 +---
 drivers/irqchip/irq-sifive-plic.c          | 8 ++------
 drivers/irqchip/irq-sp7021-intc.c          | 4 +---
 drivers/irqchip/irq-starfive-jhb100-intc.c | 4 +---
 drivers/irqchip/irq-stm32-exti.c           | 4 +---
 drivers/irqchip/irq-sunxi-nmi.c            | 3 +--
 drivers/irqchip/irq-ti-sci-inta.c          | 4 +---
 drivers/irqchip/irq-ts4800.c               | 7 ++-----
 drivers/irqchip/irq-versatile-fpga.c       | 7 ++-----
 drivers/irqchip/irq-vic.c                  | 4 +---
 drivers/irqchip/irq-vt8500.c               | 3 +--
 drivers/irqchip/irq-xilinx-intc.c          | 3 +--
 drivers/irqchip/irq-xilinx-smmu-csr.c      | 4 +---
 drivers/irqchip/qcom-irq-combiner.c        | 4 +---
 52 files changed, 61 insertions(+), 169 deletions(-)

diff --git a/drivers/irqchip/exynos-combiner.c b/drivers/irqchip/exynos-combiner.c
index d9d408cb4711..992711639ba7 100644
--- a/drivers/irqchip/exynos-combiner.c
+++ b/drivers/irqchip/exynos-combiner.c
@@ -68,21 +68,18 @@ static void combiner_handle_cascade_irq(struct irq_desc *desc)
 	unsigned long status;
 	int ret;
 
-	chained_irq_enter(chip, desc);
+	guard_chained_irq(chip, desc);
 
 	status = readl_relaxed(chip_data->base + COMBINER_INT_STATUS);
 	status &= chip_data->irq_mask;
 
 	if (status == 0)
-		goto out;
+		return;
 
 	combiner_irq = chip_data->hwirq_offset + __ffs(status);
 	ret = generic_handle_domain_irq(combiner_irq_domain, combiner_irq);
 	if (unlikely(ret))
 		handle_bad_irq(desc);
-
- out:
-	chained_irq_exit(chip, desc);
 }
 
 #ifdef CONFIG_SMP
diff --git a/drivers/irqchip/irq-aclint-sswi.c b/drivers/irqchip/irq-aclint-sswi.c
index 34572db94f3d..db3d1c642a48 100644
--- a/drivers/irqchip/irq-aclint-sswi.c
+++ b/drivers/irqchip/irq-aclint-sswi.c
@@ -33,14 +33,12 @@ static void aclint_sswi_ipi_handle(struct irq_desc *desc)
 {
 	struct irq_chip *chip = irq_desc_get_chip(desc);
 
-	chained_irq_enter(chip, desc);
+	guard_chained_irq(chip, desc);
 
 	csr_clear(CSR_IP, IE_SIE);
 	aclint_sswi_ipi_clear();
 
 	ipi_mux_process();
-
-	chained_irq_exit(chip, desc);
 }
 
 static int aclint_sswi_starting_cpu(unsigned int cpu)
diff --git a/drivers/irqchip/irq-armada-370-xp.c b/drivers/irqchip/irq-armada-370-xp.c
index 1ba82ac0c26b..c643ce1f4d93 100644
--- a/drivers/irqchip/irq-armada-370-xp.c
+++ b/drivers/irqchip/irq-armada-370-xp.c
@@ -675,7 +675,7 @@ static void mpic_handle_cascade_irq(struct irq_desc *desc)
 	u32 irqsrc, cpuid;
 	irq_hw_number_t i;
 
-	chained_irq_enter(chip, desc);
+	guard_chained_irq(chip, desc);
 
 	cause = readl_relaxed(mpic->per_cpu + MPIC_PPI_CAUSE);
 	cpuid = cpu_logical_map(smp_processor_id());
@@ -696,8 +696,6 @@ static void mpic_handle_cascade_irq(struct irq_desc *desc)
 
 		generic_handle_domain_irq(mpic->domain, i);
 	}
-
-	chained_irq_exit(chip, desc);
 }
 
 static void __exception_irq_entry mpic_handle_irq(struct pt_regs *regs)
diff --git a/drivers/irqchip/irq-aspeed-i2c-ic.c b/drivers/irqchip/irq-aspeed-i2c-ic.c
index 7996fd5cbae6..0598d352f543 100644
--- a/drivers/irqchip/irq-aspeed-i2c-ic.c
+++ b/drivers/irqchip/irq-aspeed-i2c-ic.c
@@ -35,12 +35,10 @@ static void aspeed_i2c_ic_irq_handler(struct irq_desc *desc)
 	struct irq_chip *chip = irq_desc_get_chip(desc);
 	unsigned long bit, status;
 
-	chained_irq_enter(chip, desc);
+	guard_chained_irq(chip, desc);
 	status = readl(i2c_ic->base);
 	for_each_set_bit(bit, &status, ASPEED_I2C_IC_NUM_BUS)
 		generic_handle_domain_irq(i2c_ic->irq_domain, bit);
-
-	chained_irq_exit(chip, desc);
 }
 
 /*
diff --git a/drivers/irqchip/irq-aspeed-scu-ic.c b/drivers/irqchip/irq-aspeed-scu-ic.c
index 097cf45b2126..44b51f1102ef 100644
--- a/drivers/irqchip/irq-aspeed-scu-ic.c
+++ b/drivers/irqchip/irq-aspeed-scu-ic.c
@@ -70,7 +70,7 @@ static void aspeed_scu_ic_irq_handler_combined(struct irq_desc *desc)
 	unsigned long bit, enabled, max, status;
 	unsigned int sts, mask;
 
-	chained_irq_enter(chip, desc);
+	guard_chained_irq(chip, desc);
 
 	mask = scu_ic->irq_enable << ASPEED_SCU_IC_STATUS_SHIFT;
 	/*
@@ -95,8 +95,6 @@ static void aspeed_scu_ic_irq_handler_combined(struct irq_desc *desc)
 		writel((readl(scu_ic->base) & ~mask) | BIT(bit + ASPEED_SCU_IC_STATUS_SHIFT),
 		       scu_ic->base);
 	}
-
-	chained_irq_exit(chip, desc);
 }
 
 static void aspeed_scu_ic_irq_handler_split(struct irq_desc *desc)
@@ -106,7 +104,7 @@ static void aspeed_scu_ic_irq_handler_split(struct irq_desc *desc)
 	unsigned long bit, enabled, max, status;
 	unsigned int sts;
 
-	chained_irq_enter(chip, desc);
+	guard_chained_irq(chip, desc);
 
 	sts = readl(scu_ic->base + scu_ic->isr);
 	enabled = sts & scu_ic->irq_enable;
@@ -121,8 +119,6 @@ static void aspeed_scu_ic_irq_handler_split(struct irq_desc *desc)
 		/* Clear interrupt */
 		writel(BIT(bit), scu_ic->base + scu_ic->isr);
 	}
-
-	chained_irq_exit(chip, desc);
 }
 
 static void aspeed_scu_ic_irq_mask_combined(struct irq_data *data)
diff --git a/drivers/irqchip/irq-ast2700-intc1.c b/drivers/irqchip/irq-ast2700-intc1.c
index aa5240ce1c57..75d731dd55a5 100644
--- a/drivers/irqchip/irq-ast2700-intc1.c
+++ b/drivers/irqchip/irq-ast2700-intc1.c
@@ -54,7 +54,7 @@ static void aspeed_intc1_irq_handler(struct irq_desc *desc)
 	struct irq_chip *chip = irq_desc_get_chip(desc);
 	unsigned long bit, status;
 
-	chained_irq_enter(chip, desc);
+	guard_chained_irq(chip, desc);
 
 	for (int bank = 0; bank < INTC1_BANK_NUM; bank++) {
 		status = readl(intc1->base + INTC1_ISR + (INTC1_BANK_SIZE * bank));
@@ -66,8 +66,6 @@ static void aspeed_intc1_irq_handler(struct irq_desc *desc)
 			writel(BIT(bit), intc1->base + INTC1_ISR + (INTC1_BANK_SIZE * bank));
 		}
 	}
-
-	chained_irq_exit(chip, desc);
 }
 
 static void aspeed_intc1_irq_mask(struct irq_data *data)
diff --git a/drivers/irqchip/irq-ath79-misc.c b/drivers/irqchip/irq-ath79-misc.c
index 258b8e9a2d57..dac0c69da64b 100644
--- a/drivers/irqchip/irq-ath79-misc.c
+++ b/drivers/irqchip/irq-ath79-misc.c
@@ -38,14 +38,13 @@ static void ath79_misc_irq_handler(struct irq_desc *desc)
 	void __iomem *base = domain->host_data;
 	u32 pending;
 
-	chained_irq_enter(chip, desc);
+	guard_chained_irq(chip, desc);
 
 	pending = __raw_readl(base + AR71XX_RESET_REG_MISC_INT_STATUS) &
 		  __raw_readl(base + AR71XX_RESET_REG_MISC_INT_ENABLE);
 
 	if (!pending) {
 		spurious_interrupt();
-		chained_irq_exit(chip, desc);
 		return;
 	}
 
@@ -55,8 +54,6 @@ static void ath79_misc_irq_handler(struct irq_desc *desc)
 		generic_handle_domain_irq(domain, bit);
 		pending &= ~BIT(bit);
 	}
-
-	chained_irq_exit(chip, desc);
 }
 
 static void ar71xx_misc_irq_unmask(struct irq_data *d)
diff --git a/drivers/irqchip/irq-bcm2836.c b/drivers/irqchip/irq-bcm2836.c
index fafd1f71348e..2837ce0e4de8 100644
--- a/drivers/irqchip/irq-bcm2836.c
+++ b/drivers/irqchip/irq-bcm2836.c
@@ -159,15 +159,13 @@ static void bcm2836_arm_irqchip_handle_ipi(struct irq_desc *desc)
 	int cpu = smp_processor_id();
 	u32 mbox_val;
 
-	chained_irq_enter(chip, desc);
+	guard_chained_irq(chip, desc);
 
 	mbox_val = readl_relaxed(intc.base + LOCAL_MAILBOX0_CLR0 + 16 * cpu);
 	if (mbox_val) {
 		int hwirq = ffs(mbox_val) - 1;
 		generic_handle_domain_irq(ipi_domain, hwirq);
 	}
-
-	chained_irq_exit(chip, desc);
 }
 
 static void bcm2836_arm_irqchip_ipi_ack(struct irq_data *d)
diff --git a/drivers/irqchip/irq-bcm6345-l1.c b/drivers/irqchip/irq-bcm6345-l1.c
index d446d8124a8b..e9a337ced1b1 100644
--- a/drivers/irqchip/irq-bcm6345-l1.c
+++ b/drivers/irqchip/irq-bcm6345-l1.c
@@ -120,7 +120,7 @@ static void bcm6345_l1_irq_handle(struct irq_desc *desc)
 	struct irq_chip *chip = irq_desc_get_chip(desc);
 	unsigned int idx;
 
-	chained_irq_enter(chip, desc);
+	guard_chained_irq(chip, desc);
 
 	for (idx = 0; idx < intc->n_words; idx++) {
 		int base = idx * IRQS_PER_WORD;
@@ -135,8 +135,6 @@ static void bcm6345_l1_irq_handle(struct irq_desc *desc)
 				spurious_interrupt();
 		}
 	}
-
-	chained_irq_exit(chip, desc);
 }
 
 static inline void __bcm6345_l1_unmask(struct irq_data *d)
diff --git a/drivers/irqchip/irq-bcm7038-l1.c b/drivers/irqchip/irq-bcm7038-l1.c
index 54a8557ef557..3b24a258e75b 100644
--- a/drivers/irqchip/irq-bcm7038-l1.c
+++ b/drivers/irqchip/irq-bcm7038-l1.c
@@ -123,7 +123,7 @@ static void bcm7038_l1_irq_handle(struct irq_desc *desc)
 	cpu = intc->cpus[0];
 #endif
 
-	chained_irq_enter(chip, desc);
+	guard_chained_irq(chip, desc);
 
 	for (idx = 0; idx < intc->n_words; idx++) {
 		int base = idx * IRQS_PER_WORD;
@@ -138,8 +138,6 @@ static void bcm7038_l1_irq_handle(struct irq_desc *desc)
 		for_each_set_bit(hwirq, &pending, IRQS_PER_WORD)
 			generic_handle_domain_irq(intc->domain, base + hwirq);
 	}
-
-	chained_irq_exit(chip, desc);
 }
 
 static void __bcm7038_l1_unmask(struct irq_data *d, unsigned int cpu_idx)
diff --git a/drivers/irqchip/irq-bcm7120-l2.c b/drivers/irqchip/irq-bcm7120-l2.c
index a98f0ee46b6c..3428b5fd29dc 100644
--- a/drivers/irqchip/irq-bcm7120-l2.c
+++ b/drivers/irqchip/irq-bcm7120-l2.c
@@ -59,7 +59,7 @@ static void bcm7120_l2_intc_irq_handle(struct irq_desc *desc)
 	struct irq_chip *chip = irq_desc_get_chip(desc);
 	unsigned int idx;
 
-	chained_irq_enter(chip, desc);
+	guard_chained_irq(chip, desc);
 
 	for (idx = 0; idx < b->n_words; idx++) {
 		int base = idx * IRQS_PER_WORD;
@@ -76,8 +76,6 @@ static void bcm7120_l2_intc_irq_handle(struct irq_desc *desc)
 		for_each_set_bit(hwirq, &pending, IRQS_PER_WORD)
 			generic_handle_domain_irq(b->domain, base + hwirq);
 	}
-
-	chained_irq_exit(chip, desc);
 }
 
 static void bcm7120_l2_intc_suspend(struct irq_chip_generic *gc)
diff --git a/drivers/irqchip/irq-brcmstb-l2.c b/drivers/irqchip/irq-brcmstb-l2.c
index d336ac822ea0..cb5365356841 100644
--- a/drivers/irqchip/irq-brcmstb-l2.c
+++ b/drivers/irqchip/irq-brcmstb-l2.c
@@ -68,7 +68,7 @@ static void brcmstb_l2_intc_irq_handle(struct irq_desc *desc)
 	unsigned int irq;
 	u32 status;
 
-	chained_irq_enter(chip, desc);
+	guard_chained_irq(chip, desc);
 
 	status = irq_reg_readl(b->gc, b->status_offset) &
 		~(irq_reg_readl(b->gc, b->mask_offset));
@@ -88,8 +88,6 @@ static void brcmstb_l2_intc_irq_handle(struct irq_desc *desc)
 out:
 	/* Don't ack parent before all device writes are done */
 	wmb();
-
-	chained_irq_exit(chip, desc);
 }
 
 static void __brcmstb_l2_intc_suspend(struct irq_data *d, bool save)
diff --git a/drivers/irqchip/irq-dw-apb-ictl.c b/drivers/irqchip/irq-dw-apb-ictl.c
index 4240a0dbf627..b3673bc1205c 100644
--- a/drivers/irqchip/irq-dw-apb-ictl.c
+++ b/drivers/irqchip/irq-dw-apb-ictl.c
@@ -54,7 +54,7 @@ static void dw_apb_ictl_handle_irq_cascaded(struct irq_desc *desc)
 	struct irq_chip *chip = irq_desc_get_chip(desc);
 	int n;
 
-	chained_irq_enter(chip, desc);
+	guard_chained_irq(chip, desc);
 
 	for (n = 0; n < d->revmap_size; n += 32) {
 		struct irq_chip_generic *gc = irq_get_domain_generic_chip(d, n);
@@ -67,8 +67,6 @@ static void dw_apb_ictl_handle_irq_cascaded(struct irq_desc *desc)
 			stat &= ~BIT(hwirq);
 		}
 	}
-
-	chained_irq_exit(chip, desc);
 }
 
 static int dw_apb_ictl_irq_domain_alloc(struct irq_domain *domain, unsigned int virq,
diff --git a/drivers/irqchip/irq-econet-en751221.c b/drivers/irqchip/irq-econet-en751221.c
index 2ca5d901866f..33726762d269 100644
--- a/drivers/irqchip/irq-econet-en751221.c
+++ b/drivers/irqchip/irq-econet-en751221.c
@@ -140,7 +140,7 @@ static void econet_intc_from_parent(struct irq_desc *desc)
 	struct irq_domain *domain;
 	u32 pending0, pending1;
 
-	chained_irq_enter(chip, desc);
+	guard_chained_irq(chip, desc);
 
 	pending0 = ioread32(econet_intc.membase + REG_PENDING0);
 	pending1 = ioread32(econet_intc.membase + REG_PENDING1);
@@ -152,8 +152,6 @@ static void econet_intc_from_parent(struct irq_desc *desc)
 		econet_intc_handle_pending(domain, pending0, 0);
 		econet_intc_handle_pending(domain, pending1, 32);
 	}
-
-	chained_irq_exit(chip, desc);
 }
 
 /*
diff --git a/drivers/irqchip/irq-gic.c b/drivers/irqchip/irq-gic.c
index 420261208cd0..a66aec6776d4 100644
--- a/drivers/irqchip/irq-gic.c
+++ b/drivers/irqchip/irq-gic.c
@@ -379,20 +379,18 @@ static void gic_handle_cascade_irq(struct irq_desc *desc)
 	unsigned long status;
 	int ret;
 
-	chained_irq_enter(chip, desc);
+	guard_chained_irq(chip, desc);
 
 	status = readl_relaxed(gic_data_cpu_base(chip_data) + GIC_CPU_INTACK);
 
 	gic_irq = (status & GICC_IAR_INT_ID_MASK);
 	if (gic_irq == GICC_INT_SPURIOUS)
-		goto out;
+		return;
 
 	isb();
 	ret = generic_handle_domain_irq(chip_data->domain, gic_irq);
 	if (unlikely(ret))
 		handle_bad_irq(desc);
- out:
-	chained_irq_exit(chip, desc);
 }
 
 static void gic_irq_print_chip(struct irq_data *d, struct seq_file *p)
diff --git a/drivers/irqchip/irq-goldfish-pic.c b/drivers/irqchip/irq-goldfish-pic.c
index d458cf898f8e..6aa4acd8ab02 100644
--- a/drivers/irqchip/irq-goldfish-pic.c
+++ b/drivers/irqchip/irq-goldfish-pic.c
@@ -36,7 +36,7 @@ static void goldfish_pic_cascade(struct irq_desc *desc)
 	struct irq_chip *host_chip = irq_desc_get_chip(desc);
 	u32 pending, hwirq;
 
-	chained_irq_enter(host_chip, desc);
+	guard_chained_irq(host_chip, desc);
 
 	pending = readl(gfpic->base + GFPIC_REG_IRQ_PENDING);
 	while (pending) {
@@ -44,8 +44,6 @@ static void goldfish_pic_cascade(struct irq_desc *desc)
 		generic_handle_domain_irq(gfpic->irq_domain, hwirq);
 		pending &= ~(1 << hwirq);
 	}
-
-	chained_irq_exit(host_chip, desc);
 }
 
 static const struct irq_domain_ops goldfish_irq_domain_ops = {
diff --git a/drivers/irqchip/irq-idt3243x.c b/drivers/irqchip/irq-idt3243x.c
index 8b150c7f7e46..6af1ddfc0e64 100644
--- a/drivers/irqchip/irq-idt3243x.c
+++ b/drivers/irqchip/irq-idt3243x.c
@@ -30,7 +30,7 @@ static void idt_irq_dispatch(struct irq_desc *desc)
 	struct irq_chip *host_chip = irq_desc_get_chip(desc);
 	u32 pending, hwirq;
 
-	chained_irq_enter(host_chip, desc);
+	guard_chained_irq(host_chip, desc);
 
 	pending = irq_reg_readl(idtpic->gc, IDT_PIC_IRQ_PEND);
 	pending &= ~idtpic->gc->mask_cache;
@@ -39,8 +39,6 @@ static void idt_irq_dispatch(struct irq_desc *desc)
 		generic_handle_domain_irq(idtpic->irq_domain, hwirq);
 		pending &= ~(1 << hwirq);
 	}
-
-	chained_irq_exit(host_chip, desc);
 }
 
 static int idt_pic_init(struct device_node *of_node, struct device_node *parent)
diff --git a/drivers/irqchip/irq-imx-intmux.c b/drivers/irqchip/irq-imx-intmux.c
index c7914fea3d1f..73926dec52ab 100644
--- a/drivers/irqchip/irq-imx-intmux.c
+++ b/drivers/irqchip/irq-imx-intmux.c
@@ -187,15 +187,13 @@ static void imx_intmux_irq_handler(struct irq_desc *desc)
 	unsigned long irqstat;
 	int pos;
 
-	chained_irq_enter(irq_desc_get_chip(desc), desc);
+	guard_chained_irq(irq_desc_get_chip(desc), desc);
 
 	/* read the interrupt source pending status of this channel */
 	irqstat = readl_relaxed(data->regs + CHANIPR(idx));
 
 	for_each_set_bit(pos, &irqstat, 32)
 		generic_handle_domain_irq(irqchip_data->domain, pos);
-
-	chained_irq_exit(irq_desc_get_chip(desc), desc);
 }
 
 static int imx_intmux_probe(struct platform_device *pdev)
diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx-irqsteer.c
index 4e0f7eac0c8b..e117c8a1102d 100644
--- a/drivers/irqchip/irq-imx-irqsteer.c
+++ b/drivers/irqchip/irq-imx-irqsteer.c
@@ -148,14 +148,14 @@ static void imx_irqsteer_irq_handler(struct irq_desc *desc)
 	int hwirq;
 	int irq, i;
 
-	chained_irq_enter(irq_desc_get_chip(desc), desc);
+	guard_chained_irq(irq_desc_get_chip(desc), desc);
 
 	irq = irq_desc_get_irq(desc);
 	hwirq = imx_irqsteer_get_hwirq_base(data, irq);
 	if (hwirq < 0) {
 		pr_warn("%s: unable to get hwirq base for irq %d\n",
 			__func__, irq);
-		goto out;
+		return;
 	}
 
 	for (i = 0; i < 2; i++, hwirq += 32) {
@@ -172,9 +172,6 @@ static void imx_irqsteer_irq_handler(struct irq_desc *desc)
 		for_each_set_bit(pos, &irqmap, 32)
 			generic_handle_domain_irq(data->domain, pos + hwirq);
 	}
-
-out:
-	chained_irq_exit(irq_desc_get_chip(desc), desc);
 }
 
 static int imx_irqsteer_probe(struct platform_device *pdev)
diff --git a/drivers/irqchip/irq-imx-mu-msi.c b/drivers/irqchip/irq-imx-mu-msi.c
index 6d7baeeb2bc8..7b69cba4ba76 100644
--- a/drivers/irqchip/irq-imx-mu-msi.c
+++ b/drivers/irqchip/irq-imx-mu-msi.c
@@ -197,12 +197,11 @@ static void imx_mu_msi_irq_handler(struct irq_desc *desc)
 
 	status = imx_mu_read(msi_data, msi_data->cfg->xSR[IMX_MU_RSR]);
 
-	chained_irq_enter(chip, desc);
+	guard_chained_irq(chip, desc);
 	for (i = 0; i < IMX_MU_CHANS; i++) {
 		if (status & IMX_MU_xSR_RFn(msi_data, i))
 			generic_handle_domain_irq(msi_data->msi_domain, i);
 	}
-	chained_irq_exit(chip, desc);
 }
 
 #define IMX_MU_MSI_FLAGS_REQUIRED	(MSI_FLAG_USE_DEF_DOM_OPS |	\
diff --git a/drivers/irqchip/irq-ingenic-tcu.c b/drivers/irqchip/irq-ingenic-tcu.c
index eebfdf107bd9..0cd0c74e2fc2 100644
--- a/drivers/irqchip/irq-ingenic-tcu.c
+++ b/drivers/irqchip/irq-ingenic-tcu.c
@@ -34,15 +34,13 @@ static void ingenic_tcu_intc_cascade(struct irq_desc *desc)
 	regmap_read(map, TCU_REG_TFR, &irq_reg);
 	regmap_read(map, TCU_REG_TMR, &irq_mask);
 
-	chained_irq_enter(irq_chip, desc);
+	guard_chained_irq(irq_chip, desc);
 
 	irq_reg &= ~irq_mask;
 	bits = irq_reg;
 
 	for_each_set_bit(i, &bits, 32)
 		generic_handle_domain_irq(domain, i);
-
-	chained_irq_exit(irq_chip, desc);
 }
 
 static void ingenic_tcu_gc_unmask_enable_reg(struct irq_data *d)
diff --git a/drivers/irqchip/irq-lan966x-oic.c b/drivers/irqchip/irq-lan966x-oic.c
index 40e1f26201da..5b9e2b8d7387 100644
--- a/drivers/irqchip/irq-lan966x-oic.c
+++ b/drivers/irqchip/irq-lan966x-oic.c
@@ -131,11 +131,10 @@ static void lan966x_oic_irq_handler(struct irq_desc *desc)
 	struct irq_domain *d = irq_desc_get_handler_data(desc);
 	struct irq_chip *chip = irq_desc_get_chip(desc);
 
-	chained_irq_enter(chip, desc);
+	guard_chained_irq(chip, desc);
 	lan966x_oic_irq_handler_domain(d, 0);
 	lan966x_oic_irq_handler_domain(d, 32);
 	lan966x_oic_irq_handler_domain(d, 64);
-	chained_irq_exit(chip, desc);
 }
 
 static struct lan966x_oic_chip_regs lan966x_oic_chip_regs[3] = {
diff --git a/drivers/irqchip/irq-loongarch-avec.c b/drivers/irqchip/irq-loongarch-avec.c
index 53d7d23af9bb..8c7316f70930 100644
--- a/drivers/irqchip/irq-loongarch-avec.c
+++ b/drivers/irqchip/irq-loongarch-avec.c
@@ -224,7 +224,7 @@ static void avecintc_irq_dispatch(struct irq_desc *desc)
 	struct irq_chip *chip = irq_desc_get_chip(desc);
 	struct irq_desc *d;
 
-	chained_irq_enter(chip, desc);
+	guard_chained_irq(chip, desc);
 
 	while (true) {
 		unsigned long vector = csr_read(LOONGARCH_CSR_IRR);
@@ -241,8 +241,6 @@ static void avecintc_irq_dispatch(struct irq_desc *desc)
 			pr_warn("Unexpected IRQ occurs on CPU#%d [vector %ld]\n", smp_processor_id(), vector);
 		}
 	}
-
-	chained_irq_exit(chip, desc);
 }
 
 static int avecintc_alloc_vector(struct irq_data *irqd, struct avecintc_data *adata)
diff --git a/drivers/irqchip/irq-loongson-eiointc.c b/drivers/irqchip/irq-loongson-eiointc.c
index ba6e8480e383..93f5aba1473d 100644
--- a/drivers/irqchip/irq-loongson-eiointc.c
+++ b/drivers/irqchip/irq-loongson-eiointc.c
@@ -313,7 +313,7 @@ static void eiointc_irq_dispatch(struct irq_desc *desc)
 	bool handled = false;
 	int i;
 
-	chained_irq_enter(chip, desc);
+	guard_chained_irq(chip, desc);
 
 	/*
 	 * If EIOINTC_ROUTE_MULT_IP is set, every 64 interrupt vectors in
@@ -343,8 +343,6 @@ static void eiointc_irq_dispatch(struct irq_desc *desc)
 
 	if (!handled)
 		spurious_interrupt();
-
-	chained_irq_exit(chip, desc);
 }
 
 static void eiointc_ack_irq(struct irq_data *d)
diff --git a/drivers/irqchip/irq-loongson-htpic.c b/drivers/irqchip/irq-loongson-htpic.c
index 2d78112f7fc7..896fa1daea26 100644
--- a/drivers/irqchip/irq-loongson-htpic.c
+++ b/drivers/irqchip/irq-loongson-htpic.c
@@ -32,7 +32,7 @@ static void htpic_irq_dispatch(struct irq_desc *desc)
 	struct irq_chip *chip = irq_desc_get_chip(desc);
 	uint32_t pending;
 
-	chained_irq_enter(chip, desc);
+	guard_chained_irq(chip, desc);
 	pending = readl(priv->base);
 	/* Ack all IRQs at once, otherwise IRQ flood might happen */
 	writel(pending, priv->base);
@@ -51,7 +51,6 @@ static void htpic_irq_dispatch(struct irq_desc *desc)
 		generic_handle_domain_irq(priv->domain, bit);
 		pending &= ~BIT(bit);
 	}
-	chained_irq_exit(chip, desc);
 }
 
 static void htpic_reg_init(void)
diff --git a/drivers/irqchip/irq-loongson-htvec.c b/drivers/irqchip/irq-loongson-htvec.c
index 75e40ba6069d..9c23ab234d25 100644
--- a/drivers/irqchip/irq-loongson-htvec.c
+++ b/drivers/irqchip/irq-loongson-htvec.c
@@ -44,7 +44,7 @@ static void htvec_irq_dispatch(struct irq_desc *desc)
 	struct irq_chip *chip = irq_desc_get_chip(desc);
 	struct htvec *priv = irq_desc_get_handler_data(desc);
 
-	chained_irq_enter(chip, desc);
+	guard_chained_irq(chip, desc);
 
 	for (i = 0; i < priv->num_parents; i++) {
 		pending = readl(priv->base + 4 * i);
@@ -60,8 +60,6 @@ static void htvec_irq_dispatch(struct irq_desc *desc)
 
 	if (!handled)
 		spurious_interrupt();
-
-	chained_irq_exit(chip, desc);
 }
 
 static void htvec_ack_irq(struct irq_data *d)
diff --git a/drivers/irqchip/irq-loongson-liointc.c b/drivers/irqchip/irq-loongson-liointc.c
index cf44a333b9c8..a8eac6d53f9b 100644
--- a/drivers/irqchip/irq-loongson-liointc.c
+++ b/drivers/irqchip/irq-loongson-liointc.c
@@ -76,7 +76,7 @@ static void liointc_chained_handle_irq(struct irq_desc *desc)
 	int core = liointc_core_id % LIOINTC_NUM_CORES;
 	u32 pending;
 
-	chained_irq_enter(chip, desc);
+	guard_chained_irq(chip, desc);
 
 	pending = readl(handler->priv->core_isr[core]);
 
@@ -96,8 +96,6 @@ static void liointc_chained_handle_irq(struct irq_desc *desc)
 		generic_handle_domain_irq(gc->domain, bit);
 		pending &= ~BIT(bit);
 	}
-
-	chained_irq_exit(chip, desc);
 }
 
 static void liointc_set_bit(struct irq_chip_generic *gc,
diff --git a/drivers/irqchip/irq-loongson-pch-lpc.c b/drivers/irqchip/irq-loongson-pch-lpc.c
index 7117ca6fc2f0..9bcd106de33a 100644
--- a/drivers/irqchip/irq-loongson-pch-lpc.c
+++ b/drivers/irqchip/irq-loongson-pch-lpc.c
@@ -110,7 +110,7 @@ static void lpc_irq_dispatch(struct irq_desc *desc)
 	struct irq_chip *chip = irq_desc_get_chip(desc);
 	struct pch_lpc *priv = irq_desc_get_handler_data(desc);
 
-	chained_irq_enter(chip, desc);
+	guard_chained_irq(chip, desc);
 
 	pending = readl(priv->base + LPC_INT_ENA);
 	pending &= readl(priv->base + LPC_INT_STS);
@@ -123,7 +123,6 @@ static void lpc_irq_dispatch(struct irq_desc *desc)
 		generic_handle_domain_irq(priv->lpc_domain, bit);
 		pending &= ~BIT(bit);
 	}
-	chained_irq_exit(chip, desc);
 }
 
 static int pch_lpc_map(struct irq_domain *d, unsigned int irq,
diff --git a/drivers/irqchip/irq-lpc32xx.c b/drivers/irqchip/irq-lpc32xx.c
index 6ff93df614f8..52e790af00f9 100644
--- a/drivers/irqchip/irq-lpc32xx.c
+++ b/drivers/irqchip/irq-lpc32xx.c
@@ -155,15 +155,13 @@ static void lpc32xx_sic_handler(struct irq_desc *desc)
 	struct irq_chip *chip = irq_desc_get_chip(desc);
 	u32 hwirq = lpc32xx_ic_read(ic, LPC32XX_INTC_STAT), irq;
 
-	chained_irq_enter(chip, desc);
+	guard_chained_irq(chip, desc);
 
 	while (hwirq) {
 		irq = __ffs(hwirq);
 		hwirq &= ~BIT(irq);
 		generic_handle_domain_irq(ic->domain, irq);
 	}
-
-	chained_irq_exit(chip, desc);
 }
 
 static int lpc32xx_irq_domain_map(struct irq_domain *id, unsigned int virq,
diff --git a/drivers/irqchip/irq-ls-scfg-msi.c b/drivers/irqchip/irq-ls-scfg-msi.c
index 50ce01c9cd2d..e94be9d056c4 100644
--- a/drivers/irqchip/irq-ls-scfg-msi.c
+++ b/drivers/irqchip/irq-ls-scfg-msi.c
@@ -198,7 +198,7 @@ static void ls_scfg_msi_irq_handler(struct irq_desc *desc)
 	unsigned long val;
 	int pos, size, hwirq;
 
-	chained_irq_enter(irq_desc_get_chip(desc), desc);
+	guard_chained_irq(irq_desc_get_chip(desc), desc);
 
 	val = ioread32be(msir->reg);
 
@@ -210,8 +210,6 @@ static void ls_scfg_msi_irq_handler(struct irq_desc *desc)
 			msir->srs;
 		generic_handle_domain_irq(msi_data->parent, hwirq);
 	}
-
-	chained_irq_exit(irq_desc_get_chip(desc), desc);
 }
 
 static int ls_scfg_msi_domains_init(struct ls_scfg_msi *msi_data)
diff --git a/drivers/irqchip/irq-ls1x.c b/drivers/irqchip/irq-ls1x.c
index 208f9d4cd99f..9c3a8946674e 100644
--- a/drivers/irqchip/irq-ls1x.c
+++ b/drivers/irqchip/irq-ls1x.c
@@ -40,7 +40,7 @@ static void ls1x_chained_handle_irq(struct irq_desc *desc)
 	struct irq_chip *chip = irq_desc_get_chip(desc);
 	u32 pending;
 
-	chained_irq_enter(chip, desc);
+	guard_chained_irq(chip, desc);
 	pending = readl(priv->intc_base + LS_REG_INTC_STATUS) &
 			readl(priv->intc_base + LS_REG_INTC_EN);
 
@@ -53,8 +53,6 @@ static void ls1x_chained_handle_irq(struct irq_desc *desc)
 		generic_handle_domain_irq(priv->domain, bit);
 		pending &= ~BIT(bit);
 	}
-
-	chained_irq_exit(chip, desc);
 }
 
 static void ls_intc_set_bit(struct irq_chip_generic *gc,
diff --git a/drivers/irqchip/irq-mmp.c b/drivers/irqchip/irq-mmp.c
index 8e210cb451be..9fe0085106eb 100644
--- a/drivers/irqchip/irq-mmp.c
+++ b/drivers/irqchip/irq-mmp.c
@@ -152,7 +152,7 @@ static void icu_mux_irq_demux(struct irq_desc *desc)
 	int i;
 	unsigned long mask, status, n;
 
-	chained_irq_enter(chip, desc);
+	guard_chained_irq(chip, desc);
 
 	for (i = 1; i < max_icu_nr; i++) {
 		if (irq == icu_data[i].cascade_irq) {
@@ -163,7 +163,7 @@ static void icu_mux_irq_demux(struct irq_desc *desc)
 	}
 	if (i >= max_icu_nr) {
 		pr_err("Spurious irq %d in MMP INTC\n", irq);
-		goto out;
+		return;
 	}
 
 	mask = readl_relaxed(data->reg_mask);
@@ -175,9 +175,6 @@ static void icu_mux_irq_demux(struct irq_desc *desc)
 			generic_handle_irq(icu_data[i].virq_base + n);
 		}
 	}
-
-out:
-	chained_irq_exit(chip, desc);
 }
 
 static int mmp_irq_domain_map(struct irq_domain *d, unsigned int irq,
diff --git a/drivers/irqchip/irq-mscc-ocelot.c b/drivers/irqchip/irq-mscc-ocelot.c
index 8cbc191f750b..ced780012591 100644
--- a/drivers/irqchip/irq-mscc-ocelot.c
+++ b/drivers/irqchip/irq-mscc-ocelot.c
@@ -107,7 +107,7 @@ static void ocelot_irq_handler(struct irq_desc *desc)
 	struct irq_chip_generic *gc = irq_get_domain_generic_chip(d, 0);
 	u32 reg = irq_reg_readl(gc, ICPU_CFG_INTR_DST_INTR_IDENT(p, 0));
 
-	chained_irq_enter(chip, desc);
+	guard_chained_irq(chip, desc);
 
 	while (reg) {
 		u32 hwirq = __fls(reg);
@@ -115,8 +115,6 @@ static void ocelot_irq_handler(struct irq_desc *desc)
 		generic_handle_domain_irq(d, hwirq);
 		reg &= ~(BIT(hwirq));
 	}
-
-	chained_irq_exit(chip, desc);
 }
 
 static int __init vcoreiii_irq_init(struct device_node *node,
diff --git a/drivers/irqchip/irq-mvebu-pic.c b/drivers/irqchip/irq-mvebu-pic.c
index 81ea0e79402d..b33f08eed98f 100644
--- a/drivers/irqchip/irq-mvebu-pic.c
+++ b/drivers/irqchip/irq-mvebu-pic.c
@@ -107,12 +107,10 @@ static void mvebu_pic_handle_cascade_irq(struct irq_desc *desc)
 	unsigned long irqmap, irqn;
 
 	irqmap = readl_relaxed(pic->base + PIC_CAUSE);
-	chained_irq_enter(chip, desc);
+	guard_chained_irq(chip, desc);
 
 	for_each_set_bit(irqn, &irqmap, BITS_PER_LONG)
 		generic_handle_domain_irq(pic->domain, irqn);
-
-	chained_irq_exit(chip, desc);
 }
 
 static void mvebu_pic_enable_percpu_irq(void *data)
diff --git a/drivers/irqchip/irq-mvebu-sei.c b/drivers/irqchip/irq-mvebu-sei.c
index 5a6b61b2fb1a..716ef764af6a 100644
--- a/drivers/irqchip/irq-mvebu-sei.c
+++ b/drivers/irqchip/irq-mvebu-sei.c
@@ -316,7 +316,7 @@ static void mvebu_sei_handle_cascade_irq(struct irq_desc *desc)
 	struct irq_chip *chip = irq_desc_get_chip(desc);
 	u32 idx;
 
-	chained_irq_enter(chip, desc);
+	guard_chained_irq(chip, desc);
 
 	for (idx = 0; idx < SEI_IRQ_REG_COUNT; idx++) {
 		unsigned long irqmap;
@@ -333,8 +333,6 @@ static void mvebu_sei_handle_cascade_irq(struct irq_desc *desc)
 				dev_warn(sei->dev, "Spurious IRQ detected (hwirq %lu)\n", hwirq);
 		}
 	}
-
-	chained_irq_exit(chip, desc);
 }
 
 static void mvebu_sei_reset(struct mvebu_sei *sei)
diff --git a/drivers/irqchip/irq-pruss-intc.c b/drivers/irqchip/irq-pruss-intc.c
index 9a3efd40790c..fca8e838ccfe 100644
--- a/drivers/irqchip/irq-pruss-intc.c
+++ b/drivers/irqchip/irq-pruss-intc.c
@@ -475,7 +475,7 @@ static void pruss_intc_irq_handler(struct irq_desc *desc)
 	struct pruss_intc *intc = host_irq_data->intc;
 	u8 host_irq = host_irq_data->host_irq + FIRST_PRU_HOST_INT;
 
-	chained_irq_enter(chip, desc);
+	guard_chained_irq(chip, desc);
 
 	while (true) {
 		u32 hipir;
@@ -496,8 +496,6 @@ static void pruss_intc_irq_handler(struct irq_desc *desc)
 		if (WARN_ON_ONCE(err))
 			pruss_intc_write_reg(intc, PRU_INTC_SICR, hwirq);
 	}
-
-	chained_irq_exit(chip, desc);
 }
 
 static const char * const irq_names[MAX_NUM_HOST_IRQS] = {
diff --git a/drivers/irqchip/irq-realtek-rtl.c b/drivers/irqchip/irq-realtek-rtl.c
index f1ab5a77dcef..556c87803313 100644
--- a/drivers/irqchip/irq-realtek-rtl.c
+++ b/drivers/irqchip/irq-realtek-rtl.c
@@ -163,20 +163,17 @@ static void realtek_irq_dispatch(struct irq_desc *desc)
 	unsigned long pending;
 	unsigned int hw_irq;
 
-	chained_irq_enter(chip, desc);
+	guard_chained_irq(chip, desc);
 	pending = readl_be(REG(cpu, RTL_ICTL_GIMR)) &
 		  readl_be(REG(cpu, RTL_ICTL_GISR)) & output->mask;
 
 	if (unlikely(!pending)) {
 		spurious_interrupt();
-		goto out;
+		return;
 	}
 
 	for_each_set_bit(hw_irq, &pending, RTL_ICTL_NUM_INPUTS)
 		generic_handle_domain_irq(output->domain, hw_irq);
-
-out:
-	chained_irq_exit(chip, desc);
 }
 
 static int __init realtek_setup_parents(struct device_node *node)
diff --git a/drivers/irqchip/irq-riscv-aplic-direct.c b/drivers/irqchip/irq-riscv-aplic-direct.c
index bfd11a884316..545155b0e27c 100644
--- a/drivers/irqchip/irq-riscv-aplic-direct.c
+++ b/drivers/irqchip/irq-riscv-aplic-direct.c
@@ -143,7 +143,7 @@ static void aplic_direct_handle_irq(struct irq_desc *desc)
 	irq_hw_number_t hw_irq;
 	int irq;
 
-	chained_irq_enter(chip, desc);
+	guard_chained_irq(chip, desc);
 
 	while ((hw_irq = readl(idc->regs + APLIC_IDC_CLAIMI))) {
 		hw_irq = hw_irq >> APLIC_IDC_TOPI_ID_SHIFT;
@@ -156,8 +156,6 @@ static void aplic_direct_handle_irq(struct irq_desc *desc)
 			generic_handle_irq(irq);
 		}
 	}
-
-	chained_irq_exit(chip, desc);
 }
 
 static void aplic_idc_set_delivery(struct aplic_idc *idc, bool en)
diff --git a/drivers/irqchip/irq-riscv-imsic-early.c b/drivers/irqchip/irq-riscv-imsic-early.c
index 06726a062b75..f16c8d41a90d 100644
--- a/drivers/irqchip/irq-riscv-imsic-early.c
+++ b/drivers/irqchip/irq-riscv-imsic-early.c
@@ -102,7 +102,7 @@ static void imsic_handle_irq(struct irq_desc *desc)
 	 */
 	imsic_local_sync_all(false);
 
-	chained_irq_enter(chip, desc);
+	guard_chained_irq(chip, desc);
 
 	while ((local_id = csr_swap(CSR_TOPEI, 0))) {
 		local_id >>= TOPEI_ID_SHIFT;
@@ -120,8 +120,6 @@ static void imsic_handle_irq(struct irq_desc *desc)
 
 		generic_handle_irq(lpriv->vectors[local_id].irq);
 	}
-
-	chained_irq_exit(chip, desc);
 }
 
 static void imsic_hw_states_init(void)
diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index fdfbf1a9add9..ea7f916ba901 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -388,7 +388,7 @@ static void plic_handle_irq(struct irq_desc *desc)
 
 	WARN_ON_ONCE(!handler->present);
 
-	chained_irq_enter(chip, desc);
+	guard_chained_irq(chip, desc);
 
 	while ((hwirq = readl(claim))) {
 		int err = generic_handle_domain_irq(handler->priv->irqdomain,
@@ -398,8 +398,6 @@ static void plic_handle_irq(struct irq_desc *desc)
 					    handler->priv->fwnode, hwirq);
 		}
 	}
-
-	chained_irq_exit(chip, desc);
 }
 
 static u32 cp100_isolate_pending_irq(int nr_irq_groups, struct plic_handler *handler)
@@ -480,7 +478,7 @@ static void plic_handle_irq_cp100(struct irq_desc *desc)
 
 	WARN_ON_ONCE(!handler->present);
 
-	chained_irq_enter(chip, desc);
+	guard_chained_irq(chip, desc);
 
 	while ((hwirq = cp100_get_hwirq(handler, claim))) {
 		int err = generic_handle_domain_irq(handler->priv->irqdomain, hwirq);
@@ -490,8 +488,6 @@ static void plic_handle_irq_cp100(struct irq_desc *desc)
 					    handler->priv->fwnode, hwirq);
 		}
 	}
-
-	chained_irq_exit(chip, desc);
 }
 
 static void plic_set_threshold(struct plic_handler *handler, u32 threshold)
diff --git a/drivers/irqchip/irq-sp7021-intc.c b/drivers/irqchip/irq-sp7021-intc.c
index 2a6eda9ab62e..d6b271c2b901 100644
--- a/drivers/irqchip/irq-sp7021-intc.c
+++ b/drivers/irqchip/irq-sp7021-intc.c
@@ -170,7 +170,7 @@ static void sp_intc_handle_ext_cascaded(struct irq_desc *desc)
 	int ext_num = (uintptr_t)irq_desc_get_handler_data(desc);
 	int hwirq;
 
-	chained_irq_enter(chip, desc);
+	guard_chained_irq(chip, desc);
 
 	while ((hwirq = sp_intc_get_ext_irq(ext_num)) >= 0) {
 		if (unlikely(IS_GPIO_INT(hwirq) && TEST_STATE(hwirq, _IS_ACTIVE))) { // WORKAROUND
@@ -180,8 +180,6 @@ static void sp_intc_handle_ext_cascaded(struct irq_desc *desc)
 			generic_handle_domain_irq(sp_intc.domain, hwirq);
 		}
 	}
-
-	chained_irq_exit(chip, desc);
 }
 
 static struct irq_chip sp_intc_chip = {
diff --git a/drivers/irqchip/irq-starfive-jhb100-intc.c b/drivers/irqchip/irq-starfive-jhb100-intc.c
index 838885b02f34..f08247f57145 100644
--- a/drivers/irqchip/irq-starfive-jhb100-intc.c
+++ b/drivers/irqchip/irq-starfive-jhb100-intc.c
@@ -176,7 +176,7 @@ static void starfive_intc_irq_handler(struct irq_desc *desc)
 	unsigned long value;
 	int hwirq;
 
-	chained_irq_enter(chip, desc);
+	guard_chained_irq(chip, desc);
 
 	for (int i = 0; i < STARFIVE_INTC_NUM; i++) {
 		value = ioread32(irqc->base + STARFIVE_INTC_SRC_INT(i));
@@ -192,8 +192,6 @@ static void starfive_intc_irq_handler(struct irq_desc *desc)
 			__clear_bit(hwirq, &value);
 		}
 	}
-
-	chained_irq_exit(chip, desc);
 }
 
 static int starfive_intc_probe(struct platform_device *pdev, struct device_node *parent)
diff --git a/drivers/irqchip/irq-stm32-exti.c b/drivers/irqchip/irq-stm32-exti.c
index 5fdf335acb46..1a1d9fd67de4 100644
--- a/drivers/irqchip/irq-stm32-exti.c
+++ b/drivers/irqchip/irq-stm32-exti.c
@@ -122,7 +122,7 @@ static void stm32_irq_handler(struct irq_desc *desc)
 	unsigned long pending;
 	int n, i, irq_base = 0;
 
-	chained_irq_enter(chip, desc);
+	guard_chained_irq(chip, desc);
 
 	for (i = 0; i < nbanks; i++, irq_base += IRQS_PER_BANK) {
 		gc = irq_get_domain_generic_chip(domain, irq_base);
@@ -132,8 +132,6 @@ static void stm32_irq_handler(struct irq_desc *desc)
 				generic_handle_domain_irq(domain, irq_base + n);
 		}
 	}
-
-	chained_irq_exit(chip, desc);
 }
 
 static int stm32_exti_set_type(struct irq_data *d,
diff --git a/drivers/irqchip/irq-sunxi-nmi.c b/drivers/irqchip/irq-sunxi-nmi.c
index fe32dfdc2dd0..3a5e81ddcb7c 100644
--- a/drivers/irqchip/irq-sunxi-nmi.c
+++ b/drivers/irqchip/irq-sunxi-nmi.c
@@ -97,9 +97,8 @@ static void sunxi_sc_nmi_handle_irq(struct irq_desc *desc)
 	struct irq_domain *domain = irq_desc_get_handler_data(desc);
 	struct irq_chip *chip = irq_desc_get_chip(desc);
 
-	chained_irq_enter(chip, desc);
+	guard_chained_irq(chip, desc);
 	generic_handle_domain_irq(domain, 0);
-	chained_irq_exit(chip, desc);
 }
 
 static int sunxi_sc_nmi_set_type(struct irq_data *data, unsigned int flow_type)
diff --git a/drivers/irqchip/irq-ti-sci-inta.c b/drivers/irqchip/irq-ti-sci-inta.c
index 0039d0a44154..c2d99c09359f 100644
--- a/drivers/irqchip/irq-ti-sci-inta.c
+++ b/drivers/irqchip/irq-ti-sci-inta.c
@@ -154,15 +154,13 @@ static void ti_sci_inta_irq_handler(struct irq_desc *desc)
 	domain = vint_desc->domain;
 	inta = domain->host_data;
 
-	chained_irq_enter(irq_desc_get_chip(desc), desc);
+	guard_chained_irq(irq_desc_get_chip(desc), desc);
 
 	val = readq_relaxed(inta->base + vint_desc->vint_id * 0x1000 +
 			    VINT_STATUS_MASKED_OFFSET);
 
 	for_each_set_bit(bit, &val, MAX_EVENTS_PER_VINT)
 		generic_handle_domain_irq(domain, vint_desc->events[bit].hwirq);
-
-	chained_irq_exit(irq_desc_get_chip(desc), desc);
 }
 
 /**
diff --git a/drivers/irqchip/irq-ts4800.c b/drivers/irqchip/irq-ts4800.c
index 6fc57d664df8..1698cd8a43a4 100644
--- a/drivers/irqchip/irq-ts4800.c
+++ b/drivers/irqchip/irq-ts4800.c
@@ -85,11 +85,11 @@ static void ts4800_ic_chained_handle_irq(struct irq_desc *desc)
 	struct irq_chip *chip = irq_desc_get_chip(desc);
 	u16 status = readw(data->base + IRQ_STATUS);
 
-	chained_irq_enter(chip, desc);
+	guard_chained_irq(chip, desc);
 
 	if (unlikely(status == 0)) {
 		handle_bad_irq(desc);
-		goto out;
+		return;
 	}
 
 	do {
@@ -98,9 +98,6 @@ static void ts4800_ic_chained_handle_irq(struct irq_desc *desc)
 		generic_handle_domain_irq(data->domain, bit);
 		status &= ~(1 << bit);
 	} while (status);
-
-out:
-	chained_irq_exit(chip, desc);
 }
 
 static int ts4800_ic_probe(struct platform_device *pdev)
diff --git a/drivers/irqchip/irq-versatile-fpga.c b/drivers/irqchip/irq-versatile-fpga.c
index 6eaad836d9ff..e78ac0fc602b 100644
--- a/drivers/irqchip/irq-versatile-fpga.c
+++ b/drivers/irqchip/irq-versatile-fpga.c
@@ -85,12 +85,12 @@ static void fpga_irq_handle(struct irq_desc *desc)
 	struct fpga_irq_data *f = irq_desc_get_handler_data(desc);
 	u32 status;
 
-	chained_irq_enter(chip, desc);
+	guard_chained_irq(chip, desc);
 
 	status = readl(f->base + IRQ_STATUS);
 	if (status == 0) {
 		handle_bad_irq(desc);
-		goto out;
+		return;
 	}
 
 	do {
@@ -99,9 +99,6 @@ static void fpga_irq_handle(struct irq_desc *desc)
 		status &= ~(1 << irq);
 		generic_handle_domain_irq(f->domain, irq);
 	} while (status);
-
-out:
-	chained_irq_exit(chip, desc);
 }
 
 /*
diff --git a/drivers/irqchip/irq-vic.c b/drivers/irqchip/irq-vic.c
index 607e3284f700..78779b302050 100644
--- a/drivers/irqchip/irq-vic.c
+++ b/drivers/irqchip/irq-vic.c
@@ -224,14 +224,12 @@ static void vic_handle_irq_cascaded(struct irq_desc *desc)
 	struct irq_chip *host_chip = irq_desc_get_chip(desc);
 	struct vic_device *vic = irq_desc_get_handler_data(desc);
 
-	chained_irq_enter(host_chip, desc);
+	guard_chained_irq(host_chip, desc);
 
 	while ((stat = readl_relaxed(vic->base + VIC_IRQ_STATUS))) {
 		hwirq = ffs(stat) - 1;
 		generic_handle_domain_irq(vic->domain, hwirq);
 	}
-
-	chained_irq_exit(host_chip, desc);
 }
 
 /*
diff --git a/drivers/irqchip/irq-vt8500.c b/drivers/irqchip/irq-vt8500.c
index b159e17ed1df..ca548a3fdb7e 100644
--- a/drivers/irqchip/irq-vt8500.c
+++ b/drivers/irqchip/irq-vt8500.c
@@ -192,9 +192,8 @@ static void vt8500_handle_irq_chained(struct irq_desc *desc)
 	struct irq_chip *chip = irq_desc_get_chip(desc);
 	struct vt8500_irq_data *intc = d->host_data;
 
-	chained_irq_enter(chip, desc);
+	guard_chained_irq(chip, desc);
 	vt8500_handle_irq_common(intc);
-	chained_irq_exit(chip, desc);
 }
 
 static int __init vt8500_irq_init(struct device_node *node,
diff --git a/drivers/irqchip/irq-xilinx-intc.c b/drivers/irqchip/irq-xilinx-intc.c
index bba6f6dc405e..56246da62374 100644
--- a/drivers/irqchip/irq-xilinx-intc.c
+++ b/drivers/irqchip/irq-xilinx-intc.c
@@ -140,7 +140,7 @@ static void xil_intc_irq_handler(struct irq_desc *desc)
 	struct xintc_irq_chip *irqc;
 
 	irqc = irq_data_get_irq_handler_data(&desc->irq_data);
-	chained_irq_enter(chip, desc);
+	guard_chained_irq(chip, desc);
 	do {
 		u32 hwirq = xintc_read(irqc, IVR);
 
@@ -149,7 +149,6 @@ static void xil_intc_irq_handler(struct irq_desc *desc)
 
 		generic_handle_domain_irq(irqc->root_domain, hwirq);
 	} while (true);
-	chained_irq_exit(chip, desc);
 }
 
 static void xil_intc_handle_irq(struct pt_regs *regs)
diff --git a/drivers/irqchip/irq-xilinx-smmu-csr.c b/drivers/irqchip/irq-xilinx-smmu-csr.c
index 58a1555699f5..b22cb191aad1 100644
--- a/drivers/irqchip/irq-xilinx-smmu-csr.c
+++ b/drivers/irqchip/irq-xilinx-smmu-csr.c
@@ -115,7 +115,7 @@ static void xilinx_smmu_csr_irq_handler(struct irq_desc *desc)
 	struct irq_chip *chip = irq_desc_get_chip(desc);
 	u32 status, mask, active, pending, spurious;
 
-	chained_irq_enter(chip, desc);
+	guard_chained_irq(chip, desc);
 
 	/*
 	 * SMMU_CSR_ISR latches raw, pre-mask status, so gate it with the mask
@@ -152,8 +152,6 @@ static void xilinx_smmu_csr_irq_handler(struct irq_desc *desc)
 
 		pending &= ~BIT(hwirq);
 	}
-
-	chained_irq_exit(chip, desc);
 }
 
 static int xilinx_smmu_csr_domain_map(struct irq_domain *d, unsigned int virq,
diff --git a/drivers/irqchip/qcom-irq-combiner.c b/drivers/irqchip/qcom-irq-combiner.c
index 57ff4177edb9..8fe2138c85ed 100644
--- a/drivers/irqchip/qcom-irq-combiner.c
+++ b/drivers/irqchip/qcom-irq-combiner.c
@@ -50,7 +50,7 @@ static void combiner_handle_irq(struct irq_desc *desc)
 	struct irq_chip *chip = irq_desc_get_chip(desc);
 	u32 reg;
 
-	chained_irq_enter(chip, desc);
+	guard_chained_irq(chip, desc);
 
 	for (reg = 0; reg < combiner->nregs; reg++) {
 		int hwirq;
@@ -72,8 +72,6 @@ static void combiner_handle_irq(struct irq_desc *desc)
 			generic_handle_domain_irq(combiner->domain, hwirq);
 		}
 	}
-
-	chained_irq_exit(chip, desc);
 }
 
 static void combiner_irq_chip_mask_irq(struct irq_data *data)

---
base-commit: 84abb955b1015477aa11a96e2f3ac1b938b77f48
change-id: 20261114-irqchip-cleanup-api-258c2081bd1e

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>

