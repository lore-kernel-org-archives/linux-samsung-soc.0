Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B710A137C2C
	for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Jan 2024 20:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706213998; cv=none; b=MLcBa8LoOIJPr1ae46WnW19YA5m1YXoLk0OGKyyer9LzAHPEfpuCdE9CTWsiQVh5uSmP8iHasYMgVvyfY6CHuHXzEbaL8P5xwNOF2YmlOqoEeKW/QbNgE++6ZOfzwtzrQbGPLRGMmIAURvaYpmqybS7d2Ou/Nt+D3Jqw8mAm0Fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706213998; c=relaxed/simple;
	bh=PhI9LW/VlbekrhSAPPRbJUPp4nixxFeRGjHAOy1SKHg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KCu6G204z4/PdApFJ/NBBIxTx31AZfd0TUkokWiGQ6pNsJGb365y5lwgDPz+DIRW/bEh1VDAbrV0ChIgYipf6IeVaz4dwuaiCnLFAOkFYC5Vy/6PWHPsBIJqiLBuTspMvBgqaFH4CjfY8gSYE3pVxc2LeVClW7Vm0Fa04AZ/2iU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aA34IaJ5; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aA34IaJ5"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1d72f71f222so32944965ad.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Jan 2024 12:19:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706213996; x=1706818796; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1AMn0y6UWpR7xw27jljzDWKtm5PPL6Cu6Mug2W0VcTk=;
        b=aA34IaJ54qmnN4639ntC0tBaqILwKLtWGgrubPDL42t7BoVYBjeWxUYWALtJ61N5dC
         3JhqHizcKmyiEjULvkyUaQBVdkxCRxx6Bk3CvgNgnSrJfeUmXMBfmdwBCtIxZPb/9bWo
         Ei/vFFMofDL+pP/fP90jLr3MsrZkTiRcClsByswP4HWxICQKZPP+ZYWLhSzb7MruJErZ
         HJDYCLuen6vJzs+/qlFZchYBYCHK/Gu15yOlA098gCZQY9wP/L4akPdFMbWAokPpzzbP
         6uCqxY/GXwlRkficGYt4NTcIYYQtwJEmzP5V7GfMzqvvqakLX8aUMNKIhmdvzWBDc+GO
         MRHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706213996; x=1706818796;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1AMn0y6UWpR7xw27jljzDWKtm5PPL6Cu6Mug2W0VcTk=;
        b=lTQxSkt1b1sGXrQShn4QE2k5HNW96UQfE725G6Goq6z4VGwMGnA6/aafw/vZsKd7oT
         QJSB8q2Z59lBu9zMxoHTTGXz/2fkBnO5SJoKKCegYTfBImWZ1C/Dl2XA49qHMk1IRy10
         jV5NngdOI8Z1GOzQcrCTgyo4/yiSx6if1jAnw14HGkREFkDvwaeOsvGB+SIOB2uhYU4o
         CBtvb4DESyEJ9yAUngFldGukeINPzj561f6E3XAgXozrY7y2HJYIe6UwgfM9mDLUouSA
         mbj7ybLlKnBnOqESiYocZQuqf5GWGmi9CTXJ5GdGZOePgOjBbcVJHzuW4Lw6n72/bx4J
         FReQ==
X-Gm-Message-State: AOJu0YxtQv63Gibrpjid3RaG4z5zJSA1gkWOlVISmDKHjReO4rKUlYmy
	idt0CsKl+K9sxGXsXBPz5Wy0/emDf7JUvk3r6YjAiYpODX7A2UBr77IPg7mG4CBCJnZfadLL7/k
	rx4QuE2QvVuUHPwjdz3KFDQcNKnG/pv3rWAAP3w==
X-Google-Smtp-Source: AGHT+IEDlNMo5aTWzDJycnq3U1sMwSmzGwmT5xXHVku5Um1940OW4HPZE75X2sbisg5ytxzRxcqd5yUDHa1l+h1tjfo=
X-Received: by 2002:a17:902:ecc4:b0:1d8:94e4:7718 with SMTP id
 a4-20020a170902ecc400b001d894e47718mr262595plh.114.1706213996125; Thu, 25 Jan
 2024 12:19:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240125145007.748295-1-tudor.ambarus@linaro.org> <20240125145007.748295-13-tudor.ambarus@linaro.org>
In-Reply-To: <20240125145007.748295-13-tudor.ambarus@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Thu, 25 Jan 2024 14:19:44 -0600
Message-ID: <CAPLW+4nW1LyMT2CGD7R_oRPtRgNQiyUjjUqZJYTAJ2HJMW9yfg@mail.gmail.com>
Subject: Re: [PATCH v2 12/28] spi: s3c64xx: check return code of dmaengine_slave_config()
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
> Check the return code of dmaengine_slave_config().
>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  drivers/spi/spi-s3c64xx.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
> index 107b4200ab00..48b87c5e2dd2 100644
> --- a/drivers/spi/spi-s3c64xx.c
> +++ b/drivers/spi/spi-s3c64xx.c
> @@ -297,7 +297,9 @@ static int prepare_dma(struct s3c64xx_spi_dma_data *d=
ma,
>                 config.dst_maxburst =3D 1;
>         }
>         config.direction =3D dma->direction;
> -       dmaengine_slave_config(dma->ch, &config);
> +       ret =3D dmaengine_slave_config(dma->ch, &config);
> +       if (ret)
> +               return ret;
>
>         desc =3D dmaengine_prep_slave_sg(dma->ch, sgt->sgl, sgt->nents,
>                                        dma->direction, DMA_PREP_INTERRUPT=
);
> --
> 2.43.0.429.g432eaa2c6b-goog
>
