Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A488713B7AF
	for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Jan 2024 22:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706221716; cv=none; b=S1rATk114AquWeD/GOR427avRVz8+azrdKm9tUoJIghCgdIGBXUUs/CvnAm0TuAshxRLQBbXTJyDbq/jmSUDODwJbVgPlYmVXKCL79+vXm22NrrPyFOPHGcCNIuAFDWldrJP7MJolV+nOo6HcxR+RO+mcEEHm5B0wE6+PuCfq+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706221716; c=relaxed/simple;
	bh=fewPAIgDGLGdcAwZjaqy7sb9SgnJwjIghHSrzOnA3/c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A22OxsMPpM/ZUFrTeHdkbZD31g6J5xjvJUS7uxn+O+03kNTGd3RTfwewgu9ciWJ8D/WRJFdXON6/AL/e++o2Cv6b2jZ9thPUubvwKYTrYGhRRTPcOPp3mbAv/hBR9cO6I+KKdE9GPT6c/ERB7ZinfOFTEgSTIZWQRFi6/9b5RT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ko6LbK2j; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ko6LbK2j"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-5ce07cf1e5dso4176340a12.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Jan 2024 14:28:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706221714; x=1706826514; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zA/exiIpBBgAezYkA5YOl1Fk+JrXYDEmPKHOao67IaM=;
        b=ko6LbK2juHwNUG3Gx5jXI8zidNONjTpKtcEYhExGjxsACQt/BKdcymqKuXsTbZ8Grx
         PpURoiTiaMTFkKPKoCUFirIaIx0rZnw1HIjwri3PsErwuvh2fIIevV4UxUjVUuho31qs
         Fl1Sbshme/EzqQpYvbh3zRKoxqOieRIsU0WgeaT8mxgKI/LcQXNEKtEj0SYTnncxcI8k
         Q72Sac4hIA4aaAOqM9mLVWxpMnIpnM7ys21CX9gNRraZq6fejui00Hur79T05pBIY0Cd
         q6WdPCY5KFFYI27Kez+4I+rlS7Aq5+BmiSgfcS7vAP3k3IO7kwCMxhHh5BYe/3x3daFy
         U0Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706221714; x=1706826514;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zA/exiIpBBgAezYkA5YOl1Fk+JrXYDEmPKHOao67IaM=;
        b=mRzXla9ScVZZ8W2xygADN59c5EL2tszGjhZdFD7LH/hraU7yu3YJDm1c3XkoalWG17
         C5teUSLsy1EiavMKkjVOGaDlfGr7k000Vnmq5OlGdoRPqJoDzDNqflpNFES/wQaCaV3N
         RIie5dylFAfGDXld0FxC0dMM+L04lVm7iJwfXlOa8XYMVyOkBeAXk42ljBxYr1FKlO0w
         lEd6hVYIjajU9A2O2Ud5blNg9O3yzHSdqM/u8InUUyKqssPy6sPxhj0l/rnVws3Fvkpo
         COiim3GUBH58LAycztQJnIOxmg2XRob2faWYukwFHO/AsuG0VZHO4WKuBXR0zk7VPW3O
         7WbQ==
X-Gm-Message-State: AOJu0YxwS043USE6PziwseX5BIDZb9A8upK7NVQXm3D83kfLGIN/r9sB
	EBxHnBxa1tSgUTZ7wnMai07+2+RG/S3N9a/zSBBMMYcr8HvgN4zcaM3n3d+nDaVj9uhHsr9ezYz
	sYw6lm3EIx2rkLzL/Wv01BTClhOf+yel9hw8zvQ==
X-Google-Smtp-Source: AGHT+IGf7mEs59neeLmFZTnVN+j87V7sBNtG0A/G6MI/URpASg2tvJBJnJjiUMH8fWPi0lDE99a4eX2t8nzszPn5wI8=
X-Received: by 2002:a05:6a20:258e:b0:19a:999c:6656 with SMTP id
 k14-20020a056a20258e00b0019a999c6656mr423041pzd.72.1706221714015; Thu, 25 Jan
 2024 14:28:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240125145007.748295-1-tudor.ambarus@linaro.org> <20240125145007.748295-22-tudor.ambarus@linaro.org>
In-Reply-To: <20240125145007.748295-22-tudor.ambarus@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Thu, 25 Jan 2024 16:28:22 -0600
Message-ID: <CAPLW+4mG_xVvZRrE_jfMxK2zO9GnLAPrHPdzW5bCOPpoiuCjsA@mail.gmail.com>
Subject: Re: [PATCH v2 21/28] spi: s3c64xx: infer fifosize from the compatible
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
> Infer the FIFO size from the compatible, where all the instances of the
> SPI IP have the same FIFO size. This way we no longer depend on the SPI
> alias from the device tree to select the FIFO size, thus we remove the
> dependency of the driver on the SPI alias.
>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
>  drivers/spi/spi-s3c64xx.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
> index 5a93ed4125b0..b86eb0a77b60 100644
> --- a/drivers/spi/spi-s3c64xx.c
> +++ b/drivers/spi/spi-s3c64xx.c
> @@ -1381,7 +1381,7 @@ static const struct dev_pm_ops s3c64xx_spi_pm =3D {
>  };
>
>  static const struct s3c64xx_spi_port_config s3c2443_spi_port_config =3D =
{
> -       .fifo_lvl_mask  =3D { 0x7f },

How will it work with already existing out-of-tree dts's, if only
kernel image gets updated? I wonder if it's considered ok to break
that compatibility like this.

> +       .fifosize       =3D 64,
>         .rx_lvl_offset  =3D 13,
>         .tx_st_done     =3D 21,
>         .clk_div        =3D 2,
> @@ -1389,7 +1389,7 @@ static const struct s3c64xx_spi_port_config s3c2443=
_spi_port_config =3D {
>  };
>
>  static const struct s3c64xx_spi_port_config s3c6410_spi_port_config =3D =
{
> -       .fifo_lvl_mask  =3D { 0x7f, 0x7F },
> +       .fifosize       =3D 64,
>         .rx_lvl_offset  =3D 13,
>         .tx_st_done     =3D 21,
>         .clk_div        =3D 2,
> @@ -1435,7 +1435,7 @@ static const struct s3c64xx_spi_port_config exynos5=
433_spi_port_config =3D {
>  };
>
>  static const struct s3c64xx_spi_port_config exynos850_spi_port_config =
=3D {
> -       .fifo_lvl_mask  =3D { 0x7f, 0x7f, 0x7f },
> +       .fifosize       =3D 64,
>         .rx_lvl_offset  =3D 15,
>         .tx_st_done     =3D 25,
>         .clk_div        =3D 4,
> @@ -1459,7 +1459,7 @@ static const struct s3c64xx_spi_port_config exynosa=
utov9_spi_port_config =3D {
>  };
>
>  static const struct s3c64xx_spi_port_config fsd_spi_port_config =3D {
> -       .fifo_lvl_mask  =3D { 0x7f, 0x7f, 0x7f, 0x7f, 0x7f},
> +       .fifosize       =3D 64,
>         .rx_lvl_offset  =3D 15,
>         .tx_st_done     =3D 25,
>         .clk_div        =3D 2,
> --
> 2.43.0.429.g432eaa2c6b-goog
>
