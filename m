Return-Path: <SRS0=fOmg=CX=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0012C433E2
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 14 Sep 2020 16:47:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9300021BE5
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 14 Sep 2020 16:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600102064;
	bh=0ROvPwI9GHsA6soQBVXwOuivIgyaZ2vSEX0i8eZ+57s=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-ID:From;
	b=cS0TXN07ilgYEGyJ46vGWwgHi4NrQzQ2XYdysOPMLprMimqYE3Pm65DTbyEnSWG2B
	 fvlQ/9SDTuvD/M4NhRv+kPbc65OWQyqPGPfSoq3sOly4FSVBaSLYa9KybFu0DKoqyz
	 kB3WexmgHdMquVPejXk/Q18bGjX/hBv8jjDglJcw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726035AbgINQrl (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 14 Sep 2020 12:47:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:59354 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726034AbgINPJT (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 14 Sep 2020 11:09:19 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6381720829;
        Mon, 14 Sep 2020 15:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600096158;
        bh=0ROvPwI9GHsA6soQBVXwOuivIgyaZ2vSEX0i8eZ+57s=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=KJlRnz/O4V5mlRC/axk0yDSKCcbjoVr0zU0uJHLx9DH6OAkHdR+adl/yCvsg5kmHY
         GiL0ONjceNB+vn2xXKhpJ3I3SWINlX7TJhq+69reYdD60FYnHv4h6DKcvw7NjyPGmJ
         VFlDL20ElYv2bhWDVt3uJkMZB5HxTS2fGuEQBYm4=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1kHq6W-00Biog-Ec; Mon, 14 Sep 2020 16:09:16 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Mon, 14 Sep 2020 16:09:16 +0100
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
In-Reply-To: <65565f85-d932-37f3-a8cd-dbd13d7dbfad@samsung.com>
References: <20200901144324.1071694-1-maz@kernel.org>
 <20200901144324.1071694-9-maz@kernel.org>
 <CGME20200914130601eucas1p23ce276d168dee37909b22c75499e68da@eucas1p2.samsung.com>
 <a917082d-4bfd-a6fd-db88-36e75f5f5921@samsung.com>
 <8642847d83ef5bb15663d0246d6af668@kernel.org>
 <65565f85-d932-37f3-a8cd-dbd13d7dbfad@samsung.com>
User-Agent: Roundcube Webmail/1.4.8
Message-ID: <14e2c690bf99280588538989014c7356@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: m.szyprowski@samsung.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, will@kernel.org, catalin.marinas@arm.com, linux@arm.linux.org.uk, tglx@linutronix.de, jason@lakedaemon.net, sumit.garg@linaro.org, Valentin.Schneider@arm.com, f.fainelli@gmail.com, gregory.clement@bootlin.com, andrew@lunn.ch, saravanak@google.com, kernel-team@android.com, linux-samsung-soc@vger.kernel.org, krzk@kernel.org, b.zolnierkie@samsung.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Marek,

On 2020-09-14 14:26, Marek Szyprowski wrote:
> Hi Marc,
> 
> On 14.09.2020 15:13, Marc Zyngier wrote:
>> On 2020-09-14 14:06, Marek Szyprowski wrote:
>>> On 01.09.2020 16:43, Marc Zyngier wrote:
>>>> Change the way we deal with GIC SGIs by turning them into proper
>>>> IRQs, and calling into the arch code to register the interrupt range
>>>> instead of a callback.
>>>> 
>>>> Reviewed-by: Valentin Schneider <valentin.schneider@arm.com>
>>>> Signed-off-by: Marc Zyngier <maz@kernel.org>
>>> This patch landed in linux next-20200914 as commit ac063232d4b0
>>> ("irqchip/gic: Configure SGIs as standard interrupts"). Sadly it 
>>> breaks
>>> booting of all Samsung Exynos 4210/4412 based boards (dual/quad ARM
>>> Cortex A9 based). Here are the last lines from the bootlog:
>>> 
>>> [    0.106322] CPU: Testing write buffer coherency: ok
>>> [    0.109895] CPU0: Spectre v2: using BPIALL workaround
>>> [    0.116057] CPU0: thread -1, cpu 0, socket 9, mpidr 80000900
>>> [    0.123885] Setting up static identity map for 0x40100000 -
>>> 0x40100060
>>> [    0.130191] rcu: Hierarchical SRCU implementation.
>>> [    0.137195] soc soc0: Exynos: CPU[EXYNOS4210] PRO_ID[0x43210211]
>>> REV[0x11] Detected
>>> [    0.145129] smp: Bringing up secondary CPUs ...
>>> [    0.156279] CPU1: thread -1, cpu 1, socket 9, mpidr 80000901
>>> [    0.156291] CPU1: Spectre v2: using BPIALL workaround
>>> [    2.716379] random: fast init done
>> 
>> Thanks for the report. Is this the funky non-banked GIC?
> 
> Both Exynos 4210 and 4412 use non-zero cpu-offset in GIC node in
> device-tree: arch/arm/boot/dts/exynos{4210,4412}.dtsi, so I assume that
> the GIC registers are not banked.

Annoyingly, it seems to work correctly in QEMU:

root@unassigned-hostname:~# cat /proc/interrupts
            CPU0       CPU1
  40:          0          0     GIC-0  89 Level     mct_comp_irq
  41:      16144          0     GIC-0  74 Level     mct_tick0
  42:          0      15205     GIC-0  80 Level     mct_tick1
  43:          0          0  COMBINER  18 Edge      arm-pmu
  44:          0          0  COMBINER  26 Edge      arm-pmu
  46:       2270          0     GIC-0 107 Level     mmc0
  48:        878          0     GIC-0  84 Level     13800000.serial
  52:          0          0     GIC-0  90 Level     13860000.i2c
  54:          0          0     GIC-0  67 Level     12680000.pdma
  55:          0          0     GIC-0  68 Level     12690000.pdma
  56:          0          0     GIC-0  66 Level     12850000.mdma
  59:          0          0  COMBINER  45 Edge      13620000.sysmmu
  60:          0          0  COMBINER  46 Edge      13630000.sysmmu
  61:          0          0  COMBINER  44 Edge      12e20000.sysmmu
  62:          0          0  COMBINER  34 Edge      11a20000.sysmmu
  63:          0          0  COMBINER  35 Edge      11a30000.sysmmu
  64:          0          0  COMBINER  36 Edge      11a40000.sysmmu
  65:          0          0  COMBINER  37 Edge      11a50000.sysmmu
  66:          0          0  COMBINER  38 Edge      11a60000.sysmmu
  67:          0          0  COMBINER  40 Edge      12a30000.sysmmu
  68:          0          0  COMBINER  42 Edge      11e20000.sysmmu
  74:          0          0     GIC-0  79 Level     11400000.pinctrl
  75:          0          0     GIC-0  78 Level     11000000.pinctrl
  77:          0          0  COMBINER  39 Edge      12a20000.sysmmu
  78:          0          0  COMBINER  43 Edge      12220000.sysmmu
IPI0:          0          1  CPU wakeup interrupts
IPI1:          0          0  Timer broadcast interrupts
IPI2:         32         63  Rescheduling interrupts
IPI3:       3925       5381  Function call interrupts
IPI4:          0          0  CPU stop interrupts
IPI5:       4375       3778  IRQ work interrupts
IPI6:          0          0  completion interrupts
Err:          0

Do you happen to know whether the QEMU emulation is trustworthy?

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...
