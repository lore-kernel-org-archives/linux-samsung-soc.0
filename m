Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 241B880B
	for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Feb 2025 00:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739491715; cv=none; b=V4MK2joAHVWiAfA4jTv4gZnVZHVAZTkEUNK4q3eZpPHUuGLfdGuOM7hDbIKfCfHWMgTvckPxMTH5vf1n9tT+wEOAIjyxpMFHEYr6y5DOTdCBvKaN2vCm+aMxzQ1v1E9uIet5VMSSSYDIbQ3RpnaZLGzj3gyGk1iiRB+eKAfVdRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739491715; c=relaxed/simple;
	bh=MAAfvqX3cGJML+KahVnzZbIOXXPipZMxo9WY2NDQPoo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NnfE26J9bkMgBI+vXQKubOMfbFMBq5NmU1vnaL9kuNyh0iPu3yMukXTd2Z4MHfbVJhTl4WsqMKtk/VcrjP/Fvrw9h8m7jL2PSiEhoa1TkmJRWiKMqT/mSNLnGpbAYHuVi9gZzt2hcI4kL47Ck05K7JLTh3nZ8AiLMX9/LTpy9So=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wur5WtgZ; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wur5WtgZ"
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e461015fbd4so1172173276.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 13 Feb 2025 16:08:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739491713; x=1740096513; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C3lBKZGOyoKxfPqCyoT1cGjFSA+s77EMfO8EHu92tNE=;
        b=wur5WtgZ8n/2ziOvz97HqK0CTEWvBIIi1D5l5oTBvtPkXsUPnmqlnzJyAf2/yk5H3u
         +Y4BA6eQ5JQ4WqfV/OlYtC7Tj3zp2iFOKCRfn05y+dnLZ8U8gdhofWQHQdoeJjlwvw54
         ZX1FkqMflPASQ92pHA3y7qBmRS7Um6mTPHYj/s0i/illL6RxMym01HT9oNLKXc6LxY/r
         3iAPZP/YZZYuvq1zm1YqZPqgTqXGC3D3vce8fdww76zW5LCUOrPGdmIWSFuX2az4WG0B
         VHP9seZlfneS8oLnEFvYV6nenYooZzy/alMFQKLZ02XShzTU8C6HIytF0uNEsA6TEA/f
         4WxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739491713; x=1740096513;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C3lBKZGOyoKxfPqCyoT1cGjFSA+s77EMfO8EHu92tNE=;
        b=vgylLzBp1wFBG/4dv2D9TWyOVTDkon5Mjm1XfUM7UsV9fbejYIERkLfoiwbLN7Df6Y
         CkSy8EREhXwHH1vsxYeEIxJjv+nvbB6P62+y26B90e+QP+bHXO+syWnNTOIykafpt3ta
         qaAffVyUl0IRVopkLqCSS+FhP+4Tfs0vswi/WjtR7/WxlWqjcCSQ0ZcTVhRMJIrMCyMG
         qGDhHczk7/pJ6594opXR02bat5I6ewI5QLFZwDO4tWVZGX8pAMuygbjUGGuCMw5XZKjE
         DbNEPDSzOGjZK5AuqPsdGU+N5ZmuEn/3cP9+NEhtWMB1JvCgJHFpybFFJ3aMkyXkRoWC
         tprw==
X-Forwarded-Encrypted: i=1; AJvYcCWnZ6aMQniu5Ud2/3MZDkAaPtoRCK5neSMDM0tPeh66GWPbY0vbHSYltzJOwRPCON0pKZSdGwPWMGX8gM+P/ULmTg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxNej8hpwRW+6DK2hNoXgMqicyGmGYsmIf8eU3ZHxWKD3L4ogW8
	lvh2y/XrHn4M1vvWj4GVvm3kMBDEjsCCCM3ywEqgQQucjzC9qNOjBP5SB1VNwKlnArlJ5bf4V3z
	fY/Jd9norHu61Ar9McR43zIIjr+N8WCbJR28wzQ==
X-Gm-Gg: ASbGnctCGZmKSNxADGUJsLB96XOiqV8zCqxLlSEn3Bi5K5QjVZUBNShLpVBcQQ6XVlL
	Wy8wuDqIAEwB3Y0gVB+VGu5xVnX9ul6qXsEv2SU7LsMXdHEHpKe3SO/OR4A2A+SV5hbHrT5ohsS
	/iIwW2JJu3RB1QrC+1Y83gzg/cWkgPcU8=
X-Google-Smtp-Source: AGHT+IHHB9aqmzlCmvvbOZ0op+LIbE1hTTkoDV6gv5oj2H7T56oz2T4r9lSa8//BdTV0olXsdNEbfdpHv6M7nkxz/Fw=
X-Received: by 2002:a05:6902:844:b0:e5d:b88a:5537 with SMTP id
 3f1490d57ef6-e5db88a57afmr2934415276.47.1739491713003; Thu, 13 Feb 2025
 16:08:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250213204044.660-1-wachiturroxd150@gmail.com> <20250213204044.660-3-wachiturroxd150@gmail.com>
