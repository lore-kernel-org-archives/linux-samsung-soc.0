Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1732C1CD20
	for <linux-samsung-soc@vger.kernel.org>; Tue, 16 Jan 2024 18:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705428654; cv=none; b=jwbV3OPQYYtD4rd9LtQBGpxlonMswu9mtHacbObsQlSWKn347KTjbcIb1t2qnzgNcPEvrz24oNqDi3KzvVCc+NkURFW4XvfVg9NwZb/Q49jrkTEuoHZTy4bbWSRlf17n+L0xpRr2mTUMCxzb8UQTRie3Y+IcVLPc7AJyY8DTcsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705428654; c=relaxed/simple;
	bh=RweaeoVi9vb5w/OKvidzWBDb8rUFM94JEo/ugp/chiQ=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding; b=POZAUfNk+J1zAR/LMuk8zcX+P3A3m+FGOtIHWfd2QDVfjCHstLoQqg9GCpQ0rnuySsyIYtwAXiSVa0THGaQffX4fqQA8BWKYWMSG17ehhatE03DwRkNhKTJOpNl0HapDKfo5/43IhaYxhI4YZkBXpnTlxkllu2ds35ZMPR//OFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZlSze6c6; arc=none smtp.client-ip=209.85.166.44
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZlSze6c6"
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-7bf2a5cf9cbso127535139f.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 16 Jan 2024 10:10:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705428652; x=1706033452; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WeHzMFOUSvfJb4dVqRpTD3wrNewNvV4aIi+VIi1fBLM=;
        b=ZlSze6c6h/aQzBv+8+NEEFm/W0SPmA5x6ThNXmbaaBfAtv7l+/vJFFdB9qPDhKX/VJ
         +QbNw2zq5fZUIxFbXY5CHm3q+ZDxE29QfMw664lFN2c02pFjnbYycB8UAbY2ciYkj22N
         6cqNAZB5j8p8HyrbfoPHK/bej/xMNWL/9nFA6YlIM/uyWVBNsfMGYsbZNP74lY8EvW1+
         pIGsqMBAZ+gQw1bZsPwhqCEF/MHoq5HUydds89O4AJ7PyESfTUYFFro6wYa5rWSktIJS
         IZ/W66NH60eg/ugnlg9LPIEUOcgyZ0OQfaQH0AbDWG08t9I4AJkh6XEcibPcloKgHdvC
         a2MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705428652; x=1706033452;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WeHzMFOUSvfJb4dVqRpTD3wrNewNvV4aIi+VIi1fBLM=;
        b=TrIwZ3cIaM7TN1Z1SUCPmKebxY/MfEgoGnnHkjhtTxSb1fySgErdrx3ugOd7P65GOr
         VimrJX2YOtCY0PZarv7OY0ceHv+/B+JaUmiNcK9wGrPevux7VlNeIywlY+8W31Ci7ixX
         C8M0dZj5O1k0HSr+6K42Ai3zuy+SW/3QWKswXX4kQ3fhE9M/f7dwBgLAcjI5NN2kZC/O
         f6VPqNAFLj/A81cGeRc9LDjN/wNRR3r6tjsWqgzq/HdZXQh45DpqUnxt/fa0wQfvb5Hn
         Pd/EQ3vPcenk0anNdmjBuLU1AlNUaEN2/Y1p6gNVJFatcpFNtwFy54b5gQ8i8muJEQqY
         e0zQ==
X-Gm-Message-State: AOJu0Yzpf8kXZcbl7aFOizO6mBRtBwStEr/Kh0pir0r/bL2mJLFB8qwf
	e576f5sqDSHnTwFlGLsTkPRA1EyW+luz+GQwzfQsYC4ofZcY7Q==
X-Google-Smtp-Source: AGHT+IF3T+HEuJ74amKUtc0+nZKPgelNphlTJZGAxgmPIeS7O6UgD2MbdqmRcHjgpUdSl6sAXtXDNAEaFWZmC5pnHvk=
X-Received: by 2002:a6b:7d07:0:b0:7bf:1ddd:b900 with SMTP id
 c7-20020a6b7d07000000b007bf1dddb900mr6463930ioq.8.1705428652264; Tue, 16 Jan
 2024 10:10:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240109125814.3691033-1-tudor.ambarus@linaro.org> <20240109125814.3691033-6-tudor.ambarus@linaro.org>
In-Reply-To: <20240109125814.3691033-6-tudor.ambarus@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Tue, 16 Jan 2024 12:10:40 -0600
Message-ID: <CAPLW+4nWy_7w2Q703JE5hUQtFy3ABmvcfRhhB7pkrYKgLisGWQ@mail.gmail.com>
Subject: Re: [PATCH v3 05/12] tty: serial: samsung: set UPIO_MEM32 iotype for gs101
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: peter.griffin@linaro.org, krzysztof.kozlowski+dt@linaro.org, 
	gregkh@linuxfoundation.org, mturquette@baylibre.com, sboyd@kernel.org, 
	robh+dt@kernel.org, conor+dt@kernel.org, andi.shyti@kernel.org, 
	alim.akhtar@samsung.com, jirislaby@kernel.org, s.nawrocki@samsung.com, 
	tomasz.figa@gmail.com, cw00.choi@samsung.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-serial@vger.kernel.org, andre.draszik@linaro.org, 
	kernel-team@android.com, willmcvicker@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 9, 2024 at 7:00=E2=80=AFAM Tudor Ambarus <tudor.ambarus@linaro.=
