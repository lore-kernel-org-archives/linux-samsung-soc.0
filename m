Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 476E62D9797
	for <linux-samsung-soc@vger.kernel.org>; Fri,  3 Oct 2025 17:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759512179; cv=none; b=eCJ2iG8m5GO6z//4vEsN6BACIQbdlSLIWFXn8ALTREuSY2XmA2cunw7AB7GKUW/1oEFg0KSDAZv/PRAqx7QOAcyASU5ZR0WzX13v+cKSSx7wdDx014i8cmHM/cLOqWW6Jwrz9/ZUjjkGMHkrafOBcoPnfOHo6eUByd3gn6pM03E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759512179; c=relaxed/simple;
	bh=nG0ahfV68XEs9AbhYnuX7OiFNRl3Vvk1C7mNKiqb+o4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NZVjzmNi62+gtRNl6BQVZRXuqysLjluMpPSHZur6SgQCbgFlLpgQG5WwBx/nFbmxi/lDV6Lt0wa7lP6hY8kPVNCLdUOxNXuHnehgGomsTGRVzZDWKf5jFS4Dq3IwyrA58adf4p6jlZ3cPNuWOj/GaHydi2oa0bCg6FUdmDPqbag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ryLEMopg; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ryLEMopg"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-71d60528734so28437717b3.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 03 Oct 2025 10:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759512177; x=1760116977; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LGWR7Op0jGJB/hnyDRBm1VaEtVV6gV3pqYTKcigBXCc=;
        b=ryLEMopgDzpxHODHZ43tFOza6ZmIUOW8c+Kdq97oCHLNzeBZmiWAqyt33mhQDGsrlu
         mzATRdt9RE0qzHRhyC1KRPGA5FZtfwxNDFjQoYCa5jAu0G+muMrhmf2WUFmHzLm0xqa+
         0oy41SRqH+h1WM3GMZJmjDU2pzBbJSX36rT9rE+8J7XEeRQjfwuJYHt0TII+YcTk5aJc
         I3IWrXO0kcT1EnubYjoWzWZHrR4SQ0qZoBhqCV7CQ5ZLIod9Q7qYKHSVDqV6d4wivOKq
         oqA4Av8FZokhGhuC4EqGmvtzt/eTfT3FpykYKdHCoXch80929mRJKLXOV8hpGXT1iczU
         rOQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759512177; x=1760116977;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LGWR7Op0jGJB/hnyDRBm1VaEtVV6gV3pqYTKcigBXCc=;
        b=gOPvEQX3YgCcoJ7Hj+SojduTbNaC5uN96bWZcFNAewUZu5Po7voOQ7pskG9UGVqlVr
         Cz3osLNPM/6vFehEHgqMr79rPVXpnRy4UzZM78ZDCbum3b98GMroRVzy9MEcu5fmQye7
         NBjAsVHNMKyyfWqRKo90pCas3wBdeW1AS/3Db/e301KPkB0vG05RKzuOc6tgv3Kn4E+1
         coYMqrjK5tNfBcCw/lxT45ugkM3EsUSfn+1Yojzou+CUScAqCBy3DckYygIjnZuvBiKv
         sxtB5Sz1wwR40q5M8pM9x878xVjn55FKUVcNnQ0Y1RSbBq7FLlFtMG6i99/LKmSm/dfQ
         tZ1g==
X-Forwarded-Encrypted: i=1; AJvYcCUlty/KcXhVrx6wZguxFIkul3PnPYuvU22JBYqBIh28JOwGW+NLBXDb6YNvLQQOoPPpkmCU0MwELLMUW7T5hPw6ug==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6Og4FIROs85o0fqgeY8jEed5+OckwUMH5M81coqNGI3TP+GhI
	qXpFcBXFeT97kSlj8u/aRjgKVxg29B6l5Nc80VJivaCwP2iY4BYkITqKJge9m0LAtN5upyaKzCJ
	bHIy9kbjkLrY8vjax5LJuLddKoacmUm8jrAtP+kYjvg==
X-Gm-Gg: ASbGncv3jWsRnVpDMq2B9RtR7fZ/7UNL/6S2GBcLT0xtJEcK0Uvev613IvYH/xjU+en
	ItmpGDbFiJv58MyvS8TmlCft4ZTv1Itsq8sO034JNJucxKgtZdqulBZXW5mUtqSoP+REJmP+uOY
	e8RrdiKZ+MPHRJkO199v5yQ8CwkrA7MEjiA5kS5YJIb1eHLFTpbinWWY9OFTvrVtlBn8T/NuxaL
	Nn/uIZ6qAB3/c/QXqgOwMtSfAiHxrL/3Urq8c4xVBOo
