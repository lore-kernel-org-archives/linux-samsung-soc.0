Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22C81D69F
	for <linux-samsung-soc@vger.kernel.org>; Tue, 16 Jan 2024 19:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705431827; cv=none; b=RTqMa3mRBAFKd7zVWphNoeSa9zkN26fRDZJYmlr7KFsMWsvStEs6WHuikdJdPfBVJJMTEVv1Dk1ZzVwYvHNhWfXWo3AAiG7Ta7/8bBZea1IwWCIvQB75nOkDiAz3bBQ2WZj/dd+lclP4S9ROSTdw5mrY/Xr9sMt+8uwylknUFSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705431827; c=relaxed/simple;
	bh=VZA7GkqNOsfGprEcp87CCflAFYwG+5mMjyW9KlFZQn4=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding; b=rkGXFUDGPjmpboG2y494pSPo0zsW0ND/AqbGnRTfvLmKNLHMAK6v6+eLH1DWvghmDJRh6ldcvnyHMrKp4CnIMky0F1vhX8+TM3l9YL+z5js5wkPgB3G6Wu2yxzoavzVldvctlZvijUdBt4tOulb2aY4vRLwIcWnKbt+fHXRRrKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wl1DsCKo; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wl1DsCKo"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-5cd51c0e8ebso5145065a12.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 16 Jan 2024 11:03:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705431825; x=1706036625; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uFfdvwq+VA0URYaPaSoMqo8iUhwVlg2dLRJaPWnJEaM=;
        b=wl1DsCKoZi5lhSn6aBjbNo4OCibtXReGj6Ct0mD9Ssrx1fhtqwdO1xKqXlBs1tVAwl
         49a2sjup+mlL/Q+84agOxNIPABuSoEK5H/PaaeHy8EsFhTBXAyojP2dfd1P+liju6OHa
         JDMME0y4wY5ZTt+FNaHXSLtXfaB21/ikaDeztQu8J5q3g/3/6H7v893ZdjCUHK59Mf34
         lmF8kLDYsjHgIi8B8g1VvFBiy8iFcY9wgfvkRhyeCIwH9XQHTfBpn5xOzAZIqKsUNqdN
         xqf+ky7WAXIqnRiatDZdWfdHodbBZdkyQ1D2pKSxvCUkKJXYB1VrsmrDdIum0NzmoKIA
         nWMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705431825; x=1706036625;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uFfdvwq+VA0URYaPaSoMqo8iUhwVlg2dLRJaPWnJEaM=;
        b=YpHIV8zacWHRkSKsnzYldzwjKBI3tsJ69AoO7CnO+LychoccUxg0dNIw35kh0+mszK
         Cgt4j33zVPkPNLERjS43MZsmd2kJvxvXt8MnnVa4+pZh7rKktXjIRRlwKnR8UsKU8DYL
         W4g4yS/b+UwzwR+O2n8z7JyxZSiBSKLawW4BhPK+nG2omt/lqtpS8xzZ2AKGcicH3sNm
         ORZP24NSWmAVfExJ7tGn7v3io8y0pPZWr1Tvywoc6y5fc8uEunFZeTlPV9h/Xa+KAS16
         4ukbkkubn6N8E/0eunu80u0p6Ek+7W8pxqsZwz504ROaKHVCwwuglAaUfzwN7UtqjAQ7
         Q4eA==
X-Gm-Message-State: AOJu0YxNgrMpNA6fdlOG+eMFLcydsQRJ8ZnuhJvBqAXYr87ejRvMiYH2
	6cnBm8oKgKjM4ac1q/1R5XdePdETxMjRd5G5z30/cmq7b8uCEg==
X-Google-Smtp-Source: AGHT+IEPnUs5s+u4n2M6rGcq0735SPknT/v+moyBMuh8kF4qV4x/ZF7cpKSU/gDRB07cac8VXhFT6ikMNp/8rp5YiPo=
X-Received: by 2002:a17:90b:70e:b0:28b:fa2e:ca56 with SMTP id
 s14-20020a17090b070e00b0028bfa2eca56mr4085660pjz.29.1705431825086; Tue, 16
 Jan 2024 11:03:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240110102102.61587-1-tudor.ambarus@linaro.org> <20240110102102.61587-18-tudor.ambarus@linaro.org>
In-Reply-To: <20240110102102.61587-18-tudor.ambarus@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Tue, 16 Jan 2024 13:03:34 -0600
Message-ID: <CAPLW+4k091328krLB_KdHyobG-pR--Rt5WaN6c1ccpgdV8ry7Q@mail.gmail.com>
Subject: Re: [PATCH 17/18] tty: serial: samsung: shrink port feature flags to u8
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: krzysztof.kozlowski@linaro.org, alim.akhtar@samsung.com, 
	gregkh@linuxfoundation.org, jirislaby@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	andre.draszik@linaro.org, peter.griffin@linaro.org, kernel-team@android.com, 
	willmcvicker@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 10, 2024 at 4:25=E2=80=AFAM Tudor Ambarus <tudor.ambarus@linaro=
.org> wrote:
>
> There's a single flag defined as of now. Shrink the feature flags to u8
> and aim for a better memory footprint for ``struct s3c24xx_uart_info``.
>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
>  drivers/tty/serial/samsung_tty.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsun=
g_tty.c
> index 5df2bcebf9fb..598d9fe7a492 100644
> --- a/drivers/tty/serial/samsung_tty.c
> +++ b/drivers/tty/serial/samsung_tty.c
> @@ -90,7 +90,7 @@ struct s3c24xx_uart_info {
>
>         /* uart port features */
>
> -       unsigned int            has_divslot:1;
> +       u8                      has_divslot:1;

But that's already a bit field. Why does it matter which type it is?

>  };
>
>  struct s3c24xx_serial_drv_data {
> --
> 2.43.0.472.g3155946c3a-goog
>
>
