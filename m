Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C8B130AFD
	for <linux-samsung-soc@vger.kernel.org>; Thu, 28 Mar 2024 17:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711648702; cv=none; b=FW3mrfH1AvTE/F9IMdlGsX3eg7nLD/nqwZGlq3WSCjzjc8mpHezgSh//2VVdZCg7AxByjwvGHJDbbpRbbJU0+YDCICOPGsEEMpGwO/arLKSXTsoOkzF+UxAmWZGkoUyBXPnE/JqXWEl+M14RMCTTdeY/rU3H5NLnCzh8RzJYnMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711648702; c=relaxed/simple;
	bh=VF9kw4WTAs6CxHwuSeD4k3v4iYoGGymRT9tDvNquKv0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jOb21qaYQFWw9AupSj5MvqmBVHnJPse0IDtEdSs/Jg0/1kz5YCjR7o8bzA1wCkWJ7LKZjpBRgUQRGwkgsex+dEi0WATEMUvsvPwfusAb3wFn1yipIjQuK5bb/s7s2KQMjbhelYZJLcwPDO70c8lucf3B8m9ZnBLb8ympgz99zck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Be/HF6uw; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Be/HF6uw"
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-dcbd1d4904dso1231673276.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 28 Mar 2024 10:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711648698; x=1712253498; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IMB2JrEaXdtfR7K1jGqJIj8fJgUdIhDmgzuCsvn0h6Y=;
        b=Be/HF6uwM1Qk3pOx8fJuRHzRY5ClpLb20uL2Dg4kATWnyV+QL0/t+XlKQNotZDn/Vt
         2z/VAzxr9QzRvJWwG5pTY6nk/wNDVMM1v3J1+VW07gZRP50VjRtMmxbQ5F5WuJ82pH7X
         CQftllm3JdhTMqY/ADdBqN0o6UKTXaAbtdVzQ7R6k0eG05BFxCXxZ3LpfgYQPykzcnFJ
         l3syEz4ZAv1U47diPMQNvNKyUvfMwi0iv0cNNC2uaa/mkrQB/1X/ckmlbIvk18mLpWS6
         6Lg+IL65lbm+WSuPXS9EfSujtxbK5Lx/NP5NTD61UzC+GnvyfMLyn3UhwEFCAt1mN0mt
         V5CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711648698; x=1712253498;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IMB2JrEaXdtfR7K1jGqJIj8fJgUdIhDmgzuCsvn0h6Y=;
        b=c4vR66jTNUqyV9617AITt6cZcca6b92QB6XuH/q4/N8WAg+MBB9qjjSnvLqgNxSCbW
         Jx1K7aQjn9Y2idEsoa/W8TUR55gAJ++UQPmDiZ/Qy3QAINtrfSYS7AYdCw+UDenmyfdT
         VQTUF7vjoIC5pYuSat5O8hMn614KwGulLiB3ojeROLnivVA1DwvhuTE7f43Rpc4kP2Mn
         265mnnQnXGQVpaD/25mixqiXeX/1XHqQ9b1wA94abIxx5+DIfX0aqSA9MQ8s9XnEGlkY
         fLHPAMxKeVU10t5zJBxyfsFTldv4Kj7xR6tdZ3jJozVke1yJz/mKFndOBW/aja6iYIV1
         z0rw==
X-Forwarded-Encrypted: i=1; AJvYcCUe5Mxg+ajaladngw6qSwnUUYc8eVkV2U+suCxvggq/73GgBRK3sHaRpurnP8cln1b5k2+5UQwTT9AA3g2p+kWDfITzzKSLzOogQ7KTZqa4D/c=
X-Gm-Message-State: AOJu0YyvqqFYAVBFSGjNubVTjpCPlen5StjV/d8+2Kh7NblAEQHAeCTT
	6aQhotICvA+OdsSpwtwUIlN2kuGIZFfMMymYnItaXp4e8lxecvH+OA5GKbT/kBsAf1KdyKWNSmA
	1bmss+6RPjzEwBrDn/yIYUWwNg1bm+Luw2vB5lQ==
