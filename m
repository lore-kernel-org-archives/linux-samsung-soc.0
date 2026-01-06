Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF46B29BD81
	for <linux-samsung-soc@vger.kernel.org>; Tue,  6 Jan 2026 04:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767675437; cv=none; b=STGWVmqFcyGZevMhMOK+2ta3Q5N2gJBsc8Qrp+HcCoUYv4lwOU5WephCw9j+df9sh213O/A0pLE+d6NWDATexZXSbg/Jba63OucjJy4rUnDYl5DCAv/u6ZC0QdXmFt40q26vDNTC0k8KA2/cSurVd8d8RhTIW+WoYYLqcgQHGb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767675437; c=relaxed/simple;
	bh=p/jbSDGwTWmm/8mvuCIwU/V1ZevpiU/zQiFsYrx82/U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h0khPLojLNSCgus0BqBrIUIgbN3jrUkpnp8iRHFHyH8OOiHABW62GruaoNT/vKM5RkiJEXMXUKobzkqlEmSgrx8uTlv9SEH+f2FyDKAeVbi0LEan/D4XRPsZq398yEWUirDia2S0Tn/XXacsDHRCrWbgfSGBz5PIMojcIbku4Mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aeQ2T6sO; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aeQ2T6sO"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7b75e366866so271564b3a.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 05 Jan 2026 20:57:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767675435; x=1768280235; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oOlNWZ1ASjDiM8/EVArPiKc25ePbXneuyrH70Dm1FmA=;
        b=aeQ2T6sOEkR1IaNfr8UXMfSjh5qNK9MAaImJemXo/+yaLOlWUpH96nV3QHper9tI34
         rStl3Qqi/+bJGF/tWh6e7blPBEVBGE5/J8w+1bJwzmGFyCvyRAB2yJ4z7k+QSDJYoVjh
         ZAZBdYid28yGTZiwlQ9yzvAODUwazplO3gt0p/5TaEiUgixO19rVgQiwOme1hiNf3j2v
         yj9nm7qQKzJ2lggijzxUa58ddpfA7DfBv9F4SvJPBQ/44tNXZRnFbcouUl8PC3u2qiiO
         bgesopMTThGZA9EhIY/ib3a7wH2eh1cElOLZtXJDAzo0jujY3tJsyxbi7E2/WFB0ZbWX
         oQHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767675435; x=1768280235;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oOlNWZ1ASjDiM8/EVArPiKc25ePbXneuyrH70Dm1FmA=;
        b=AzypJMhWxVsWKJIKX728QLOU2OaguSFYmTWC61YsuPPUJtpaFfBYj1V7kgoUI8EhNk
         D79BzmWozxYvO2Gb3bKwS9vZkJW36lLKm4068Bau9qeqAea+vg4pvzqazB1V+x9YPI7a
         2b30GErw+/rSEMo2WJLdYuGXly4abSJR2EAvs7+RaleP6pdinCx/Dmc5kMbjyuQwIo1y
         fAPTJx0ct6iUrhlas+0k740JpZApLt3Om+M5NRJ9Xav0wHHmZGimHb3klYoVuaxa26LK
         j8j/+auXtTrr3uQF5VPWOFFt8x2xkgi5KcBTFZ5MEVGvV+lO2Nxh1F3e+/pQ29Rq5ALl
         m6qw==
X-Forwarded-Encrypted: i=1; AJvYcCVOmreGWAgNrvvRPYh3jFUCC7DcrG/YXtZOU8DdutSpx7sDdy+MkVKOyrIs9pg9+iMVk52TGGCnXmNfa2Uopv7Ncg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwWUASKGlKUFWTXTilS8dmLpBTvHRWE8bIgBN8r4HXJEj0zrMsm
	9OGgFdGAJ0oC5l9Un54RCyR24BaQLpx0tdbCeDNtACa1HJY3pPNweBgZSCosvMdJWJU=
