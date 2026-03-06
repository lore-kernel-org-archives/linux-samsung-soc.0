Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBEDE367F54
	for <linux-samsung-soc@vger.kernel.org>; Fri,  6 Mar 2026 15:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772810486; cv=pass; b=sATAZSZ2QI6N5y5huUKUsNZOgm0KKHZjxgE9TuktqC/mNT4mZZCFCw7cgkh9fHeYke2anEvi/PPim77/vpCOAor9Z+HwlRpudqGayr0J/g31l1IlIw7eJua9GEwbLHxcb4h31+FgkP1ACZ3XLLQwxtkRl152AxI3a+BZYPN2IxM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772810486; c=relaxed/simple;
	bh=clDN9Q/ggH6IxCcQFM2Fua/woNyxwC6yrqnlD16EscQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oNVjFMyStVX4Hq1mEm9d9eLN1GeeLJfBJ309o0ziNCqEj0Nb/JxDpl9wR10/7w7+HitYo4x1QReZKkLO8oh7QY4ta4dwAWh4v0s1Hzq6aC5JT6SgPmGy/Zhjzk6nPZtwbQXIZ8o2OhXRHZOK2BH73l1/dGL0vL/fg0IBaJQGGLU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZNLCmAag; arc=pass smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZNLCmAag"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-65c0891f4e9so724263a12.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 06 Mar 2026 07:21:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772810478; cv=none;
        d=google.com; s=arc-20240605;
        b=h7RvggbKcGz8TsGUEn1Q/MtANemdXmozSICkDZvwUjQrQvEHvv72+f+BQ4Eeq787Cl
         Pr/zXwbcP8+X5eRMbKk3/6R0xIN/jZrm3OL+wRGr0WrLIwsIuR8HdCMDJFUvhgJWwTal
         IuA/k42ch+Ut84t8+9mt18WVvpnxAbhILZB3hVQaXgKcz/A2rmWoCsM97nqitxFu3aIa
         7y84zoH1ZfyRqFZzYkpIZoPvzOiE/3nywjWQwHVeDSC9eW4Mirs9JblgPrkC4DI3YDc0
         UFh2h1OKqVLoj/7u76gwzLRyKc5h99ICVy8jWEXE2V+7X/KOIkcUwBJJgqy7Euj6fIaL
         p2Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fVf18GuOCj4KUJQyL5+kDdyR0nQ8PeWTy0/PXRvmRP0=;
        fh=Ai6v+uks+JBLmlCLDHLepojGNqJf628Y5v5nmyvTcGw=;
        b=QLkZ1f4wYm0CaPnHOZpXby210Z2XPyw3FOrpqfqPeWc6I6kH/hd+UwbjRmo1Bej4CC
         m6EfoxZuwRyXzMqTz07GcozAWHyAJDJK4oHRzKf+ra3RtY0HwdS3omnNHUOgX34vdUUs
         c8pY+hty8W573Lkbg10hMJsrNKYb1TI/fk58fUDQV55tGB7Pc78ZXSVdH3c2i7+AADSX
         cSMes3dv0Qsl36NVxiA+x+zDdup6BblyNoYFQJLUJoW1ihxpLFzl9+L/m/ycHMioWKyJ
         E4kyi6mXYaIuspFP9wP1gAiO/Qw2zjAZAlUmNfAmRH7RXE+/061WMa/94hbxoWYuH6l+
         2CKg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772810478; x=1773415278; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fVf18GuOCj4KUJQyL5+kDdyR0nQ8PeWTy0/PXRvmRP0=;
        b=ZNLCmAagGeCgfsW7k7dfrDPZU9Pz5OCW0dPv84z6mZ8Y7bvXNC2GedgDhbGi+AAMbj
         VfaqdgP7PHzF64KBl/Nvbr/IjhMuv1KZlm5mNpL2muvGt5IauVZ6FGtea+Ru3vz6aZKw
         R+c9U4jxZrQkilY0P6PfuEf48KYvXanQzxvLKHg6cTcE3QWKr+YaWQwdaOETSE+OU+Jk
         0xAb6UdItKQ3zCNFB4WLazMHlieqwHL1G4GdbZtykyfTUBjyU0BGrZD8/ZGlY7Vvvr2L
         yALj4c7O+UsaNjPiw9IR5rJshgvBC+Op8veKALmgpxqOkr4fn/0RloMb4O9YzyGaY8vh
         BPpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772810478; x=1773415278;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fVf18GuOCj4KUJQyL5+kDdyR0nQ8PeWTy0/PXRvmRP0=;
        b=aG8tDdtm/VSz0uJ2gekGUcaX3+zl/qHpsTnRsyTSIvkE+MlX2qrBxW1LaGPQxBV+O1
         tGebiLo1VHRCXMa2DgL6Uug5bZQrHtMMbZAeu88zKGlugoH25VryabZxsdQx7nYpM9TF
         saQecFw/4UehZj8pvTsgvHqYttSx+0Ze5XxZL14UbOwuSsQ6mnWh1SSlk68VCsz3u/8Y
         TJiWyGlqZBIlg5KjCfmDsWfMu5rOidqNnnrMRKAfBtjCe2GFEqfpUeKV1qdX0u3V5Qru
         xxBmdKFdzJDOB5AMDPU6VKiHExOVT0HaOvyKF4u39xw13Ydsc795R/+K5Rsh7zgGZKeE
         tZTg==
