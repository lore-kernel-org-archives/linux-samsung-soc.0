Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D613C13E0
	for <linux-samsung-soc@vger.kernel.org>; Mon, 18 May 2026 11:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779102231; cv=none; b=cxC1eVkic9ov0MMfsdxl08T4yz3/KhrjKTeskOKa6/dRyVU3ypA61kdAQl59EVANqQESOLDxfebCfQPyuJZCkh5HIDgF0XWz/u5JY7m+Ej+hhkOoWinLp5g6MZQl8PQ9YRGAhD5Hhwjh3cZAr8sRxeCQiAyvyafdw9GxH8GvWeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779102231; c=relaxed/simple;
	bh=2azSRqyFV+owNxP9S5U/2/KiWIBGYAW64WefxqX8o+w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dq8B4q+VgFZ5oIVJ7QdLZoh3te/bpVdfmYwaiYQLb/qAT0LHhPqHsQv+epWeGdkkWgwrf8w3Y224xI5UKUiUpUwEHsxf3eioASiateQGHjTSBfe0Sj23fwxtYTQ8FwKt2SnR6zvTmbAvZjCSdO7SMCsNr6ZR1oO06UiN2gy9ABw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zqLsGYIo; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zqLsGYIo"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-488a14c31eeso12539845e9.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 18 May 2026 04:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779102224; x=1779707024; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ym6sU3N+ufw6A47V79Zg3TdaXBrPKwoqv75wbzIWhrg=;
        b=zqLsGYIotoXeoHpfVNbNGabN/5Eyt28OizbZhUvDyX4Cjgqm4BC89pfWSUpiZ83enQ
         Gw+PdL2Y567k9b1GfTywVB3SvX/3lgE+JWZV6swedwk+9Gj3Qd8imU5oACRKz6sZ8mNk
         e64bumy+g/uKIf2uKy00MAH6YjFeThFG7Kpd7sIMj57pU932f4p45QmJhaWR0WF3YtMh
         qY8I5QIkRFfzeCmZziVDSX+8ooBW4wfDMTgaTISjy9NwCqGLe1vgHsiqyHl+BPB+mFGZ
         wNkwtDwjjH+PsSTbBrbf0XwjXxbPxwlC3Me5FRQDFIvA1gfdnX0QczM9eWazFVGbAw8C
         znzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779102224; x=1779707024;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ym6sU3N+ufw6A47V79Zg3TdaXBrPKwoqv75wbzIWhrg=;
        b=l74RSVKMrdakzmwKlkFzHZqfpUz2nuEPUXGoj9I/S5WLrv/PEF/8J9pziXLCMWiGuC
         9SAtpSwYU0QKf0EsI3vDN8eyDWxmVDtLvMOIrZwyGh67jMwSmJUFvlh6KCreqoxjwiG1
         zd+/vrc6hzmK5/2NmUG621Lx1mPqw1/Lwue78AInu02wvHfYD03LtT+qMAP0F7Ri91OX
         a248RP5Ly0VM22UtGI29n66r42ECK1ufnz/ZQBcjdDH+RqpcPQ8FmdkEBrY/Fo1u6how
         39YtapqPlZLCsBOINNN0bB0ygwzM8X4d0NgIkps7hwzbSIids3rtepjG9+tE079bFz+v
         R+wA==
X-Gm-Message-State: AOJu0YyPhdeTizqMEeQxLYHPWGo9vShPJ6Ub9aGSvqltbo5MYLq7sRcD
	vY1OaHICtDXve9UbDVVMlN7dqYIS3ZmXuMmTlCXZcn8RJZ/IM+i0job69aVy+H1CbT4=
X-Gm-Gg: Acq92OEg0NdZOgy9ilK0sgGR4Sy0WopV27qPigfB43JAIngLqcSUmYDe1151Bpz/6MU
	HJnFLpMG0+3wWyJt0EU9JcggK+X7OGG9Y0n1xL1/wZl5rq8gmUkRTWtlcgxz3u39UMjZ9IGN5LP
	TQIWLQMvjHp2m0OYFKYpv0I5J95XjrzUuf2pmlch1nQgSB5MRFTkA5hvGfVoWfqTsEQGIy/6QSF
	APdG3MxJM+2G17V2q9gMbPdke03FpwrwEPhitrw1IaMoJPQ1+MVIamx29QCPX9e830UwP3Cqoez
	sHnYfK2leutLByviS/3K2/8XhKfe30l0OWr6laRxAVnAMtiDocNAA6R323ePswu9Ltx2K5JPwni
	mJhhDMmwXg74UAoSJ/6iVPys3Avk/kawOio6IkQice4RF487gQBEfzmXA+9/ceIUNtW2pBEAfGW
	RHIvza/WrjAtYviynpJyuX8l5bzq1NdhY=