X-Google-Smtp-Source: AGHT+IEaOvU8KB5Em4L2bWs/Xj/IkcvvxTcqZJWq4PxSiqWi8wXfy+Ft4q6LsFqAEYTMabgdZG5h7FcKPPHNINr43CI=
X-Received: by 2002:a05:690e:1c4:b0:636:d230:7d82 with SMTP id
 956f58d0204a3-63b9a0e08bdmr1960868d50.26.1759512176832; Fri, 03 Oct 2025
 10:22:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251002-gs101-pmu-regmap-tables-v1-0-1f96f0920eb3@linaro.org> <20251002-gs101-pmu-regmap-tables-v1-1-1f96f0920eb3@linaro.org>
In-Reply-To: <20251002-gs101-pmu-regmap-tables-v1-1-1f96f0920eb3@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Fri, 3 Oct 2025 12:22:46 -0500
X-Gm-Features: AS18NWBQR2ismkqxDcti8kjrNtnGND89e5O87aRDbFrbCUVqVqwZBLFSImHDwoE
Message-ID: <CAPLW+4=mVbXex9Sxm2oEq0j3RJ0_KtXRq2Ttt5cfQ_dxXTuhSA@mail.gmail.com>
Subject: Re: [PATCH 1/3] soc: samsung: exynos-pmu: allow specifying read &
 write access tables for secure regmap
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 2, 2025 at 5:33=E2=80=AFAM Andr=C3=A9 Draszik <andre.draszik@li=
naro.org> wrote:
>
> Accessing non-existent PMU registers causes an SError, halting the
> system.
>
> regmap can help us with that by allowing to pass the list of valid
> registers as part of the config during creation. When this driver
> creates a new regmap itself rather than relying on
> syscon_node_to_regmap(), it's therefore easily possible to hook in
> custom access tables for valid read and write registers.
>
> Specifying access tables avoids SErrors for invalid registers and
> instead the regmap core can just return an error. Outside drivers, this
> is also helpful when using debugfs to access the regmap.
>
> Make it possible for drivers to specify read and write tables to be
> used on creation of the secure regmap.
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---
>  drivers/soc/samsung/exynos-pmu.c | 3 +++
>  drivers/soc/samsung/exynos-pmu.h | 4 ++++
>  2 files changed, 7 insertions(+)
>
> diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exyno=
s-pmu.c
> index 22c50ca2aa79bf1945255ee6cc7443d7309b2573..9f416de03610b1727d8cc7761=
6e5c87e2525cc69 100644
> --- a/drivers/soc/samsung/exynos-pmu.c
> +++ b/drivers/soc/samsung/exynos-pmu.c
> @@ -635,6 +635,9 @@ static int exynos_pmu_probe(struct platform_device *p=
dev)
>                 pmu_regmcfg =3D regmap_smccfg;
>                 pmu_regmcfg.max_register =3D resource_size(res) -
>                                            pmu_regmcfg.reg_stride;
> +               pmu_regmcfg.wr_table =3D pmu_context->pmu_data->wr_table;
> +               pmu_regmcfg.rd_table =3D pmu_context->pmu_data->rd_table;
> +

Seems like pmu_regmcfg declaration can be pulled under this "if" scope
-- just a thought for future.

>                 /* Need physical address for SMC call */
>                 regmap =3D devm_regmap_init(dev, NULL,
>                                           (void *)(uintptr_t)res->start,
> diff --git a/drivers/soc/samsung/exynos-pmu.h b/drivers/soc/samsung/exyno=
s-pmu.h
> index 0938bb4fe15f439e2d8bddeec51b6077e79a7e84..113149ed32c88a09b075be820=
50c26970e4c0620 100644
> --- a/drivers/soc/samsung/exynos-pmu.h
> +++ b/drivers/soc/samsung/exynos-pmu.h
> @@ -27,6 +27,10 @@ struct exynos_pmu_data {
>         void (*pmu_init)(void);
>         void (*powerdown_conf)(enum sys_powerdown);
>         void (*powerdown_conf_extra)(enum sys_powerdown);
> +
> +       /* for the pmu_secure case */
> +       const struct regmap_access_table *rd_table;
> +       const struct regmap_access_table *wr_table;

Maybe it's worth to add #include <linux/regmap.h> in this header, or
at least forward declaration struct regmap_access_table?

Also, would be nice to have kernel-doc comment for struct
exynos_pmu_data at this point, but it might be out of scope for this
patch.

Other than those minor nitpicks -- LGTM:

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  };
>
>  extern void __iomem *pmu_base_addr;
>
> --
> 2.51.0.618.g983fd99d29-goog
>
>
