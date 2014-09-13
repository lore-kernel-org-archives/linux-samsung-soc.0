From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v4 2/8] clk: samsung: Factor out the common code to clk.c
Date: Sat, 13 Sep 2014 13:20:12 +0200
Message-ID: <5414286C.40103@gmail.com>
References: <1410535592-5782-1-git-send-email-ch.naveen@samsung.com> <1410535592-5782-4-git-send-email-ch.naveen@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f171.google.com ([74.125.82.171]:51212 "EHLO
	mail-we0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751609AbaIMLUQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 13 Sep 2014 07:20:16 -0400
In-Reply-To: <1410535592-5782-4-git-send-email-ch.naveen@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Naveen Krishna Chatradhi <ch.naveen@samsung.com>, linux-arm-kernel@lists.infradead.org
Cc: naveenkrishna.ch@gmail.com, linux-samsung-soc@vger.kernel.org, catalin.marinas@arm.com, robh@kernel.org, devicetree@vger.kernel.org, kgene.kim@samsung.com, gregkh@linuxfoundation.org, Mike Turquette <mturquette@linaro.org>

Hi Naveen,

Please see my comments inline.

On 12.09.2014 17:26, Naveen Krishna Chatradhi wrote:
> While adding clock support for Exynos5260, the infrastructure to
> register multiple clock controllers was introduced. Factor out the
> support for registering multiple clock controller from Exynos5260
> clock code to common samsung clock code so that it can be used by
> other Exynos SoC which have multiple clock controllers.

[snip]

> @@ -268,7 +135,7 @@ struct samsung_gate_clock aud_gate_clks[] __initdata = {
>  
>  static void __init exynos5260_clk_aud_init(struct device_node *np)
>  {
> -	struct exynos5260_cmu_info cmu = {0};
> +	struct exynos_cmu_info cmu = {0};
>  
>  	cmu.mux_clks = aud_mux_clks;
>  	cmu.nr_mux_clks = ARRAY_SIZE(aud_mux_clks);
> @@ -280,7 +147,7 @@ static void __init exynos5260_clk_aud_init(struct device_node *np)
>  	cmu.clk_regs = aud_clk_regs;
>  	cmu.nr_clk_regs = ARRAY_SIZE(aud_clk_regs);
>  
> -	exynos5260_cmu_register_one(np, &cmu);
> +	exynos_cmu_register_one(np, &cmu);

I'd suggest changing the namespace prefix from exynos to just samsung to
be consistent with other helpers. Otherwise looks good.

Best regards,
Tomasz
