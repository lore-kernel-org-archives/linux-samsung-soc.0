Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92660224EC
	for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Jan 2024 20:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706299587; cv=none; b=DVNTrv38ypKrCSjHMQJy1dSsl+CMJreFZQn0n0WGQ8tpn0adyw/ch1HlNmqz7Hf32YErMjIkiM22QrSCLnheY2oCcqIqj/1hPSs46IvMEapRkEMY1RFup+JrWJfPednyvjBvY/xdko7Q/z0U60O33U1jBKURbkfGzL1cja35i1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706299587; c=relaxed/simple;
	bh=sXzD9XF1wSaVbPB4WStHBUPn9mQ3LnoVAJQIQPjGFCs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SgZ6wDHOJ9e6DHMb3J2THQZwVO5jvUyCrb80tacLGglkjBnOyNtQuajJOlOILj9FQnuCpr+gAIk6m33LLYe7i4b77kQdbiSLLJe6DsT9Nsd2UP56RiB3NmPg1peK3wT8/WSYPhukYdvZDKRsSQ0p+LGhnQA2FlVzmWYPp9DCol0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TpeTIaq7; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TpeTIaq7"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-290da27f597so519302a91.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Jan 2024 12:06:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706299585; x=1706904385; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hyg3j+csLi06Njb0QnNOSR4IamfFLKs7cHM9SdWTGrs=;
        b=TpeTIaq7IX8Sk0qIykPHMI+nhtRswTcFT4Q/YxvnUuT5y6NCscCsMgIjwEbuN4Ws5l
         Ro10ZuxdR7W4xBrq/CpgRB9Cl/dLyOAkStOCJnqF7HpRH0bNzd1m1EKaFP2RIN7H5e1H
         /yTEzj3rQMqCBcH5OobR1mLujeuMXTYA5hzJXWqefq6v+/l4iBaeesfrHv0eWTS7axiO
         jWJaDME21+MG1Z8sRBdtQsBo7KYEWAJ3neDAfEcUYLTZP6Z4rUxKZhR3iwCGI2pu2Yqc
         nA9+VutT0pJO0WokyMFHiJU6bCU48S8vCA2V2h36deGhWQovVl0FIeKy7jAqJY45aopE
         Eq0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706299585; x=1706904385;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hyg3j+csLi06Njb0QnNOSR4IamfFLKs7cHM9SdWTGrs=;
        b=vb7lKjS/YPt0NgvsP9w2h9Glp29ktFzB+IyHLBC04Z8u2DVG3a/Lj2eIJroMfhmDO7
         r2oa+uMJwJgki1lzZtYPUvCaLeu8kvkXtwF037p8PtRtlglxqrIZDXr1WnLnLsDSKrwF
         24L3Ljzx5HziW34Fob3m+GISg4LXEsEmo4oCLMUFR5wbe83pibQT4iRwNVUWQLpDJp/A
         6uhTD+TIW6EGItK/+kLkS21tFqcFbjRw1elZ9NaQ2shGAyp/30GKq8iBepwLCGfR/tLt
         GKHio4D/zbW0RKIUeCf2kVGwWLBv/5+OUgGAbVeuQttJx9jY/bJW0/QvSbQAYZBUeFLP
         yB8g==
X-Gm-Message-State: AOJu0YwxZQsZox2JVF9OK5JdnLNe/q8r3FOBlP+XJdQ6yphH9IsB9thY
	wEReeUq8jXogRzmczjytPo7qMidieqeNe3diTWskXMqX3NtSQRfM+45wxxRIsO+vLZh4DXiv5Id
	vF3KAoP2sK2zm7/DbPk4PcF1caE8MR7mvl9lF1A==
X-Google-Smtp-Source: AGHT+IHgdqErwTfGR1mFoEDcqPBsabyANjOebK1CnmeVuHVeU8ZeySVoIUaSHRxYDZBvVhcJJEb+aNWGA4Q7/3O0PBk=
X-Received: by 2002:a17:90b:1947:b0:290:1cd6:6acf with SMTP id
 nk7-20020a17090b194700b002901cd66acfmr384009pjb.37.1706299584939; Fri, 26 Jan
 2024 12:06:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240126171546.1233172-1-tudor.ambarus@linaro.org> <20240126171546.1233172-16-tudor.ambarus@linaro.org>
In-Reply-To: <20240126171546.1233172-16-tudor.ambarus@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Fri, 26 Jan 2024 14:06:13 -0600
Message-ID: <CAPLW+4mpWXzt=Tvf9OP5ru8uyBLtBWqqCzn4D7i9MZFi1basng@mail.gmail.com>
Subject: Re: [PATCH v3 15/17] spi: s3c64xx: remove duplicated definition
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: broonie@kernel.org, andi.shyti@kernel.org, krzysztof.kozlowski@linaro.org, 
	alim.akhtar@samsung.com, jassi.brar@samsung.com, linux-spi@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, andre.draszik@linaro.org, 
	peter.griffin@linaro.org, kernel-team@android.com, willmcvicker@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 26, 2024 at 11:16=E2=80=AFAM Tudor Ambarus <tudor.ambarus@linar=
o.org> wrote:
>
> S3C64XX_SPI_TRAILCNT brings no benefit in terms of name over
> S3C64XX_SPI_MAX_TRAILCNT. Remove the duplicated definition.
>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  drivers/spi/spi-s3c64xx.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
> index dc779d5305a5..e9344fe71e56 100644
> --- a/drivers/spi/spi-s3c64xx.c
> +++ b/drivers/spi/spi-s3c64xx.c
> @@ -115,8 +115,6 @@
>  #define S3C64XX_SPI_MAX_TRAILCNT       0x3ff
>  #define S3C64XX_SPI_TRAILCNT_OFF       19
>
> -#define S3C64XX_SPI_TRAILCNT           S3C64XX_SPI_MAX_TRAILCNT
> -
>  #define S3C64XX_SPI_POLLING_SIZE       32
>
>  #define msecs_to_loops(t) (loops_per_jiffy / 1000 * HZ * t)
> @@ -1092,7 +1090,7 @@ static void s3c64xx_spi_hwinit(struct s3c64xx_spi_d=
river_data *sdd)
>         val =3D readl(regs + S3C64XX_SPI_MODE_CFG);
>         val &=3D ~S3C64XX_SPI_MODE_4BURST;
>         val &=3D ~(S3C64XX_SPI_MAX_TRAILCNT << S3C64XX_SPI_TRAILCNT_OFF);
> -       val |=3D (S3C64XX_SPI_TRAILCNT << S3C64XX_SPI_TRAILCNT_OFF);
> +       val |=3D (S3C64XX_SPI_MAX_TRAILCNT << S3C64XX_SPI_TRAILCNT_OFF);
>         writel(val, regs + S3C64XX_SPI_MODE_CFG);
>
>         s3c64xx_flush_fifo(sdd);
> --
> 2.43.0.429.g432eaa2c6b-goog
>
