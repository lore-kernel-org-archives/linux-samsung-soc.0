Received: from mail-vs2-f43.google.com (mail-vs2-f43.google.com [74.125.227.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B3324AA3EB
	for <linux-samsung-soc@vger.kernel.org>; Fri,  2 Oct 2026 15:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790953332; cv=pass; b=E6Q1Whe4YRD0ykDs/rn5XatrbGQkyS5WMOTabb472bDYLgMTyxWoRfeRieIUpiLUdBWgDhztx0RDPXmrEDfyExAgNC/9HHxf23lAo9rb7s7AmryImVE3HMFzIQIkT2KTC4xCTVxn5HRYeYajLGLL8MOGtb9ThRgfvKmS/QdGQq8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790953332; c=relaxed/simple;
	bh=Nihuo5Y1J+JNGMGXPcGfvABsTM685RdMjow6I2pzz/Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GoZvdmMKgYTfxa2t6B9VLagkRae/L+hpVCEI559ySFz+pmylOy12rdyPJQPs4tMFtEhddAgA12HZNM/U2uu2xafL0rT3Ax3dfdTZGzRnnVwG2QEYKRZhdE8FCWo/bvtWjq3MNPTHLONia8coReDyeiImwuT0wnKAgxwGYTapU/U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nZ1iw2Dc; arc=pass smtp.client-ip=74.125.227.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nZ1iw2Dc"
Received: by mail-vs2-f43.google.com with SMTP id ada2fe7eead31-7bf2de022d5so1740905137.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 02 Oct 2026 08:02:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790953329; cv=none;
        d=google.com; s=arc-20260327;
        b=WLIDUPOVI+wZ49UR5QPq5wcF2rq7FIdpgMBOSvgO2TjtQ/pfkzHrI+smCeyhTqgL13
         Pn0J1Ly44Y3y4a1AN8FCTPqWqWQZXSjE8YNXr2elVhwCeMHXRXqwWAD4qEHEx9VKMxpY
         vWiMf600XanbS3YItwaJV+XA3aOz0efvpmQ0Iig6crOyjv6e1uWa/asVlkFCMHNj9Kwn
         MLBePgexPSwjtoj+v6drfjlqF3gRvzAHB8hT+9DWaENXQ1fqk5FzafK1FQo+1Q28I4TT
         PCwV+6rnOqcwd4seiQUHX5BRxMfVxd4nbMg5Ozdc1OnQ71BqYrdBbC4aYj9O02wnLV5T
         SigA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/8BetBBJofDyU9wdLFm7iPoNavj8+VQriTK4PJhous8=;
        fh=xGAD+SwytIj2vhESRM5U1NwTVXuzqr0lbQTLJ2tmn2M=;
        b=qGg3A6OVTzBtMoXp95R276kiiG4+k7zF2J/qXTJU3nD4rucDOflW1FrNRGr5wmxZnT
         q/Do9VTU9Rlm3Dvr3NXKOfAhdeMe0Z7fnn1yuDUJ6RM2XYiVf7wL5jDUTxNUJuzXdiYV
         TuSwhRRlb1wp1UvW2jb9vZqvKnJR1/doNyp/z1OSvx0vajlGe4LwmQ3DlQYoslOB/gY8
         Vr3TaL6XG1g1Vw48QBQN4OZhXQa4/IdmwsbaE4kMZSh1CkT8XP6Ae5JYKJ8Q23ysrEbC
         sH+fAmt9qrVS1bVhy9JSkdAHwP/sotETiPglUaiDHSY/GqT7FF5qTep3cYRCwgnzXcMO
         f/uw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790953329; x=1791558129; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/8BetBBJofDyU9wdLFm7iPoNavj8+VQriTK4PJhous8=;
        b=nZ1iw2DcbFCIXrvS9PhsOlB4jZHj935CKxY75sctKg1izARnvVxWjMZmR1gf3SV5qk
         vO0CaXSlYq3sn7SLtRMXxw6wNoKP/TujZLSH+dgB85YNKMMWQA2PF/3ZLT1eNQ9bbkWY
         8ifu3asCjqzjFoKX5XZBydwgOxjOE7Lxx36jxo5CaY6dscX/Fkd5LIW4u4QJYQmnpyWQ
         NgBO2pWhGLah+hjsL74HXSgClQmqUMIPhK5xz4svr2nyj0uWj/t8Lp8XIcRm88F05e7/
         pKjLOUNPKFPX2uIsKk3ASi51Vpa+43pZDWh3x2Mt4PELC5LJ5jDgi/osEh+cac1f/hqQ
         deGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790953329; x=1791558129;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/8BetBBJofDyU9wdLFm7iPoNavj8+VQriTK4PJhous8=;
        b=H61Lx0XPBY4E5FKgL+3+3S27PO0g3xHBF77/q8SFgC4kxRDzsCmjAijhqNcwb8u6gX
         y+GV8l7WBWywn/bQwZFx3+2o60VwxruKZRyTljUYnnc5XuqoWFSXtxra2bDqnhntaayU
         57ogS+8Drpj616RY/aa8e6Q+1NTrA8wYgn4V/QUUKnAovowIY4cKrvvai4OCUCfqvcDY
         WXXYR699rKnyeO+bKGzIXkVjFtyEuol+VH5yorwRoplbKvTE+kiHSQ0HN4MYe0SjLYjz
         dP7dW1OfTi/Uw3VEcMpxtwndwj61X29x9w1LlsHrVuPCG0ymOwDZ2jJL6SAdj1oMpLl8
         VwHQ==
X-Forwarded-Encrypted: i=1; AKwUvByRlF1b3dP0TwVRxLb7/SYtlIHsd+tXvx+DpKlOi70rwjxnydSJcYHMn/I++Lp0ILTDPuvo4BLAckulhd+T6T8x8A==@vger.kernel.org
X-Gm-Message-State: AFq9FYIn1wAA7Bl4YcdDi5yoXTGyqrAJGA5q6bCzTLFsQMuotRaF1ZJz
	62fiXSGsDkz25MBvOiepScgfTaN+vIpctoQL150klirD1/exWwgnUA5/K8R4IQO4FuGl3VEkPZk
	AOjUz/VJZxpdGIjozg/TjMKffYdo1aIFfm79qjM/2gw==
X-Gm-Gg: AYBFou1054C/RyyeEKQOyzAsd5rK+BjXKJyOEXR6FzKuPYywQW6IhvKVxHLLMoW2dpK
	BOTkQzL1frF1BpBmk9qeH6DB6nxqqDJiQr6kBoKFiZR3swdcN2xAjcMmk8HB2/iCvLm3gO94AgT
	54oxwES3vFkna3EiGkD5P3q6r1biRs+xq2eJeSWpOPdngedIF+msInDYlgdtF9AGhN9qgfOjBv7
	EcafJXqGq+RcIlIvzBvJO/OJ1OMcoNdFrkV7O81KCS/Sn93PBqhJkEKs7ZROPav/1IhQ3Od134i
	POLFA23vqe3jurx4kpbHUx+zZv7Z2t7kl2Oz3h4nssNwGLT8LPiaTrPYP3v4BSsnGQrYc7K5aVQ
	=
X-Received: by 2002:a05:6102:80a1:b0:7b7:e1bc:b070 with SMTP id
 ada2fe7eead31-7c0f5caaa75mr904078137.31.1790953329113; Fri, 02 Oct 2026
 08:02:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20260927150943epcas5p1fb1720070f2bdca2c6cd32094dde895c@epcas5p1.samsung.com>
 <20260927152738.3673504-1-alim.akhtar@samsung.com> <20260927152738.3673504-2-alim.akhtar@samsung.com>
In-Reply-To: <20260927152738.3673504-2-alim.akhtar@samsung.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 2 Oct 2026 16:01:55 +0100
X-Gm-Features: AclHuK8ij08G6Gr-EgDhgI61gJxwT1zt3h2boZhljCMfEb9c1DxgDHs5LAOtRr4
Message-ID: <CADrjBPrXYX4_d9dJ=SUqHf-eMDyuSpSChkuTsrPHfo2ZNh2mMw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] watchdog: s3c2410_wdt: Add support for Exynos8855 SoC
To: Alim Akhtar <alim.akhtar@samsung.com>
Cc: krzk@kernel.org, robh@kernel.org, conor+dt@kernel.org, linusw@kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org, 
	linux@roeck-us.net, hajun.sung@samsung.com, wim@linux-watchdog.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 27 Sept 2026 at 16:09, Alim Akhtar <alim.akhtar@samsung.com> wrote:
>
> Watchdog IP on this SoC is similar to Exynos850/ExynosAutov{9/920}.
> This does not have CNT_EN_WDT bit in PMU and offset of RST_STAT is
> different then the previously support SoC.
> Reuse the offset as much as from already supported SoC
>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---

Small nit: If you send another version, the last sentence could be
updated slightly for clarity. Something like
"Reuse the offsets as much as possible from already supported SoCs"

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>
> *Changes in V2:
>         - Fixed Sashiko review comments
>                 - [Low] watchdog: confusing reuse of CLUSTER0 macro for CLUSTER1
>                 - [Low] watchdog: space-based alignment for EXYNOS8855_RST_STAT_REG_OFFSET
>
>  drivers/watchdog/s3c2410_wdt.c | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
>
> diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
> index 7053963fb0ac..007c05ed2c7b 100644
> --- a/drivers/watchdog/s3c2410_wdt.c
> +++ b/drivers/watchdog/s3c2410_wdt.c
> @@ -58,6 +58,7 @@
>  #define S3C2410_WATCHDOG_DEFAULT_TIME  (15)
>
>  #define EXYNOS5_RST_STAT_REG_OFFSET            0x0404
> +#define EXYNOS8855_RST_STAT_REG_OFFSET         0x10
>  #define EXYNOS5_WDT_DISABLE_REG_OFFSET         0x0408
>  #define EXYNOS5_WDT_MASK_RESET_REG_OFFSET      0x040c
>  #define EXYNOS850_CLUSTER0_NONCPU_OUT          0x1220
> @@ -73,6 +74,7 @@
>
>  #define EXYNOS850_CLUSTER0_WDTRESET_BIT                24
>  #define EXYNOS850_CLUSTER1_WDTRESET_BIT                23
> +#define EXYNOS8855_CLUSTER1_WDTRESET_BIT       25
>  #define EXYNOSAUTOV9_CLUSTER0_WDTRESET_BIT     25
>  #define EXYNOSAUTOV9_CLUSTER1_WDTRESET_BIT     24
>  #define EXYNOSAUTOV920_CLUSTER0_WDTRESET_BIT   0
> @@ -281,6 +283,26 @@ static const struct s3c2410_wdt_variant drv_data_exynos850_cl1 = {
>                   QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN,
>  };
>
> +static const struct s3c2410_wdt_variant drv_data_exynos8855_cl0 = {
> +       .mask_reset_reg = EXYNOS850_CLUSTER0_NONCPU_INT_EN,
> +       .mask_bit = 2,
> +       .mask_reset_inv = true,
> +       .rst_stat_reg = EXYNOS8855_RST_STAT_REG_OFFSET,
> +       .rst_stat_bit = EXYNOS850_CLUSTER0_WDTRESET_BIT,
> +       .quirks = QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET |
> +                 QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_DBGACK_BIT,
> +};
> +
> +static const struct s3c2410_wdt_variant drv_data_exynos8855_cl1 = {
> +       .mask_reset_reg = EXYNOSAUTOV920_CLUSTER1_NONCPU_INT_EN,
> +       .mask_bit = 2,
> +       .mask_reset_inv = true,
> +       .rst_stat_reg = EXYNOS8855_RST_STAT_REG_OFFSET,
> +       .rst_stat_bit = EXYNOS8855_CLUSTER1_WDTRESET_BIT,
> +       .quirks = QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET |
> +                 QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_DBGACK_BIT,
> +};
> +
>  static const struct s3c2410_wdt_variant drv_data_exynos990_cl0 = {
>         .mask_reset_reg = GS_CLUSTER0_NONCPU_INT_EN,
>         .mask_bit = 2,
> @@ -400,6 +422,8 @@ static const struct of_device_id s3c2410_wdt_match[] = {
>           .data = &drv_data_exynos7 },
>         { .compatible = "samsung,exynos850-wdt",
>           .data = &drv_data_exynos850_cl0 },
> +       { .compatible = "samsung,exynos8855-wdt",
> +         .data = &drv_data_exynos8855_cl0 },
>         { .compatible = "samsung,exynos990-wdt",
>           .data = &drv_data_exynos990_cl0 },
>         { .compatible = "samsung,exynosautov9-wdt",
> @@ -723,6 +747,7 @@ s3c2410_get_wdt_drv_data(struct platform_device *pdev, struct s3c2410_wdt *wdt)
>         /* Choose Exynos850/ExynosAutov9 driver data w.r.t. cluster index */
>         if (variant == &drv_data_exynos850_cl0 ||
>             variant == &drv_data_exynosautov9_cl0 ||
> +           variant == &drv_data_exynos8855_cl0 ||
>             variant == &drv_data_gs101_cl0 ||
>             variant == &drv_data_exynosautov920_cl0 ||
>             variant == &drv_data_exynos990_cl0) {
> @@ -740,6 +765,8 @@ s3c2410_get_wdt_drv_data(struct platform_device *pdev, struct s3c2410_wdt *wdt)
>                 case 1:
>                         if (variant == &drv_data_exynos850_cl0)
>                                 variant = &drv_data_exynos850_cl1;
> +                       else if (variant == &drv_data_exynos8855_cl0)
> +                               variant = &drv_data_exynos8855_cl1;
>                         else if (variant == &drv_data_exynosautov9_cl0)
>                                 variant = &drv_data_exynosautov9_cl1;
>                         else if (variant == &drv_data_gs101_cl0)
> --
> 2.34.1
>