X-Google-Smtp-Source: AGHT+IFvODLCEqAxm5n0XVkXoNSLzULV36Er2Og/J1Iy7BT7XxZQSRjln9IX9vYVbq35MTHF9K8T2+xldb2BmW5RcZo=
X-Received: by 2002:a25:70c5:0:b0:dcf:288e:21ca with SMTP id
 l188-20020a2570c5000000b00dcf288e21camr38551ybc.11.1711648698172; Thu, 28 Mar
 2024 10:58:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20240327033501epcas2p2bbe21301da5584f7f3a073c51a363c00@epcas2p2.samsung.com>
 <20240327033041.83625-1-jaewon02.kim@samsung.com>
In-Reply-To: <20240327033041.83625-1-jaewon02.kim@samsung.com>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Thu, 28 Mar 2024 12:58:07 -0500
Message-ID: <CAPLW+4k4qh4ZYBufZoGbUZN0yxSE2X8bOdkEQVw1Zg9YUVpbug@mail.gmail.com>
Subject: Re: [PATCH] spi: s3c64xx: Use DMA mode from fifo size
To: Jaewon Kim <jaewon02.kim@samsung.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	linux-spi@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 26, 2024 at 10:35=E2=80=AFPM Jaewon Kim <jaewon02.kim@samsung.c=
om> wrote:
>
> The SPI data size is smaller than FIFO, it operates in PIO mode,

Spelling: "The" -> "If the"

> and if it is larger than FIFO mode, DMA mode is selected.
>
> If the data size is the same as the FIFO size, it operates in PIO mode
> and data is separated into two transfer. In order to prevent,

Nit: "transfer" -> "transfers", "prevent" -> "prevent it"

> DMA mode must be used from the case of FIFO and data size.
>

You probably mean this code (it occurs two times in the driver):

    xfer->len =3D fifo_len - 1;

Can you please elaborate on why it's done this way? Why can't we just
do "xfer->len =3D fifo_len" and use the whole FIFO for the transfer
instead? I don't understand the necessity to split the transfer into
two chunks if its size is of FIFO length -- wouldn't it fit into FIFO
in that case? (I'm pretty sure this change is correct, just want to
understand how exactly it works).

> Fixes: 1ee806718d5e ("spi: s3c64xx: support interrupt based pio mode")

Just wonder if that fixes some throughput regression, or something
worse (like failed transfers when the transfer size is the same as
FIFO size)?

> Signed-off-by: Jaewon Kim <jaewon02.kim@samsung.com>
> ---
>  drivers/spi/spi-s3c64xx.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
> index 9fcbe040cb2f..81ed5fddf83e 100644
> --- a/drivers/spi/spi-s3c64xx.c
> +++ b/drivers/spi/spi-s3c64xx.c
> @@ -430,7 +430,7 @@ static bool s3c64xx_spi_can_dma(struct spi_controller=
 *host,
>         struct s3c64xx_spi_driver_data *sdd =3D spi_controller_get_devdat=
a(host);
>
>         if (sdd->rx_dma.ch && sdd->tx_dma.ch)
> -               return xfer->len > sdd->fifo_depth;
> +               return xfer->len >=3D sdd->fifo_depth;
>
>         return false;
>  }
> @@ -826,11 +826,11 @@ static int s3c64xx_spi_transfer_one(struct spi_cont=
roller *host,
>                         return status;
>         }
>
> -       if (!is_polling(sdd) && (xfer->len > fifo_len) &&
> +       if (!is_polling(sdd) && xfer->len >=3D fifo_len &&
>             sdd->rx_dma.ch && sdd->tx_dma.ch) {
>                 use_dma =3D 1;
>

Would be nice to remove this empty line, while at it.

> -       } else if (xfer->len >=3D fifo_len) {
> +       } else if (xfer->len > fifo_len) {

Below in the same function I can see similar code:

            if (target_len >=3D fifo_len)
                xfer->len =3D fifo_len - 1;

Shouldn't that 'if' condition be fixed too? Or it's ok as it is? (Just
noticed it by searching, not sure myself, hence asking).

>                 tx_buf =3D xfer->tx_buf;
>                 rx_buf =3D xfer->rx_buf;
>                 origin_len =3D xfer->len;
> --
> 2.43.2
>
>