X-Received: by 2002:a05:600c:310f:b0:48f:d346:e646 with SMTP id 5b1f17b1804b1-48fe60d5693mr204370815e9.10.1779102223732;
        Mon, 18 May 2026 04:03:43 -0700 (PDT)
Received: from [10.11.12.109] ([82.76.215.73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe5694fcasm229778475e9.5.2026.05.18.04.03.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 04:03:43 -0700 (PDT)
Message-ID: <1cfd32ac-4f28-4478-9f39-e75c3e12fd44@linaro.org>
Date: Mon, 18 May 2026 14:03:40 +0300
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: samsung: acpm: add initial Exynos850 support
To: Alexey Klimov <alexey.klimov@linaro.org>,
 Sam Protsenko <semen.protsenko@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260512-exynos850-acpm-clk-v1-0-837532ddbf38@linaro.org>
 <20260512-exynos850-acpm-clk-v1-2-837532ddbf38@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260512-exynos850-acpm-clk-v1-2-837532ddbf38@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/12/26 11:40 PM, Alexey Klimov wrote:
> The Exynos850 SoC utilizes the APM co-processor for clock management
> via ACPM, similar to the GS101 SoC.
> 
> Add the Exynos850-specific clock variant array (including mif, int,
> cpucl0, cpucl1, g3d, aud, cam, disp, and cp) and wire it up to the
> driver data infrastructure. Add the "exynos850-acpm-clk" device ID
> to enable dynamic instantiation of these clocks during probe().
> 
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  drivers/clk/samsung/clk-acpm.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/drivers/clk/samsung/clk-acpm.c b/drivers/clk/samsung/clk-acpm.c
> index 604604b5b814..d9b2604db03a 100644
> --- a/drivers/clk/samsung/clk-acpm.c
> +++ b/drivers/clk/samsung/clk-acpm.c
> @@ -40,6 +40,18 @@ struct acpm_clk_driver_data {
>  		.name		= cname,		\
>  	}
>  
> +static const struct acpm_clk_variant exynos850_acpm_clks[] = {
> +	ACPM_CLK("mif"),
> +	ACPM_CLK("int"),
> +	ACPM_CLK("cpucl0"),
> +	ACPM_CLK("cpucl1"),
> +	ACPM_CLK("g3d"),
> +	ACPM_CLK("aud"),
> +	ACPM_CLK("cam"),
> +	ACPM_CLK("disp"),
> +	ACPM_CLK("cp"),
> +};

What clocks did you test from the array?

you need bindings for the clocks, otherwise you'll reference the clocks
in device tree with raw integers. See:
See include/dt-bindings/clock/google,gs101-acpm.h.

Since the bindings patch have to be defined in their own patch:
Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

> +
>  static const struct acpm_clk_variant gs101_acpm_clks[] = {
>  	ACPM_CLK("mif"),
>  	ACPM_CLK("int"),
> @@ -57,6 +69,12 @@ static const struct acpm_clk_variant gs101_acpm_clks[] = {
>  	ACPM_CLK("bo"),
>  };
>  
> +static const struct acpm_clk_driver_data acpm_clk_exynos850 = {
> +	.clks = exynos850_acpm_clks,
> +	.nr_clks = ARRAY_SIZE(exynos850_acpm_clks),
> +	.mbox_chan_id = 0,
> +};
> +
>  static const struct acpm_clk_driver_data acpm_clk_gs101 = {
>  	.clks = gs101_acpm_clks,
>  	.nr_clks = ARRAY_SIZE(gs101_acpm_clks),
> @@ -173,6 +191,7 @@ static int acpm_clk_probe(struct platform_device *pdev)
>  }
>  
>  static const struct platform_device_id acpm_clk_id[] = {
> +	{ "exynos850-acpm-clk", (kernel_ulong_t)&acpm_clk_exynos850 },
>  	{ "gs101-acpm-clk", (kernel_ulong_t)&acpm_clk_gs101 },
>  	{}
>  };
> 

