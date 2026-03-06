Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51CF36C9F8
	for <linux-samsung-soc@vger.kernel.org>; Fri,  6 Mar 2026 15:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772812304; cv=pass; b=dLxniThtT4CBi3EUmrVzLgzYOij9HGomo4r6AAJ2j3vp/QNoFh2lC3UT/tfFadZjlrdrsvixjIzbtleiGzOXF/QQmHw4rVvMP/9dipbw6xwqyawaWB9TmXEHoG/y96xOIgTeExkIwRWuicV/6DgDKisUtLPzzWLxkMiBs8CKXNg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772812304; c=relaxed/simple;
	bh=zt/0UNt3uP18aJxtk0eoO7x0Py6Ek1ZFUdGvve+hz54=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QakIGHwS9pR0zqTaGxc2RtSeOMeDJOuetDYYkxQi6dq/ELxyXsbKcKWpitN5pg9ff0h+8Gwre+CFtl90Mt5JLvVLDE4V9i8S/etLP60VWHaMVApdou3idf/l+TtA0ayPN18K5uQPrEGkLKXeXyQCpeFKVxnLeOUju9I2KdrRNG4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jJN1hOtd; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jJN1hOtd"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-660d2e4846cso5208167a12.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 06 Mar 2026 07:51:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772812301; cv=none;
        d=google.com; s=arc-20240605;
        b=M28jwJxhEI/W2TPdhi+q41X6c0OTHhtvUeR1P8st8uIbTPrm3BqWaH82Ej098gkixX
         jnpgM7Mo6UtvCGO9kqrAkP73e/dVVN3c4Plbdb7vuEez20xcRs2AxKcPQ/SqUMNvZmGa
         BXFMYWsZ4h/Rk2rnUFB8JDtNX3BgzBLBXqNOjUnQwI4V7stR41LKaV+PMsplL4OZfDdU
         1668tA+KsALbSwGeienASy0PR+ODCqE7xACFXtzKq1zVm6dcBCMWztlusSvuM4Dx1V7z
         Lx/b42PFIM4Qzmi+PBX76qSrZK4jRLnXuj9dvz44Elwgpp0VXoSKczTnbBUHFul1Opdt
         RokQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xzcKbGMLVorHlsZLyV1rvqs6i8R7J8sRM6aIMH0+nN8=;
        fh=2D4TA6ecwuO8TH19yQ25M/WLt9T4qfrXwUhU83RDaRQ=;
        b=YZpj6WNHaB2P6qWmlmIktOS+NTLciKfukHQbk5ozZZTNRI3LyDc9bg0LeowVQBzeZj
         fHIq8BwM7m2kmbPKK0798J9qyUCUyy0/N43am6htapd0m3ipuX/kmtBzSbhGNVUWKmQi
         68qii7dG4RZ84KvLAWRt7SvQ0bg9sqO3G4Zg2K7tLntDaGwccNh+hloqememqqHxJz8w
         SxnADUw89vIJl3ywzj5zTRk772J1EuPyG8y6e3LA2nuuUNDD/1cs1nEMV0THRP6MjIOb
         jBRjyK/yqVjawurCXxE5969iZRbKqCyissc5aPr37/3ZHUocwQ/x1ockNJMFlz83Wl8e
         FEyA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772812301; x=1773417101; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xzcKbGMLVorHlsZLyV1rvqs6i8R7J8sRM6aIMH0+nN8=;
        b=jJN1hOtdwsskWc1pefnfQcjLiGmjUKNymGSXkMS2DHIWWFDik2mp7S6FwL709lcD6L
         eMeMJBQDT0wtlGsDv5f8F49DsbENS1Opqgw53IG0OVKThm515JIcdl6oyJTftzgaJAK3
         eOJF/TWqggjJm4GLS0g7KI7BvMKGDWP1q1Sg/jfUy01z1RpaT56xlp0FBkDJUwo0t2Ba
         HrPG0/QvWEnDvrkdMmzKFSocqXwg7c8RrBZWOa1AE+r1hpt1zBDPUykT0wqh4t3yTvDf
         LOJWgdtin9gyfeivQ1lWmTM+fq7uamU+J5+Z7W13xEX2I70ywKrS4kNL6p5lwkbIilfC
         +XYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772812301; x=1773417101;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xzcKbGMLVorHlsZLyV1rvqs6i8R7J8sRM6aIMH0+nN8=;
        b=WDy8Zo/YJv1Sbq1rNvVVDNuWzcNsI6Vfb1yl0qeqRiIVQf/5cMYmYI4R3bbEsdXsho
         hj+NftTQeJPhQlpRigmsvE0gLQp7XaDDVsRGteizxF2/qlgjZfqeA2Wnk3W9iejbtWLM
         hdAsIUeAwCeAPh3BSQHUtSyNFtQDOoNY2+4IQcYEhu7Pc4Mh4mSCi5L7Sxf1ZrylWvpb
         JrHnAI+OvRCgpDyJwB9JYsmm/VFJg3Hd+wa1WJLXStEBHTqb0YvggDpPtZx8WvOALvtF
         3EmOuKfGAr1qoQoMmLCXsy5pJRjuem39zOCm8LDsEYdnyuvMpsuaYfysoXCefjMo/bJG
         hy4g==
