Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD28313E043;
	Fri,  7 Jun 2024 08:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717748007; cv=none; b=lZ8wFnmVwFvk0bpyQcLjLlebYdjKigvJc+ZzzCi+LN1WWIuFtuiKyQUXgxOVN1Y2K1Hduv5eKXrZGxXpVFDMH529DoVCgrOXiiP8E8aV6VIKsmZaU117l45H+6T2JqtRvJzJN3eDcYC5m854WPXT2onAnf5V3eBkQmRBqkjmQC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717748007; c=relaxed/simple;
	bh=VIzFG9SjjjS21ocqaupIRcoydDcwg7MVYn9fi3MKjaI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZYazl8lZaDk0S7K27RsZlqfweL/IjyML/eYAITk5k7CK1OV7HUgM6hPtwoUdROPIse2oHpqQ9z4h1FVR0iM6Bkx2NnKUDfjkwXQOhsuNQW5RB9oBcqwc5xFhU0+TGTQeFwXAYszsIhGQNIY6mTw01I0C5jmABooC3wOXAUUq4BE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from i53875b65.versanet.de ([83.135.91.101] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1sFUif-0000XX-SI; Fri, 07 Jun 2024 10:13:05 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sam Protsenko <semen.protsenko@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Subject: Re: [PATCH v1 2/4] clk: rockchip: Switch to use kmemdup_array()
Date: Fri, 07 Jun 2024 10:13:04 +0200
Message-ID: <8182279.JRmrKFJ9eK@diego>
In-Reply-To: <20240606161028.2986587-3-andriy.shevchenko@linux.intel.com>
References:
 <20240606161028.2986587-1-andriy.shevchenko@linux.intel.com>
 <20240606161028.2986587-3-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Andy,

Am Donnerstag, 6. Juni 2024, 18:09:32 CEST schrieb Andy Shevchenko:
> Let the kememdup_array() take care about multiplication and possible
> overflows.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/clk/rockchip/clk-cpu.c | 5 ++---
>  drivers/clk/rockchip/clk-pll.c | 8 ++++----
>  2 files changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/clk/rockchip/clk-cpu.c b/drivers/clk/rockchip/clk-cpu.c
> index 6ea7fba9f9e5..398a226ad34e 100644
> --- a/drivers/clk/rockchip/clk-cpu.c
> +++ b/drivers/clk/rockchip/clk-cpu.c
> @@ -369,9 +369,8 @@ struct clk *rockchip_clk_register_cpuclk(const char *name,
>  
>  	if (nrates > 0) {
>  		cpuclk->rate_count = nrates;
> -		cpuclk->rate_table = kmemdup(rates,
> -					     sizeof(*rates) * nrates,
> -					     GFP_KERNEL);
> +		cpuclk->rate_table = kmemdup_array(rates, nrates, sizeof(*rates),
> +						   GFP_KERNEL);

are you sure the param order is correct?

According to [0], it's (src, element_size, count, gfp), while above
(and below) element_size and count seems switched in the
kmemdup_array calls.


Heiko

[0] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/mm/util.c#n149

>  		if (!cpuclk->rate_table) {
>  			ret = -ENOMEM;
>  			goto unregister_notifier;
> diff --git a/drivers/clk/rockchip/clk-pll.c b/drivers/clk/rockchip/clk-pll.c
> index 2d42eb628926..606ce5458f54 100644
> --- a/drivers/clk/rockchip/clk-pll.c
> +++ b/drivers/clk/rockchip/clk-pll.c
> @@ -1136,10 +1136,10 @@ struct clk *rockchip_clk_register_pll(struct rockchip_clk_provider *ctx,
>  			len++;
>  
>  		pll->rate_count = len;
> -		pll->rate_table = kmemdup(rate_table,
> -					pll->rate_count *
> -					sizeof(struct rockchip_pll_rate_table),
> -					GFP_KERNEL);
> +		pll->rate_table = kmemdup_array(rate_table,
> +						pll->rate_count,
> +						sizeof(*pll->rate_table),
> +						GFP_KERNEL);
>  		WARN(!pll->rate_table,
>  			"%s: could not allocate rate table for %s\n",
>  			__func__, name);
> 




