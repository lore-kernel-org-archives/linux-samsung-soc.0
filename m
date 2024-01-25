Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E451F137C2E
	for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Jan 2024 20:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706215534; cv=none; b=dHynnLsLHeBOCYtX3O8tiKLbra6B263vmTOUi8HpJM26Ka0q6WqJD0iot2OvqmHYMyME/BMUT80f18MyzBTWXmb9IM4biWgcjsycNULeq2jkeDMEE8G+UPArZC61oB3R3xj6b+rq4bY6S0rwHgfrfuSQfmBCIRg3thxhghdwwGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706215534; c=relaxed/simple;
	bh=u4m3rhslZrR5Hsot++6wdzU0ej58tjNpwhODKsqQKLI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IIoqaByq9tJe+lIi0N1FwOgQXneNwYE/Q/OBRDMrkeJ1MT7MzjO3lFcp03urRlL/Jel957h93mvJvFgM+AjSdiTvk2Z5ir/ZoHdYAK9Naal6W6o7HaiTDUutZTy1AmwFb4jNd3l/XKZwQQ6Cl2CIWRwUceh6HnGA6MjlBdpZjbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oPrPCEg4; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oPrPCEg4"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-29036dc3a63so3320057a91.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Jan 2024 12:45:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706215532; x=1706820332; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OjdvfWOMZIbIKqDPk6c3LehvDX9fVj7yu1ffjzs1Y4w=;
        b=oPrPCEg49l26MN0w4JTS7mulcbHu3czWBt/DEPdZz4u7jJZTrUcTNgU/6cgGTaN3bw
         T8bymBfZqrLedtX42si++VVzS0pA2fIxQHz29gfHuqOXEhPmCnAPojItVhRrpWkscn/Y
         C/E/v5DRWFAODZXkEwUNAqnNqnSw3P8iBZHYqfIgPZ7t77FMSj3f3NxCelhiLJIjWtjn
         VDQS9+ZyNTsby7YkTFAG68yObCiBCR5nTNM4GMrvhO1vMCkQjb0Y3ewa0MqqO1kSrxr+
         IM6YQEfGjj5reuKQafnSkUkZc2E0dqAs/L4+Jj/zJ/MKquO3LsCQi7fPGs3gPMNcw7Am
         YUCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706215532; x=1706820332;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OjdvfWOMZIbIKqDPk6c3LehvDX9fVj7yu1ffjzs1Y4w=;
        b=rNBs2VNfwyELUdFK5QA37AGXWnYa/dy7GNoDr0X/+vCZ2fYhfb0cc900jSOtpydZh9
         FUVfl5a1lf9RzPM4WJWtEXIcHf2Mk0vhxxH35SqZKQDU/7d1YFyRbcbetEnANxBwBR+J
         i7yRX1nMBGX/+gFb85iRobEMSAC9d/5xVkUc6GNCFImpwOa5K/XMLHsNjWrP1lCaw84i
         afUX8kmUxxN53+f5txdeierUY1pkrIsQyGPopcDIhmAZuJz8kaqakg6/oZa2trTLPg8B
         C2ErRIKF3/VOxJYGg0Z1DIo2QuJLae4H1uLgKng+nQociUFnDcPPotCon+F9RlfuDxQv
         lfvw==
X-Gm-Message-State: AOJu0YzRbB3FJIyHZeU9Dk0/hDa+aGoek68UR2Ir91FSHZH3AFHGogM/
	EvE2DbAv8or7iMMJJHxRWPJxZk4vijIVQXlWYOdpAvceud/0PnmzwT+UTehYVeOSaNuihK1B/yr
	2UeGavVVvkX77adh1K6+snhU6cB3gfBvYCvowlg==
X-Google-Smtp-Source: AGHT+IFofqibqxuDjtddSx6QluMZVRpw+2AXJrlPUc7U34sNPQ9cpNct34ReKCCPsxw5hwiOFV0+l3LKSUbE88X6ZwI=
X-Received: by 2002:a17:90a:1a08:b0:292:6b51:6bb with SMTP id
 8-20020a17090a1a0800b002926b5106bbmr262488pjk.0.1706215532174; Thu, 25 Jan
 2024 12:45:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240125145007.748295-1-tudor.ambarus@linaro.org> <20240125145007.748295-28-tudor.ambarus@linaro.org>
In-Reply-To: <20240125145007.748295-28-tudor.ambarus@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Thu, 25 Jan 2024 14:45:21 -0600
Message-ID: <CAPLW+4kTDxvRuCvg8TO8QFQiTUfrvzEavX=Cx2QVRZ=SnRLrOg@mail.gmail.com>
Subject: Re: [PATCH v2 27/28] spi: s3c64xx: add support for google,gs101-spi
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: broonie@kernel.org, andi.shyti@kernel.org, arnd@arndb.de, 
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	alim.akhtar@samsung.com, linux-spi@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arch@vger.kernel.org, andre.draszik@linaro.org, 
	peter.griffin@linaro.org, kernel-team@android.com, willmcvicker@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 25, 2024 at 8:50=E2=80=AFAM Tudor Ambarus <tudor.ambarus@linaro=
.org> wrote:
>
> Add support for GS101 SPI. All the SPI nodes on GS101 have 64 bytes
> FIFOs, infer the FIFO size from the compatible. GS101 allows just 32bit
> register accesses, otherwise a Serror Interrupt is raised. Do the write
> reg accesses in 32 bits.
>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
>  drivers/spi/spi-s3c64xx.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
> index 35a2d5554dfd..e887be6955a0 100644
> --- a/drivers/spi/spi-s3c64xx.c
> +++ b/drivers/spi/spi-s3c64xx.c
> @@ -1501,6 +1501,18 @@ static const struct s3c64xx_spi_port_config exynos=
autov9_spi_port_config =3D {
>         .quirks         =3D S3C64XX_SPI_QUIRK_CS_AUTO,
>  };
>
> +static const struct s3c64xx_spi_port_config gs101_spi_port_config =3D {
> +       .fifosize       =3D 64,
> +       .rx_lvl_offset  =3D 15,
> +       .tx_st_done     =3D 25,
> +       .clk_div        =3D 4,
> +       .high_speed     =3D true,
> +       .clk_from_cmu   =3D true,
> +       .has_loopback   =3D true,
> +       .use_32bit_io   =3D true,
> +       .quirks         =3D S3C64XX_SPI_QUIRK_CS_AUTO,
> +};
> +
>  static const struct s3c64xx_spi_port_config fsd_spi_port_config =3D {
>         .fifosize       =3D 64,
>         .rx_lvl_offset  =3D 15,
> @@ -1556,6 +1568,10 @@ static const struct of_device_id s3c64xx_spi_dt_ma=
tch[] =3D {
>                 .compatible =3D "samsung,exynosautov9-spi",
>                 .data =3D &exynosautov9_spi_port_config,
>         },
> +       {

As I mentioned before, this braces style looks too bloated to me.
Other than that:

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

> +               .compatible =3D "google,gs101-spi",
> +               .data =3D &gs101_spi_port_config,
> +       },
>         {
>                 .compatible =3D "tesla,fsd-spi",
>                 .data =3D &fsd_spi_port_config,
> --
> 2.43.0.429.g432eaa2c6b-goog
>
