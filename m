Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA2D2571B8;
	Sat, 17 Jan 2026 19:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768677906; cv=none; b=Sg9RcxwYC99nTuTFcQG1HDbtzZwWMqkmTe/81Q4mc20Mq653FesFvUq1OogabXkS20XYBn1jdfaPt41msxYH2+TQUdtwJdXg08vY7uu8tO8yJz/0pWraQoyDlkpgje3yZgzaerSZyI1Hkgo8IfGB7WymXOESv3Z8quUvhzNuJ6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768677906; c=relaxed/simple;
	bh=tTZl9CX+1jUu6Qu7S8Vamek8DWf6OLGlE/QCQzYqkuI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pTFuLWFl/FC2skmE+L5W8Ew4P7ZYC1EZclAG+yMJn/FuYilwcsjKjGYvAeCEknvlx/fwCkdF1gYbav9hYTsK9o8eY+gR3Bf7V1VMRVzgRVAlLj1ka0W/JYlCgs82bSg5e908b6IQotB6NuWES0kEMveQVBirUpNONCEwO0ZS7oQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IySncHSi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IySncHSi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BB18C4CEF7;
	Sat, 17 Jan 2026 19:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768677906;
	bh=tTZl9CX+1jUu6Qu7S8Vamek8DWf6OLGlE/QCQzYqkuI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IySncHSiD1lX4N21BoUm89LJXXfYt4r74HJN2+4Z1tEUa+I9QI978Cut9cJqp08qh
	 aP+WScfwchF2f6SNtc4v/Q673kJ5rufRLHxPoZ72dnjK1qnLDEsGRG7cGgggqigvrB
	 mXM+QLj0kI/77QoyCWld32kmWb1unpBTeikJFqWLWYYzSkm0XY+9/0fPaKXbSMmhzo
	 3FYPaCqmdAkZQQrgmEwU62GHJanv4hWEF1BmdLivxQ+deyfM/sBInaIyLBRwB3D8uc
	 eAvuKdLONkslXVQI/vWp0qeABKx4StvrknmjZ5+UT1CQYvaLj06inA+miPC/htdik5
	 Dj2Dghtkkvxqw==
Message-ID: <dfc3f6ee-08c8-4673-91c2-e9c863105753@kernel.org>
Date: Sat, 17 Jan 2026 20:25:01 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] clk: samsung: allow runtime PM with auto clock gating
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Will McVicker <willmcvicker@google.com>, Juan Yescas <jyescas@google.com>,
 linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260109-clk-samsung-autoclk-updates-v1-0-2394dcf242a9@linaro.org>
 <20260109-clk-samsung-autoclk-updates-v1-3-2394dcf242a9@linaro.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20260109-clk-samsung-autoclk-updates-v1-3-2394dcf242a9@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09/01/2026 18:27, André Draszik wrote:
> When automatic clock gating is enabled, runtime PM (RPM) isn't entered
> even if enabled for a CMU if a sysreg clock exists and is provided by
> this CMU (as is generally the case).
> 
> The reason is that this driver acquires a CMU's sysreg registers using
> syscon_regmap_lookup_by_phandle() which ends up preparing the sysreg
> clock. Given the sysreg clock is provided by this CMU, this CMU's usage
> count is therefore bumped and RPM can not be entered as this CMU never
> becomes idle.
> 
> Switch to using device_node_to_regmap() which doesn't handle resources
> (the clock), leaving the CMU's usage count unaffected.
> 
> Note1: sysreg clock handling is completely removed with this commit

I miss where do you remove in this commit the sysreg clock handling?

> because sysreg register access is only required during suspend/resume.
> In the runtime suspend case, we would have to enable the clock to read
> the registers, but we can not do that as that would cause a resume of
> this driver which is not allowed. This is not a problem because we
> would only need to handle the clock manually if automatic clock gating
> wasn't enabled in the first. This code is only relevant if automatic
> clock gating is enabled, though.
> 
> Fixes: 298fac4f4b96 ("clk: samsung: Implement automatic clock gating mode for CMUs")
> Signed-off-by: André Draszik <andre.draszik@linaro.org>
> ---
>  drivers/clk/samsung/clk.c | 92 +++++++++++++++++++++++++++++++++++------------
>  drivers/clk/samsung/clk.h |  2 ++
>  2 files changed, 71 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/clk/samsung/clk.c b/drivers/clk/samsung/clk.c
> index 9f68f079fd552f8dfb6898dbfb47dec0e84c626c..6515df81fcbc79b90f5262843e67575f6a4e0dda 100644
> --- a/drivers/clk/samsung/clk.c
> +++ b/drivers/clk/samsung/clk.c
> @@ -9,11 +9,13 @@
>   */
>  
>  #include <linux/slab.h>
> +#include <linux/clk.h>
>  #include <linux/clkdev.h>
>  #include <linux/clk-provider.h>
>  #include <linux/io.h>
>  #include <linux/mfd/syscon.h>
>  #include <linux/mod_devicetable.h>
> +#include <linux/of.h>
>  #include <linux/of_address.h>
>  #include <linux/regmap.h>
>  #include <linux/syscore_ops.h>
> @@ -489,6 +491,50 @@ void __init samsung_cmu_register_clocks(struct samsung_clk_provider *ctx,
>  		samsung_clk_register_cpu(ctx, cmu->cpu_clks, cmu->nr_cpu_clks);
>  }
>  
> +static int samsung_get_sysreg_regmap(struct device_node *np,
> +				     struct samsung_clk_provider *ctx)
> +{
> +	struct device_node *sysreg_np;
> +	struct clk *sysreg_clk;
> +	struct regmap *regmap;
> +	int ret;
> +
> +	sysreg_np = of_parse_phandle(np, "samsung,sysreg", 0);
> +	if (!sysreg_np)
> +		return -ENODEV;
> +
> +	sysreg_clk = of_clk_get(sysreg_np, 0);

I don't think you should be poking clock of some other device. This
clearly breaks encapsulation. What sysreg is needs to do to access
registers, is only business of sysreg. No other drivers should
re-implement this.

> +	if (IS_ERR(sysreg_clk)) {
> +		ret = PTR_ERR(sysreg_clk);
> +		/* clock is optional */
> +		if (ret != -ENOENT) {
> +			pr_warn("%pOF: Unable to get sysreg clock: %d\n", np,
> +				ret);
> +			goto put_sysreg_np;
> +		}
> +		sysreg_clk = NULL;
> +	}


Best regards,
Krzysztof
