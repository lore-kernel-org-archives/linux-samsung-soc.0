From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH 08/12] clk: samsung: add clock controller driver for s3c2410, s3c2440 and s3c2442
Date: Mon, 17 Feb 2014 22:05:16 +0100
Message-ID: <5643318.r2EB20boll@phil>
References: <201312131356.40755.heiko@sntech.de> <201312131401.52029.heiko@sntech.de> <52F7D842.5060609@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:37979 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751097AbaBQVGL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 17 Feb 2014 16:06:11 -0500
In-Reply-To: <52F7D842.5060609@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, t.figa@samsung.com, mturquette@linaro.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Hi Tomasz,

Am Sonntag, 9. Februar 2014, 20:34:26 schrieb Tomasz Figa:
> > +/*
> > + * fixed rate clocks generated outside the soc
> > + * Only necessary until the devicetree-move is complete
> > + */
> > +struct samsung_fixed_rate_clock s3c2410_common_frate_clks[] __initdata =
> > {
> > +	FRATE(XTI, "xti", NULL, CLK_IS_ROOT, 0),
> 
> Do you need to assign this clock an ID? When DT is used, it's defined as
> a separate clock provider using fixed clock bindings, so it is not
> provided by this driver.

I think that I'll need this (and similar on the s3c2412). This is due to the 
cpufreq driver for the earlier SoCs needing the xtal-frequency to calculate 
the pll lock time (s3c24xx-cpufreq.c s3c_cpufreq_update_loctkime).

Or do you have an idea on how to fix up the cpufreq driver in an easy way?


Heiko
