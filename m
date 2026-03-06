Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D82FF3E3D9C
	for <linux-samsung-soc@vger.kernel.org>; Fri,  6 Mar 2026 15:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772811056; cv=pass; b=k8ikYODOoUm7pOiIBcdRnq4TaonqVvpYQpQWuQ5bqw+hMkYPV4n0U8jE0fWT156cYR82Bg7Sj2IRyBmQfprnlKRWdkea/jA5CiXy6C3c1abxvbYQzX3PbMNTYFkaZs+gQeHIgaU3qW+gztdr8titdbNeBbnVtX7zOri6eCU6wvg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772811056; c=relaxed/simple;
	bh=46xMvOYumwmjwLPg5YVs7sI653yrVjCZpDniQ/O9pso=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OsWOvunGRSUKIe2f2ZqPtGWPk0T4l/rxPqcoTdHjaIINSfRNe3zfdHvQNxXc365dsFeLV9umTKD159FYNK+ykvhYTB49ppwb38gYHgBYQnNgkXsPnclCTI+EaIMVhEZo61sdwfntpTl1saaOmcJjmzOsqrOv9h5/PUq3zDNrTyo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fVI3IsJf; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fVI3IsJf"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6615c461d3fso2850450a12.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 06 Mar 2026 07:30:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772811053; cv=none;
        d=google.com; s=arc-20240605;
        b=M+LQd6RBW++inwiCxEoXSJJqovFBsSS6gUnhC4nzqYVpEpE+jLinopyiMwaverx6rw
         ZWhj1dpsnlg0RoRq+ajOwdY9DDAInZyjt1lIG1TfZQVk9KOcQa9r4c3lnQAeFPej9YsY
         wX3zM3IBocKLSRWtwTDVBaLIgIDY3AnWllwNzlJuHviF0A09/2u9HBjdGDg6uF3z6rPk
         1PuoIFg9Wzj4Oxjo/K1zY1/L4gQCD69KJtDL6QuR21H0T2oalSfSyaT7Mlszv99RxYix
         Or+t2MsqqSASJuQKY4RrRK2Rb+mixTRYncN8GWjMLNI5w4+V0nVYNfdGls8hA8/BFTcn
         f+nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oEcKE/Xry4U3uD1i7TPLQGRKNjLm+QJOilg4eN6K6Ig=;
        fh=ABTFBdH/N9K6dTw1zxXTfAdP/OXNfR6azBZWqnvE4f8=;
        b=fL3c0dQTfzRtjltI/QDUSxqYnoOtTfsO8U7L8K7hRoB5ba2KzSZxb31/tPWjDSGNAL
         CLBbpaxcRLtw7qzYusQXlOGD6OOWK+cOvvhr6pX9YsMvIqu0I+/7VTa0M9663si30adj
         z4b/PlxHLNnGlIHE8+nMUTMzoW0/rrx2N4uV1t4ZCf8DrPV330EWSbDVpa78i2oL0CP5
         fPah+OLcISPckamiMISR9ngHActwmMLlFPEjXeJvM/R7O/gS0wQ9+w7jO5o/LgEIS97e
         DSGi1EE3bJQvstMx6IWIkG0mFU+Zes/H6vk0PUkt0fDkDMpvW12FotDhP8fpKT6phAs+
         mGEQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772811053; x=1773415853; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oEcKE/Xry4U3uD1i7TPLQGRKNjLm+QJOilg4eN6K6Ig=;
        b=fVI3IsJfhbPtjn+9sIwlAH42d3Tspl9+0/Avk4wuCeOr3Pq9w3/JnmzYEvBBU34W0q
         XS43+GW7ohVVg0zXEYmcLkSOPbZBu2g3hDK+VYfbHiPnjSfHAIZ2UeM1SU0AaOIRdTKG
         oQ0aEmWuCyRrvCsGLHoOMM1yOlbMIorbRFWcaBCmreWmMzHcB+cWSQb322zuy/j8j/m3
         C23Iyb4pp1mly6jGRZw3A64YulAupOCAEUVNunLV07ETU0B/GQWOXsBesyNv+IGVgJ/V
         Ja3/dVk8hxB+BQ/UB/7x6qFoKVVP1t4mANgAk1plHZb2vqB+G/PmFi4fhtGFe8MkCc8a
         lJ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772811053; x=1773415853;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oEcKE/Xry4U3uD1i7TPLQGRKNjLm+QJOilg4eN6K6Ig=;
        b=bAYE635G0A9jOcxEun1ssdv/NOG2cUMbRKgK8XVB+lnjnSdwreTV00Rlf2sYzaB3Mz
         MOW3zn3HDJk7HU76TlEXmTaOQOrPbnosT3a63XPz0gBbgmbLBzCElvaTofX6+RF2OK2/
         kc/ncPjvw3gPWBjBnqu/jgpqVWxagHO98IwS4eiU5WFuHePmzf3DWbSmfDHMf8DsP2JC
         SEIbPkClfn8Md3kfMlxJSY6EJ36Q3puib/gUjvokD3q+Gu+NymZOrp2q/maIugZH4YPp
         05sN6q5uxP4SgqPCErULjmMAS/8CqyMmXQrg21z/z84zNDSPZUrFroE4+o7yGgxDh3NF
         ckoA==
