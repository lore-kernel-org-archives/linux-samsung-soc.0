Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 291CE328B6D
	for <linux-samsung-soc@vger.kernel.org>; Wed, 22 Oct 2025 11:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761131259; cv=none; b=mHMSHQp09YcdRWI4trqdBgqVG31P7cqHG78wOvz0xWe+wG4bCbnF+3SCjBcaZ/hrG8aftQlHpDwzTtUcck645kxX1Fj3+qwj7OaZ32ITJ0NXKtZkq7cWkTW6Y/fbegmU64wUMQp7KXidlmJrXS/T6dm56RGdr6M/lgKKMmTUu4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761131259; c=relaxed/simple;
	bh=NF6e/3SUl/mK178rTaB2eKW0q0VirZfspZzm5JQSfYo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T3UHrj5OW+i6eXul2AkAlJFcExKedsniNMYf7QnqykJ+TKTckQsy3xcJzgfN7Ju4uG3TVcCyiXDnvneG0daLxXjhw7oijiTb7PS0cpZY2CdZJGXu4lq71KqsAeJ0LMXCI3yISmJIxkqlOeaHr6i/yYSWEr+Q7YBVP/jNXE/A8lY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZvLXCjZt; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZvLXCjZt"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-7815092cd22so90112217b3.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 22 Oct 2025 04:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761131255; x=1761736055; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U5H2hOYHrC6k0KzLWWZQ6pqjMN1sq2+E7LMIYVsMxic=;
        b=ZvLXCjZtpmQOoxUHrdpzbyT9qlu9PqNgcaMl/88hmEhg6lonFsAe5xUl74Cbt67x8L
         LCgEBLZAhtIQ0MPkhPv41aZaW6ooUyAK48gSv16jJpl6Qw5bfzWkqCSqmGjL7iKQBg/6
         DduUslsFpyQGkzseVEOKZ0ayM3pRfpABf4ZyYVwLAMOxiFatX/RLj75jjdIFgDZfZTyH
         1w+rXTMpFjfu48zxGmpiLlprLGWY7/O3dc+J8ff9VJPLQoHFt4ijOEy5rgez+8WqxacP
         phZqMlB8xuiZ+uysYR8UprE/SXqg3qIImO4ZKZUgvJRIAt3GwTAZDPRTg6yd1LPRlrUc
         87sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761131255; x=1761736055;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U5H2hOYHrC6k0KzLWWZQ6pqjMN1sq2+E7LMIYVsMxic=;
        b=McXx+VCvTLfg5b25gZxG3KuE5en0OMyxekuYQoKHDTtfxLiMc6uofkmsCPwWmiTWjw
         +DdgAQnygNEXZEFhO/A6kFRsjgsICL+z3xnVVWFuWhMQCosvHvCjRQJp7IGZqh/+QvNi
         xIr51B7yeWDc2JdjUVKXBX5chRg7THoEhKx9a63TACAu2GPwH6Vl7LXim0JNIiJw/HNP
         qeWAfh11KB69USIwjyV3PAUUdXf0WIb/6IW707+cAPCTi8pxE/+Iu7YDeLg2eRm2Iydz
         hed96G6ZEgqSNdEOfP/GW/zSo+Hu9AQkIHbWN5TLY5GI4acQQgel/7Sui+iv+5NIEeX6
         7NOg==
X-Forwarded-Encrypted: i=1; AJvYcCVf/gRSUBFzH09pGmrtGS8ZjE5a7w9f405ewyOREAYf+yqIBBlIP1dhPwpVPmhbO4yRIvAumNugkQXiB2/oaP9v0w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxdqIhFhPbDuH1BNfPP2Grmy1Jb154MoY2rkrAWUuMFRoIB+lA3
	f69qmyW0oT7qCU4OoHrtA6oYXK/VLeRJXh0LRxX0zbk7PVk8g1SSj3EC2U1H9sl0hgAQNh4dXlB
	4aNh4Wtd+dJX7iYl5UvdWiofNt9Mt1JzsC0Djf9A8YvqVDgCNivT+m1s=
