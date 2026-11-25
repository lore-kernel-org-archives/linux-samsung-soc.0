Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795640360;
	b=YJNuQrXAN+cOcFFOhsqkqiIIY/0Ss3JEKy+tYeilDoLIjmfGQa1v7nar4kIHHP2jpzna
	 amrl6szCkT+JE9LSLwLJJ8BswlYYFppVE5meaNaXL1ofitrcGHnGxU9u2L0onvqnRsWIF
	 aKft2QdXYP5t3bkOwIBLBTpJibYSVsIiUlnlng0w1bhejruBiV8a+3UqOV9RPs37iQWuh
	 KKaA1mSivwAcXCTjHEzgeTy3UzdOQYCAqwvynHuFxMofQqQF2XXRed9mDHqPUtFIy7FTn
	 MyVu/wYuknSz7EormkXZGUQ9T8haJupZMHz6cnRn3wqxuCe2edqBAHUNCPv/FWmtt5g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795640360;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=PXBgJMIY+nvFjiJk/u8SJDhKaneIc4smuRh4J/SjTx8=;
	b=Dmh35pqEuBo+cXvoe43/cocqmFAc6xUVfiOQ6Zfe0/S71AesKX9m5fnFKvtc8Ow/+l0k
	 cKeE7HZNTzRiULv+P3tq2i+XWOJAEOZ9BX7Zcv9LdjLgSjQdXsvHgpuLGwz14y2p+lucT
	 iiInkoq9w2rxtd8dkZNmMNx62GvPwkLyniAiflawYcvKYb4E8qfNOt0g3dgPz/vRuBxlL
	 Lljd3dvbZJ4CNL4P2tRY5TmbRL89glH42Xvhjl9UugIsjG8mfQCArUES0nXkG0pwVoKOQ
	 3TuS3cbEoKjSVmHpOiG4QgurOwcLNNFN35a5oO8nwiVOvm64oGiVFwZeGM4T8W5cPqA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=XX+oVSvl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C054606A321
	for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Nov 2026 20:59:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C054606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=XX+oVSvl
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6bab377105dso4914634a12.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Nov 2026 12:59:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795640358; cv=none;
        d=google.com; s=arc-20260327;
        b=l/qrkEZD3AoU8OD+XMNwRzkA8r4VVK4H2hLVL7Yw3UHgTZBk+df8/5D91ZRXST6Gic
         kdYZV7ftFHOSBGcCjNg7Hnc649Qz7ZD/35+fbs4c3PR3ZAGrL1IDUVGYDUhGcAnY91dk
         oTc/Szj/yHie0GSK5RsO79lwW7ONnKBNxOI+b1JTUaiilZIytVOWCNdSJYLAWmwisBzE
         fVyTvOcDVcmCw4WVqRaMQYHX/7Z6dtapgeDkqVt4seMqdTXj/ghN7W8fp6YzEvfQJQ8U
         i8zNP5KaO32uucSU5RJtWHxHbfhb/3xoVDxFlVOc4weY/Ow2XSaOlzeHUpVKFvK6jHuY
         qGQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=PXBgJMIY+nvFjiJk/u8SJDhKaneIc4smuRh4J/SjTx8=;
        fh=kz0bIWqAM3ZVxrjD6Hfbfl5to9U/85kY0+PhFig+YTw=;
        b=S0T5fOOIim3gl2xUtx1JVbbxVFHwEXy+Q+lOUT7SxSvJe88AfYYkSq/6tI+8CYsRQ1
         rvBw2ysPCBXZlvlvKH7Qsll869qU1yT7eAReoa13r7ys2IlC9kdoXAWt3cHrMg0rUDtL
         WBa2oLUzNECzcy19hCdHPhM0ZwvotQtjn5SmTY7NrB2XobSjKH39UbPil0phpUZ1agrW
         gv20SBjoAJw07kG/zriNobuLgXXAUZRDwDTKEelFXRrUJca5fVIcnC9DPiXMhl7eziK3
         7AB7hvhEQovLKhpsx9i6VpjOYUmMPGY29owNUsbVTspym+r7IY/X3cIH509TIACzNnKB
         62hg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795640358; x=1796245158; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PXBgJMIY+nvFjiJk/u8SJDhKaneIc4smuRh4J/SjTx8=;
        b=XX+oVSvlwbkZJl/q7Fv5V3x1hehf+uCE6xb9HMTUuDbF0ZguAJu6UzBvMyjr+3Fj+3
         Nvvze0tQocy6EAVfwsaasTedqzOkcNCy/4uKy4ga9ffBNEU7meDWoVRIhaMd/gGGMdI7
         lq5DNc74gydvwyL0KrWQjZceHBDyui3QPZeJfkBAj+1uk1bV6V6TfjBr0CGUgjMNGPgc
         30FyNBH/PxEbZNh5NMMvBcC6d1IEiDTbCGmTdLvEdJHnoUn9P1A4ajQO/glmLAXbn1d/
         mfEWoGHROTKpQHjsOwdD0NEQ3Fr4qoUCiHkHuoHNdnRzqEcdcHzI4Nnw4O/QDAzqRJsK
         rQ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795640358; x=1796245158;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PXBgJMIY+nvFjiJk/u8SJDhKaneIc4smuRh4J/SjTx8=;
        b=HW9VV16/7iXNeCwfIL8GETHB6oNVhR3Mo1nzamddLhoKxUC1N6JQkWLIT3r/CcCmta
         /zJA4NNbKX/XVUo3eN4AKprovDzJAwzdXclQVbSzPwC+BAWQIcVW9C9633vQpACKRFpJ
         ezs5NWCchDW3A/biLAHYKAvELLLPh+Ebk1ETMQVJz+h3fuxD/X0McmverW8cAJ0ct1ed
         e1XZusgor0FGnLvwnNQb8rWI1aMLndrmlbph2DLHDvp5AWesXlpK0jIpvhwOZLKRkfp3
         9bfN4t8LedEn6l1BFVQm7P8917q5gcdrRhAtSDD1pJ7MDmrTfE4RCuNIZ9mV+ooMNVqA
         yTaA==