X-Forwarded-Encrypted: i=1; AJvYcCXziWiUgIV2tjhKd6z5a/Yac9dWwM6bSAJHGeyL/oX9TrH61mlLBUu6/ArhttG10oDzc2pAy4q8EIcKsYsTngUSCg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwjZ/0p+QqpixekL8lvo6o9MipFzLyydqjhLp32sZI2wPRvMoF1
	c1BlFwwY8VzTN/xR6rOix4a84Y/421Zof0TXCriYLNRfvdwR0yzqhG5suRTKTchiRTBn/QY//7o
	HVmvkFJGrN7VjyCz6haAaLNPboUfH+JpFkaF6Ug9HvQ==
X-Gm-Gg: ATEYQzyBTy9Ey0fpVJk/QEXBMi0TfzFVYSQ+mILE/c4cNYwHUql5pQ01sDaA6jAGUcg
	mEhy5RKrmZlJ4VSGJiIHrJ6x2SR1a6k+Rr9elkcx9TZCbHQgjM+h/xGV87qyMA4JFyxtVGk5Xu3
	/i94N7bg0i3tbUmIaTg+AduBxL2z5wd+SjbejJrz/qy0gpANFK3Pah32yVO00pJF8Xn5s8acXW8
	PrjZcqHqhJb6VJv+h6ymBWMGkSx0pdyWULvjZVGyGXfErXnCNiVPAGx0QCqQ13+GLYodKW3VHpD
	j29hNl24qIH+bMcEAmVa00jiIWUmT2jPY91ZVIu/0w==
X-Received: by 2002:a05:6402:278f:b0:659:4099:877 with SMTP id
 4fb4d7f45d1cf-6619d2f6d81mr1512760a12.0.1772811052896; Fri, 06 Mar 2026
 07:30:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260306-gs101-pd-v7-0-03f7c7965ba5@linaro.org> <20260306-gs101-pd-v7-5-03f7c7965ba5@linaro.org>
