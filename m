Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DEFD1CF8C
	for <linux-samsung-soc@vger.kernel.org>; Tue, 16 Jan 2024 18:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705429093; cv=none; b=s9vpGdBO/traxSgKsad++UhR91oQrPyWAU2wHY6g368MmYM42P8/ulcMI4ILfiQtqnuMxJDo3Bk+svaAniai32qwLG2Npi6hWUd7WPl/ZZsIoRFBj1Y6L+83BiS233YGJZ8jj2nbpsF6RpQ+S11IwxbCRx4V4oczWyyvFVby7O4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705429093; c=relaxed/simple;
	bh=gKTkgQrZ49Y9ypGVnL4BuMEuKgsHCL1mmdyBQRQ7TyM=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding; b=ZDqamtdyNNjtGviwT+lxpHHqzONH2efR7hwLnxxtkw/nz5hTTl653feheoCKOR4Cfxk8W8oLhWaXwLXtkd8YchnrnLeKBRqm8j0ZZZVhryKxxmKr36zUMXBKCKklTCEGuP9jo+lndrMvB9bzh63fO7KC7z+224IExTI0oe4P+Sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zRp7oB14; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zRp7oB14"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-28cf491b197so5177018a91.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 16 Jan 2024 10:18:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705429091; x=1706033891; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nJooin9XTx4g3x3a9c7SBIxC9eNa2n9cCWHm63C9sSo=;
        b=zRp7oB147QO+I2o3hq79h6wka3bcgMLkOSALgvFUpwnMywOFBP5kJPBEUC8PhpRXtA
         KXiHqlvjR7vwXpd1xUvrsuJDsrw15v9nREGTbhv8LueGrYT7oam/uGLX5WimynX/F64h
         1szairMFRms95dn9HP0UvQqPBZ7T3h6iMevoUt0AQUrM0D1JI240LeEGd+x6Ekqxrmdt
         8SUYJWtYGNoSKs/YiLkTSsgDtBIplMQDJXA5217B7dHjfu5pMolmNVxPSJ/6YJFZkdSM
         2wPCuBXEI+ekkwEbd9gxv9SA9eWdlzdeByBVwDjdmaET7tzcN0uCts/YS3hR3kydEWKH
         lyNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705429091; x=1706033891;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nJooin9XTx4g3x3a9c7SBIxC9eNa2n9cCWHm63C9sSo=;
        b=DT+c3MHu93nWekvtGrXz1s4RUbKJXJ6+34+cOf1kI9G1YtTUubOiyW0mMvPwwWs6y1
         CV85aJvf1UQofkMSxvVA878fPcFINGZt4OALK2r1cSDbbe6Z4vU99cF8I9/Q6d6Gq1qP
         4Hm1eJAy5H/lL0OxPU4aSv7GXbmrzIr0sLW8F49cjXfoshgVaEb7bcTVasfdH/uaRnyC
         9KYH06Yu27jZFvLUG+hYiNgVw3iHZGzs4sPV5+K056b7aCyth6q7e9qzBsOpaz4nV1Fb
         MJYq5VweGJPonlMEkf78DytZxm2WStJnCXht3gA4egMapMJoFr1kcg6sMS+g1VXupxsc
         wuZg==
X-Gm-Message-State: AOJu0YycmeH27wpxr24He+9tbTFhJpwgwXD376Wi3WLy/4yPIUFU4DCY
	GJBZEZbSEjHoPQSJJx/cIsxseg27k8rAY+KtG0pesPZXHQ/V8Q==
X-Google-Smtp-Source: AGHT+IGSVRpaZ7py0aGDcXqUGB1wR1pdRNGkrbP520E/PLnsPPWJZ6RT2l0QCqMxgJNKCi+AWA26QY6IY55+lhtrXOA=
X-Received: by 2002:a17:90a:6586:b0:28c:4a6:2190 with SMTP id
 k6-20020a17090a658600b0028c04a62190mr4488921pjj.10.1705429091652; Tue, 16 Jan
 2024 10:18:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240110102102.61587-1-tudor.ambarus@linaro.org> <20240110102102.61587-9-tudor.ambarus@linaro.org>
In-Reply-To: <20240110102102.61587-9-tudor.ambarus@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Tue, 16 Jan 2024 12:18:00 -0600
Message-ID: <CAPLW+4=yQYQvMKuMX68_kmCtV8C_EUD2a1UHQBCpg4x186FtaA@mail.gmail.com>
Subject: Re: [PATCH 08/18] tty: serial: samsung: move open brace '{' on the
 next line
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: krzysztof.kozlowski@linaro.org, alim.akhtar@samsung.com, 
	gregkh@linuxfoundation.org, jirislaby@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	andre.draszik@linaro.org, peter.griffin@linaro.org, kernel-team@android.com, 
	willmcvicker@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 10, 2024 at 4:23=E2=80=AFAM Tudor Ambarus <tudor.ambarus@linaro=
.org> wrote:
>
> Move open brace '{' following function definition on the next line.
>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  drivers/tty/serial/samsung_tty.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsun=
g_tty.c
> index 11ae3a1dcdc3..b9d1ef67468c 100644
> --- a/drivers/tty/serial/samsung_tty.c
> +++ b/drivers/tty/serial/samsung_tty.c
> @@ -1740,7 +1740,8 @@ static struct uart_driver s3c24xx_uart_drv =3D {
>
>  static struct s3c24xx_uart_port s3c24xx_serial_ports[UART_NR];
>
> -static void s3c24xx_serial_init_port_default(int index) {
> +static void s3c24xx_serial_init_port_default(int index)
> +{
>         struct uart_port *port =3D &s3c24xx_serial_ports[index].port;
>
>         spin_lock_init(&port->lock);
> --
> 2.43.0.472.g3155946c3a-goog
>
>
