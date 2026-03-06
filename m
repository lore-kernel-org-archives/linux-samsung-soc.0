Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E17A350282
	for <linux-samsung-soc@vger.kernel.org>; Fri,  6 Mar 2026 15:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772810445; cv=pass; b=MIHj+oTiP7gsoMf5O0tIGaPZvbkOUlP5cS0P2eXvywprfgc7OUlEWV/nRaOZyNEDMU+CwcCuQWZ+lGrhsONSHssR339YRVC0HPJpexNleaeOSFOFC04tzk4CWE15XHCl2pqlCRdsQ0SDA+TXDPTtWKfbPiz/Qrmrim1DYUIISIE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772810445; c=relaxed/simple;
	bh=KOsZndq2fxFvV5ZjjA90mg2yR7mJTcoSEakFrOShe1o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CAbNbBl6gjUeY3mcs+2azCOLa8mGLLM5FEXZDESBdopXRBH1zjZnjlf769FQGshqBsZDsw5EAiNijgA9/SNwqc+dCh3Avk77Euzf1Ra6907qd7RvcTIO0PGX1wmpRuZZELYiv6iYke0XXN1MtjQ7HviaDMn7m3bmDpwH2I4qwHQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qJQglw1/; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qJQglw1/"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-660d77cacc2so1084015a12.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 06 Mar 2026 07:20:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772810442; cv=none;
        d=google.com; s=arc-20240605;
        b=TLtf+u20xX6tVYh1WRsiQVS9qjSPGBQRdyfXiuYOsAqIgpZD3jTvI85u58gKPatrts
         QvSK0eQlKON7GudRFhiHL6HOwm9ezozNuHLJH3S5h1K28eR26xUvntFLcJ4ap+F5+T8K
         U6vu/Zz8GfbriFXgOPtbK0G/DLDvCv71XXi6gDJ7tZ3T3QcY0FyCkT0KsNiO3ExtRe09
         GnowXlCho8n7pQSUb/xf2LQ/cdUkniIAYVeIfJCM34a8TLBokNY9OTa75zq9pELJURbH
         pHqphfkaCryIWerqtpGYgBGhbVB3rZxFdQ9Vf9djQJHzdyFvK4pRzRw3RNTxu3Y9sjq/
         pBbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oPFMUflif2PcoprUWa7OFxGTQSn7UEMXyNiXbjIMxgc=;
        fh=O1h6zvu7jnOZkRU5EQJErQ7F8rkNuDSdmWT84I/Lmnw=;
        b=VsRqe215dM+DnuhOPk+b+lq4ATccO3zQR8DZ0fJOFjGUPfTbGQ07WVP76K5+1jCUc3
         W+AaAvMr2YWnA8ZKDVYsU8UfTFXQ5B5Kt0dDYhlNhreFRF+XOoZyaDATQHx9AEFQE08B
         RkNhL3nAVMuhluzVWM1mQlQvXNzLy0qF+mmiQttOjicZ3u6ychFRtqSMrencToapaR1h
         zS39gLSShY9sU46k5jFuHnlyo9LQZ8wmyVzB5RR95ALmrQRyFFP2gHRJK7IyLuFlNUUP
         n3cPMu7G53DObQ1n2Dfyj/l0jbYrqQYapXjWPblHPVBFePk6ZEZxuSA7PSC+6J7dLQPp
         i0vw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772810442; x=1773415242; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oPFMUflif2PcoprUWa7OFxGTQSn7UEMXyNiXbjIMxgc=;
        b=qJQglw1/2i7Vrc/qxZO66X7wS1a+J79HX8FaACL138laP5SjsSG7lOtf9KOeXCH9+9
         NEAfmb3sGqhV2AUDJ1dhlIvwt0xXoEoLrvcAWR9VyXeFXQz8WTk/WRztXF5ZGQPf1yEn
         VSqQokMB0SrfvMs+K17dDWKZnQU/x2UvljL4oHWx6QtB9PAAhMycSJt2fBaKw1l4V5WC
         pMty4HWPLxUFOIpzETbAIumJujnIHPu6xFIU7DU0ok+FNFJrunfGQ515/H7frh+1Iytj
         WplKJgEthW2Q/dhpHmmvHP6cZJ5lYEn9WEpIrfDzhqjJ1jJBg5LI2k4WWmRJyWDsWNBD
         tPFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772810442; x=1773415242;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oPFMUflif2PcoprUWa7OFxGTQSn7UEMXyNiXbjIMxgc=;
        b=cR2hwEM/IGYldtdG7hgIMwEVQZA+smLTvCSwEm3L9XYOE+NSdafbErqoG/NLd6yHfU
         iOrm95XOVEt/D4JKzdRKECV7TkDoe1pOLixuPGM+A0M+1mnexe4beJIRC9RIY6qwKrDi
         i8fE2GqKZ+HDG3r4pfel9rate22d5kDSdlKVZxcIfZ7y/EHdNM+jRBZnDV4uyBouj79A
         LSk2Zwi8p3upvzbUwjzQxW2s11CVaR5sWpshOhdA87ledN4QuALklAm1uurL3+PTrdZ1
         5KbuhQ8BjORdwbDBIQbxcTv9S0ZCUEWhGe2cvg/87b9VIvJOT6SODn10SivLdiFehmx8
         J22A==
