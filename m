Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D421CD21
	for <linux-samsung-soc@vger.kernel.org>; Tue, 16 Jan 2024 18:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705430296; cv=none; b=XMvdzxdTKhiUcVZpRBvbf+YoUkAsXAjyjHsTh9AEkSArj6NfRyolVxivTkFhCiTAnGunKPR1rGWPUL3QZatr02pL1hQ0I7IoPzxcHNmeWFWJl2w596+o7pIycGmzTw4pq1ViiL6SPVE/f0EAz9xxur2zTJFhNBzsz2wjiwDFrMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705430296; c=relaxed/simple;
	bh=TB6bL0w3hLWUcnDcaIay8oWyOu6RzNDf0O17kPM6VXw=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding; b=Nb8UWjihuHmpegpoeqLZ/x0l3zZ0b7qoE3cD2L4SO6jvjSovLhabxKZTDCUS4fZfVpZJkmQ21BHkP4PnJJI9dvZ2wnuNom4gx1IoWQDmGeQFnwWd+PqcWlkkBESQ0HTvzBg6B4EzwQrf+u+h6WPxLQAxYSmdrZGfxWNGt+Tbqf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oGxH89Dd; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oGxH89Dd"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-5cdf76cde78so5138067a12.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 16 Jan 2024 10:38:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705430293; x=1706035093; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0jDglbZBWktYfWTPUcusyZr2j2GiYOxnIQXGiD8Doo4=;
        b=oGxH89DdczRxZnF4aohIqsU78Z+Srdlzge3Ji/jgAa6Fb6Spd1BEJNiI8rE4hG1goZ
         rlKPoeg/ln2gFfGQPZB38Qs5lb9u8CxAn4Pi/gwVDwaucUSYrgOYh58f3dE7YbUIvlXm
         MdGi78pL3TYyVpYjiogoopMxxTZBPDgBp6V4OnE6AI0vIx67m6zyPegIvLot2gsbej3p
         NBH3Ne1vIxD5CVXV4SoJd3wRu59Lnu5euQWMLxYtQVKNhR2fnBneTI7/nlysuybv2OtG
         qgGTDdu1PGCb6za71j3MyI9uvJIEO2OLdqN7txZgHNVo4W86zdiMEqWse5auX4MTpjeP
         pJ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705430293; x=1706035093;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0jDglbZBWktYfWTPUcusyZr2j2GiYOxnIQXGiD8Doo4=;
        b=dqztoNZ666AWendQ1ObukdG4kyseYLwl3LZfrYJdMC7NWI7PxVVC35l2405Uvaa/m1
         TFVqdKfTCZ/zSMddoDjN5KXH44ShzrBWr6U1YdrpsbYPhw7tta2EYh+5QvA3wpLmAAwA
         fJInDJZt067R4jfTotUZCi7NrDO7n73Iw8H4gJ+ROEbucFv7aUsIz6Rj0BXilhdhEWoc
         acOg4KQDmCaLSW4wMcgJNFZ+vH1+AVK3W09dpq3jwhVloXsa81ZzdQ2oePK/aFyd0Osl
         jSPHwNGrTw/vhHCsPSXOJfwFD3iHHB7m5tfFY4DXNDV6IWUncP/4m8D+eivvd9y4eKkg
         EC8w==
X-Gm-Message-State: AOJu0YzCkoAwAHdYWXU9BmKqF1BHVwTpz3CC809EiyNWlxqgIFBztjAe
	31CUpXBdo7+VrU5la5PDbadUXXaPefSM+HuakrwgwNDxUbdeNQ==
X-Google-Smtp-Source: AGHT+IF1E60nyMxp0rq+piEAJAls/q3iuzPDrclS7edvISLFAbWxO/l+vo81dtOlaSnpPsalLHC1RtyIGgPAaFAsaDo=
X-Received: by 2002:a17:90a:d913:b0:28e:1d1e:f2eb with SMTP id
 c19-20020a17090ad91300b0028e1d1ef2ebmr2701244pjv.90.1705430293457; Tue, 16
 Jan 2024 10:38:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240110102102.61587-1-tudor.ambarus@linaro.org> <20240110102102.61587-12-tudor.ambarus@linaro.org>
In-Reply-To: <20240110102102.61587-12-tudor.ambarus@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Tue, 16 Jan 2024 12:38:02 -0600
Message-ID: <CAPLW+4mKBwsc9VLrGTd2k6d0n-K9TZAjH6M8trcK3Av8TQ2Ngg@mail.gmail.com>
Subject: Re: [PATCH 11/18] tty: serial: samsung: don't compare with zero an if
 (bitwise expression)
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
> Since an if tests the numeric value of an expression, certain coding
> shortcuts can be used. The most obvious one is writing
>     if (expression)
> instead of
>     if (expression !=3D 0)
>
> Since our case is a bitwise expression, it's more natural and clear to
> use the ``if (expression)`` shortcut.

Maybe the author of this code:

    (ufstat & info->tx_fifomask) !=3D 0

just wanted to outline (logically) that the result of this bitwise
operation produces FIFO length, which he checks to have non-zero
length? Mechanically of course it doesn't matter much, and I guess
everyone can understand what's going on there even without '!=3D 0'
part. But it looks quite intentional to me, because in the same 'if'
block the author uses this as well:

    (ufstat & info->tx_fifofull)

without any comparison operators.

>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
>  drivers/tty/serial/samsung_tty.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsun=
g_tty.c
> index dbbe6b8e3ceb..f2413da14b1d 100644
> --- a/drivers/tty/serial/samsung_tty.c
> +++ b/drivers/tty/serial/samsung_tty.c
> @@ -988,8 +988,7 @@ static unsigned int s3c24xx_serial_tx_empty(struct ua=
rt_port *port)
>         u32 ufcon =3D rd_regl(port, S3C2410_UFCON);
>
>         if (ufcon & S3C2410_UFCON_FIFOMODE) {
> -               if ((ufstat & info->tx_fifomask) !=3D 0 ||
> -                   (ufstat & info->tx_fifofull))
> +               if ((ufstat & info->tx_fifomask) || (ufstat & info->tx_fi=
fofull))

Does this line fit into 80 characters? If no, please rework it so it
does. I guess it's also possible to get rid of superfluous braces
there, but then the code might look confusing, and I'm not sure if
checkpatch would be ok with that.

>                         return 0;
>
>                 return 1;
> --
> 2.43.0.472.g3155946c3a-goog
>
>
