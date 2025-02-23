Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4754C1FBEBB
	for <linux-samsung-soc@vger.kernel.org>; Sun, 23 Feb 2025 23:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740354722; cv=none; b=KK+tYIr0YYeX+5GTUKdk+FoWuErMov5hySw7wt4GVVucs9XQ473aPHKVY6uQOmesbfx4ce94anwlqdOm3STQUH9Sb2TxCXz86rrH07uAtq8kJRYUb/Es/P+vEVFOSZQkaTlWmZ41I8P7E+zUpWP4s4oyKgZOiwq8nL1rekey+Tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740354722; c=relaxed/simple;
	bh=cVnkL0OykbviiyBibblWdxGIMtt3l46QEn5+cgf3624=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z0SQ8/a89jRB39HZsEHJGZPsu//zd7egzFEGZhHa9b9GzldoFtSZNp/FixaJHU0/Tmn3eAFUMu3FTSmnFCc8r5wknUKwTvLRnljXeCGq2AGS0tsDsBEvoMfBPRNBQEvFczfaZyJCZWYU46tI9qIXJXmT0Z+NpSfd+QEf+iPbUbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AC8MTrwM; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AC8MTrwM"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-30a28bf1baaso34224361fa.3
        for <linux-samsung-soc@vger.kernel.org>; Sun, 23 Feb 2025 15:51:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740354718; x=1740959518; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZqpsSfd4hK9sMOyyiNPBFdSaUXrM9eOMXEQlPVLZ1L4=;
        b=AC8MTrwMoPeeFkM3OZA+Uyqwp9FIDY3KLJwf6dSg1pmoj72j3tneWZ028YrW0SO7mN
         HR0WGvBcusaivXlIOq+o0BorOULyx3/vSXQu8Banrfm4M5yeIj+KEEcwHy49KPjTKFv7
         pLGbc7fuPUdaXxBATogUbVWQcqvz+kECGjTdEbZ2in1u4FTPN13XTuZSMOkAtZnXrtH+
         1qP1IUh7JfIwffmwAJZYbHOl/GGX2dt4SF0B2HgepACL3dQdo2umdKm5c0TSoh6b8NyX
         Keml95KywYgSRAOOGWd9K2VlHsSJrb6VRkjmTILgadTYVJCTDV+lkhysNX7YOpJZ2apf
         m83Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740354718; x=1740959518;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZqpsSfd4hK9sMOyyiNPBFdSaUXrM9eOMXEQlPVLZ1L4=;
        b=fjCVBty36hjB95wtYcnQxF/jXGAzXuoMMU20mxVCNsYJIWO9sCtr/bhgS1DXcIYj28
         2/i/oUIYZVPVGNnLHYVvidOP6uYh8fAArVWII/DiwY67gk/VJx2qNsDeOgZ+iXO24X1J
         D7mXJ7Cxm8yAiLTb04tSWAuV87Q8ijWYOeAgPyTwh55kaFs4Z1ZrJzdHhrDCwLPxg0/d
         rT9aOCJKCeNGrdKSwYK3DNLF/I3wntx+2jdsLgFafaYHr9gibSX4u/vkykxS+ckJ3dXa
         ApRdyy7lUM6m7L07KckBiXMMNBkzvIDL4HIUUUijZjVbb5ggBz/jR1wA8uuOu31KM9Qo
         6HMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtbbvJsYhbu3+1SPnMhtJrlXDyjQqq73JoWVr8u53nQz7aTyciPzlCf6XCUqKhJHj04VQeb/lxcLmxe4/T4wHw0Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyVJuosLrurZt79OdrRz4QNeuO3qQk+0CxD5nVNxJERs3PeDiQA
	RqFHktxW6n+IcMpKCpt028l4gv6j99os/Z4MJydFWM0K/1giRs4SQy5eS64bhGn5xa4Y4wPt9Jm
	q