X-Forwarded-Encrypted: i=1; AL+hErGqqfY2XZiamWjnPvysbSsRhmmp7+b90nPw5YLd8bQXQ0FtEdQGugOMVyYHVbYnXeu77wXHMZdk44sWutnzJFFA7g==@vger.kernel.org
X-Gm-Message-State: APuU4Z81fMF8j3kT4pS4UD3DFRBERxaW+lVNylot4n9aQX4U1/5OTkl9
	d4bqEcU+3FGcwba2hVeLLAM4GBMo4HFZfnd246C6HQu3k/VJDu7U+17NqdB9KghvksQiYJtYho0
	BlFiVERhtlaibrew5nxfxjpJoKnAv2ep8kD3VqehV6A==
X-Gm-Gg: AZFdTZdS81J+6hkAEsLYczOxBjYmnx7pzqgq6w+l0dngPdnMxbzKwwatNUD7ND5o7Nc
	2SAYEE4z4Jooyym9py1Wh0tDeU2rhSJXVypyGwh5KE43LlZG/Lk9CKfgb5KW5fpldMsCmUUr7kh
	yfoxIwmuQDW4zcUkdS8F+vmEMsMyxWTrKMo9WxXKbDGXJcSwnp50XnYW9OdIJLGVnuupJnGvS2T
	sTFzs4r3xHIAh1wfg3BbYrjqNt8kqF78/goP1yE0/pI+y6aN2mjDCEWiVr8qgbNkdIArCZ9oMxE
	X+UF5lwfGjEdIDSNMMrPaajSbEZ9oonyXgjhcbYjiBRH7wBCHzRws0aciZ0xwGGSTqSaOZm/d5s
	jZ0OyuqGyMzL/T3K46oqjYwdp1QZ/ArLxp0S4rV/8mFNbhaXvExORH/FxQtzPdcH2p1Y7Z5U=
X-Received: by 2002:aa7:cf85:0:b0:6b1:a509:875 with SMTP id
 4fb4d7f45d1cf-6ba37e66febmr9344235a12.20.1795640358409; Wed, 25 Nov 2026
 12:59:18 -0800 (PST)
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123164834.3330320-1-lee@kernel.org> <20261123164834.3330320-8-lee@kernel.org>
In-Reply-To: <20261123164834.3330320-8-lee@kernel.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 25 Nov 2026 20:59:06 +0000
X-Gm-Features: Aa3M54qBKC7-tr-B2jw-93nT_AW_sr-oGI0v4yuTHgh0h7sm-7QQngWZhmScpnM
Message-ID: <CADrjBPq2OmgLjzs8qYybQSKRDBC5QK5DTrO8Wy4gbUoo0Ydu6g@mail.gmail.com>
Subject: Re: [PATCH 07/10] clk: samsung: exynos5420: Terminate PLL rate tables
 with sentinels
