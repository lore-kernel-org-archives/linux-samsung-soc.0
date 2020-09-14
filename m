Return-Path: <SRS0=fOmg=CX=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 758CAC43461
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 14 Sep 2020 13:13:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 422D121D1B
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 14 Sep 2020 13:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600089225;
	bh=GgADN7crfAe7jzTb6yGV4ztzDkC+d0tdj2gVu76Vzeo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-ID:From;
	b=w97o5J5FPDXlVW2q/EQC54a98exsmSbcCPplcYe40RaJO+6vK56WjyPVbK3aKS35H
	 Xd7VftzXcbuIWzVrg9LHAnAxW84AnNF8o7fzK8Dyn8HGZY7UC5Rcbbabe7K2j6yWzT
	 pQIDR74io6safxMPaOekJvI2vErmjcwuS2wqy8B4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726050AbgINNNk (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 14 Sep 2020 09:13:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:39518 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726548AbgINNNI (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 14 Sep 2020 09:13:08 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4EF26208E4;
        Mon, 14 Sep 2020 13:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600089186;
        bh=GgADN7crfAe7jzTb6yGV4ztzDkC+d0tdj2gVu76Vzeo=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=UK6P/qw6cASw8lJgW7aMiSBKbeZcVaTtNC8RxVbA3e0YWCGVsGXoALZSoHgwGE14L
         nCebfxUoJuWbIZOxGj2sVNhIMWVjJBjqyfyIuyrLOfOhtq7pH0exWZYsURXq1Fp0yq
         HdFLg34NSM53vslKsV5LHjGmJC7TRG25YNqmsoOs=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1kHoI4-00Bggl-I0; Mon, 14 Sep 2020 14:13:04 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Mon, 14 Sep 2020 14:13:04 +0100
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
In-Reply-To: <a917082d-4bfd-a6fd-db88-36e75f5f5921@samsung.com>
References: <20200901144324.1071694-1-maz@kernel.org>
 <20200901144324.1071694-9-maz@kernel.org>
 <CGME20200914130601eucas1p23ce276d168dee37909b22c75499e68da@eucas1p2.samsung.com>
 <a917082d-4bfd-a6fd-db88-36e75f5f5921@samsung.com>
User-Agent: Roundcube Webmail/1.4.8
Message-ID: <8642847d83ef5bb15663d0246d6af668@kernel.org>
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

On 2020-09-14 14:06, Marek Szyprowski wrote:
> Hi Marc,
> 
> On 01.09.2020 16:43, Marc Zyngier wrote:
>> Change the way we deal with GIC SGIs by turning them into proper
>> IRQs, and calling into the arch code to register the interrupt range
>> instead of a callback.
>> 
>> Reviewed-by: Valentin Schneider <valentin.schneider@arm.com>
>> Signed-off-by: Marc Zyngier <maz@kernel.org>
> This patch landed in linux next-20200914 as commit ac063232d4b0
> ("irqchip/gic: Configure SGIs as standard interrupts"). Sadly it breaks
> booting of all Samsung Exynos 4210/4412 based boards (dual/quad ARM
> Cortex A9 based). Here are the last lines from the bootlog:
> 
> [    0.106322] CPU: Testing write buffer coherency: ok
> [    0.109895] CPU0: Spectre v2: using BPIALL workaround
> [    0.116057] CPU0: thread -1, cpu 0, socket 9, mpidr 80000900
> [    0.123885] Setting up static identity map for 0x40100000 - 
> 0x40100060
> [    0.130191] rcu: Hierarchical SRCU implementation.
> [    0.137195] soc soc0: Exynos: CPU[EXYNOS4210] PRO_ID[0x43210211]
> REV[0x11] Detected
> [    0.145129] smp: Bringing up secondary CPUs ...
> [    0.156279] CPU1: thread -1, cpu 1, socket 9, mpidr 80000901
> [    0.156291] CPU1: Spectre v2: using BPIALL workaround
> [    2.716379] random: fast init done

Thanks for the report. Is this the funky non-banked GIC?

         M.
-- 
Jazz is not dead. It just smells funny...
