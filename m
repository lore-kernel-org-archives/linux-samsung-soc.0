Return-Path: <SRS0=0LAj=CY=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43882C43461
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 15 Sep 2020 09:48:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A7D8A21D24
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 15 Sep 2020 09:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600163337;
	bh=rD/UNyFOCyRF0Jm2w6/woqRyP5HVr7lmAT2+g4WW3+M=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-ID:From;
	b=2sizP7KTzywAi5iKz/xgOAEMd7GPX69BFzugNdbEnbbMgZCXRb6aFsBXRSxZgnhrg
	 4vV/HEFG/Tok7qDlgGZ4Gu0X4OOVF1Bhs8+W9669+QW9ZvVln5ZMy8+Qx73Jan/cpl
	 JklyPJ1wLB9WhgGvWljLIcm+e3B1/tEvLOvaqnMs=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726125AbgIOJs4 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 15 Sep 2020 05:48:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:60734 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726095AbgIOJsx (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 15 Sep 2020 05:48:53 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B66E021D1B;
        Tue, 15 Sep 2020 09:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600163332;
        bh=rD/UNyFOCyRF0Jm2w6/woqRyP5HVr7lmAT2+g4WW3+M=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=X1a5GFVGN7r8G7Gjfeq8GR12AjMpUfPgIubRv/9sLAp4MH2MbEm1pmbHe5sdGnyCz
         7CiOGRqqODyzZu5muuwNOpGHMtk9WFCLi3Si7cC8XqpP0NB1AfFVrP45sKwyKGOZ/J
         3GrZnVuuNNIe9u7fNNx8UFNr0rsFzxAZibIpWk/s=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1kI7Zy-00BxXi-KC; Tue, 15 Sep 2020 10:48:50 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Tue, 15 Sep 2020 10:48:50 +0100
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
In-Reply-To: <ce90375a-6752-1fa9-6927-991a99168b33@samsung.com>
References: <20200901144324.1071694-1-maz@kernel.org>
 <20200901144324.1071694-9-maz@kernel.org>
 <CGME20200914130601eucas1p23ce276d168dee37909b22c75499e68da@eucas1p2.samsung.com>
 <a917082d-4bfd-a6fd-db88-36e75f5f5921@samsung.com>
 <8642847d83ef5bb15663d0246d6af668@kernel.org>
 <65565f85-d932-37f3-a8cd-dbd13d7dbfad@samsung.com>
 <14e2c690bf99280588538989014c7356@kernel.org>
 <33e3ef7c-44e9-a509-74ad-c2e39779fd9d@samsung.com>
 <731a70ded2e2e862483d1df96224d039@kernel.org>
 <ce90375a-6752-1fa9-6927-991a99168b33@samsung.com>
User-Agent: Roundcube Webmail/1.4.8
Message-ID: <77e4565c507b3a9ea0646ee06590ac95@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: m.szyprowski@samsung.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, will@kernel.org, catalin.marinas@arm.com, linux@arm.linux.org.uk, tglx@linutronix.de, jason@lakedaemon.net, sumit.garg@linaro.org, Valentin.Schneider@arm.com, f.fainelli@gmail.com, gregory.clement@bootlin.com, andrew@lunn.ch, saravanak@google.com, kernel-team@android.com, linux-samsung-soc@vger.kernel.org, krzk@kernel.org, b.zolnierkie@samsung.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 2020-09-15 09:35, Marek Szyprowski wrote:
> Hi Marc,
> 
> On 15.09.2020 10:07, Marc Zyngier wrote:
>> On 2020-09-15 07:48, Marek Szyprowski wrote:
>>>>> Both Exynos 4210 and 4412 use non-zero cpu-offset in GIC node in
>>>>> device-tree: arch/arm/boot/dts/exynos{4210,4412}.dtsi, so I assume
>>>>> that
>>>>> the GIC registers are not banked.
>>>> 
>>>> Annoyingly, it seems to work correctly in QEMU:
>> 
>> [...]
>> 
>>>> Do you happen to know whether the QEMU emulation is trustworthy?
>>> 
>>> I didn't play much with Exynos emulation on QEMU. All I know is that
>>> this patch simply doesn't work on the real hw.
>> 
>> I don't doubt it. The question was more whether we could trust QEMU
>> to be reliable, in which case the issue would be around a kernel
>> configuration problem. Could you stash your kernel config somewhere?
> 
> I just use the vanilla exynos_defconfig for my tests.

Tried that with QEMU, same result. It keeps working. Oh well.

> 
>>> If there is anything to check or test, let me know. I will try to 
>>> help
>>> as much as possible.
>> 
>> It would be interesting to see whether the CPUs are getting any IPI.
>> Can you try the following patch, and send the results back?

[...]

> [    0.145493] smp: Bringing up secondary CPUs ...
> [    0.152740] CPU0 send IPI0 base = f0800000
> [    0.152786] CPU1: Booted secondary processor
> [    0.155582] CPU0 send IPI0 base = f0800000
> [    0.163945] CPU1 IPI0 base = f0808000
> [    0.163956] CPU1 IPI1 base = f0808000
> [    0.163966] CPU1 IPI2 base = f0808000
> [    0.163976] CPU1 IPI3 base = f0808000
> [    0.163986] CPU1 IPI4 base = f0808000
> [    0.163995] CPU1 IPI5 base = f0808000
> [    0.164004] CPU1 IPI6 base = f0808000
> [    0.164014] CPU1 IPI7 base = f0808000
> [    0.164025] CPU1: thread -1, cpu 1, socket 9, mpidr 80000901
> [    0.164035] CPU1: Spectre v2: using BPIALL workaround
> [    0.203803] CPU1 send IPI2 base = f0808000
> [    0.207834] CPU1 IPI0 received
> [    0.207839] CPU0 IPI2 received
> [    0.214052] CPU0 send IPI2 base = f0800000
> [    0.217990] CPU1 IPI2 received
> [    0.222188] CPU1 send IPI2 base = f0808000
> [    2.754062] random: fast init done

So IPIs *do work* for some time, but CPU0 ends up not seeing IPI2.
I see a slightly different behaviour in QEMU:

[    0.555590] smp: Bringing up secondary CPUs ...
[    0.606032] CPU0 send IPI0 base = f0800000
[    0.609149] CPU0 send IPI0 base = f0800000
[    0.610329] CPU0 send IPI0 base = f0800000
[    0.611445] CPU0 send IPI0 base = f0800000
[    0.611588] CPU1: Booted secondary processor
[    0.613579] CPU0 send IPI0 base = f0800000
[    0.616180] CPU1 IPI0 base = f0808000
[    0.616470] CPU1 IPI1 base = f0808000
[    0.616634] CPU1 IPI2 base = f0808000
[    0.616781] CPU1 IPI3 base = f0808000
[    0.616931] CPU1 IPI4 base = f0808000
[    0.617074] CPU1 IPI5 base = f0808000
[    0.617220] CPU1 IPI6 base = f0808000
[    0.617366] CPU1 IPI7 base = f0808000
[    0.617824] CPU1: thread -1, cpu 1, socket 9, mpidr 80000901
[    0.618115] CPU1: Spectre v2: using BPIALL workaround
[    0.627969] CPU1 send IPI3 base = f0808000
[    0.631301] CPU0 IPI3 received
[    0.631389] CPU1 IPI0 received
[    0.639726] CPU0 send IPI2 base = f0800000
[    0.641632] CPU1 IPI2 received
[    0.664666] CPU1 send IPI2 base = f0808000
[    0.665987] CPU0 IPI2 received
[    0.670718] smp: Brought up 1 node, 2 CPUs
[    0.672175] SMP: Total of 2 processors activated (48.00 BogoMIPS).
[    0.674071] CPU: All CPU(s) started in SVC mode.

where the secondary starts by sending IPI3 (IPI_CALL_FUNC). Not sure it
matters.

The fact that CPU0 doesn't process the second IPI2 makes me wonder
if there is something flawed in the EOI logic.

Can you try applying this patch, which reverts that particular logic?
If that happens to work, we'll have to investigate what comes out
of the IAR register...

Otherwise, we'll keep reverting bits of the patch until we nail it...

Thanks,

         M.

diff --git a/drivers/irqchip/irq-gic.c b/drivers/irqchip/irq-gic.c
index 4be2b62f816f..6daf2de7233a 100644
--- a/drivers/irqchip/irq-gic.c
+++ b/drivers/irqchip/irq-gic.c
@@ -335,22 +335,31 @@ static void __exception_irq_entry 
gic_handle_irq(struct pt_regs *regs)
  		irqstat = readl_relaxed(cpu_base + GIC_CPU_INTACK);
  		irqnr = irqstat & GICC_IAR_INT_ID_MASK;

-		if (unlikely(irqnr >= 1020))
-			break;
-
-		if (static_branch_likely(&supports_deactivate_key))
+		if (likely(irqnr > 15 && irqnr < 1020)) {
+			if (static_branch_likely(&supports_deactivate_key))
+				writel_relaxed(irqstat, cpu_base + GIC_CPU_EOI);
+			isb();
+			handle_domain_irq(gic->domain, irqnr, regs);
+			continue;
+		}
+		if (irqnr < 16) {
  			writel_relaxed(irqstat, cpu_base + GIC_CPU_EOI);
-		isb();
-
-		/*
-		 * Ensure any shared data written by the CPU sending the IPI
-		 * is read after we've read the ACK register on the GIC.
-		 *
-		 * Pairs with the write barrier in gic_ipi_send_mask
-		 */
-		if (irqnr <= 15)
+			if (static_branch_likely(&supports_deactivate_key))
+				writel_relaxed(irqstat, cpu_base + GIC_CPU_DEACTIVATE);
+#ifdef CONFIG_SMP
+			/*
+			 * Ensure any shared data written by the CPU sending
+			 * the IPI is read after we've read the ACK register
+			 * on the GIC.
+			 *
+			 * Pairs with the write barrier in gic_raise_softirq
+			 */
  			smp_rmb();
-		handle_domain_irq(gic->domain, irqnr, regs);
+			handle_IPI(irqnr, regs);
+#endif
+			continue;
+		}
+		break;
  	} while (1);
  }


-- 
Jazz is not dead. It just smells funny...