To: Lee Jones <lee@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Thomas Abraham <thomas.ab@samsung.com>, 
	Chander Kashyap <k.chander@samsung.com>, Amit Daniel Kachhap <amit.daniel@samsung.com>, 
	Tomasz Figa <t.figa@samsung.com>, Lukasz Luba <lukasz.luba@arm.com>, 
	Marian Mihailescu <mihailescu2m@gmail.com>, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 23 Nov 2026 at 16:49, Lee Jones <lee@kernel.org> wrote:
>
> _samsung_clk_register_pll() sizes each PLL rate table by scanning until
> it encounters an entry with .rate == 0, then copies the counted entries
> into pll->rate_table.  However, exynos5420_pll2550x_24mhz_tbl,
> exynos5422_bpll_rate_table, exynos5420_epll_24mhz_tbl, and
> exynos5420_vpll_24mhz_tbl all omit a terminating zero sentinel, causing
> out-of-bounds reads into adjacent read-only data and populating
> pll->rate_table with bogus entries.
>
> Append a sentinel entry to each of the four PLL rate tables.
>
> Fixes: ca5b40293822 ("clk: samsung: register exynos5420 apll/kpll configuration data")
> Fixes: 9842452acd3d ("clk: samsung: exynos542x: Add EPLL rate table")
> Fixes: 8b4a7acf7b30 ("clk: samsung: add BPLL rate table for Exynos 5422 SoC")
> Fixes: b92981de92cb ("clk: samsung: exynos5420: Add VPLL rate table")
> Closes: https://sashiko.dev/#/bug/linux-553831f9-0a7b-4e94-be60-222de60ca8c3
> Cc: stable@vger.kernel.org
> Signed-off-by: Lee Jones <lee@kernel.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  drivers/clk/samsung/clk-exynos5420.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
> index 400a5c59815c..35baeabf3ccb 100644
> --- a/drivers/clk/samsung/clk-exynos5420.c
> +++ b/drivers/clk/samsung/clk-exynos5420.c
> @@ -1419,6 +1419,7 @@ static const struct samsung_pll_rate_table exynos5420_pll2550x_24mhz_tbl[] __ini
>         PLL_35XX_RATE(24 * MHZ, 400000000,  200, 3, 2),
>         PLL_35XX_RATE(24 * MHZ, 300000000,  200, 2, 3),
>         PLL_35XX_RATE(24 * MHZ, 200000000,  200, 3, 3),
> +       { /* sentinel */ }
>  };
>
>  static const struct samsung_pll_rate_table exynos5422_bpll_rate_table[] = {
> @@ -1430,6 +1431,7 @@ static const struct samsung_pll_rate_table exynos5422_bpll_rate_table[] = {
>         PLL_35XX_RATE(24 * MHZ, 275000000, 275, 3, 3),
>         PLL_35XX_RATE(24 * MHZ, 206000000, 206, 3, 3),
>         PLL_35XX_RATE(24 * MHZ, 165000000, 110, 2, 3),
> +       { /* sentinel */ }
>  };
>
>  static const struct samsung_pll_rate_table exynos5420_epll_24mhz_tbl[] = {
> @@ -1448,6 +1450,7 @@ static const struct samsung_pll_rate_table exynos5420_epll_24mhz_tbl[] = {
>         PLL_36XX_RATE(24 * MHZ,  49152000U, 197, 3, 5, -25690),
>         PLL_36XX_RATE(24 * MHZ,  45158401U, 90, 3, 4, 20762),
>         PLL_36XX_RATE(24 * MHZ,  32768001U, 131, 3, 5, 4719),
> +       { /* sentinel */ }
>  };
>
>  static const struct samsung_pll_rate_table exynos5420_vpll_24mhz_tbl[] = {
> @@ -1459,6 +1462,7 @@ static const struct samsung_pll_rate_table exynos5420_vpll_24mhz_tbl[] = {
>         PLL_35XX_RATE(24 * MHZ, 266000000U,  266, 3, 3),
>         PLL_35XX_RATE(24 * MHZ, 177000000U,  118, 2, 3),
>         PLL_35XX_RATE(24 * MHZ, 100000000U,  200, 3, 4),
> +       { /* sentinel */ }
>  };
>
>  static struct samsung_pll_clock exynos5x_plls[nr_plls] __initdata = {
> --
> 2.56.1.750.gf70dc682cf-goog
>
