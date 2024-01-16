Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902A61CD2D
	for <linux-samsung-soc@vger.kernel.org>; Tue, 16 Jan 2024 18:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705428881; cv=none; b=f1QE528Q92H0ackVBmbTgf7koy1U+fZLaFn8lwoN/Xl/U6AMIDCKa/12FnmUd9ijogDMjUyEggVQsetVOq8VDPeo8q1Jp4MxnX0JcmW3P2oHPPcRVZBxP7vfu1+3D8n4roY4j07YGdkAQHrqJwrDBcj5DeXt7WNH+8jE9Gya1oQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705428881; c=relaxed/simple;
	bh=cv59bDCTOqRhiDC3HpONyDpPUeopXrDeTyWmM+8EkOI=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding; b=AUYIEdQMCAwjLHhI98KnkU/DQamPedLTYr59KVrt02dQ4KhGQJK+kw+Z1wTqKRaBCe4yDKBB8kHdT7HnCWQRlcljYdAB2sIJ9WNWgAZn/S9zIefuJlm2NFftpE8Qhmtc4lPQvGKn+VYAYogqw/GGVZcJTWTj5IMgXhWsxAto3I4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ntfNTKq8; arc=none smtp.client-ip=209.85.166.54
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ntfNTKq8"
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-7bee874fcc2so362334439f.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 16 Jan 2024 10:14:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705428879; x=1706033679; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xRhLuuiIVVo+A52y6bxPnSkQ+JrLAw3wqr2sWjodaZc=;
        b=ntfNTKq8C4HxrhN7HqHgbmqQXfktwh8hmtgTA5ncDWjXGizdF3GP0fGzClzVcPySY5
         Fr/LPYZkV9MKuT7X9Ho1WvaMWPpxFEqRhWT90Sy7hmG1jl9bMpHMyWnWjyEYvOSSdOWL
         7RsivC3zzWi4FqeKBp1Fbus4EvmmfmE3Ira6cAvx5n03Mi7ocy62RMTCJHCjxRribQ2T
         RcvSJ0PxWvBqmO8FcwuvIr3ttU+VFagMYmrqyEP++o14SO2/yzy3wEuWj1wWkEpVm1EU
         paXan10Buan5kMdpRnQbVihNjLYYRVwsx6+Ihh3oMBg7fP1FX6pVxm41RiGQqlToSr72
         7SNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705428879; x=1706033679;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xRhLuuiIVVo+A52y6bxPnSkQ+JrLAw3wqr2sWjodaZc=;
        b=PqdXT5eoOgGDvI2ioqt+t25WWQKjn+YE6BsazkYhkbNo7Tb9gfY5tOkTBo1dnIFIkV
         kYPVgnvCXHN8pDujOMIvir3TxkFv/Ejy1L2TPKSCi5Ds/mj6uiAV3hKD+gb7QpZNH+Av
         s7BQVC8rR6qAg4GtAnAIK2Lg5z+yyDTCYCpXzZXPiyNiIGXtTk50FATEDJQlIchyNkVX
         7vY+taASF7eAoZHU19xf3iB7IumwrRaej6hf43AKAJ8cwQroNR5Ng5ph5r5G2SoqdaV0
         R2rWVI3K5QTtzgTzq0t7ML2XTN24P1vo3zM8zDJQl1x74CbePH3UKE6Uk7bBAiT6fdC6
         Hg8g==
X-Gm-Message-State: AOJu0YyEC8oU2dCOlZnFqy8gH6ZbtmtfC9/hzEgdxW+34/QyoYNO1rho
	hcShoZBy7NHwKpC2TDTu4QTDSdH4XcZupCQ2R2Hu4MJ2A4pbOg==
X-Google-Smtp-Source: AGHT+IEfZdEKTVV73IlpY3EGlS1kPKh3DImT91Va7UPo6ctMhZS1jwa3ClSyV/+ZVIEwxJrtZw8TuE8UvHu/GnDXkQ4=
X-Received: by 2002:a05:6602:3054:b0:7be:d30c:d170 with SMTP id
 p20-20020a056602305400b007bed30cd170mr8728680ioy.34.1705428879752; Tue, 16
 Jan 2024 10:14:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240110102102.61587-1-tudor.ambarus@linaro.org> <20240110102102.61587-4-tudor.ambarus@linaro.org>
In-Reply-To: <20240110102102.61587-4-tudor.ambarus@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Tue, 16 Jan 2024 12:14:28 -0600
Message-ID: <CAPLW+4mY4VUm+cryBDFLp9TFkxG2oqJrmbZVuRuT5bFOzYXrnQ@mail.gmail.com>
Subject: Re: [PATCH 03/18] tty: serial: samsung: add gs101 earlycon support
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: krzysztof.kozlowski@linaro.org, alim.akhtar@samsung.com, 
	gregkh@linuxfoundation.org, jirislaby@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	andre.draszik@linaro.org, peter.griffin@linaro.org, kernel-team@android.com, 
	willmcvicker@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 10, 2024 at 4:21=E2=80=AFAM Tudor Ambarus <tudor.ambarus@linaro=
.org> wrote:
>
> The entire bus (PERIC) on which the GS101 serial resides only allows
> 32-bit register accesses. The reg-io-width dt property is disallowed
> for the "google,gs101-uart" compatible and instead the iotype is
> inferred from the compatible. Always set UPIO_MEM32 iotype for the
> gs101 earlycon.
>
> Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  drivers/tty/serial/samsung_tty.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsun=
g_tty.c
> index 20ec6ef1a52f..74bc5151dad4 100644
> --- a/drivers/tty/serial/samsung_tty.c
> +++ b/drivers/tty/serial/samsung_tty.c
> @@ -2810,6 +2810,17 @@ OF_EARLYCON_DECLARE(exynos4210, "samsung,exynos421=
0-uart",
>  OF_EARLYCON_DECLARE(artpec8, "axis,artpec8-uart",
>                         s5pv210_early_console_setup);
>
> +static int __init gs101_early_console_setup(struct earlycon_device *devi=
ce,
> +                                           const char *opt)
> +{
> +       /* gs101 always expects MMIO32 register accesses. */
> +       device->port.iotype =3D UPIO_MEM32;
> +
> +       return s5pv210_early_console_setup(device, opt);
> +}
> +
> +OF_EARLYCON_DECLARE(gs101, "google,gs101-uart", gs101_early_console_setu=
p);
> +
>  /* Apple S5L */
>  static int __init apple_s5l_early_console_setup(struct earlycon_device *=
device,
>                                                 const char *opt)
> --
> 2.43.0.472.g3155946c3a-goog
>
>