In-Reply-To: <20250213204044.660-3-wachiturroxd150@gmail.com>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Thu, 13 Feb 2025 18:08:21 -0600
X-Gm-Features: AWEUYZkHiLNGtqh6JY6R15-hw34etZLDV9fUZUEOBeHdZwrkxJs0njIeYoVmXyc
Message-ID: <CAPLW+4nJVf0raJ-O3u6uUteBi--N5xGwvzXp7cHqbkdMJ8gCSQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] spi: s3c64xx: add support exynos990-spi to new
 port config data
To: Denzeel Oliva <wachiturroxd150@gmail.com>
Cc: andi.shyti@kernel.org, broonie@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, alim.akhtar@samsung.com, 
	linux-spi@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 13, 2025 at 2:41=E2=80=AFPM Denzeel Oliva <wachiturroxd150@gmai=
l.com> wrote:
>
> Exynos990 uses the same version of USI SPI (v2.1) as the GS101.
> Removed fifo_lvl_mask and rx_lvl_offset, and changed to the new data
> configuration port.
>
> The difference from other new port configuration data is that fifo_depth
> is only specified in fifo-depth in DT.
>

In the code below I can see this bit:

    /* If not specified in DT, defaults to 64 */
    .fifo_depth     =3D 64,

Is that intentional or is it some leftover that was meant to be
removed before the submission? From s3c64xx_spi_probe() it looks like
the "fifo-depth" DT property is ignored if .fifo_depth is set in the
port_config:

    if (sdd->port_conf->fifo_depth)
        sdd->fifo_depth =3D sdd->port_conf->fifo_depth;
    else if (of_property_read_u32(pdev->dev.of_node, "fifo-depth",
&sdd->fifo_depth))
        sdd->fifo_depth =3D FIFO_DEPTH(sdd);

Btw, wouldn't it be reasonable to flip this probe() code the other way
around? So that the fact that the DT property is available is
prioritized, not its port_config counterpart. That would make it
possible to provide a sensible default in the port_config structure
and at the same time be able to override it by specifying the DT
property for nodes where it's needed. Just a thought, not strictly
related to this patch.

> Exynos 990 data for SPI:
> - The depth of the FIFO is not the same size on all nodes.
>   A depth of 64 bytes is used on most nodes,
>   while a depth of 256 bytes is used on 3 specific nodes (SPI 8/9/10).
> - The Exynos 990 only allows access to 32-bit registers.
>   If access is attempted with a different size, an error interrupt
>   is generated. Therefore, it is necessary to perform write accesses to
>   registers in 32-bit blocks.
> - To prevent potential issues when fifo-depth is not explicitly set in
>   DT, a default value of 64 is assigned to ensure stable operation.
>
> Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
> ---
>  drivers/spi/spi-s3c64xx.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
> index 389275dbc..5f55763f9 100644
> --- a/drivers/spi/spi-s3c64xx.c
> +++ b/drivers/spi/spi-s3c64xx.c
> @@ -1586,6 +1586,20 @@ static const struct s3c64xx_spi_port_config exynos=
850_spi_port_config =3D {
>         .quirks         =3D S3C64XX_SPI_QUIRK_CS_AUTO,
>  };
>
> +static const struct s3c64xx_spi_port_config exynos990_spi_port_config =
=3D {
> +       /* If not specified in DT, defaults to 64 */
> +       .fifo_depth     =3D 64,

Talking about this line here.

> +       .rx_fifomask    =3D S3C64XX_SPI_ST_RX_FIFO_RDY_V2,
> +       .tx_fifomask    =3D S3C64XX_SPI_ST_TX_FIFO_RDY_V2,
> +       .tx_st_done     =3D 25,
> +       .clk_div        =3D 4,
> +       .high_speed     =3D true,
> +       .clk_from_cmu   =3D true,
> +       .has_loopback   =3D true,
> +       .use_32bit_io   =3D true,
> +       .quirks         =3D S3C64XX_SPI_QUIRK_CS_AUTO,
> +};
> +
>  static const struct s3c64xx_spi_port_config exynosautov9_spi_port_config=
 =3D {
>         /* fifo_lvl_mask is deprecated. Use {rx, tx}_fifomask instead. */
>         .fifo_lvl_mask  =3D { 0x1ff, 0x1ff, 0x7f, 0x7f, 0x7f, 0x7f, 0x1ff=
, 0x7f,
> @@ -1664,6 +1678,9 @@ static const struct of_device_id s3c64xx_spi_dt_mat=
ch[] =3D {
>         { .compatible =3D "samsung,exynos850-spi",
>                         .data =3D &exynos850_spi_port_config,
>         },
> +       { .compatible =3D "samsung,exynos990-spi",
> +                       .data =3D &exynos990_spi_port_config,
> +       },
>         { .compatible =3D "samsung,exynosautov9-spi",
>                         .data =3D &exynosautov9_spi_port_config,
>         },
> --
> 2.48.1
>
>