X-Gm-Gg: ASbGnctuHiKVapYrtU6JgePcIt5mgccvTP7Xtv13/0NoHKgndt2wScS+TvQpkkEpsr0
	5706/EDeETtKgL+DWItLUtEDNQnCk767+dXqMkPZ0QY+tvEvJNjpXhWIsNYkOoGII29n1S7PXu3
	txLfhg/47Mh8tDG9hlwE0sgX4BlCevL/CkHvJ01Qt75o/QfioLq44hsZkoJ70xI8frt+9CPf55k
	wIHeK0+aSLb1tKn9USABdXREs0AUHJLh/BhGQrZNfeuY8rNc/tW/79v9sy+mWXjA9F90b5Vlpkd
	mlqr1PN7UoUvKbDfDQ6FPwxRkp6DPiOsjGKEKBE+4VGESYeJ8Es23xXk8wXfB1BgDlYfKdumxMT
	/+C+WFw==
X-Google-Smtp-Source: AGHT+IEpJwtjfAQELBV6QLX+Dx/RJbukpSeVjI5C/XlxolpeCymBYYRyu1xtRVKJ/uK17lMxs8fvVw==
X-Received: by 2002:a05:6512:12c4:b0:546:3136:f03d with SMTP id 2adb3069b0e04-5483925996emr3876237e87.35.1740354718344;
        Sun, 23 Feb 2025 15:51:58 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54530df9016sm2706600e87.36.2025.02.23.15.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 15:51:56 -0800 (PST)
Date: Mon, 24 Feb 2025 01:51:54 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Abel Vesa <abel.vesa@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 7/8] phy: phy-snps-eusb2: add support for exynos2200
Message-ID: <ac7bq3toicuoppmspqvohiss5wkhgw4v6aozzstd5pr66bfcse@k7tqijab4csq>
References: <20250223122227.725233-1-ivo.ivanov.ivanov1@gmail.com>
 <20250223122227.725233-8-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250223122227.725233-8-ivo.ivanov.ivanov1@gmail.com>

