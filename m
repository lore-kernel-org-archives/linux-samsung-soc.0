Received: from mta1.migadu.com (out-14.mta1.migadu.com [95.215.58.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984084779A1
	for <linux-samsung-soc@vger.kernel.org>; Fri, 16 Oct 2026 11:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792149712; cv=none; b=oda15Owz/NXSifi8jJhdD5L5SgmknuLFFMDxrZ7zqqpGdDHsPgRcg5y9U3Gswdnd2GeVDeHg0iGrSb1qB17/Vei4XrghVOnSYO3i++u8UE9bxNBYARLPAzzjtPOodsoCfPQtn7LytcmWmKmFrqc6bvEphBI0hTpssmdEOV9MJTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792149712; c=relaxed/simple;
	bh=oi/9EU6e5cYtwsWehZ2m7dnsSzMNmAFIFcZvso5J7l0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y72j/Hlid8kpOQQyenYZY5++mvckiDtD5mS2Uc1+ZVeXJlXmZ9cehArVu9VhHOoKNpviyAi7KmCr8mgHk1t0BtKvoJlQtiSShfw6KSETt7OiGnnQg+ehCMyGg9plZWbvNq2K3A+WTRO/eM1ZWGcJmw1H9gdHv/s164Tzjno8g58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=grimler.se; spf=pass smtp.mailfrom=grimler.se; dkim=pass (1024-bit key) header.d=grimler.se header.i=@grimler.se header.b=STatmMgl; arc=none smtp.client-ip=95.215.58.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=grimler.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=grimler.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=grimler.se header.i=@grimler.se header.b="STatmMgl"
X-Envelope-To: linux-samsung-soc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=oi/9EU6e5cYtwsWehZ2m7dnsSzMNmAFIFcZvso5J7l0=;
 c=simple/simple; d=grimler.se;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792149701; v=1; x=1792754501;
 b=STatmMgl0PUwePx7zFZDkgygfjyzS6pZ09ylisLBkqLDCgaSYs7zPwFb83S+5j08K8Ze5gII
 wAEjzWCN/A5GM7DbWfq8W8MP7NPyyzJqtrsQPLa79zYJdtuBxuxg6neRHusqUIzn5vgd4bV097N
 yr2b9NjSZNRK26yQ4FPxqWWQ=
X-Envelope-To: linux-samsung-soc@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id d37b4f5d259aacf6;
	Fri, 16 Oct 2026 11:21:40 +0000
X-Mizu-Trace-ID: d37b4f5d259aacf6
X-Migadu-Flow: FLOW_OUT
Date: Fri, 16 Oct 2026 13:21:40 +0200
From: Henrik Grimler <henrik@grimler.se>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>
Subject: Re: [PATCH] clk: samsung: exynos5-subcmu: Defer probe until power
 domains are available
Message-ID: <20261016112140.GA17404@localhost>
References: <CGME20261013111847eucas1p24df37631cc74fa27879f7d979348a1e1@eucas1p2.samsung.com>
 <20261013111840.3645724-1-m.szyprowski@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261013111840.3645724-1-m.szyprowski@samsung.com>

Hi Marek,

On Tue, Oct 13, 2026 at 01:18:38PM +0200, Marek Szyprowski wrote:
> Sub-CMU devices are added to their power domains with
> of_genpd_add_device() during exynos5_clk_probe(). Its return value is
> ignored, so if the power domain provider is not registered yet, the
> sub-CMU device is silently left outside of its power domain.
> 
> Since commit c09a3e6c97f0 ("soc: samsung: pm_domains: Convert to regular
> platform driver"), power domain providers are registered only when their
> platform devices are probed, which happens after exynos5_clk_probe() has
> already been called.
> 
> When a sub-CMU device is outside of its power domain, its runtime PM
> callbacks race with the power domain state changes, which might result in
> losing the proper hardware state. In practice, some clock muxes are left
> switched to the oscillator instead of the respective PLLs.
> 
> Fix this by deferring exynos5_clk_probe() until the platform devices for
> all available power domains are instantiated.
> 
> Fixes: c09a3e6c97f0 ("soc: samsung: pm_domains: Convert to regular platform driver")
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

Reviewed-by: Henrik Grimler <henrik@grimler.se>

I have noticed the same issue on my boards, and the fix looks good to
me. Thanks for fixing it!

Best regards,
Henrik Grimler

> ---
>  drivers/clk/samsung/clk-exynos5-subcmu.c | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/samsung/clk-exynos5-subcmu.c b/drivers/clk/samsung/clk-exynos5-subcmu.c
> index 373129847301..587fe6e3bbed 100644
> --- a/drivers/clk/samsung/clk-exynos5-subcmu.c
> +++ b/drivers/clk/samsung/clk-exynos5-subcmu.c
> @@ -6,6 +6,7 @@
>  
>  #include <linux/io.h>
>  #include <linux/of.h>
> +#include <linux/of_platform.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_domain.h>
>  #include <linux/pm_runtime.h>
> @@ -155,11 +156,25 @@ static int __init exynos5_clk_register_subcmu(struct device *parent,
>  
>  static int __init exynos5_clk_probe(struct platform_device *pdev)
>  {
> +	static const char pd_node_name[] = "samsung,exynos4210-pd";
>  	struct device_node *np;
>  	const char *name;
>  	int i;
>  
> -	for_each_compatible_node(np, NULL, "samsung,exynos4210-pd") {
> +	/* Defer until all needed power domains are registered */
> +	for_each_compatible_node(np, NULL, pd_node_name) {
> +		if (of_device_is_available(np)) {
> +			struct platform_device *pd = of_find_device_by_node(np);
> +
> +			if (!pd) {
> +				of_node_put(np);
> +				return -EPROBE_DEFER;
> +			}
> +			put_device(&pd->dev);
> +		}
> +	}
> +
> +	for_each_compatible_node(np, NULL, pd_node_name) {
>  		if (of_property_read_string(np, "label", &name) < 0)
>  			continue;
>  		for (i = 0; i < nr_cmus; i++)
> -- 
> 2.43.0
> 
> 
