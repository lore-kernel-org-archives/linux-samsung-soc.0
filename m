Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F2ED1F866A
	for <linux-samsung-soc@vger.kernel.org>; Wed,  6 Aug 2025 18:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754503670; cv=none; b=jXqtVMGuvTcYAlMbuRPVrPlnkBoSwok9dVgpGAvighzQL4DYO3fjak4Ey8eOGiqTqUpPfTADE/Wd8/xIeCAMZma7l2AQSspsVuhkr25t9vejD/cBIf8mwSUfk7BTa7jQJcjFJKevfvecjpIoIyxTHAKhmByF78UkdNLsBPG6ooA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754503670; c=relaxed/simple;
	bh=FPHT+FUeEvjLidkz/VK3FcZAuwEOLlrxDGWwCHYkxr0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=URafzZhi02fQ9jBeODuowXNDhvm1UeYMuK6KCLDgD6IaMx7fV+2W/Kzq5Uvq7SQZ+a4RLqpJy3UU5AEJ/OYg0XswmkzAYqOxnhB+5l0jdAL3hfyQXbqZxgtI7zUqnf9GbAxQhdccpiWm8C/ljPe8/SZ7I07bEkJa+PBxKHsvT/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j+1CabpB; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j+1CabpB"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-71bbfbd994cso1292847b3.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 06 Aug 2025 11:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754503667; x=1755108467; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e64dYOpRvHmbbrtWNTSj9g3tc82tVKc7j0umGWHc75Q=;
        b=j+1CabpB+rPf+G1WA231R5dyYsna0JYFVaB/8y4mwy1P+Ewp9AnSmATiCFqo+5JQzw
         rTzd29PRUtK9egG4Fxa8NLX8PztWfqWTjvMCgC7xMvR9FhYVyrAh0zrmRhf1llpSd/lJ
         8qT06U1SledlpUqUFfiqP+MX1hRBfup/vBCWvVpJXMV2jYbrvr1nJguFcXt7NQu/B+XV
         LgJBZKNbUZEaKiPiHAbTlEiQ79FPcJ55AKJ2rwEy04aBP2tS9YBX8tNJlnd5kXQIqSV4
         ig/9i6CsU889moNIc8wnWrR3rkpO5yoKHBXwyyWgFfMnJ4AC7IElzBuYFUFFzU0VU4X0
         IvAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754503667; x=1755108467;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e64dYOpRvHmbbrtWNTSj9g3tc82tVKc7j0umGWHc75Q=;
        b=vt8yDH0UjuOR0tJghJce8Cksg7Skx8uMgdwaHFKGYw8oQq2LeiBFJ2yk11R1ZCmHKA
         I9pe19aEQ3Xbj1to5zrhRZxFpnBi3YUJ1HzDLYq7TXcvisRLO6/0pH8h71UoT1pHZXB9
         y1THQyxCIY/OrLr1BVXxDSAwNth51L9pdlGxp0590R+VJF1cPInIKDMXzUXTk+jWGwTu
         oP5746YYHsinbLemLL3NDqgxLvbS0MZeqrrYEKijxvOJQRULNZ8C7jl8zGPClZtfcxnJ
         G20jcsVbjezh2J4kRLcKdJ/KvX+0F0FDm6KceZELQTZGoHLAagzim4t4QIEMMq+V7KT8
         FzwQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvJIN1YGRtmMiGG0RLE7wP56WrL2ywG5Ij2pRgoLpQ4LMvS9CqxvOevylUQkR8F6QRCXh3N4TUN27BOycIUVJtiA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzMq846QBYfjaRFGZv5OXjO0Cbvau42bPQw2nQ7mM52lhvS0Dkx
	pOGUsgMhUCDoMtmJrwJ9gRyyqctBhrewtnaomnVbSxhRvz4ocmbZosMvf+wXQVtSq06ZbE0xf6m
	Q2NdT1BJpFmr/xHj0WGasrW0xi47iuBMRtMx+qx5JT0qBqyxD1ETUteA=
X-Gm-Gg: ASbGnctxYh54dVxP9kmLkoNh86YUeObdrLyEJKm2sl0oxgee4fnKO9/NZDCQvtCdt/e
	TDy3sVlS2dX65gwxS9HqJB17l9r5XM0xG7bZMPNqtCDfVpC/Na1rFNbn7f288m0OrOhoDWQ8Ad7
	XQ5gHcPqd+3w8PQNl1zlsFvv1sKb4o/JiZ60BD3f4Pr0W26PsGTv+KycjPbrLXF0NGTGc033M+J
	1tBZqXs55zdbBnn
X-Google-Smtp-Source: AGHT+IGzVNInSABQDNnUNPgx22fnkoQK29xlj80Xhm92+720xF5zbG7euyqOftdTJkmT4Ecukdgi7FOxbvVqX2U7ToY=
X-Received: by 2002:a05:690c:317:b0:71a:26cd:6d18 with SMTP id
 00721157ae682-71bcc920fc0mr43203327b3.40.1754503666653; Wed, 06 Aug 2025
 11:07:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20250806070030epcas2p4f9b779bd9fde57b4bfea958efdf62cf4@epcas2p4.samsung.com>
 <20250806065514.3688485-1-sw617.shin@samsung.com> <20250806065514.3688485-6-sw617.shin@samsung.com>
In-Reply-To: <20250806065514.3688485-6-sw617.shin@samsung.com>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Wed, 6 Aug 2025 13:07:35 -0500
X-Gm-Features: Ac12FXz1wG21J0FHFOEmb1_vYpGiG5VXTvwnDLd5jOWOoXjCI9NbzNvCVoOhnfQ
Message-ID: <CAPLW+4m42-8QEEcQgqm93=Ar44-Gmwu5fiLy66SXEMes6J=zUA@mail.gmail.com>
Subject: Re: [PATCH v5 5/5] watchdog: s3c2410_wdt: exynosautov9: Enable
 supported features
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
> Enable supported features for ExynosAutov9 SoC.
> - QUIRK_HAS_DBGACK_BIT
> - QUIRK_HAS_32BIT_CNT
>
> Signed-off-by: Sangwook Shin <sw617.shin@samsung.com>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  drivers/watchdog/s3c2410_wdt.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wd=
t.c
> index 541870b4d01a..f25563585983 100644
> --- a/drivers/watchdog/s3c2410_wdt.c
> +++ b/drivers/watchdog/s3c2410_wdt.c
> @@ -306,7 +306,8 @@ static const struct s3c2410_wdt_variant drv_data_exyn=
osautov9_cl0 =3D {
>         .cnt_en_reg =3D EXYNOS850_CLUSTER0_NONCPU_OUT,
>         .cnt_en_bit =3D 7,
>         .quirks =3D QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET |
> -                 QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN,
> +                 QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN |
> +                 QUIRK_HAS_DBGACK_BIT | QUIRK_HAS_32BIT_CNT,
>  };
>
>  static const struct s3c2410_wdt_variant drv_data_exynosautov9_cl1 =3D {
> @@ -318,7 +319,8 @@ static const struct s3c2410_wdt_variant drv_data_exyn=
osautov9_cl1 =3D {
>         .cnt_en_reg =3D EXYNOSAUTOV9_CLUSTER1_NONCPU_OUT,
>         .cnt_en_bit =3D 7,
>         .quirks =3D QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET |
> -                 QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN,
> +                 QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN |
> +                 QUIRK_HAS_DBGACK_BIT | QUIRK_HAS_32BIT_CNT,
>  };
>
>  static const struct s3c2410_wdt_variant drv_data_gs101_cl0 =3D {
> --
> 2.25.1
>
