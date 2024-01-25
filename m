Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AC293173A
	for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Jan 2024 20:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706214630; cv=none; b=sc3XgUOzqSNoGqIuLRI05xbg/jPdaCznx8CWHyage1n4PCHXD973gJ4/vAhbtf4gVUmshNI9E9xoFf5PN0k0JqdIwvcifseWmTxJ40n3JDzKK68hTA7M3mT9ZG/SUcnENjmUIku/udvZxtBXW+1W5N3ka0AiUgakagotmLX6IEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706214630; c=relaxed/simple;
	bh=qyB/Y5vX4BWVM3IVM8ZZ84h1GieTlRH/8FgZwWwIei0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PM/dH1Fr0Mj4R1s3qaikcwqF19Ce6TlV3qeeWbhwY/NxFPGOPD6NB6VsZe8SuLNAFhVU6yPWg0Vi7PorciarQFlLKInCRKRvKSea+snx1/OG1fk5eHM8UJ1kLXIGz6IuKXxVz1a64qkSQ1hr8WOdzEi7MU/fK1adcHlNdvSp3Tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WO0r7E2m; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WO0r7E2m"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1d730b6943bso28809925ad.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Jan 2024 12:30:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706214628; x=1706819428; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OYxfXc50Twx0SI7BklS0TiFbp4w6OJhOAqF13p3nHFU=;
        b=WO0r7E2mwHFP651NKU78CcekdQ30/UjNBj2R+vQr4u0VCSyZfVplnHkTlzJ21yzh3R
         Vac4PpH5NloJVyFrHdf1rZ/DI5GTkPph6TJ57dT3t7bMX/wB5bNV4MZyxdWSx39MKhyH
         lFBRViQUNxbowHeQgdDJH1u3Be6slTdsL/tLELxrNXL3mSkUlqPzh4lIQqkwqj05e1oi
         ZWgGcu7aTLV9sr4GK0OrtU3StJUMbzyf5rvblvORieCvCkJ2zw7EKWa0c7HIytfq7xs9
         AHtAHUUQvHYXax/Gb7eyYVv2BgOBkGtB6Ikc3JXaoWjsd1XMFO1Ac/dRG1hZ+ORn3UPN
         vXMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706214628; x=1706819428;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OYxfXc50Twx0SI7BklS0TiFbp4w6OJhOAqF13p3nHFU=;
        b=SrPzx9TokOAs3NxuvKJrsliGtXcOP8RMMVfU0c1Y/s7XxhfcVeAmvzqjyA28pfzVvL
         WhI8mPK5R5vIoEUHlLC3UVMx2ZB8ruHX9Z56miYZ5BqRdfPJF8bVLVqoQh1Tm5+4Ox29
         pMG5pvb1UJfR+n2DW7qigt3jOnJ0yFBTFxDlWAp4AscAdWgNClFRJiDog5mEBFQj+mqF
         6B24G/O9znXwziMXUebCyCzmI02t9BvyTqgPfuDu6vrJ/UJqHb+795BkoNH/6PK1vjF0
         jExD4JYOJn3yobKpAneZ4LGIqqQEeFvzKGzKsA01ED/IHNby0WmEMQwyMC+Q5bUa/jrd
         cAFQ==
X-Gm-Message-State: AOJu0YyZiz+PAp7DJU0Oux6hdliDPigY1l6jGxzkHPUvbvxYGOSnrI7m
	QhH8K5wWYMxhoLW0CqFFNWGlGDhyfmnt12p3ZQD01HrM9uJSn/fOnWzllCuzqAZ6mSk+nBYh48n
	v3Tg0dnBjoxeu3lNdjdaLbYJWSjVN8wSo/zOVSQ==
X-Google-Smtp-Source: AGHT+IEz8Vtc1vgjaJUrrDM1+EJq/k5aivTI3aYtqCF7YvJZFNwF0nqii5+o5d1QjE6jqHB/WQnyY/qBbleLzKs8X3g=
X-Received: by 2002:a17:90a:ee45:b0:292:7fa8:29a with SMTP id
 bu5-20020a17090aee4500b002927fa8029amr149942pjb.67.1706214628497; Thu, 25 Jan
 2024 12:30:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240125145007.748295-1-tudor.ambarus@linaro.org> <20240125145007.748295-16-tudor.ambarus@linaro.org>
In-Reply-To: <20240125145007.748295-16-tudor.ambarus@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Thu, 25 Jan 2024 14:30:17 -0600
Message-ID: <CAPLW+4nXTr5AYeeXYxvAF1Je4xrcqg6Hv2y_O9TkenK3giry+w@mail.gmail.com>
Subject: Re: [PATCH v2 15/28] spi: s3c64xx: return ETIMEDOUT for wait_for_completion_timeout()
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
> ETIMEDOUT is more specific than EIO, use it for
> wait_for_completion_timeout().
>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  drivers/spi/spi-s3c64xx.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
> index 447320788697..d2dd28ff00c6 100644
> --- a/drivers/spi/spi-s3c64xx.c
> +++ b/drivers/spi/spi-s3c64xx.c
> @@ -523,7 +523,7 @@ static int s3c64xx_wait_for_dma(struct s3c64xx_spi_dr=
iver_data *sdd,
>
>         /*
>          * If the previous xfer was completed within timeout, then
> -        * proceed further else return -EIO.
> +        * proceed further else return -ETIMEDOUT.
>          * DmaTx returns after simply writing data in the FIFO,
>          * w/o waiting for real transmission on the bus to finish.
>          * DmaRx returns only after Dma read data from FIFO which
> @@ -544,7 +544,7 @@ static int s3c64xx_wait_for_dma(struct s3c64xx_spi_dr=
iver_data *sdd,
>
>         /* If timed out while checking rx/tx status return error */
>         if (!val)
> -               return -EIO;
> +               return -ETIMEDOUT;
>
>         return 0;
>  }
> @@ -574,7 +574,7 @@ static int s3c64xx_wait_for_pio(struct s3c64xx_spi_dr=
iver_data *sdd,
>         if (use_irq) {
>                 val =3D msecs_to_jiffies(ms);
>                 if (!wait_for_completion_timeout(&sdd->xfer_completion, v=
al))
> -                       return -EIO;
> +                       return -ETIMEDOUT;
>         }
>
>         val =3D msecs_to_loops(ms);
> --
> 2.43.0.429.g432eaa2c6b-goog
>