X-Forwarded-Encrypted: i=1; AJvYcCXhahbTd4RVIE1mzt0a1dlZncTrQIPEPebmar9Q8z4WrASQy8Ty7btENxrYrb5g8lMMmVXMozqBwgIANLQ9Mrh3+A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzGIKUydFR1pROoUUnZhska27BIIzJc2HlpXnhUhEdi5EG1wwHV
	F6UZvL7KDsiNxsoZhMjv1weaoEmm/FTjKLVlRXV569/O8JBH5Vku3G9MLKSLfwS4IbBKmjVezcm
	0fObIMKz9r8xt4eAPaQd8/kK1/eCjcfEqyQ6i1bUv/A==
X-Gm-Gg: ATEYQzw/XiTJDmCol5V6fU9ylx1wmG1yPOzOL/UAxhKja9Jt8DRX0RZCyP00UKpQK/2
	LA/pTC3TNboPayjMQU0u5vRivcgfYE0fCm33zgvyQ1x94gxRQMUJHO9KX02jD8OSeU7nVjqM7bx
	JtDHSiMYA8fzpPSc+VRAshs5GL0FduaJOOkchAvWWCoHOrooi3KnU1FS3ssbLsfdgcCvKndch4F
	wbxC4A6L1gVLnsE5D9afMvwr5ZUBKsDWW5FjD7GxE9aW/EvptuCORmTbUCmNd6cnMLICsqDCdNd
	PRifmXnGcZDSXsfafVpXIgG6HH2WpgxlA5/42q+cUA==
X-Received: by 2002:a05:6402:440b:b0:65c:354e:94f0 with SMTP id
 4fb4d7f45d1cf-6619d467bf2mr1553000a12.8.1772812301052; Fri, 06 Mar 2026
 07:51:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260306-gs101-pd-v7-0-03f7c7965ba5@linaro.org> <20260306-gs101-pd-v7-6-03f7c7965ba5@linaro.org>
In-Reply-To: <20260306-gs101-pd-v7-6-03f7c7965ba5@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 6 Mar 2026 15:51:29 +0000
X-Gm-Features: AaiRm50XSyJAhZxudj29YJ-AfLARk18pjf_9-ZTH2qd-aJZzO76tWKTXAR6KLlw
Message-ID: <CADrjBPqB60UtWpZjBdsGtijw+OSq76vfBaiKoJg8We2na-ixhQ@mail.gmail.com>
Subject: Re: [PATCH v7 06/10] pmdomain: samsung: don't hard-code offset for
 registers to 0 and 4
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
> When such a regmap is used it will cover the complete PMU memory region
> rather than individual power domains. This means the register offsets
> for the configuration and status registers will have to take the power
> domain offsets into account, rather than unconditionally hard-coding 0
> and 4 respectively.
>
> Update the code to allow that.
>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  drivers/pmdomain/samsung/exynos-pm-domains.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/pmdomain/samsung/exynos-pm-domains.c b/drivers/pmdom=
ain/samsung/exynos-pm-domains.c
> index 3bcba7d38ac1..8df46b41f9bc 100644
> --- a/drivers/pmdomain/samsung/exynos-pm-domains.c
> +++ b/drivers/pmdomain/samsung/exynos-pm-domains.c
> @@ -30,6 +30,8 @@ struct exynos_pm_domain {
>         struct regmap *regmap;
>         struct generic_pm_domain pd;
>         u32 local_pwr_cfg;
> +       u32 configuration_reg;
> +       u32 status_reg;
>  };
>
>  static int exynos_pd_power(struct generic_pm_domain *domain, bool power_=
on)
> @@ -41,7 +43,7 @@ static int exynos_pd_power(struct generic_pm_domain *do=
main, bool power_on)
>         pd =3D container_of(domain, struct exynos_pm_domain, pd);
>
>         pwr =3D power_on ? pd->local_pwr_cfg : 0;
> -       err =3D regmap_write(pd->regmap, 0, pwr);
> +       err =3D regmap_write(pd->regmap, pd->configuration_reg, pwr);
>         if (err) {
>                 pr_err("Regmap write for power domain %s %sable failed: %=
d\n",
>                        domain->name, power_on ? "en" : "dis", err);
> @@ -53,7 +55,7 @@ static int exynos_pd_power(struct generic_pm_domain *do=
main, bool power_on)
>         while (timeout-- > 0) {
>                 unsigned int val;
>
> -               err =3D regmap_read(pd->regmap, 0x4, &val);
> +               err =3D regmap_read(pd->regmap, pd->status_reg, &val);
>                 if (err || ((val & pd->local_pwr_cfg) !=3D pwr)) {
>                         cpu_relax();
>                         usleep_range(80, 100);
> @@ -164,6 +166,8 @@ static int exynos_pd_probe(struct platform_device *pd=
ev)
>         pd->pd.power_off =3D exynos_pd_power_off;
>         pd->pd.power_on =3D exynos_pd_power_on;
>         pd->local_pwr_cfg =3D pm_domain_cfg->local_pwr_cfg;
> +       pd->configuration_reg +=3D 0;
> +       pd->status_reg +=3D 4;
>
>         /*
>          * Some Samsung platforms with bootloaders turning on the splash-=
screen
> @@ -174,7 +178,7 @@ static int exynos_pd_probe(struct platform_device *pd=
ev)
>             of_device_is_compatible(np, "samsung,exynos4210-pd"))
>                 exynos_pd_power_off(&pd->pd);
>
> -       ret =3D regmap_read(pd->regmap, 0x4, &val);
> +       ret =3D regmap_read(pd->regmap, pd->status_reg, &val);
>         if (ret)
>                 return dev_err_probe(dev, ret, "failed to read status");
>
>
> --
> 2.53.0.473.g4a7958ca14-goog
>