org> wrote:
>
> GS101's Connectivity Peripheral blocks (peric0/1 blocks) which
> include the I3C and USI (I2C, SPI, UART) only allow 32-bit
> register accesses.
>
> Instead of specifying the reg-io-width =3D 4 everywhere, for each node,
> the requirement should be deduced from the compatible.
>
> Infer UPIO_MEM32 iotype from the "google,gs101-uart" compatible.
> Update the uart info name to be GS101 specific in order to
> differentiate from the other exynos platforms. All the other settings
> are not changed.
>
> exynos_fifoszdt_serial_drv_data was replaced by gs101_serial_drv_data
> because the iotype restriction is gs101 specific and there was no other
> user of exynos_fifoszdt_serial_drv_data.
>
> Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

> v3: collect Peter's R-b tag
> v2: new patch
>
>  drivers/tty/serial/samsung_tty.c | 38 +++++++++++++++++++++++---------
>  1 file changed, 28 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsun=
g_tty.c
> index ff646cddd3f8..a81b61953a28 100644
> --- a/drivers/tty/serial/samsung_tty.c
> +++ b/drivers/tty/serial/samsung_tty.c
> @@ -2497,25 +2497,43 @@ static const struct s3c24xx_serial_drv_data exyno=
s850_serial_drv_data =3D {
>         .fifosize =3D { 256, 64, 64, 64 },
>  };
>
> -/*
> - * Common drv_data struct for platforms that specify samsung,uart-fifosi=
ze in
> - * device tree.
> - */
> -static const struct s3c24xx_serial_drv_data exynos_fifoszdt_serial_drv_d=
ata =3D {
> -       EXYNOS_COMMON_SERIAL_DRV_DATA(),
> +static const struct s3c24xx_serial_drv_data gs101_serial_drv_data =3D {
> +       .info =3D {
> +               .name           =3D "Google GS101 UART",
> +               .type           =3D TYPE_S3C6400,
> +               .port_type      =3D PORT_S3C6400,
> +               .iotype         =3D UPIO_MEM32,
> +               .has_divslot    =3D 1,
> +               .rx_fifomask    =3D S5PV210_UFSTAT_RXMASK,
> +               .rx_fifoshift   =3D S5PV210_UFSTAT_RXSHIFT,
> +               .rx_fifofull    =3D S5PV210_UFSTAT_RXFULL,
> +               .tx_fifofull    =3D S5PV210_UFSTAT_TXFULL,
> +               .tx_fifomask    =3D S5PV210_UFSTAT_TXMASK,
> +               .tx_fifoshift   =3D S5PV210_UFSTAT_TXSHIFT,
> +               .def_clk_sel    =3D S3C2410_UCON_CLKSEL0,
> +               .num_clks       =3D 1,
> +               .clksel_mask    =3D 0,
> +               .clksel_shift   =3D 0,
> +       },
> +       .def_cfg =3D {
> +               .ucon           =3D S5PV210_UCON_DEFAULT,
> +               .ufcon          =3D S5PV210_UFCON_DEFAULT,
> +               .has_fracval    =3D 1,
> +       },
> +       /* samsung,uart-fifosize must be specified in the device tree. */
>         .fifosize =3D { 0 },
>  };
>
>  #define EXYNOS4210_SERIAL_DRV_DATA (&exynos4210_serial_drv_data)
>  #define EXYNOS5433_SERIAL_DRV_DATA (&exynos5433_serial_drv_data)
>  #define EXYNOS850_SERIAL_DRV_DATA (&exynos850_serial_drv_data)
> -#define EXYNOS_FIFOSZDT_DRV_DATA (&exynos_fifoszdt_serial_drv_data)
> +#define GS101_SERIAL_DRV_DATA (&gs101_serial_drv_data)
>
>  #else
>  #define EXYNOS4210_SERIAL_DRV_DATA NULL
>  #define EXYNOS5433_SERIAL_DRV_DATA NULL
>  #define EXYNOS850_SERIAL_DRV_DATA NULL
> -#define EXYNOS_FIFOSZDT_DRV_DATA NULL
> +#define GS101_SERIAL_DRV_DATA NULL
>  #endif
>
>  #ifdef CONFIG_ARCH_APPLE
> @@ -2603,7 +2621,7 @@ static const struct platform_device_id s3c24xx_seri=
al_driver_ids[] =3D {
>                 .driver_data    =3D (kernel_ulong_t)ARTPEC8_SERIAL_DRV_DA=
TA,
>         }, {
>                 .name           =3D "gs101-uart",
> -               .driver_data    =3D (kernel_ulong_t)EXYNOS_FIFOSZDT_DRV_D=
ATA,
> +               .driver_data    =3D (kernel_ulong_t)GS101_SERIAL_DRV_DATA=
,
>         },
>         { },
>  };
> @@ -2626,7 +2644,7 @@ static const struct of_device_id s3c24xx_uart_dt_ma=
tch[] =3D {
>         { .compatible =3D "axis,artpec8-uart",
>                 .data =3D ARTPEC8_SERIAL_DRV_DATA },
>         { .compatible =3D "google,gs101-uart",
> -               .data =3D EXYNOS_FIFOSZDT_DRV_DATA },
> +               .data =3D GS101_SERIAL_DRV_DATA },
>         {},
>  };
>  MODULE_DEVICE_TABLE(of, s3c24xx_uart_dt_match);
> --
> 2.43.0.472.g3155946c3a-goog
>
>