In-Reply-To: <20260306-gs101-pd-v7-5-03f7c7965ba5@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 6 Mar 2026 15:30:41 +0000
X-Gm-Features: AaiRm50zapVukbutcTzczn3suOY9q3j1hR6w8wOK7BWF-RBJ1XR5B4U0Jjw-RuU
Message-ID: <CADrjBPriZBKpBvZZ4ScNSd2NDT1Oa=y0Z7ZXTt1_ss3y4xkCcQ@mail.gmail.com>
Subject: Re: [PATCH v7 05/10] pmdomain: samsung: convert to using regmap
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Juan Yescas <jyescas@google.com>, 
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 6 Mar 2026 at 10:29, Andr=C3=A9 Draszik <andre.draszik@linaro.org> =
wrote:
>
> On platforms such as Google gs101, direct mmio register access to the
> PMU registers doesn't necessarily work and access must happen via a
> regmap created by the PMU driver instead.
>
> In preparation for supporting such SoCs convert the existing mmio
> accesses to using a regmap wrapper.
>
> With this change in place, a follow-up patch can update the driver to
> optionally acquire the PMU-created regmap without having to change the
> rest of the code.
>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---
> There is one checkpatch warning, relating to the non-const
> regmap_config. It can not easily be made const at this stage, but a
> follow-up patch allows us to make it const and the warning will go away
> anyway.
>
> v4:
> - rework the loop in exynos_pd_power() slightly, to not return 0 early
>   to allow more code to be run after pd on/off register write without
>   changing the loop again, required for gs101.
> - add error message in case first regmap write in exynos_pd_power() fails
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  drivers/pmdomain/samsung/exynos-pm-domains.c | 83 +++++++++++++++++++++-=
------
>  1 file changed, 62 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/pmdomain/samsung/exynos-pm-domains.c b/drivers/pmdom=
ain/samsung/exynos-pm-domains.c
> index 5c3aa8983087..3bcba7d38ac1 100644
> --- a/drivers/pmdomain/samsung/exynos-pm-domains.c
> +++ b/drivers/pmdomain/samsung/exynos-pm-domains.c
> @@ -9,15 +9,14 @@
>  // conjunction with runtime-pm. Support for both device-tree and non-dev=
ice-tree
>  // based power domain support is included.
>
> -#include <linux/io.h>
>  #include <linux/err.h>
>  #include <linux/platform_device.h>
>  #include <linux/slab.h>
>  #include <linux/pm_domain.h>
>  #include <linux/delay.h>
>  #include <linux/of.h>
> -#include <linux/of_address.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/regmap.h>
>
>  struct exynos_pm_domain_config {
>         /* Value for LOCAL_PWR_CFG and STATUS fields for each domain */
> @@ -28,7 +27,7 @@ struct exynos_pm_domain_config {
>   * Exynos specific wrapper around the generic power domain
>   */
>  struct exynos_pm_domain {
> -       void __iomem *base;
> +       struct regmap *regmap;
>         struct generic_pm_domain pd;
>         u32 local_pwr_cfg;
>  };
> @@ -36,31 +35,42 @@ struct exynos_pm_domain {
>  static int exynos_pd_power(struct generic_pm_domain *domain, bool power_=
on)
>  {
>         struct exynos_pm_domain *pd;
> -       void __iomem *base;
>         u32 timeout, pwr;
> -       char *op;
> +       int err;
>
>         pd =3D container_of(domain, struct exynos_pm_domain, pd);
> -       base =3D pd->base;
>
>         pwr =3D power_on ? pd->local_pwr_cfg : 0;
> -       writel_relaxed(pwr, base);
> +       err =3D regmap_write(pd->regmap, 0, pwr);
> +       if (err) {
> +               pr_err("Regmap write for power domain %s %sable failed: %=
d\n",
> +                      domain->name, power_on ? "en" : "dis", err);
> +               return err;
> +       }
>
>         /* Wait max 1ms */
>         timeout =3D 10;
> -
> -       while ((readl_relaxed(base + 0x4) & pd->local_pwr_cfg) !=3D pwr) =
{
> -               if (!timeout) {
> -                       op =3D (power_on) ? "enable" : "disable";
> -                       pr_err("Power domain %s %s failed\n", domain->nam=
e, op);
> -                       return -ETIMEDOUT;
> +       while (timeout-- > 0) {
> +               unsigned int val;
> +
> +               err =3D regmap_read(pd->regmap, 0x4, &val);
> +               if (err || ((val & pd->local_pwr_cfg) !=3D pwr)) {
> +                       cpu_relax();
> +                       usleep_range(80, 100);
> +                       continue;
>                 }
> -               timeout--;
> -               cpu_relax();
> -               usleep_range(80, 100);
> +
> +               break;
>         }
>
> -       return 0;
> +       if (!timeout && !err)
> +               /* Only return timeout if no other error also occurred. *=
/
> +               err =3D -ETIMEDOUT;
> +       if (err)
> +               pr_err("Power domain %s %sable failed: %d\n", domain->nam=
e,
> +                      power_on ? "en" : "dis", err);
> +
> +       return err;
>  }
>
>  static int exynos_pd_power_on(struct generic_pm_domain *domain)
> @@ -109,8 +119,18 @@ static int exynos_pd_probe(struct platform_device *p=
dev)
>         struct device_node *np =3D dev->of_node;
>         struct of_phandle_args child, parent;
>         struct exynos_pm_domain *pd;
> +       struct resource *res;
> +       void __iomem *base;
> +       unsigned int val;
>         int on, ret;
>
> +       struct regmap_config reg_config =3D {
> +               .reg_bits =3D 32,
> +               .val_bits =3D 32,
> +               .reg_stride =3D 4,
> +               .use_relaxed_mmio =3D true,
> +       };
> +
>         pm_domain_cfg =3D of_device_get_match_data(dev);
>         pd =3D devm_kzalloc(dev, sizeof(*pd), GFP_KERNEL);
>         if (!pd)
> @@ -120,9 +140,26 @@ static int exynos_pd_probe(struct platform_device *p=
dev)
>         if (!pd->pd.name)
>                 return -ENOMEM;
>
> -       pd->base =3D of_iomap(np, 0);
> -       if (!pd->base)
> -               return -ENODEV;
> +       /*
> +        * The resource typically points into the address space of the PM=
U.
> +        * Therefore, avoid using devm_platform_get_and_ioremap_resource(=
) and
> +        * instead use platform_get_resource() and devm_ioremap() to avoi=
d
> +        * conflicts due to address space overlap.
> +        */
> +       res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       if (!res)
> +               return dev_err_probe(dev, -ENXIO, "missing IO resources")=
;
> +
> +       base =3D devm_ioremap(dev, res->start, resource_size(res));
> +       if (!base)
> +               return dev_err_probe(dev, -ENOMEM,
> +                                    "failed to ioremap PMU registers");
> +
> +       reg_config.max_register =3D resource_size(res) - reg_config.reg_s=
tride;
> +       pd->regmap =3D devm_regmap_init_mmio(dev, base, &reg_config);
> +       if (IS_ERR(pd->regmap))
> +               return dev_err_probe(dev, PTR_ERR(base),
> +                                    "failed to init regmap");
>
>         pd->pd.power_off =3D exynos_pd_power_off;
>         pd->pd.power_on =3D exynos_pd_power_on;
> @@ -137,7 +174,11 @@ static int exynos_pd_probe(struct platform_device *p=
dev)
>             of_device_is_compatible(np, "samsung,exynos4210-pd"))
>                 exynos_pd_power_off(&pd->pd);
>
> -       on =3D readl_relaxed(pd->base + 0x4) & pd->local_pwr_cfg;
> +       ret =3D regmap_read(pd->regmap, 0x4, &val);
> +       if (ret)
> +               return dev_err_probe(dev, ret, "failed to read status");
> +
> +       on =3D val & pd->local_pwr_cfg;
>
>         pm_genpd_init(&pd->pd, NULL, !on);
>         ret =3D of_genpd_add_provider_simple(np, &pd->pd);
>
> --
> 2.53.0.473.g4a7958ca14-goog
>
