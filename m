Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D3B21105
	for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Jan 2024 15:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706626928; cv=none; b=rLWhOL/xV9hvv7dr7PR7p850pX6zFfuFt9Mp/Mib9JseyX8mqCTvbw6tbUiY1lFhG2smyShc19layssUx0Rw1hroMODzAMoq9prL/9Qh43DIXzusm+B1vRdjC68PQSfxmdwrUuvZxMcC1oMGQFSNNlS5yKUnCnufH4QE2nihloQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706626928; c=relaxed/simple;
	bh=xU89VXeOgdeVGO8ifM+y778gFYd1HxXjIaxrSD2so0U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V7ynSzdZcC1sF3I/yAd1y/Shg4+iBZUpIAtK+oN4Ds8RKMHBmFOOQ2jV7WglrgriSxaxdx68tbZDUohaspBaMQ723GE5pXVs6N8CbTqwuObC8qq2847XNqxNLayeHLp0V2dJF9Y+wDeNbC4zQ+Sn6gD0CNZLv6qXt1lnpPULOAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=b3TbaF8Z; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b3TbaF8Z"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-42a8be32041so31348701cf.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Jan 2024 07:02:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706626926; x=1707231726; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MJ+gflKj48xYGvVtJjeC3SYWWp6ebgTpGb8GhCSAMwk=;
        b=b3TbaF8ZtcGUUthTboJaZqv9R/A5e1fatSjJMg+ywDvd4IuKT3BPR19Ixy30zRtLpa
         uaA/IIY45ZbTXnrGJph8CkdTrDC8afLYsrUGSyyZUuf1KPyeFfNWecyOM7BpFimRy/2B
         R0BC3iaK+qad6AKRQm1KDrvl7LZKX+NwvGxG4ntgbJ3URz+wheDt/5ChOUcA+pn/avwY
         RyJi9Q2AS9rO/KAp1PwnegvHqJWnZW9I1Y3+eXvI4xGpz6ZDZ1He5RU6mGLPW9NajTds
         TFU8Ffyu9gac84ll2o7HWda7el+85V/azO5chfWihG+KK+NWrrio/RA3JXyn1WxVDrCa
         kZBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706626926; x=1707231726;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MJ+gflKj48xYGvVtJjeC3SYWWp6ebgTpGb8GhCSAMwk=;
        b=raSW43ZJceDtgATs4twj2tPpkThIRqI9rO7GrJJlrvSQXLLvvH47PZlF0YtdxIIjbS
         YqyA6zx7BDeUXioI8p66MjqajjWFzePfcld34TFjkVaeIsXkaPUI7Jt6nHjQ/D8WI3J0
         rWQ5HYwMnAtbl09PmOjBt7jiSRAEkz6cG27jqkmGAVh/cf004/RaFGg9iUNn+niiujyh
         e3Sr2CpuDE/9xN6Wa1fxyBArQwAj0jRBo3bYE4xE7d1iALycckc1b5EExUh7Tfjb5TkW
         srflxAcd/TfnxTK4hWA+Pc63oU0FGK/qeJceRuPqavBkIxkkggF0+ujjchIqgRaZmuXs
         cmpg==
X-Gm-Message-State: AOJu0YwduyQ7UHEEpuE2jMnqUyf9kdwsPT27T0OqQIsNi1ifYA3FWsag
	mJgs3g4jc0Wra+YXkJiguJplnn6pJDn2VjWhTYs0c+Yfp34OliU1kfCEDNsShZQkjs/D+NFiYzq
	jipQd2xE6ltkZz16mD3y3oDcYQ+yP4aSqX1rnCA==
X-Google-Smtp-Source: AGHT+IHXg+32TKi5xcy+oIQz9oqU8rWRsJ2Fi4QgcBOniIyeMqG+ulFYU5PWZSXQm342RKVoD9XX/PYp3pIdBrV6//c=
X-Received: by 2002:ac8:4e86:0:b0:42a:b809:7f95 with SMTP id
 6-20020ac84e86000000b0042ab8097f95mr1371826qtp.8.1706626925869; Tue, 30 Jan
 2024 07:02:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240129211912.3068411-1-peter.griffin@linaro.org>
 <20240129211912.3068411-2-peter.griffin@linaro.org> <b1798b8a-5794-4c79-a1d3-50259fa3ba81@roeck-us.net>
