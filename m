From: Abhilash Kesavan <kesavan.abhilash@gmail.com>
Subject: Re: [PATCH v4 2/8] clk: samsung: Factor out the common code to clk.c
Date: Mon, 22 Sep 2014 09:53:22 +0530
Message-ID: <CAM4voa=DE2CC2jftmnnscP1iHhcktaXKhgViOARsZR0b4+benA@mail.gmail.com>
References: <1410535592-5782-1-git-send-email-ch.naveen@samsung.com>
	<1410535592-5782-4-git-send-email-ch.naveen@samsung.com>
	<5414286C.40103@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qa0-f45.google.com ([209.85.216.45]:48739 "EHLO
	mail-qa0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750723AbaIVEXX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 22 Sep 2014 00:23:23 -0400
In-Reply-To: <5414286C.40103@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Naveen Krishna Chatradhi <ch.naveen@samsung.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, devicetree <devicetree@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Mike Turquette <mturquette@linaro.org>, robh@kernel.org, catalin.marinas@arm.com, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, gregkh@linuxfoundation.org, Naveen Krishna <naveenkrishna.ch@gmail.com>

Hi Tomasz,

Naveen is no longer with Samsung, so I will be taking this patchset forward.

On Sat, Sep 13, 2014 at 4:50 PM, Tomasz Figa <tomasz.figa@gmail.com> wrote:
> Hi Naveen,
>
> Please see my comments inline.
>
> On 12.09.2014 17:26, Naveen Krishna Chatradhi wrote:
>> While adding clock support for Exynos5260, the infrastructure to
>> register multiple clock controllers was introduced. Factor out the
>> support for registering multiple clock controller from Exynos5260
>> clock code to common samsung clock code so that it can be used by
>> other Exynos SoC which have multiple clock controllers.
>
> [snip]
>
>> @@ -268,7 +135,7 @@ struct samsung_gate_clock aud_gate_clks[] __initdata = {
>>
>>  static void __init exynos5260_clk_aud_init(struct device_node *np)
>>  {
>> -     struct exynos5260_cmu_info cmu = {0};
>> +     struct exynos_cmu_info cmu = {0};
>>
>>       cmu.mux_clks = aud_mux_clks;
>>       cmu.nr_mux_clks = ARRAY_SIZE(aud_mux_clks);
>> @@ -280,7 +147,7 @@ static void __init exynos5260_clk_aud_init(struct device_node *np)
>>       cmu.clk_regs = aud_clk_regs;
>>       cmu.nr_clk_regs = ARRAY_SIZE(aud_clk_regs);
>>
>> -     exynos5260_cmu_register_one(np, &cmu);
>> +     exynos_cmu_register_one(np, &cmu);
>
> I'd suggest changing the namespace prefix from exynos to just samsung to
> be consistent with other helpers. Otherwise looks good.

Will fix this.

Regards,
Abhilash
>
> Best regards,
> Tomasz
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
