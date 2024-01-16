Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3CEF1CF89
	for <linux-samsung-soc@vger.kernel.org>; Tue, 16 Jan 2024 18:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705431135; cv=none; b=Z0ALA8FO/mnpIiZaXcldxieIxMNHXmtglPXjTzm/mnlOszbWeywVRsjqit12JOoDZSUYp1C8t8rUNAfxobgst3RddyrCAQUaJxCfeDyH79/PSMNY7YQENLD0WggpmyZmwSUNmbtb+4skuU63vMqmG84o8G3PCuaSK47B41QOu2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705431135; c=relaxed/simple;
	bh=/K8VPhKa0ZQLIT4I+YaGXUtaKJqi701MWyn53qqVPWI=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding; b=jPFX8wZx/FQL9IKQX4dvvzRLvjnEumjU4uc17Bj5JaVoIVswtfVEQXjKv16CUw65FN13Z/Kkktz9cHdW3htJ7OMOQXkPDdh32jjhsBVpcuhWB4I2sJ22LdpIUe/4LfDlbacJ7/mMQLRBZVnm86vuJINlPn4biGfuNGf6j2O5Sy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wrMwwuI8; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wrMwwuI8"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-28cf491b197so5199805a91.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 16 Jan 2024 10:52:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705431133; x=1706035933; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eiEq2TIzBLf+TCDCHFATauUGuzABkkErqxkgwaaXJeo=;
        b=wrMwwuI8RUIcnh2KTX+ByqhOEme8pcHVUEQKYlWJEqsff7GajcuwNwrbXhfPCPxJo7
         /PuSDq77CszFQbJqHbRY3GxcXoe4tECLjt3H/9mIHsOS3DEWh3l1wxxe9dtTlpObdV0+
         QObr6NiqMoBF+t/suN072uTchOYXyrxRNk6o1NqZi/w2j5fCk53NApT/COKe9CAujkSE
         GjOq2Tks2WoCDSes9Q46OGtE/kvjOgdD8i4OYver09B+C11jDYbG3+5/MgOw9S70wcuN
         79puRRMGPLDNQO15uH4A2s9I5Atc+IuTpZJ0OR4dY1aITVEsOVvisjghfKKt1xIF4Zga
         s2Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705431133; x=1706035933;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eiEq2TIzBLf+TCDCHFATauUGuzABkkErqxkgwaaXJeo=;
        b=YoKV5rtyR+DQrevLSLg33SH8tGnLzRLrY3Wyqs1fKeaXoMvu4/Ix1+NRFHSDwpuDTE
         yDaOomB8QcpNn4XY23CzaI9Wj3U9I7liLA6TYdABtxEmItfD07hHvvosna3NHFWkKu6D
         9YTSGl3WV/InEHy8Tp7FRvFdNkuMhpk3jbSHH9NOOHiXBIidvoeNcz4UOVUWosS2bRQA
         bgxYSj9BvpJfa737x3QTKdpAHtj/aKipIY3hvMlLV8uGGmnu98va5yRmMkEnQJJxu0XS
         9icPd1e3KQwYOvEqa/tKrIL/UDRm/Rd3/7Y/OjZbw8GB3POo9OiM0l6BnyX8B+N241NK
         qIBg==
X-Gm-Message-State: AOJu0Yyp46L0pr7hEofpqqHGN/zSJQW3F1TCWIko7OJWc4FmmMXxGRvQ
	sigHvCObfxmprettTIPh3wdpU8Ep7IIEdRLBfpS2o4MWASk10Q==
X-Google-Smtp-Source: AGHT+IHdCZd4ZqNmemGEvDzjokCVj4WZXw4hl6Tiw1c8DaYEhSVVgr3R/qzrTboYQEsCXmc7zuHIs6OPQiFIH8Yn004=
X-Received: by 2002:a17:90a:fb8a:b0:28b:187:2db with SMTP id
 cp10-20020a17090afb8a00b0028b018702dbmr4403962pjb.82.1705431133288; Tue, 16
 Jan 2024 10:52:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240110102102.61587-1-tudor.ambarus@linaro.org> <20240110102102.61587-14-tudor.ambarus@linaro.org>
In-Reply-To: <20240110102102.61587-14-tudor.ambarus@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Tue, 16 Jan 2024 12:52:02 -0600
Message-ID: <CAPLW+4nH0o4fsKTBwO6XwynK2DYCiMLMkmK7LgYepHc87jHJ5g@mail.gmail.com>
Subject: Re: [PATCH 13/18] tty: serial: samsung: return bool for s3c24xx_serial_txempty_nofifo()
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: krzysztof.kozlowski@linaro.org, alim.akhtar@samsung.com, 
	gregkh@linuxfoundation.org, jirislaby@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	andre.draszik@linaro.org, peter.griffin@linaro.org, kernel-team@android.com, 
	willmcvicker@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 10, 2024 at 4:24=E2=80=AFAM Tudor Ambarus <tudor.ambarus@linaro=
.org> wrote:
>
> s3c24xx_serial_txempty_nofifo() returned either 0 or BIT(2), which is
> counterintuitive. Make the method return bool, and return true when TX
> is empty and false otherwise.
>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
>  drivers/tty/serial/samsung_tty.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsun=
g_tty.c
> index 46fba70f3d77..63e993bed296 100644
> --- a/drivers/tty/serial/samsung_tty.c
> +++ b/drivers/tty/serial/samsung_tty.c
> @@ -236,9 +236,9 @@ static inline const char *s3c24xx_serial_portname(con=
st struct uart_port *port)
>         return to_platform_device(port->dev)->name;
>  }
>
> -static int s3c24xx_serial_txempty_nofifo(const struct uart_port *port)
> +static bool s3c24xx_serial_txempty_nofifo(const struct uart_port *port)
>  {
> -       return rd_regl(port, S3C2410_UTRSTAT) & S3C2410_UTRSTAT_TXE;
> +       return !!(rd_regl(port, S3C2410_UTRSTAT) & S3C2410_UTRSTAT_TXE);

If the function already returns bool, I'm not sure doing !! is
necessary. But I don't mind.

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  }
>
>  static void s3c24xx_serial_rx_enable(struct uart_port *port)
> @@ -782,7 +782,7 @@ static void s3c24xx_serial_rx_drain_fifo(struct s3c24=
xx_uart_port *ourport)
>                 ch =3D rd_reg(port, S3C2410_URXH);
>
>                 if (port->flags & UPF_CONS_FLOW) {
> -                       int txe =3D s3c24xx_serial_txempty_nofifo(port);
> +                       bool txe =3D s3c24xx_serial_txempty_nofifo(port);
>
>                         if (ourport->rx_enabled) {
>                                 if (!txe) {
> --
> 2.43.0.472.g3155946c3a-goog
>
>