On Sun, Feb 23, 2025 at 02:22:26PM +0200, Ivaylo Ivanov wrote:
> The Exynos2200 SoC reuses the Synopsis eUSB2 PHY IP, alongside an
> external repeater, for USB 2.0. Add support for it to the existing
> driver.
> 
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> ---
>  drivers/phy/Kconfig          |   2 +-
>  drivers/phy/phy-snps-eusb2.c | 172 +++++++++++++++++++++++++++++++++++
>  2 files changed, 173 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
> index 11c166204..58c911e1b 100644
> --- a/drivers/phy/Kconfig
> +++ b/drivers/phy/Kconfig
> @@ -45,7 +45,7 @@ config PHY_PISTACHIO_USB
>  
>  config PHY_SNPS_EUSB2
>  	tristate "SNPS eUSB2 PHY Driver"
> -	depends on OF && (ARCH_QCOM || COMPILE_TEST)
> +	depends on OF && (ARCH_EXYNOS || ARCH_QCOM || COMPILE_TEST)
>  	select GENERIC_PHY
>  	help
>  	  Enable support for the USB high-speed SNPS eUSB2 phy on select
> diff --git a/drivers/phy/phy-snps-eusb2.c b/drivers/phy/phy-snps-eusb2.c
> index 7a242fe32..67a19d671 100644
> --- a/drivers/phy/phy-snps-eusb2.c
> +++ b/drivers/phy/phy-snps-eusb2.c
> @@ -13,6 +13,39 @@
>  #include <linux/regulator/consumer.h>
>  #include <linux/reset.h>
>  
> +#define EXYNOS_USB_PHY_HS_PHY_CTRL_RST	(0x0)
> +#define USB_PHY_RST_MASK		GENMASK(1, 0)
> +#define UTMI_PORT_RST_MASK		GENMASK(5, 4)
> +
> +#define EXYNOS_USB_PHY_HS_PHY_CTRL_COMMON	(0x4)
> +#define RPTR_MODE			BIT(10)
> +#define FSEL_20_MHZ_VAL			(0x1)
> +#define FSEL_24_MHZ_VAL			(0x2)
> +#define FSEL_26_MHZ_VAL			(0x3)
> +#define FSEL_48_MHZ_VAL			(0x2)
> +
> +#define EXYNOS_USB_PHY_CFG_PLLCFG0	(0x8)
> +#define PHY_CFG_PLL_FB_DIV_19_8_MASK	GENMASK(19, 8)
> +#define DIV_19_8_19_2_MHZ_VAL		(0x170)
> +#define DIV_19_8_20_MHZ_VAL		(0x160)
> +#define DIV_19_8_24_MHZ_VAL		(0x120)
> +#define DIV_19_8_26_MHZ_VAL		(0x107)
> +#define DIV_19_8_48_MHZ_VAL		(0x120)
> +
> +#define EXYNOS_USB_PHY_CFG_PLLCFG1	(0xc)
> +#define EXYNOS_PHY_CFG_PLL_FB_DIV_11_8_MASK	GENMASK(11, 8)
> +#define EXYNOS_DIV_11_8_19_2_MHZ_VAL	(0x0)
> +#define EXYNOS_DIV_11_8_20_MHZ_VAL	(0x0)
> +#define EXYNOS_DIV_11_8_24_MHZ_VAL	(0x0)
> +#define EXYNOS_DIV_11_8_26_MHZ_VAL	(0x0)
> +#define EXYNOS_DIV_11_8_48_MHZ_VAL	(0x1)
> +
> +#define EXYNOS_PHY_CFG_TX		(0x14)
> +#define EXYNOS_PHY_CFG_TX_FSLS_VREF_TUNE_MASK	GENMASK(2, 1)
> +
> +#define EXYNOS_USB_PHY_UTMI_TESTSE	(0x20)
> +#define TEST_IDDQ			BIT(6)
> +
>  #define QCOM_USB_PHY_UTMI_CTRL0		(0x3c)
>  #define SLEEPM				BIT(0)
>  #define OPMODE_MASK			GENMASK(4, 3)
> @@ -196,6 +229,93 @@ static void qcom_eusb2_default_parameters(struct snps_eusb2_hsphy *phy)
>  				    FIELD_PREP(PHY_CFG_TX_HS_XV_TUNE_MASK, 0x0));
>  }
>  
> +static int exynos_eusb2_ref_clk_init(struct snps_eusb2_hsphy *phy)
> +{
> +	unsigned long ref_clk_freq = clk_get_rate(phy->ref_clk);
> +
> +	switch (ref_clk_freq) {
> +	case 19200000:
> +		snps_eusb2_hsphy_write_mask(phy->base, EXYNOS_USB_PHY_HS_PHY_CTRL_COMMON,
> +					    FSEL_MASK,
> +					    FIELD_PREP(FSEL_MASK, FSEL_19_2_MHZ_VAL));
> +

Could you please unify the switchcase? assign the values to temp
variables, then program them from a single code stream. Or maybe even
replace switch-case with a table-based lookup.

(we probably should implement the similar change for qcom part. Maybe
you can refactor it too?)

Other than that LGTM.

> +		snps_eusb2_hsphy_write_mask(phy->base, EXYNOS_USB_PHY_CFG_PLLCFG0,
> +					    PHY_CFG_PLL_FB_DIV_19_8_MASK,
> +					    FIELD_PREP(PHY_CFG_PLL_FB_DIV_19_8_MASK,
> +						       DIV_19_8_19_2_MHZ_VAL));
> +
> +		snps_eusb2_hsphy_write_mask(phy->base, EXYNOS_USB_PHY_CFG_PLLCFG1,
> +					    EXYNOS_PHY_CFG_PLL_FB_DIV_11_8_MASK,
> +					    EXYNOS_DIV_11_8_19_2_MHZ_VAL);
> +		break;
> +
> +	case 20000000:
> +		snps_eusb2_hsphy_write_mask(phy->base, EXYNOS_USB_PHY_HS_PHY_CTRL_COMMON,
> +					    FSEL_MASK,
> +					    FIELD_PREP(FSEL_MASK, FSEL_20_MHZ_VAL));
> +
> +		snps_eusb2_hsphy_write_mask(phy->base, EXYNOS_USB_PHY_CFG_PLLCFG0,
> +					    PHY_CFG_PLL_FB_DIV_19_8_MASK,
> +					    FIELD_PREP(PHY_CFG_PLL_FB_DIV_19_8_MASK,
> +						       DIV_19_8_20_MHZ_VAL));
> +
> +		snps_eusb2_hsphy_write_mask(phy->base, EXYNOS_USB_PHY_CFG_PLLCFG1,
> +					    EXYNOS_PHY_CFG_PLL_FB_DIV_11_8_MASK,
> +					    EXYNOS_DIV_11_8_20_MHZ_VAL);
> +		break;
> +

-- 
With best wishes
Dmitry
