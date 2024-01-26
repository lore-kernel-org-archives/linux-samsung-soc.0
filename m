Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C88622616
	for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Jan 2024 20:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706299787; cv=none; b=jcR4TYdDMTIl/JYb3eBNOpIc3rIi1OnKdx+IpPpexBP92NbPN715bx/IFGGpsAM0y1HLVUMDZT+nln/f9bDf61JV3q2DhOf4jNCiSNJdTaH0yX41X6IXVRqLhn1XdeGF+Hqtj5iC9gjXQ5j52kRmWRMHs2COp/vATmnJ7UlavXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706299787; c=relaxed/simple;
	bh=26UmmMdUwHYMA5666/eDGLbOSATXZsruBdeY8Aig6Wg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a2HBMvzt+DRYLEWI5oCjbY6Ptw1cRL0A1dwr4iPbA0+NkA1n6XvtHZYYcQuVlRjEhhk7hBo42+ybkHRPAFVPa+rIZ+NAKS2Uq0sy6x2XsyLUrHUXvDUaSzSJIs+R1czu1G92sdqgj63nf41vMjKgTnKRCZBq4WLxjICMZ/R0+R8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Jrqy0iQa; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Jrqy0iQa"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1d71b62fa87so13402035ad.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Jan 2024 12:09:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706299785; x=1706904585; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p/1tKkzsqc4Lxn/B+1z+yYYxCGxfUQO3LjVc+R01ieg=;
        b=Jrqy0iQaweq3Ap/pZmCCNtWSZIUqc40SILHnDBAK9CnSNjtUajrLe/zlDEsDJaTqQJ
         fResHodY6jngc5ZaD8ahkEzw1a3WDu7g0CSeMsNQZs9ElA5Rm1elA9aWaOheD6Aej1DH
         4qorXiJ455bmbjdNGLVeYscD9wwOQurtTRUq5tTDM0swkgfFp4JbFjN0igfTcxkQymc+
         2ZMoh90oae4+To1y6tjnkBHvB+Gs23R++w9QXg1J7jA7gGqqTCntXz7jsaRnTFy2C7nL
         NvfL70C7Qw++urjurNNdJqSi8GoqEV42H4MFaiZFxddwzHNTpiUha42J9GmZrmqF60Zk
         LQFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706299785; x=1706904585;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p/1tKkzsqc4Lxn/B+1z+yYYxCGxfUQO3LjVc+R01ieg=;
        b=wI8RxPCLBNeKp/VHuDU4R55bcukCVljLL+Rh/8BRU2AzFX8S3IjoH8ywr8i5bCpA0n
         isnP8VHtgLOuZeF2KExf+KabNu9Pyngn5bzlbpVPbYTENlJoHuz41MnX2tebZDaOd5V6
         6RDNdVbA7SHta/VAQ0ba70utIjWEpuC09CP2fL9vvQa5lFRNJEpfBjOGgQAvchwUw8On
         ig21BNjgVzebGeEzNhggB5X5P9QnfSHhOJ67cG3R1slsksDJt2/C6us6nzGxrDXn9mmI
         cmZ/bsipCIaM4vQLi23dJWBXceWZKWmds4HKqXk2FydfeceMrCg76MtphGmQSDJcxcjY
         VYfA==
X-Gm-Message-State: AOJu0YxkKdDXeTZyOReaH+F9/5kmqEboHmvrCT6hZpSGn/3mSfVQQzFu
	H5gGwJnvG+vu3lD4qgVynAnufs35xfRNI382W7wJvk+AD8tPI/7L1s2Gh6Wfaitdk1Fu/cxI9c3
	7LlKmnPDjTrYKYSbRHHRfuFyjvR8leW8VJQHvdA==
X-Google-Smtp-Source: AGHT+IH2rs0C2o8K7YBb3nQFCnS/YduyrRBKw5z2DfxwWvlgOq59M+qY6wRCka+xar/JGAiMbqPHaDdfeJslVIO1cpk=
X-Received: by 2002:a17:90a:9f82:b0:28e:878f:9b35 with SMTP id
 o2-20020a17090a9f8200b0028e878f9b35mr1869586pjp.34.1706299785635; Fri, 26 Jan
 2024 12:09:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240126171546.1233172-1-tudor.ambarus@linaro.org> <20240126171546.1233172-17-tudor.ambarus@linaro.org>
In-Reply-To: <20240126171546.1233172-17-tudor.ambarus@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Fri, 26 Jan 2024 14:09:34 -0600
Message-ID: <CAPLW+4mZc84mt3E6VJWVJta9o0nKvk00-9vok9-Z80JU45ev2Q@mail.gmail.com>
Subject: Re: [PATCH v3 16/17] spi: s3c64xx: drop a superfluous bitwise NOT operation
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
> val &=3D ~mask;
> val |=3D mask;
>
> is equivalent to:
> val |=3D mask;
>
> Drop the superfluous bitwise NOT operation.
>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---

That's much more clear. Also I'm pretty sure if you compare .o file
before and after the patch, they would be identical -- another way to
argue the patch has no functional change.

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  drivers/spi/spi-s3c64xx.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
> index e9344fe71e56..43b888c8812e 100644
> --- a/drivers/spi/spi-s3c64xx.c
> +++ b/drivers/spi/spi-s3c64xx.c
> @@ -1089,7 +1089,6 @@ static void s3c64xx_spi_hwinit(struct s3c64xx_spi_d=
river_data *sdd)
>
>         val =3D readl(regs + S3C64XX_SPI_MODE_CFG);
>         val &=3D ~S3C64XX_SPI_MODE_4BURST;
> -       val &=3D ~(S3C64XX_SPI_MAX_TRAILCNT << S3C64XX_SPI_TRAILCNT_OFF);
>         val |=3D (S3C64XX_SPI_MAX_TRAILCNT << S3C64XX_SPI_TRAILCNT_OFF);
>         writel(val, regs + S3C64XX_SPI_MODE_CFG);
>
> --
> 2.43.0.429.g432eaa2c6b-goog
>
