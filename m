Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8271F866A
	for <linux-samsung-soc@vger.kernel.org>; Wed,  6 Aug 2025 18:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754503702; cv=none; b=tTYQAQWnk2GwLPh4QH2kwDY9JfKR1nvU0Y9nxOWVdPPBf21TExxzYXOG6ykOfC3SMdmZp7zPHAuLGvcvXZaN5ZrIeTUnDA4SA9HzYC9veXWeXAlR5qyj6CpKAEcIF7cquFgktIaH4oVhEN+baX2R8x+HG41OjKsCfkZb8ctkmp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754503702; c=relaxed/simple;
	bh=kc9keBH0hvOHfAXjDx3bZTlAEhj8hxPUYfFUTHJ+WOs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uBqbxQYmpfcBGE0dOvdT/lVZCQ49oh6VSjp3B3puL3MkvWN6giAnOIYVZqCoNr2xGpeVWFZzdQruaRnhJuckw0taqEZn5aR0CHd4UrKcbpMarTNPBYXCk8XbPfI4GpFY3iMUbZyfMkHHaz7LMqGvXfYLJA66y0hFvVQZLAh3CGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nDSyCmDu; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nDSyCmDu"
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e8fd07da660so146234276.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 06 Aug 2025 11:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754503700; x=1755108500; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zeiw/igg3VRkIFQpTb1DWvr2tgsyqZV4hPeCuzYTAzA=;
        b=nDSyCmDujpVKfvvXxzQ2fa+N9sXdlrTXqtYX8hVwMR26kYaTYEYuxLWVVVjQMZXCXc
         qRFDfGmQ0YDFRy5CXjU5Y0LCxke8k368+L3sQK7u2cJJ6MiZ4yrj4vud3HLt16mIfkVQ
         +nr+BmdhlxFZbuSm2r6MrwPGUAP7EQ95km3Of2TU5THSuGyN2YaR2Ye4Sx1GC7IexSCR
         1Lx9FnBBgwZ8sJ2Vk5ZiR6xoTb/k09spwpK2AkPJ+0XxaOqmeXQnMBJZI20IN9y7ykLe
         asqM8XioOla0/7J7AT9uRMCQdltmVAJttI+WkbPohG2YEnWh0R4iDNl0Bw/Wjid14gnn
         iFag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754503700; x=1755108500;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zeiw/igg3VRkIFQpTb1DWvr2tgsyqZV4hPeCuzYTAzA=;
        b=U0+BD6Z8e4FewFLMcaThrUObGjKMT5ZoDTj6nWtJ9TnRdkWdrMzttWL6yh9efURkNE
         jlTwOO4k/ICcZDczn6gYmqNrLbWEiChUFBm+Q39Ab9v92eX46lUk8lqBFtSF9GiBdhQa
         7QtI2dyK24H/0v/3uA7jvj/HqC6neLoZmWhtBRbODH4xYbJWm6Jng/MCV2I7g9e35AJ8
         7U0Piv+G9vnYG8b6wPZhbqiGwF36u8B4Fp47xXsq9MCsV9EJ0qHu1FfFeW0CvR2KGcgR
         nFW/yCOVZACCfIR5bN+EdK9fK4BZnkoo42TLc5ofSbg3oGgbAjRN87BHrcKAa+xO9BOq
         bNzw==
X-Forwarded-Encrypted: i=1; AJvYcCXUDyEy+inz0VDGoZwjE8vMuEun7X00HSqN5xArrbhxzkjLDf2V4DKdwYnHyBsNUDRcWOOFtRDvntAF471GKsTkEQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy468hzsGd6G/IwG25RYdBdvngUJxopZ8Tp02081eJta5jvUak3
	DyBGGUD34kdWc0qytHfA6fd6CGbMUzrSAvWznTbj00QQf+jIw/nc/EBXzh7eRU/M4YJiz4MmgNl
	Yn1RVqPY7U/ZEvonfMn/yuhupgvKoTaehkBF8XWi2mw==