X-Forwarded-Encrypted: i=1; AJvYcCXHsUQzsUrEeR9LJvvVl9pqRIgPIDKUhkwkuPaSoruFhAZVWEWNSW6Yo778kbGWgR60Rz7EQEEOEMc25J46a7VPtw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0VYwgSkvIZK5PU7q4z98MZ30A9JWKtlrvQEREjLNiTCnbLATb
	eP6Kj++2laRVzgcsM1n8g66r3zNvf6kS5jn49Eus3XtGgVih/LDnDcotOH7VBhIyud+TIZme2FR
	SBNZF4B0aKDa16lsFjkVd+nos8hX/FcarrRQ4nXbhJQ==
X-Gm-Gg: ATEYQzyzDTs8aGv5gplG+hfMY64HiNkZP0hODKoOq2TgSUoYCfYGR2SJeQFEboOz+dx
	KO7rR+FI90iwGTSIJ5IRTZpotCkBQ/Eg2oVBJtvhMwLZn99LbWsOEIn7zQGzv3i4QuaRZH9iYOd
	6JN5+eRKlPG1jfhbByFKpaImDiZxVxjYnuBbose8dClS9M/BuoNISoxty2PZMpmXE7aJSZLUJyv
	w9gKO529IFtaaasvTxVPfZZeFViCNC5vKtxgws0f4x7tQWttOoKw2nLwRBtsqZWS+nmQVP/sIah
	4HlZaQ1QLqRaoxLQerz7GN3iG1DhLO0JK4Nz+VecSA==
X-Received: by 2002:a17:906:6a0c:b0:b8e:3d49:25db with SMTP id
 a640c23a62f3a-b942e00db25mr143796466b.54.1772810477794; Fri, 06 Mar 2026
 07:21:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260306-gs101-pd-v7-0-03f7c7965ba5@linaro.org> <20260306-gs101-pd-v7-8-03f7c7965ba5@linaro.org>
In-Reply-To: <20260306-gs101-pd-v7-8-03f7c7965ba5@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 6 Mar 2026 15:21:06 +0000
X-Gm-Features: AaiRm53NoJSram8HquKNMruwU8Hhr-XYeKCTUDRI7ADZLhZOeyB6oV1YUnbVV6A
Message-ID: <CADrjBPqnf9YVeOgY=uSETnbcQLgi5OY2N3usPOjzJx4o0hGEPA@mail.gmail.com>
Subject: Re: [PATCH v7 08/10] pmdomain: samsung: use dev_err() instead of pr_err()
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
> dev_err() gives us more consistent error messages, which include the
> device. Switch to using dev_err().
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  drivers/pmdomain/samsung/exynos-pm-domains.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/pmdomain/samsung/exynos-pm-domains.c b/drivers/pmdom=
ain/samsung/exynos-pm-domains.c
> index 2214d9f32d59..41a232b3cdaf 100644
> --- a/drivers/pmdomain/samsung/exynos-pm-domains.c
> +++ b/drivers/pmdomain/samsung/exynos-pm-domains.c
> @@ -30,6 +30,7 @@ struct exynos_pm_domain_config {
>   */
>  struct exynos_pm_domain {
>         struct regmap *regmap;
> +       struct device *dev;
>         struct generic_pm_domain pd;
>         u32 local_pwr_cfg;
>         u32 configuration_reg;
> @@ -47,8 +48,9 @@ static int exynos_pd_power(struct generic_pm_domain *do=
main, bool power_on)
>         pwr =3D power_on ? pd->local_pwr_cfg : 0;
>         err =3D regmap_write(pd->regmap, pd->configuration_reg, pwr);
>         if (err) {
> -               pr_err("Regmap write for power domain %s %sable failed: %=
d\n",
> -                      domain->name, power_on ? "en" : "dis", err);
> +               dev_err(pd->dev,
> +                       "Regmap write for power domain %s %sable failed: =
%d\n",
> +                       domain->name, power_on ? "en" : "dis", err);
>                 return err;
>         }
>
> @@ -71,8 +73,8 @@ static int exynos_pd_power(struct generic_pm_domain *do=
main, bool power_on)
>                 /* Only return timeout if no other error also occurred. *=
/
>                 err =3D -ETIMEDOUT;
>         if (err)
> -               pr_err("Power domain %s %sable failed: %d\n", domain->nam=
e,
> -                      power_on ? "en" : "dis", err);
> +               dev_err(pd->dev, "Power domain %s %sable failed: %d\n",
> +                       domain->name, power_on ? "en" : "dis", err);
>
>         return err;
>  }
> @@ -140,6 +142,8 @@ static int exynos_pd_probe(struct platform_device *pd=
ev)
>         if (!pd)
>                 return -ENOMEM;
>
> +       pd->dev =3D dev;
> +
>         pd->pd.name =3D exynos_get_domain_name(dev, np);
>         if (!pd->pd.name)
>                 return -ENOMEM;
>
> --
> 2.53.0.473.g4a7958ca14-goog
>
