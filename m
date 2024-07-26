Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2AF3CF7E
	for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Jul 2024 18:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722017300; cv=none; b=pcJkRq2hzVPNY+eXBQP8+QjJab4jwBRHpfP788bq5H81Kk9leC1YqxWgtdMWObS6PNRW2M68Z+80QfsEWe3FClzAbkgsPQ93zXYwVdGaxR/CC+tJ9WdrjMZUeNpacbE1Pa7xMQSw+UA6qQ89WcXPtbrxWoRYbQC/Ibnr0giJGew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722017300; c=relaxed/simple;
	bh=GxmoYIeBXMGpKO1+bZK55byxlD5ApVDBz7Iy5st0gJg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KXNyTPY+sPFSWzDVjAS42vw35l+rIrhpc6W4F46yrxsd/m3ycpJSKRDUyglxnaHj8bkIDa0FylNGVyAHIgnxeOq1Q1oTXNhbCKncwJZuaMZETKvNNEq1kRkiHetnBS1xFNOhzaEaJRRZYaVOsNTmv5jBYpnSdT9UW1PDYKbv49E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D+QyDVFn; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D+QyDVFn"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-65fdfd7b3deso24283487b3.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Jul 2024 11:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722017296; x=1722622096; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A0k1VjbXgRbh6rHMNc26/2pKAqBtNwTa1NeFJwoSY3w=;
        b=D+QyDVFnMmZxdzlFjgXelWCHAnLdsGVHFOxt2VFwIJkwtoIXZzhD/jPVg5QLc0c1Hf
         7cVQ/ThOopBOi1uN0rW5tFccw1G/UnkNjY8Tb69lN+h1BNS6MNDE0sxefbcvUxQUgz9m
         F/ESNm1sGRL/Qmlz5xtExaUhEiVGWQ4udY/iuRsV9BeyqiW1k+Sur+Z6edhHiw4b4kpA
         DXvio62XKbwKagkIjgIdfOLYznce+5Erd00GTTCmM1+fYV1bb5Z/8w9husIdHMUtbknT
         QdBQWE4ZNHHxrvhIwW1JRRUov1de6Uuq+/A0s2Gx+mTevJNWPPSBWc9k3suD7EggcTah
         dUGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722017296; x=1722622096;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A0k1VjbXgRbh6rHMNc26/2pKAqBtNwTa1NeFJwoSY3w=;
        b=BZkx7j6XFzCx06+k62RdQceELaY33zySNNonwYSJR/K8POJ4dz6FZ3EJZQAKYy1Vrd
         B2TCuKzYWQjY5R6jJUSoD7bp3YVDMKNrw9sZjjIMcp60LNbCgfS+xHu+NfBskXv2tWk9
         RuXYFjI4Dq5pXI0nrHDHqSEiX+Yey7zpvEvi6RsHZLJpkPvkSauU3BYwhN/ewO7y+DGM
         MzdWdH4zXsNPk0MVfMEUu5oAEu5TlosE2kBFqO0xFHrXsMcsmL4Pa46Z2GZBsAM9lGgs
         4ULsd2sGa9wqPZCddSEXwGNIIieN4uAui80MjZ1jAfyRFgufoNYiYFBII2rigBWd8Kbe
         4T/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUtT81BFJfqKGDMMZWFe5Fx9txzZiyt4r44lBEgn4v2/0XLbngYnGioFIsDragDyVC7odFQOaVUsQGgnvmYL2cc/Sx130CungJbSstoYHzqhco=
X-Gm-Message-State: AOJu0Yw+86A/S5FB80RMuFV2ZTFjVsmgOw5yhj2Y3b/Okc5rCBezFVMs
	ftuHwlPWndncqBhuFTI9wNgFxQWo5gT/3nDnQyJe5gUR9Aas34cqZJY+K1aKEfpJ5ly8bohK1Kt
	AsHpRCHzbeP0R5s2wGAGgqInZds8Lfoc1ORGM9w==
X-Google-Smtp-Source: AGHT+IFkESiWao/vWnFp/DsXlGOMMM3aoXRS1ZwQbcgc7JCIUzd6EJnTYt77j/BQJ878gOluPtcgh7p7GqV6PD/zXX0=
X-Received: by 2002:a05:690c:4a01:b0:64a:e2ab:be33 with SMTP id
 00721157ae682-67a073b4271mr7940997b3.22.1722017296429; Fri, 26 Jul 2024
 11:08:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20240726110136eucas1p2c100992bb710acb5a12bb294401d4aeb@eucas1p2.samsung.com>
 <20240726110114.1509733-1-m.majewski2@samsung.com> <20240726110114.1509733-3-m.majewski2@samsung.com>
In-Reply-To: <20240726110114.1509733-3-m.majewski2@samsung.com>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Fri, 26 Jul 2024 13:08:05 -0500
Message-ID: <CAPLW+4n==hm=tiDOZ14LMw-nWGbu22m2rh7nEJyUR6f0AwzOAg@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] drivers/thermal/exynos: use pm_sleep_ptr instead
 of conditional compilation
To: Mateusz Majewski <m.majewski2@samsung.com>
Cc: linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Anand Moon <linux.amoon@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 26, 2024 at 6:01=E2=80=AFAM Mateusz Majewski
<m.majewski2@samsung.com> wrote:
>
> Slightly simpler and nothing is lost if _suspend and _resume functions
> are built unconditionally.
>
> Suggested-by: Anand Moon <linux.amoon@gmail.com>
> Signed-off-by: Mateusz Majewski <m.majewski2@samsung.com>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  drivers/thermal/samsung/exynos_tmu.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
>
> diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/samsu=
ng/exynos_tmu.c
> index 9b7ca93a72f1..b68e9755c933 100644
> --- a/drivers/thermal/samsung/exynos_tmu.c
> +++ b/drivers/thermal/samsung/exynos_tmu.c
> @@ -1132,7 +1132,6 @@ static void exynos_tmu_remove(struct platform_devic=
e *pdev)
>                 clk_unprepare(data->clk_sec);
>  }
>
> -#ifdef CONFIG_PM_SLEEP
>  static int exynos_tmu_suspend(struct device *dev)
>  {
>         exynos_tmu_control(to_platform_device(dev), false);
> @@ -1152,15 +1151,11 @@ static int exynos_tmu_resume(struct device *dev)
>
>  static DEFINE_SIMPLE_DEV_PM_OPS(exynos_tmu_pm,
>                                 exynos_tmu_suspend, exynos_tmu_resume);
> -#define EXYNOS_TMU_PM  (&exynos_tmu_pm)
> -#else
> -#define EXYNOS_TMU_PM  NULL
> -#endif
>
>  static struct platform_driver exynos_tmu_driver =3D {
>         .driver =3D {
>                 .name   =3D "exynos-tmu",
> -               .pm     =3D EXYNOS_TMU_PM,
> +               .pm     =3D pm_sleep_ptr(&exynos_tmu_pm),
>                 .of_match_table =3D exynos_tmu_match,
>         },
>         .probe =3D exynos_tmu_probe,
> --
> 2.45.1
>