X-Gm-Gg: ASbGncs3hOVh7p/FXXNkR7VJEX8OUCexQ+a8KzrzQ457ad0r/ELoD/iL6y4iV4FJ/l7
	NkkAD0ycc7J7tcphxOzXFTY8GCp/tL1H5I00nzDAr/5KQ5rEjakVcabG3rbSOxOHeYwSrU0gHqu
	5x9BvPfERwQyNKm4a3lZ4FnZxQ/qJo9nnlw7rUMZi2gmiwgGAqqrtEU4HJVqVVqjwxwn3ZekJZz
	LZ8nw==
X-Google-Smtp-Source: AGHT+IFljVcbKKiD4Y8odlIXjBBnYAePfAKr/sOc5LqjcBRdGaAhcUOQ5sCog6SPAwBGoi0fdvXwkpzJhgdnQl3q8ms=
X-Received: by 2002:a05:6902:4310:b0:e85:ea52:8b with SMTP id
 3f1490d57ef6-e902abde969mr3799149276.22.1754503699782; Wed, 06 Aug 2025
 11:08:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20250806070030epcas2p3f2b0c36b6c492629e50e76be469b2db3@epcas2p3.samsung.com>
 <20250806065514.3688485-1-sw617.shin@samsung.com> <20250806065514.3688485-5-sw617.shin@samsung.com>
In-Reply-To: <20250806065514.3688485-5-sw617.shin@samsung.com>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Wed, 6 Aug 2025 13:08:08 -0500
X-Gm-Features: Ac12FXwS1WG6f5yuQagZd9mQDHAbqfGJ1tb9fpDSgy50MD5AWOvIXyjEOgbaPAg
Message-ID: <CAPLW+4m2S5jAJ4xas_r69AUHFENOrr=4-ZYUgtrqQ5aJgetDng@mail.gmail.com>
Subject: Re: [PATCH v5 4/5] watchdog: s3c2410_wdt: exynosautov920: Enable QUIRK_HAS_32BIT_CNT
To: Sangwook Shin <sw617.shin@samsung.com>
Cc: krzk@kernel.org, alim.akhtar@samsung.com, wim@linux-watchdog.org, 
	linux@roeck-us.net, dongil01.park@samsung.com, khwan.seo@samsung.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 6, 2025 at 2:00=E2=80=AFAM Sangwook Shin <sw617.shin@samsung.co=
m> wrote:
>
> Enable QUIRK_HAS_32BIT_CNT to ExynosAutov920 SoC which has 32-bit WTCNT.
>
> Signed-off-by: Sangwook Shin <sw617.shin@samsung.com>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  drivers/watchdog/s3c2410_wdt.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wd=
t.c
> index 673ab6768688..541870b4d01a 100644
> --- a/drivers/watchdog/s3c2410_wdt.c
> +++ b/drivers/watchdog/s3c2410_wdt.c
> @@ -357,7 +357,7 @@ static const struct s3c2410_wdt_variant drv_data_exyn=
osautov920_cl0 =3D {
>         .cnt_en_bit =3D 8,
>         .quirks =3D QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET |
>                   QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN |
> -                 QUIRK_HAS_DBGACK_BIT,
> +                 QUIRK_HAS_DBGACK_BIT | QUIRK_HAS_32BIT_CNT,
>  };
>
>  static const struct s3c2410_wdt_variant drv_data_exynosautov920_cl1 =3D =
{
> @@ -370,7 +370,7 @@ static const struct s3c2410_wdt_variant drv_data_exyn=
osautov920_cl1 =3D {
>         .cnt_en_bit =3D 8,
>         .quirks =3D QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET |
>                   QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN |
> -                 QUIRK_HAS_DBGACK_BIT,
> +                 QUIRK_HAS_DBGACK_BIT | QUIRK_HAS_32BIT_CNT,
>  };
>
>  static const struct of_device_id s3c2410_wdt_match[] =3D {
> --
> 2.25.1
>