X-Gm-Gg: AY/fxX6OT4Fb0Y4+KnvOuU+Zv0e9hKunsfJZzw8ye5ONBjtwx0edX4bc81NsGDfPQDt
	NTUd9mq0Z4dqyWxVjlZSoBA9zCOxB6wlNfbLepBVcwBJ1ndedqKxswfuSiXDrJYgL24kdmdMDvR
	u6bnPrct86ctbJYFeez7Kh8pCK/FNGruJFu5Rz8IYKDe5xX2IEqIEw3Zh0AVe+teb3kyj9LPMTo
	6Kl1Bcxeth4CNx/js3WyqKb2/Afj+7jEPGgBNzaIeCYiJTGFIGThCO8A75Oog7bus2kLzP8T7rT
	sp3SgdzHShxTW940kT74nnmU5sdRyLFABlyahk1qerw4AZvHcvQrh/PIqJPrwMgjafjvc2MvCj/
	flMUzDPVWmHlMhUBJFTZjYNTPvVPkJK1UZr9nTkaiMAdRp0lwqu+gRxIMRFgdt6JFQpsS4ajIEn
	Iez+32NwnXilMp43Zk43YKPg==
X-Google-Smtp-Source: AGHT+IH1HIV++y2p498uUKeXICIqTonP/XkL+xU6dt4xBDj6CXKEeUOGv7lJojUw920KVFSDaG10IA==
X-Received: by 2002:a05:6a00:ad86:b0:7e8:43f5:bd3e with SMTP id d2e1a72fcca58-8187f78d9fdmr1867900b3a.42.1767675434866;
        Mon, 05 Jan 2026 20:57:14 -0800 (PST)
Received: from localhost ([122.172.80.63])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819baa1936dsm727051b3a.12.2026.01.05.20.57.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 20:57:14 -0800 (PST)
Date: Tue, 6 Jan 2026 10:27:12 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Russell King <linux@armlinux.org.uk>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Nipun Gupta <nipun.gupta@amd.com>, 
	Nikhil Agarwal <nikhil.agarwal@amd.com>, Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Vinod Koul <vkoul@kernel.org>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	llvm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-clk@vger.kernel.org, 
	imx@lists.linux.dev, dmaengine@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-pm@vger.kernel.org
Subject: Re: [PATCH 11/11] cpufreq: s5pv210: Simplify with scoped for each OF
 child loop
Message-ID: <g4k2qdsihxfawfsi5ie3w2fhbsd2x6z5heifkcte75c2w3sjg3@cofrjgaiilta>
References: <20260105-of-for-each-compatible-scoped-v1-0-24e99c177164@oss.qualcomm.com>
 <20260105-of-for-each-compatible-scoped-v1-11-24e99c177164@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260105-of-for-each-compatible-scoped-v1-11-24e99c177164@oss.qualcomm.com>

On 05-01-26, 14:33, Krzysztof Kozlowski wrote:
> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.  Note that there is another part of code using "np"
> variable, so scoped loop should not shadow it.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> Depends on the first patch.
> ---
>  drivers/cpufreq/s5pv210-cpufreq.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/cpufreq/s5pv210-cpufreq.c b/drivers/cpufreq/s5pv210-cpufreq.c
> index ba8a1c96427a..e64e84e1ee79 100644
> --- a/drivers/cpufreq/s5pv210-cpufreq.c
> +++ b/drivers/cpufreq/s5pv210-cpufreq.c
> @@ -629,19 +629,17 @@ static int s5pv210_cpufreq_probe(struct platform_device *pdev)
>  		goto err_clock;
>  	}
>  
> -	for_each_compatible_node(np, NULL, "samsung,s5pv210-dmc") {
> -		id = of_alias_get_id(np, "dmc");
> +	for_each_compatible_node_scoped(dmc, NULL, "samsung,s5pv210-dmc") {
> +		id = of_alias_get_id(dmc, "dmc");
>  		if (id < 0 || id >= ARRAY_SIZE(dmc_base)) {
> -			dev_err(dev, "failed to get alias of dmc node '%pOFn'\n", np);
> -			of_node_put(np);
> +			dev_err(dev, "failed to get alias of dmc node '%pOFn'\n", dmc);
>  			result = id;
>  			goto err_clk_base;
>  		}
>  
> -		dmc_base[id] = of_iomap(np, 0);
> +		dmc_base[id] = of_iomap(dmc, 0);
>  		if (!dmc_base[id]) {
>  			dev_err(dev, "failed to map dmc%d registers\n", id);
> -			of_node_put(np);
>  			result = -EFAULT;
>  			goto err_dmc;
>  		}
> 

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
