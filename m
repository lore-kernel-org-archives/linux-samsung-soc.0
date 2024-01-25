Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4D1137C2E
	for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Jan 2024 20:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706215451; cv=none; b=rUsFQIaVT5uF/S+154iXSbefWzo5wRt2q9vZxiH6A0UgO7zD7q2qu0sktYnkztl1odZMYXEgJ3AtyDR9Ab9znxsExOIUBEWU2WbfwzL3XsCBot9tfJgAn2NeL1wWzyLNfLI4kMzCekesf+vj/ZKg5CenvFVCDPVo68cva9fGoRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706215451; c=relaxed/simple;
	bh=A4DlPA5ZS8DI8SfLbauTdQPP3/bM0j755xOJ7bN0/S8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bf8pGli4b5Up7VRK1ApuCTHw8Fvbnh7lu4DwC6/wlW183VWfKvrVoixAMk1RT/uUQyQnN1unmoA3EzmjAo2l1HYZZ79r2L67XdKcEgvl5FIEdvZF49wfnjuotBRtMO6qJiZafv7j6gof9fb/AfoBeI+0mirq1almjyB4DwNs8QQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ve+S+Opg; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ve+S+Opg"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1d71c844811so39124715ad.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Jan 2024 12:44:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706215449; x=1706820249; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=45hoLVU1kMNJvCkEmNn31hPORALk5tp9XZjsZd89mts=;
        b=ve+S+Opg0+nNdr3cG1Hmlq/n/tylJEi7bNn+b3HrEaGUHTRKZN7XtBExIbZ6LXFsfI
         YVlTOlvnlC4eoiAh+KUo0z9GS/kOU/BEZJRi+13ViFrgfVHdB8C3O3oVj8zhCPOxGNa4
         tZ5yh6iMP0NuNDFTFMfUcvLENxuulopTJcxSvYDXIli/TvjvwBOdaDaMBxfxesU/Ysgk
         9JvcOxtquvcVZB8+TTBD/naVr5a8G7ssb5ItQqHZNbF89OfgtDBtTuyY8mrACUveL+O4
         lsmTjo3ZInh9oLBtscqCvPPZ3actpJOdnNJdrkKegLrLiZO4CS6uxiF6vi7CXPoSDyGR
         c9wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706215449; x=1706820249;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=45hoLVU1kMNJvCkEmNn31hPORALk5tp9XZjsZd89mts=;
        b=TpRkjHvggAgqEWqvemN6FEFGEVbUc+FGGJ5h/sHVMwnMWusuWXXhFIZ9NQeUFaaRfj
         BA03HexoWzAxlr8tT1QmoMcdi8MNcDtjX3UE/e4yFdn7bXVVPZGWQXIhrtS3tM3GvFOZ
         xbOxv8VeZI+CCxGr/4IfoY5V+nLHyCpK9KqGsnLqAUw8FfaW7qMuZx3yIavWL6imhdPz
         Gl1vUm6L+MDe6RvmX+HhEWenZli/f1lY0UsPz4dJ1J8WMJWbZyoo8LeItl+vKGgcHn4h
         FS6odqDz5ZeVxAAMX0CRSS+avG3jblqX98Dluc5XNEEJOzMYgD6IpS5nN1s0dIho0GAM
         cqjA==
X-Gm-Message-State: AOJu0Yy+OWZ2TKWxemMUf5r7vkQ6J3bGM+gWo7VVjsBs4zjevWu3haID
	U60s8oyLkUmG1agUQrNOBM0YOQs0YyV/e1FWjv8XPHQi7UYZaGj0oKkkW9GhR6Db1LSB7bY3Jrs
	Ik3P9RRq8HbrmY/PArnJBWux9YuuVyjKHinbINA==
X-Google-Smtp-Source: AGHT+IFjxDRR951l2uvjkFJzpekmldx6UXtJcNdQqyuBbeP5oU2ps8Vv1hWhLiEkCrbTHrGuKMtCJQO0mTbC53OYYXY=
X-Received: by 2002:a17:90a:5785:b0:28c:fb86:23ce with SMTP id
 g5-20020a17090a578500b0028cfb8623cemr181303pji.44.1706215448724; Thu, 25 Jan
 2024 12:44:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240125145007.748295-1-tudor.ambarus@linaro.org> <20240125145007.748295-17-tudor.ambarus@linaro.org>
In-Reply-To: <20240125145007.748295-17-tudor.ambarus@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Thu, 25 Jan 2024 14:43:57 -0600
Message-ID: <CAPLW+4mLWU-8H=qESe9csXm=e_ByvP=nc7MEJzknv+XAUjqUZg@mail.gmail.com>
Subject: Re: [PATCH v2 16/28] spi: s3c64xx: simplify s3c64xx_wait_for_pio()
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
> s3c64xx_spi_transfer_one() makes sure that for PIO the xfer->len is
> always smaller than the fifo size. Since we can't receive more that the
> FIFO size, droop the loop handling, the code becomes less misleading.

Drop (spelling)?