X-Forwarded-Encrypted: i=1; AJvYcCXme0vK7OcsvRpXLekZQP4KQ7qqM5k7BwUWVQo9C7NgK2JFS7cWUdEURXzMV+XjR7LeEPVzevyMzRsPcWpg01cqnA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3vefoNB0hPkHnYIHqG+EmtySn4kBpvMmUmsx5s0aNEfS/2UIx
	GHBIxITlnNcKO5i+8rLTBTs7Eu5iPRoKmAU145Zm7Nk4fiGWgDH+lkZjUe4mF0vxRHlr1EmRM3o
	8dVDhFxYFZ1ttTHl2YKrZhMKpzv6aUh9lcBzCZJzukA==
X-Gm-Gg: ATEYQzwuMQFFvrmoI+ksSXAO3LmPcFGAmy1fcoNAFxZI/fZoMsgLu8zqhvk92Uhq43S
	WMQSkZI1TjRyOVYJp0CWdg1+Dg+b4MPyRNUSxC7Jkx+ZZwmG6KThU8pZ7VDR6JK1sJyzU8zT8ND
	Z4V/FpaCFkbVHSWXH8KIJYi6Je6GkIq3+wh87rkyQ/A3wK76N3CD5nFDSN4KlrF9EetvgcnVNSy
	/CSuqtgnx8Qww9I45u22iD1AHi/M//81FWYqYe1l46UlVOLni44nV90Lfv3YkMzfkds5tmFVoGk
	iK4shlj2ZcJYTn2kieQe152Aqfk9nYZ/2WxnKDIGhQ==
X-Received: by 2002:a05:6402:719:b0:65f:76d7:d507 with SMTP id
 4fb4d7f45d1cf-66142d406c4mr2730888a12.8.1772810441112; Fri, 06 Mar 2026
 07:20:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260306-gs101-pd-v7-0-03f7c7965ba5@linaro.org> <20260306-gs101-pd-v7-7-03f7c7965ba5@linaro.org>
In-Reply-To: <20260306-gs101-pd-v7-7-03f7c7965ba5@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 6 Mar 2026 15:20:29 +0000
X-Gm-Features: AaiRm52gkTQ-LvYEyU8OUxVKlY-XzL8CHFqDj2nv7Gqx-ZbbUqON9JYJP7oOtB8
Message-ID: <CADrjBPrAK6-76u1vPUkc5BLTugHCa+Fk=Rvr9uOQDie7Avfd7w@mail.gmail.com>
Subject: Re: [PATCH v7 07/10] pmdomain: samsung: add support for google,gs101-pd
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
> On Google gs101, direct mmio register access to the PMU registers
> doesn't work and access must happen via a regmap created by the PMU
> driver instead.
>
> Add a flag to the device match data to denote this case, and obtain
> the regmap using the parent node in DT if true, while keeping to use
> the traditional direct mmio regmap otherwise.
>
> Additionally, the status is just one bit on gs101.
>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