X-Gm-Gg: ASbGncuEM713oapVOkor8uIJYPMKbumm2KT6bHQ0fmhWksmhSGA6JbMyM5pdFf49b9a
	Bp8dFNqSn0xRSFxOAdWQi0HzyUh/KsI1dldlK42XOBzaWN7q6bhgPhFBTqEEwhQFgLh48OSe0E4
	4INoz7RNzf3AmBLmctCbKuOzsumQOJhAP/ox6lQdEIGXv0Fph9Oy8qcGSENqRUafr1mIQgkOvZ4
	LP6Y/P/++TK44+16yE263m1gTdZt8UkndKQL6HBEX3T3Gj+GNKAPPzFddnGl5s3Zrq9+Zuj
X-Google-Smtp-Source: AGHT+IFJ1vqYp3EqzVjhqjgkltJtdC0F8S0mc4Lwhfr9E90fNJYBhrJvwPxKs+vLQCTJSeMcdqP1qkhWadhCQNPbGBw=
X-Received: by 2002:a53:a0cb:0:b0:63e:e9b:6220 with SMTP id
 956f58d0204a3-63e161d9a5emr12477946d50.47.1761131255117; Wed, 22 Oct 2025
 04:07:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251016-gs101-pd-v3-0-7b30797396e7@linaro.org> <20251016-gs101-pd-v3-8-7b30797396e7@linaro.org>
In-Reply-To: <20251016-gs101-pd-v3-8-7b30797396e7@linaro.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 22 Oct 2025 13:06:59 +0200
X-Gm-Features: AS18NWDVrbFCkhc03fhqCT8wIs3nWgG9ruif750F0ANB4USSH-3L9fEAVcRT1Po
Message-ID: <CAPDyKFq2esPos=D-eVz6w1VXq=4LYi6fx54K4TvsUi4JqUJOaQ@mail.gmail.com>
Subject: Re: [PATCH v3 08/10] pmdomain: samsung: selectively handle enforced sync_state
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 16 Oct 2025 at 17:58, Andr=C3=A9 Draszik <andre.draszik@linaro.org>=
 wrote:
>
> Unconditionally calling of_genpd_sync_state() causes issues on
> platforms with child domains as the parent domain will be turned off
> before the child domain was even registered during boot.
>
> This in particular is an issue for the upcoming Google gs101 support -
> all operations on child domains registered after the parent domain
> misbehave.
>
> Add a flag to the probe data to be able to sync_state conditionally
> only, and enable that flag on the two platforms currently supported by
> this driver.
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
>
> ---
> v2:
> * use bool for need_early_sync_state (Krzysztof)
> ---
>  drivers/pmdomain/samsung/exynos-pm-domains.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/pmdomain/samsung/exynos-pm-domains.c b/drivers/pmdom=
ain/samsung/exynos-pm-domains.c
> index 638d286b57f716140b2401092415644a6805870e..15a1582aa92103a07335eb681=
600d9415369fefd 100644
> --- a/drivers/pmdomain/samsung/exynos-pm-domains.c
> +++ b/drivers/pmdomain/samsung/exynos-pm-domains.c
> @@ -20,6 +20,7 @@
>  struct exynos_pm_domain_config {
>         /* Value for LOCAL_PWR_CFG and STATUS fields for each domain */
>         u32 local_pwr_cfg;
> +       bool need_early_sync_state;
>  };
>
>  /*
> @@ -69,10 +70,12 @@ static int exynos_pd_power_off(struct generic_pm_doma=
in *domain)
>
>  static const struct exynos_pm_domain_config exynos4210_cfg =3D {
>         .local_pwr_cfg          =3D 0x7,
> +       .need_early_sync_state  =3D true,
>  };
>
>  static const struct exynos_pm_domain_config exynos5433_cfg =3D {
>         .local_pwr_cfg          =3D 0xf,
> +       .need_early_sync_state  =3D true,
>  };
>
>  static const struct of_device_id exynos_pm_domain_of_match[] =3D {
> @@ -179,7 +182,7 @@ static int exynos_pd_probe(struct platform_device *pd=
ev)
>          * reset during boot. As a temporary hack to manage this, let's e=
nforce
>          * a sync_state.
>          */
> -       if (!ret)
> +       if (pm_domain_cfg->need_early_sync_state && !ret)
>                 of_genpd_sync_state(np);

The call to of_genpd_sync_state() was intended as a temporary solution here=
.

Potentially, if we would be able to distinguish what PM domain that is
causing the problem on the Exynos platforms, we could set
GENPD_FLAG_NO_STAY_ON for that genpd instead.

>
>         pm_runtime_enable(dev);
>
> --
> 2.51.0.788.g6d19910ace-goog
>

The above said, $subject patch is still fine as is for me.

Kind regards
Uffe