For the patch: how exactly it was tested to make sure there is no regressio=
n?

>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
>  drivers/spi/spi-s3c64xx.c | 75 +++++++++------------------------------
>  1 file changed, 17 insertions(+), 58 deletions(-)
>
> diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
> index d2dd28ff00c6..00a0878aeb80 100644
> --- a/drivers/spi/spi-s3c64xx.c
> +++ b/drivers/spi/spi-s3c64xx.c
> @@ -485,26 +485,6 @@ static int s3c64xx_enable_datapath(struct s3c64xx_sp=
i_driver_data *sdd,
>         return 0;
>  }
>
> -static u32 s3c64xx_spi_wait_for_timeout(struct s3c64xx_spi_driver_data *=
sdd,
> -                                       int timeout_ms)
> -{
> -       void __iomem *regs =3D sdd->regs;
> -       unsigned long val =3D 1;
> -       u32 status;
> -       u32 max_fifo =3D FIFO_DEPTH(sdd);
> -
> -       if (timeout_ms)
> -               val =3D msecs_to_loops(timeout_ms);
> -
> -       do {
> -               status =3D readl(regs + S3C64XX_SPI_STATUS);
> -       } while (FIELD_GET(S3C64XX_SPI_ST_RX_FIFO_LVL, status) < max_fifo=
 &&
> -                --val);
> -
> -       /* return the actual received data length */
> -       return FIELD_GET(S3C64XX_SPI_ST_RX_FIFO_LVL, status);
> -}
> -
>  static int s3c64xx_wait_for_dma(struct s3c64xx_spi_driver_data *sdd,
>                                 struct spi_transfer *xfer)
>  {
> @@ -553,13 +533,11 @@ static int s3c64xx_wait_for_pio(struct s3c64xx_spi_=
driver_data *sdd,
>                                 struct spi_transfer *xfer, bool use_irq)
>  {
>         void __iomem *regs =3D sdd->regs;
> +       u8 *buf =3D xfer->rx_buf;
> +       unsigned long time_us;
>         unsigned long val;
> -       u32 status;
> -       int loops;
> -       u32 cpy_len;
> -       u8 *buf;
> +       u32 status, len;
>         int ms;
> -       unsigned long time_us;
>
>         /* microsecs to xfer 'len' bytes @ 'cur_speed' */
>         time_us =3D (xfer->len * 8 * 1000 * 1000) / sdd->cur_speed;
> @@ -582,48 +560,29 @@ static int s3c64xx_wait_for_pio(struct s3c64xx_spi_=
driver_data *sdd,
>                 status =3D readl(regs + S3C64XX_SPI_STATUS);
>         } while (FIELD_GET(S3C64XX_SPI_ST_RX_FIFO_LVL, status) < xfer->le=
n &&
>                  --val);
> -
>         if (!val)
>                 return -EIO;
>
>         /* If it was only Tx */
> -       if (!xfer->rx_buf) {
> +       if (!buf) {
>                 sdd->state &=3D ~TXBUSY;
>                 return 0;
>         }
>
> -       /*
> -        * If the receive length is bigger than the controller fifo
> -        * size, calculate the loops and read the fifo as many times.
> -        * loops =3D length / max fifo size (calculated by using the
> -        * fifo mask).
> -        * For any size less than the fifo size the below code is
> -        * executed atleast once.
> -        */
> -       loops =3D xfer->len / FIFO_DEPTH(sdd);
> -       buf =3D xfer->rx_buf;
> -       do {
> -               /* wait for data to be received in the fifo */
> -               cpy_len =3D s3c64xx_spi_wait_for_timeout(sdd,
> -                                                      (loops ? ms : 0));
> -
> -               switch (sdd->cur_bpw) {
> -               case 32:
> -                       ioread32_rep(regs + S3C64XX_SPI_RX_DATA,
> -                                    buf, cpy_len / 4);
> -                       break;
> -               case 16:
> -                       ioread16_rep(regs + S3C64XX_SPI_RX_DATA,
> -                                    buf, cpy_len / 2);
> -                       break;
> -               default:
> -                       ioread8_rep(regs + S3C64XX_SPI_RX_DATA,
> -                                   buf, cpy_len);
> -                       break;
> -               }
> +       len =3D FIELD_GET(S3C64XX_SPI_ST_RX_FIFO_LVL, status);
> +
> +       switch (sdd->cur_bpw) {
> +       case 32:
> +               ioread32_rep(regs + S3C64XX_SPI_RX_DATA, buf, len / 4);
> +               break;
> +       case 16:
> +               ioread16_rep(regs + S3C64XX_SPI_RX_DATA, buf, len / 2);
> +               break;
> +       default:
> +               ioread8_rep(regs + S3C64XX_SPI_RX_DATA, buf, len);
> +               break;
> +       }
>
> -               buf =3D buf + cpy_len;
> -       } while (loops--);
>         sdd->state &=3D ~RXBUSY;
>
>         return 0;
> --
> 2.43.0.429.g432eaa2c6b-goog
>
