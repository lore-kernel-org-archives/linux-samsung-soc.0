Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A0B812CDBE
	for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Oct 2025 13:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761054894; cv=none; b=BMa3Cwlt5e93HffDidm2T7TJxUSFY21F+/g24Wabb04avQuyq0EJAr3qoj9k20UITkmMkAZRT7yQ2Zvl6IrRuEJ7jt57945RiJ+w830b1WaSknBEvNW4VykXywrq2k5jCGpfQVNW/INV/kpAlQBfkj9bYiV/JLGcU3tZ/7vfCnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761054894; c=relaxed/simple;
	bh=WjXVc6EHp/g4iSC0dgl+mBlijG+pJ2E1MMjbyg07e+k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o3A0E8cxYd7/1fu/FRrXR49/xXJ3i7/4V8QXuRqhlkarIZO91OLZbFuMujESeKqOaJEl9Egw7O9YwOzZA1EkCRpYRxcmOVoMWoCsD+n4cRmeURZemg8UGS1QnTvT7rUT1MKn+Q++0IIJAbww/KWQ55q29JsdlB5Gwp+BvABPyO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z7MiLYc9; arc=none smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z7MiLYc9"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-63d0692136bso5808266d50.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Oct 2025 06:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761054892; x=1761659692; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t7l2S0fTu5SAF3VSsMCSsLrp+bmdGs9v0RGyTD+mw5o=;
        b=Z7MiLYc94MoWtpRRdN94cauHSrYJHA2B/Y6/IEgd5CgGX96YFHY3fVWOtro0a4Gaaa
         41wtWTBU/Aeo13JTK860LTl8Is3s5pnxRuIa5yayhMDPjkCjVD1UFfBo+pNaqQAx+Di7
         +zM1UpZBKht2heAxtX4OZ1oeIdb5SfzogJ0pfrbcwaz0thc4EOWL4K1OgpnajXudnKR9
         K0qVRXO3gytM2LZRHcib8v/LBLYc97EjKP/schY7KPeJ3AvK81cCBI1zccA7cceTIMal
         K+zRA1QAe7rCu1HNMXgi05P9J9exSmXwqQ7eMoVWBygUVXRVmwsmX0J+qkBDIhITDbTj
         3HiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761054892; x=1761659692;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t7l2S0fTu5SAF3VSsMCSsLrp+bmdGs9v0RGyTD+mw5o=;
        b=YGFBJeyYtRdaAraP4OKWjwZCmkic1/uByKjZ8+vedlt2d+4GfgMZkPyZfHq5hVK0MR
         mclCMQi3IiJhKLNk0yCWAlRgQMKXb5V2T2mzoNm7/9b6pYRA5hbl66wo6RIZ2o4R15K2
         3j4j9OTe/3LZ9v3Es4T5Tqy2lY8ju3ZfnEI5O8r8cTSXjgmvNhaxWIbc59Ehgc4Q1Fz0
         edUUN8BnKAlJ2jRibJNnHj9ULtWDVTFuHSGRS82Z4FkbSHKg0J93RRUvP36BUlo+LoeS
         7Iz6qckNEUHS5usAH/23bSrgam4I3Kd2yLsNG0kNLfHFeRkOy26H8gSHNst57dAG0yQO
         RQRg==
X-Forwarded-Encrypted: i=1; AJvYcCUe2A8M+RAbFhZ8iDyuW9Ucv4H56XSUUoiFomIF4JAInCU1Zw/fb95df+6EoFP4xXrt+16ZRt75xEIA58ktQzYcnA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy23XjEftlDzWBWD0JfJD1ylq+e0pBpUGH1508KebAGg6GJMMPS
	0qr3+gMMKlgtf2iTAoz1vrYKKPXO8eloPlSoZYcoe+DI4fk9JJ2e0pt8INduPZeSNWj5NRIaN8l
	30AJrFHNjWaHjdG9uurLXThFR9Lirnwkb6KlJ839F/A==