> v4:
> - add 'use_parent_regmap' flag instead of going by 'syscon' compatible
>   in parent, as it's not a given that the parent provides a syscon-
>   compatible regmap (it actually doesn't anymore after recent changes
>   on gs101)
>
> I've still kept Marek's Tested-by from v3, as legacy Exynos code
> doesn't change.
> ---
>  drivers/pmdomain/samsung/exynos-pm-domains.c | 66 +++++++++++++++++++---=
------
>  1 file changed, 46 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/pmdomain/samsung/exynos-pm-domains.c b/drivers/pmdom=
ain/samsung/exynos-pm-domains.c
> index 8df46b41f9bc..2214d9f32d59 100644
> --- a/drivers/pmdomain/samsung/exynos-pm-domains.c
> +++ b/drivers/pmdomain/samsung/exynos-pm-domains.c
> @@ -12,6 +12,7 @@
>  #include <linux/err.h>
>  #include <linux/platform_device.h>
>  #include <linux/slab.h>
> +#include <linux/mfd/syscon.h>
>  #include <linux/pm_domain.h>
>  #include <linux/delay.h>
>  #include <linux/of.h>
> @@ -21,6 +22,7 @@
>  struct exynos_pm_domain_config {
>         /* Value for LOCAL_PWR_CFG and STATUS fields for each domain */
>         u32 local_pwr_cfg;
> +       bool use_parent_regmap;
>  };
>
>  /*
> @@ -93,8 +95,16 @@ static const struct exynos_pm_domain_config exynos5433=
_cfg =3D {
>         .local_pwr_cfg          =3D 0xf,
>  };
>
> +static const struct exynos_pm_domain_config gs101_cfg =3D {
> +       .local_pwr_cfg          =3D BIT(0),
> +       .use_parent_regmap      =3D true,
> +};
> +
>  static const struct of_device_id exynos_pm_domain_of_match[] =3D {
>         {
> +               .compatible =3D "google,gs101-pd",
> +               .data =3D &gs101_cfg,
> +       }, {
>                 .compatible =3D "samsung,exynos4210-pd",
>                 .data =3D &exynos4210_cfg,
>         }, {
> @@ -122,17 +132,9 @@ static int exynos_pd_probe(struct platform_device *p=
dev)
>         struct of_phandle_args child, parent;
>         struct exynos_pm_domain *pd;
>         struct resource *res;
> -       void __iomem *base;
>         unsigned int val;
>         int on, ret;
>
> -       struct regmap_config reg_config =3D {
> -               .reg_bits =3D 32,
> -               .val_bits =3D 32,
> -               .reg_stride =3D 4,
> -               .use_relaxed_mmio =3D true,
> -       };
> -
>         pm_domain_cfg =3D of_device_get_match_data(dev);
>         pd =3D devm_kzalloc(dev, sizeof(*pd), GFP_KERNEL);
>         if (!pd)
> @@ -143,25 +145,49 @@ static int exynos_pd_probe(struct platform_device *=
pdev)
>                 return -ENOMEM;
>
>         /*
> -        * The resource typically points into the address space of the PM=
U.
> +        * The resource typically points into the address space of the PM=
U and
> +        * we have to consider two cases:
> +        *   1) some implementations require a custom regmap (from PMU pa=
rent)
> +        *   2) this driver might map the same addresses as the PMU drive=
r
>          * Therefore, avoid using devm_platform_get_and_ioremap_resource(=
) and
> -        * instead use platform_get_resource() and devm_ioremap() to avoi=
d
> +        * instead use platform_get_resource() here, and below for case 1=
) use
> +        * syscon_node_to_regmap() while for case 2) use devm_ioremap() t=
o avoid
>          * conflicts due to address space overlap.
>          */
>         res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
>         if (!res)
>                 return dev_err_probe(dev, -ENXIO, "missing IO resources")=
;
>
> -       base =3D devm_ioremap(dev, res->start, resource_size(res));
> -       if (!base)
> -               return dev_err_probe(dev, -ENOMEM,
> -                                    "failed to ioremap PMU registers");
> -
> -       reg_config.max_register =3D resource_size(res) - reg_config.reg_s=
tride;
> -       pd->regmap =3D devm_regmap_init_mmio(dev, base, &reg_config);
> -       if (IS_ERR(pd->regmap))
> -               return dev_err_probe(dev, PTR_ERR(base),
> -                                    "failed to init regmap");
> +       if (pm_domain_cfg->use_parent_regmap) {
> +               pd->regmap =3D syscon_node_to_regmap(dev->parent->of_node=
);
> +               if (IS_ERR(pd->regmap))
> +                       return dev_err_probe(dev, PTR_ERR(pd->regmap),
> +                                            "failed to acquire PMU regma=
p");
> +
> +               pd->configuration_reg =3D res->start;
> +               pd->status_reg =3D res->start;
> +       } else {
> +               void __iomem *base;
> +
> +               const struct regmap_config reg_config =3D {
> +                       .reg_bits =3D 32,
> +                       .val_bits =3D 32,
> +                       .reg_stride =3D 4,
> +                       .use_relaxed_mmio =3D true,
> +                       .max_register =3D (resource_size(res)
> +                                        - reg_config.reg_stride),
> +               };
> +
> +               base =3D devm_ioremap(dev, res->start, resource_size(res)=
);
> +               if (!base)
> +                       return dev_err_probe(dev, -ENOMEM,
> +                                            "failed to ioremap PMU regis=
ters");
> +
> +               pd->regmap =3D devm_regmap_init_mmio(dev, base, &reg_conf=
ig);
> +               if (IS_ERR(pd->regmap))
> +                       return dev_err_probe(dev, PTR_ERR(base),
> +                                            "failed to init regmap");
> +       }
>
>         pd->pd.power_off =3D exynos_pd_power_off;
>         pd->pd.power_on =3D exynos_pd_power_on;
>
> --
> 2.53.0.473.g4a7958ca14-goog
>
