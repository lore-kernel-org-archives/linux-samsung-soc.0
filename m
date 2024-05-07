Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F0E73530
	for <linux-samsung-soc@vger.kernel.org>; Tue,  7 May 2024 12:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715084121; cv=none; b=UEvF8Yv6xiOtL1bvdj0qq+5phWU+yA12q0saCCw3IiXQKRRRGMriOuj5RKxGTNVmG37l+Evb4n0H1b7VwVhIWiWuUpVxu7QSW+dmZ+FXjkiZQnKeQQzpQhNMMiKv/p5ejr+H8uug8KHov3OBTHW+EJbhataC9OX7VCoWPxT0cyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715084121; c=relaxed/simple;
	bh=4ExG0FZDY6f08QETasOyXD/lspkhULsMREyw3QJterw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nLI9wpsKeZc5K8XCaXjMVzUkznft+kC8acX/OxS8Sl2Wh/2Cmp1KePkB5Y40jgZB9wEz6CnSTEAWLVlheNKpw2FB1c64IRlxGVbGMeCku79gklm8pp1uznomuSbZtjS1FxdrlU1WCd9uxzL18gImKyJN14XO042Mkii3l4Ioa7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a5QjcowB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a5QjcowB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA415C4DDE4
	for <linux-samsung-soc@vger.kernel.org>; Tue,  7 May 2024 12:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715084120;
	bh=4ExG0FZDY6f08QETasOyXD/lspkhULsMREyw3QJterw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=a5QjcowBooTLKsJ6gz38m+jIt54nTjxBfVH6+887vRX+2ePl/1N0JXPqOJ6ddL/7a
	 psgRAAWSWxGyl7C0p1XuhHKSZDXX6tBrhpxVL7tud+zb+59IbIwzFMnA2H4jXFGfPK
	 nzdTCAKdsSXAUiw8QSvHP4mDTPSTIqtQ/H9ePriZpv8mMRxLAxYNkCJ2ssUPa+JHu1
	 7GwN8wax3xFXk4zspZvtaUFDxxpKnZ9BhHWRHjlE2Q4T0V9lQp+vTGc+JEUYgLJucR
	 HzNyk4Ji/xrt3WG2C3k8+Y+/THV2mVRQYGRygxjB3lkyVOFKhPB5Sa6nQ6ruC+5JSB
	 TULtxMoHc/BLw==
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-ddda842c399so3162804276.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 07 May 2024 05:15:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXQEiphEJKUzFVvTBNDQpoPi+KBLsmtyjlML9sRGkf0l2VBmvtvrhi50QAdmZalEHzLutQpjmaCM6PmNaNJnqxmR7F5rpwV8Sna320xpG2rJ2w=
X-Gm-Message-State: AOJu0Yyrj9XrwSMIsT5SBOmKd88R/owxcHc58dNU7eo8sxwRj5FpEy9Q
	U5XBCFE9ZCHg+Utw9eLsTyoDq3SBBLZd6tvz9ZbP/HU5hOUUTCFahZco3+Ek/qGyi/LPhOHeCO/
	aPaFHKFO+sVc+oIYSOa8T2RPGhPJBlg6G3n7WhQ==
X-Google-Smtp-Source: AGHT+IH+Pja8EgUMLpfJwhO7v0UjdoeL8if8dUGCw6qXcAIWrNDLG5aoxfpLWtSpJvCmWyUWR2rEmCfBWkFANDX1uvw=
X-Received: by 2002:a05:6902:2cb:b0:de6:86f:c6a4 with SMTP id
 w11-20020a05690202cb00b00de6086fc6a4mr16605659ybh.44.1715084119930; Tue, 07
 May 2024 05:15:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240503151129.3901815-1-l.stach@pengutronix.de> <20240503151129.3901815-3-l.stach@pengutronix.de>
In-Reply-To: <20240503151129.3901815-3-l.stach@pengutronix.de>
From: Robert Foss <rfoss@kernel.org>
Date: Tue, 7 May 2024 14:15:09 +0200
X-Gmail-Original-Message-ID: <CAN6tsi4PBmr9mXj16rDod_6-pJQAsvbTWhfCmmG0=2n5bBM0Rg@mail.gmail.com>
Message-ID: <CAN6tsi4PBmr9mXj16rDod_6-pJQAsvbTWhfCmmG0=2n5bBM0Rg@mail.gmail.com>
Subject: Re: [PATCH 02/14] drm/rockchip: analogix_dp: add runtime PM handling
To: Lucas Stach <l.stach@pengutronix.de>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, Sandy Huang <hjc@rock-chips.com>, 
	Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>, 
	Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	dri-devel@lists.freedesktop.org, kernel@pengutronix.de, 
	patchwork-lst@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 3, 2024 at 5:12=E2=80=AFPM Lucas Stach <l.stach@pengutronix.de>=
 wrote:
>
> Hook up the runtime PM suspend/resume paths to make the rockchip
> glue behave more like the exynos one. The same suspend/resume
> functions are used for system sleep via the runtime PM force
> suspend/resume.
>
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
>  drivers/gpu/drm/rockchip/analogix_dp-rockchip.c | 13 ++++---------
>  1 file changed, 4 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gp=
u/drm/rockchip/analogix_dp-rockchip.c
> index baeb41875a4b..8214265f1497 100644
> --- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> @@ -13,6 +13,7 @@
>  #include <linux/of.h>
>  #include <linux/of_graph.h>
>  #include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
>  #include <linux/regmap.h>
>  #include <linux/reset.h>
>  #include <linux/clk.h>
> @@ -430,7 +431,6 @@ static void rockchip_dp_remove(struct platform_device=
 *pdev)
>         analogix_dp_remove(dp->adp);
>  }
>
> -#ifdef CONFIG_PM_SLEEP
>  static int rockchip_dp_suspend(struct device *dev)
>  {
>         struct rockchip_dp_device *dp =3D dev_get_drvdata(dev);
> @@ -450,14 +450,9 @@ static int rockchip_dp_resume(struct device *dev)
>
>         return analogix_dp_resume(dp->adp);
>  }
> -#endif
>
> -static const struct dev_pm_ops rockchip_dp_pm_ops =3D {
> -#ifdef CONFIG_PM_SLEEP
> -       .suspend_late =3D rockchip_dp_suspend,
> -       .resume_early =3D rockchip_dp_resume,
> -#endif
> -};
> +static DEFINE_RUNTIME_DEV_PM_OPS(rockchip_dp_pm_ops, rockchip_dp_suspend=
,
> +               rockchip_dp_resume, NULL);
>
>  static const struct rockchip_dp_chip_data rk3399_edp =3D {
>         .lcdsel_grf_reg =3D RK3399_GRF_SOC_CON20,
> @@ -485,7 +480,7 @@ struct platform_driver rockchip_dp_driver =3D {
>         .remove_new =3D rockchip_dp_remove,
>         .driver =3D {
>                    .name =3D "rockchip-dp",
> -                  .pm =3D &rockchip_dp_pm_ops,
> +                  .pm =3D pm_ptr(&rockchip_dp_pm_ops),
>                    .of_match_table =3D rockchip_dp_dt_ids,
>         },
>  };
> --
> 2.39.2
>

Reviewed-by: Robert Foss <rfoss@kernel.org>