X-Gm-Gg: ASbGncvMd0JsvPQ7uEFoGneMEzQuJVbmndJMwjJwHrmYoaUWqvGjQhMiZorIcFs3Kn9
	nOtmfzhxOCdM7eznC5PRJMGkiXiFRPPJKL8kzXfFoUg2WPnNI3KNKO2DliMKWBVPDis/10VETHu
	4r+q3rmxdQtWNWr/M2G39XX3ao7mStefM9GVVUHJNYfai3SITGodEnwl5qSz/NJlWLbF5PwE9IE
	5DUiylKNdHuQp4BqvJsksyvWQcK/S0QfAVi2KBdeUmm5RgQUW9AJtT5tnp5xfSZ8AnR9Fs/
X-Google-Smtp-Source: AGHT+IHBbKVNcuM7l9dFMzW3m4txAHgl/oBl0HllzJAJ6dzOGjsTsg6Juv5F+fWERMC7Ma504B1opcnGXEPDICN6WPQ=
X-Received: by 2002:a05:690e:134a:b0:63e:34ed:a131 with SMTP id
 956f58d0204a3-63e34eda971mr6291641d50.31.1761054891971; Tue, 21 Oct 2025
 06:54:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251016-gs101-pd-v3-0-7b30797396e7@linaro.org> <20251016-gs101-pd-v3-4-7b30797396e7@linaro.org>
In-Reply-To: <20251016-gs101-pd-v3-4-7b30797396e7@linaro.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 21 Oct 2025 15:54:16 +0200
X-Gm-Features: AS18NWDpF262ybo6_Emnnj0aCX8cQdB1lik5qoOWoSB0z0MgCBOGMTnmDv5nouE
Message-ID: <CAPDyKFpH2p=JhkuXOxL4V3QMH8GObh0qSphPCK=OM9cNe+QmJg@mail.gmail.com>
Subject: Re: [PATCH v3 04/10] pmdomain: samsung: plug potential memleak during probe
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, stable@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 16 Oct 2025 at 17:58, Andr=C3=A9 Draszik <andre.draszik@linaro.org>=
 wrote:
>
> of_genpd_add_provider_simple() could fail, in which case this code
> leaks the domain name, pd->pd.name.
>
> Use devm_kstrdup_const() to plug this leak. As a side-effect, we can
> simplify existing error handling.
>
> Fixes: c09a3e6c97f0 ("soc: samsung: pm_domains: Convert to regular platfo=
rm driver")
> Cc: stable@vger.kernel.org
> Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

Applied for fixes, thanks!

Kind regards
Uffe


> ---
> v2:
> mark as fix, as this isn't a pure simplification
> ---
>  drivers/pmdomain/samsung/exynos-pm-domains.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/pmdomain/samsung/exynos-pm-domains.c b/drivers/pmdom=
ain/samsung/exynos-pm-domains.c
> index 5d478bb37ad68afc7aed7c6ae19b5fefc94a9035..f53e1bd2479807988f969774b=
4b7b4c5739c1aba 100644
> --- a/drivers/pmdomain/samsung/exynos-pm-domains.c
> +++ b/drivers/pmdomain/samsung/exynos-pm-domains.c
> @@ -92,13 +92,14 @@ static const struct of_device_id exynos_pm_domain_of_=
match[] =3D {
>         { },
>  };
>
> -static const char *exynos_get_domain_name(struct device_node *node)
> +static const char *exynos_get_domain_name(struct device *dev,
> +                                         struct device_node *node)
>  {
>         const char *name;
>
>         if (of_property_read_string(node, "label", &name) < 0)
>                 name =3D kbasename(node->full_name);
> -       return kstrdup_const(name, GFP_KERNEL);
> +       return devm_kstrdup_const(dev, name, GFP_KERNEL);
>  }
>
>  static int exynos_pd_probe(struct platform_device *pdev)
> @@ -115,15 +116,13 @@ static int exynos_pd_probe(struct platform_device *=
pdev)
>         if (!pd)
>                 return -ENOMEM;
>
> -       pd->pd.name =3D exynos_get_domain_name(np);
> +       pd->pd.name =3D exynos_get_domain_name(dev, np);
>         if (!pd->pd.name)
>                 return -ENOMEM;
>
>         pd->base =3D of_iomap(np, 0);
> -       if (!pd->base) {
> -               kfree_const(pd->pd.name);
> +       if (!pd->base)
>                 return -ENODEV;
> -       }
>
>         pd->pd.power_off =3D exynos_pd_power_off;
>         pd->pd.power_on =3D exynos_pd_power_on;
>
> --
> 2.51.0.788.g6d19910ace-goog
>
