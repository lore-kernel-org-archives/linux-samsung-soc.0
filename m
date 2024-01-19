Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFE063C465
	for <linux-samsung-soc@vger.kernel.org>; Fri, 19 Jan 2024 16:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705681655; cv=none; b=EPHa0Ti6jpAuv2/F0zV+SGL/ldZYSHFiSJ3GtGfTrY5q+bqlUu+C6YACCBuxQ/Encila3yZySekqjbOXBZewasxtudeJ67vTElfy844FBdFgDpHu1eyMv4rspQChzeJE0AOdy0F5kA1LqfRHRoRT7AEpDfqgH+XemByfeoTfRSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705681655; c=relaxed/simple;
	bh=kkWYKcL9oT4VufYrCMQAS2UWPSnN7a4PSvDgPkTT1Og=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U2r46GD4tKP5NvULyCVfN4dwjS+i0ayc440zQjyOq+4Fs+B+8wyqP4BeGQyvUo2145ZquMfydXjo7oxBtnno9lJ3S7ckB/UbM6ER1V/p3gWEIvuIB3VBxmcsmn5/WmTVGt36PHn7/rhcsVHfg4bZLSonVBLAxXSbOqrkNhrvqPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mK3yMiGj; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mK3yMiGj"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-5ce6b5e3c4eso672581a12.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 19 Jan 2024 08:27:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705681652; x=1706286452; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/wDiJilyv3/HsVDsNR/fLAo3Wov0N9tZ0IfMd0xcH4g=;
        b=mK3yMiGjr9cL5ZFCCTn7feferawm4/3b1hV+F1Zw8pZfHg1P/CYIVYym3jsSWHsBeo
         f/FhVm5KxxXDbsawDtfCD7n0yMqCMDjOcwAbsQqNmg3moo/ItqajvJqBE60Rq9D0PDnd
         PzCxyiRg82eZM6K3vTytVDXm/ZINqsh4AKV1G0KP7NU1sjoiTzrO5HaOIWd/zxzUR+Lh
         1PXDthXi8Cy/xi1att6yqy315vD1lZEQB0Sj1ZdgKBRmyVeOEY53AaUoXC8GtY1/ZE8y
         /N721c0+9RtMCM1dFgqJFzYw8OqtoitZXxvkEpsPLExwrJ8loPzllxZ0exJIYPiownjj
         UzgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705681652; x=1706286452;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/wDiJilyv3/HsVDsNR/fLAo3Wov0N9tZ0IfMd0xcH4g=;
        b=vc1xdil7PMv9EWQt6jKJeQnp27kM+gS3e+Orv5MyDFBJmlyLTveONQNyG+tqPZxEiv
         4Ot9zpbWPIcdmUZnqA15hjvPO8eQCvOlwvWIXCBQU7qEnGFldUldcnYpjYWnd+EVTaOr
         dVrEpj77y0uzTI5NE6rE6+P3hv34s6J6qcHNmDwonMmvlOxWDZyXSAS0J1BkDtOZ1Kmz
         kW+Je2tzq1tr/gYZ9qHnycwD6niIQTaIWpEUVqJhx0Spi3jZrU+TaCE2Qq3flGpijoOK
         Oil3s6sJBq/zAe39uehppeu2EWPmGtqU6s0Iam0ZAq39YoNuv6cEv3XwOBzakw6E6W4c
         3ysQ==
X-Gm-Message-State: AOJu0YyH1E3/t2MfOP3C5YqRPp8f8ruTFy4FQIYI6HWD/oSQVowb8Iss
	sePrH+WoAzW2z13Y167gFfCaVWcyw/KJkPB64v/YB3Lni6dRSd9pMGv2rR1+WHgrsk2wf1HfBNn
	53tyXjP7K1AtBEdukrH7ROEvWJ3Ry/wz8wl34YQ==
X-Google-Smtp-Source: AGHT+IHtPQv47KroEyd47og/vmNUBP9tj7tQ2QErTVBbhe87+ZNUoPqiRqCBKf1f63X/+C9w5wA5YZt8cjCJ625Ozrg=
X-Received: by 2002:a17:90a:6286:b0:290:bd1:7d37 with SMTP id
 d6-20020a17090a628600b002900bd17d37mr22504pjj.47.1705681652237; Fri, 19 Jan
 2024 08:27:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240119104526.1221243-1-tudor.ambarus@linaro.org> <20240119104526.1221243-2-tudor.ambarus@linaro.org>
In-Reply-To: <20240119104526.1221243-2-tudor.ambarus@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Fri, 19 Jan 2024 10:27:21 -0600
Message-ID: <CAPLW+4kxTUUTrXWOtoBvMFHa+cyRBba_JvLNuKny-rsStbgmSg@mail.gmail.com>
Subject: Re: [PATCH v2 01/19] tty: serial: samsung: fix tx_empty() to return TIOCSER_TEMT
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: gregkh@linuxfoundation.org, jirislaby@kernel.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	alim.akhtar@samsung.com, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	andre.draszik@linaro.org, kernel-team@android.com, peter.griffin@linaro.org, 
	willmcvicker@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 19, 2024 at 4:45=E2=80=AFAM Tudor Ambarus <tudor.ambarus@linaro=
.org> wrote:
>
> The core expects for tx_empty() either TIOCSER_TEMT when the tx is
> empty or 0 otherwise. s3c24xx_serial_txempty_nofifo() might return
> 0x4, and at least uart_get_lsr_info() tries to clear exactly
> TIOCSER_TEMT (BIT(1)). Fix tx_empty() to return TIOCSER_TEMT.
>
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  drivers/tty/serial/samsung_tty.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsun=
g_tty.c
> index 71d17d804fda..6fdb32b83346 100644
> --- a/drivers/tty/serial/samsung_tty.c
> +++ b/drivers/tty/serial/samsung_tty.c
> @@ -987,11 +987,10 @@ static unsigned int s3c24xx_serial_tx_empty(struct =
uart_port *port)
>                 if ((ufstat & info->tx_fifomask) !=3D 0 ||
>                     (ufstat & info->tx_fifofull))
>                         return 0;
> -
> -               return 1;
> +               return TIOCSER_TEMT;
>         }
>
> -       return s3c24xx_serial_txempty_nofifo(port);
> +       return s3c24xx_serial_txempty_nofifo(port) ? TIOCSER_TEMT : 0;
>  }
>
>  /* no modem control lines */
> --
> 2.43.0.429.g432eaa2c6b-goog
>
