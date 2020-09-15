Return-Path: <SRS0=0LAj=CY=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00C2BC433E2
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 15 Sep 2020 08:09:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B7D2421D7A
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 15 Sep 2020 08:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600157377;
	bh=IZYUvTiAZWqnPcm6F0y4Yp8zOr69gEe6o9yO3V1b034=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-ID:From;
	b=xR4DYtZ06LT3cT5PST8ERXBD5zZrNbbg1DcgMxS4MaCM5GdDYm5CdzSmrTD4PdJqo
	 I/Rz4Jitg5ZL65Dm/pZxTS5ulJK6Y2obCSJALMuHQzi52BpzdFueJATsSHrEHXi/LB
	 lhbiFrASJwGcRca9VusejU1GwYlSoUyiFR05MBn0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726131AbgIOIJS (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 15 Sep 2020 04:09:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:60368 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726235AbgIOIJK (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 15 Sep 2020 04:09:10 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4FC2121D7B;
        Tue, 15 Sep 2020 08:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600157277;
        bh=IZYUvTiAZWqnPcm6F0y4Yp8zOr69gEe6o9yO3V1b034=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=HtGAogrKVzRCPY1PZDOdYTBulwY+tbtuJxty2xOzJsFT2/5ppuvADcsTq6VaAhSBv
         PwxQ5dnHB7yPH/jL6d81KJZIkx04715nBFHWebFoeej1HFy2pikGMlZ9QxJ/H8V0uA
         RgJCAEQf/fcH6Gt01U9iGCwrPYMVlQR0AzmF6WZw=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1kI60J-00Bw9D-FJ; Tue, 15 Sep 2020 09:07:55 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 15 Sep 2020 09:07:55 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Russell King <linux@arm.linux.org.uk>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Sumit Garg <sumit.garg@linaro.org>,
        Valentin Schneider <Valentin.Schneider@arm.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Saravana Kannan <saravanak@google.com>,
        kernel-team@android.com,
        'Linux Samsung SOC' <linux-samsung-soc@vger.kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH v3 08/16] irqchip/gic: Configure SGIs as standard
 interrupts
In-Reply-To: <33e3ef7c-44e9-a509-74ad-c2e39779fd9d@samsung.com>
References: <20200901144324.1071694-1-maz@kernel.org>
 <20200901144324.1071694-9-maz@kernel.org>
 <CGME20200914130601eucas1p23ce276d168dee37909b22c75499e68da@eucas1p2.samsung.com>
 <a917082d-4bfd-a6fd-db88-36e75f5f5921@samsung.com>
 <8642847d83ef5bb15663d0246d6af668@kernel.org>
 <65565f85-d932-37f3-a8cd-dbd13d7dbfad@samsung.com>
 <14e2c690bf99280588538989014c7356@kernel.org>
 <33e3ef7c-44e9-a509-74ad-c2e39779fd9d@samsung.com>
User-Agent: Roundcube Webmail/1.4.8
Message-ID: <731a70ded2e2e862483d1df96224d039@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: m.szyprowski@samsung.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, will@kernel.org, catalin.marinas@arm.com, linux@arm.linux.org.uk, tglx@linutronix.de, jason@lakedaemon.net, sumit.garg@linaro.org, Valentin.Schneider@arm.com, f.fainelli@gmail.com, gregory.clement@bootlin.com, andrew@lunn.ch, saravanak@google.com, kernel-team@android.com, linux-samsung-soc@vger.kernel.org, krzk@kernel.org, b.zolnierkie@samsung.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Marek,

On 2020-09-15 07:48, Marek Szyprowski wrote:
> Hi Marc,
> 
>>> Both Exynos 4210 and 4412 use non-zero cpu-offset in GIC node in
>>> device-tree: arch/arm/boot/dts/exynos{4210,4412}.dtsi, so I assume 
>>> that
>>> the GIC registers are not banked.
>> 
>> Annoyingly, it seems to work correctly in QEMU:

[...]

>> Do you happen to know whether the QEMU emulation is trustworthy?
> 
> I didn't play much with Exynos emulation on QEMU. All I know is that
> this patch simply doesn't work on the real hw.

I don't doubt it. The question was more whether we could trust QEMU
to be reliable, in which case the issue would be around a kernel
configuration problem. Could you stash your kernel config somewhere?

> If there is anything to check or test, let me know. I will try to help
> as much as possible.

It would be interesting to see whether the CPUs are getting any IPI.
Can you try the following patch, and send the results back?

Thanks,

         M.

diff --git a/arch/arm/kernel/smp.c b/arch/arm/kernel/smp.c
index 00327fa74b01..5b01d53de9af 100644
--- a/arch/arm/kernel/smp.c
+++ b/arch/arm/kernel/smp.c
@@ -420,7 +420,7 @@ asmlinkage void secondary_start_kernel(void)
  #ifndef CONFIG_MMU
  	setup_vectors_base();
  #endif
-	pr_debug("CPU%u: Booted secondary processor\n", cpu);
+	pr_err("CPU%u: Booted secondary processor\n", cpu);

  	preempt_disable();
  	trace_hardirqs_off();
@@ -621,6 +621,8 @@ static void do_handle_IPI(int ipinr)
  {
  	unsigned int cpu = smp_processor_id();

+	pr_info("CPU%d IPI%d received\n", cpu, ipinr);
+
  	if ((unsigned)ipinr < NR_IPI)
  		trace_ipi_entry_rcuidle(ipi_types[ipinr]);

diff --git a/drivers/irqchip/irq-gic.c b/drivers/irqchip/irq-gic.c
index d7321ccf730f..7723cad6e406 100644
--- a/drivers/irqchip/irq-gic.c
+++ b/drivers/irqchip/irq-gic.c
@@ -190,6 +190,8 @@ static inline bool cascading_gic_irq(struct irq_data 
*d)
  static void gic_poke_irq(struct irq_data *d, u32 offset)
  {
  	u32 mask = 1 << (gic_irq(d) % 32);
+	if (gic_irq(d) < 16)
+		pr_info("CPU%d IPI%lu base = %lx\n", smp_processor_id(), d->hwirq, 
(unsigned long)gic_dist_base(d));
  	writel_relaxed(mask, gic_dist_base(d) + offset + (gic_irq(d) / 32) * 
4);
  }

@@ -814,6 +816,7 @@ static void gic_ipi_send_mask(struct irq_data *d, 
const struct cpumask *mask)
  	 */
  	dmb(ishst);

+	pr_info("CPU%d send IPI%lu base = %lx\n", smp_processor_id(), 
d->hwirq, (unsigned long)gic_data_dist_base(&gic_data[0]));
  	/* this always happens on GIC0 */
  	writel_relaxed(map << 16 | d->hwirq, gic_data_dist_base(&gic_data[0]) 
+ GIC_DIST_SOFTINT);


-- 
Jazz is not dead. It just smells funny...