In-Reply-To: <b1798b8a-5794-4c79-a1d3-50259fa3ba81@roeck-us.net>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 30 Jan 2024 15:01:54 +0000
Message-ID: <CADrjBPrr5t-ZbYH-agsfniztBCtf15UMMmUGTNuHTX3dm=Rkxw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] soc: samsung: exynos-pmu: Add regmap support for
 SoCs that protect PMU regs
To: Guenter Roeck <linux@roeck-us.net>
Cc: arnd@arndb.de, krzysztof.kozlowski@linaro.org, wim@linux-watchdog.org, 
	alim.akhtar@samsung.com, jaewon02.kim@samsung.com, semen.protsenko@linaro.org, 
	kernel-team@android.com, tudor.ambarus@linaro.org, andre.draszik@linaro.org, 
	saravanak@google.com, willmcvicker@google.com, linux-fsd@tesla.com, 
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Guenter,

Thanks for the feedback.

On Tue, 30 Jan 2024 at 06:26, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 1/29/24 13:19, Peter Griffin wrote:
> > Some Exynos based SoCs like Tensor gs101 protect the PMU registers for
> > security hardening reasons so that they are only accessible in el3 via an
> > SMC call.
> >
> > As most Exynos drivers that need to write PMU registers currently obtain a
> > regmap via syscon (phys, pinctrl, watchdog). Support for the above usecase
> > is implemented in this driver using a custom regmap similar to syscon to
> > handle the SMC call. Platforms that don't secure PMU registers, get a mmio
> > regmap like before. As regmaps abstract out the underlying register access
> > changes to the leaf drivers are minimal.
> >
> > A new API exynos_get_pmu_regmap_by_phandle() is provided for leaf drivers
> > that currently use syscon_regmap_lookup_by_phandle(). This also handles
> > deferred probing.
> >
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> [ ... ]
>
> > +/**
> > + * exynos_get_pmu_regmap
> > + * Find the pmureg previously configured in probe() and return regmap property.
> > + * Return: regmap if found or error if not found.
> > + */
> >   struct regmap *exynos_get_pmu_regmap(void)
> >   {
> >       struct device_node *np = of_find_matching_node(NULL,
> >                                                     exynos_pmu_of_device_ids);
> >       if (np)
> > -             return syscon_node_to_regmap(np);
> > +             return exynos_get_pmu_regmap_by_phandle(np, NULL);
> >       return ERR_PTR(-ENODEV);
> >   }
> >   EXPORT_SYMBOL_GPL(exynos_get_pmu_regmap);
> >
> > +/**
> > + * exynos_get_pmu_regmap_by_phandle
> > + * Find the pmureg previously configured in probe() and return regmap property.
> > + * Return: regmap if found or error if not found.
> > + *
> > + * @np: Pointer to device's Device Tree node
> > + * @property: Device Tree property name which references the pmu
> > + */
> > +struct regmap *exynos_get_pmu_regmap_by_phandle(struct device_node *np,
> > +                                             const char *property)
> > +{
> > +     struct device *dev;
> > +     struct exynos_pmu_context *ctx;
> > +     struct device_node *pmu_np;
> > +
> > +     if (property)
> > +             pmu_np = of_parse_phandle(np, property, 0);
> > +     else
> > +             pmu_np = np;
> > +
> > +     if (!pmu_np)
> > +             return ERR_PTR(-ENODEV);
> > +
> > +     dev = driver_find_device_by_of_node(&exynos_pmu_driver.driver,
> > +                                         (void *)pmu_np);
> > +     of_node_put(pmu_np);
> > +     if (!dev)
> > +             return ERR_PTR(-EPROBE_DEFER);
> > +
> > +     ctx = dev_get_drvdata(dev);
> > +
> > +     return ctx->pmureg;
> > +}
> > +EXPORT_SYMBOL_GPL(exynos_get_pmu_regmap_by_phandle);
> > +
>
> I think there should be a detailed comment explaining why the complexity
> is necessary instead of just returning pmu_context->pmureg.

Ok, I'll add a detailed comment for v3.

Thanks,

Peter
