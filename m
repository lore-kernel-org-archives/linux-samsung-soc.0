Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B67301CF83
	for <linux-samsung-soc@vger.kernel.org>; Tue, 16 Jan 2024 18:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705430830; cv=none; b=Hoc+VQ235LiyPgg0exEdUnWMB/lB3ByQDB43tR8WDmqs3dwPDrPs+OdK10qcO0czZrBBUQm4cF2aHyQhJr+3f25LDc9AbGYwV7W4ql2T63staitk+wG7PS5UQXyBaJeZ+4OW4gXX7mgdTbEYXzKQnyeQIu6i62d0Oo86Awf9jmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705430830; c=relaxed/simple;
	bh=gKxv+UOkndb8j78LrufMKusgJzXZYbUdkxVdxRFLmFw=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding; b=B5fzJNgvAPMytZbOnRMd1lW4uJYST3Wece5GQCHPXhZsIFj/mBO4n811QBGzPggOb2rUZJAGfmZ+E4L2jThIxetltgoDWpqElOHDZ60j/FRhGMomWhFV3cnakhND+hFIiWGTU2RhRPi3xGWdfxM5hkrw91/blFrQTVOkUksg1Bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=H/VmS92e; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H/VmS92e"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-28e7b2f1988so575897a91.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 16 Jan 2024 10:47:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705430828; x=1706035628; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mzOK6W+G74uDiUdt7KMX09h88wCbiDkSJ1x7zb5kpR8=;
        b=H/VmS92e0erTpXmGD81gSrxVcTk0/E3TPlie1vM0yirrS3OPF/MYKVkm9/DANEpyC3
         qPa7+0I9QmPX/E83nVDWVVu69KdcWFzlK5G2vok/To+IjK6i6vAgmc9MHKaTNjRFrgCI
         OpW10FStEqWJhcYh06CY/4gxvqHbMhQpVB1zoWl7geKl4W6FAmxtvs40kGXHozIf1pD/
         43wGvnv2VuGu4Y0KFVBHsaw4xf9Sz1JELwu3d7edutnBTRJZlk1vI3g+zd9wl+C3MpRI
         34b6IgnLOge1/BU0zERd9iDRCPDD7qflyJWAYH86n0vQQ61OF4GWmbjKVMs8NYtrSUfP
         RHHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705430828; x=1706035628;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mzOK6W+G74uDiUdt7KMX09h88wCbiDkSJ1x7zb5kpR8=;
        b=B9Nn2EPs/Y/QR1OclTmfRrIgG203IgCWLd82chOuYf345mkw2wR8LMGDYATPcVoWUj
         gZQs74bk1U08Q2igg2j0iOn+vn0zSLv87Wt6Xx+wUyySexnsuYVvIlxjAjD1Aqk8GbsK
         L7r3CVIibOFYyqwomzv6J6QQ650jAYvT8OPotI7BMlssgX354RdIxwrUigfanCQkrWln
         O/yfATQ5MVXm4xYTUdkWu0BpTmGeIsBw5epgIus1ooF1TLCkgbjfkPn9wxqTqA2ZAaJ9
         qsflYEtETjgyoCFzhsIbjga0+XNi+YtZzT6y5x+DWMncAVHIZ37AJvbgUtNBFD/tv/YE
         eLNQ==
X-Gm-Message-State: AOJu0YwVuTfLw28/qTq7puJPbE2Lq6+71D9l/8K0G7OcQoRIA57ZcC7y
	0cKzbh1zxrAz/2nu+mVdjFtSyn0C0tPU7O3iPG3Rv0SfJ3LF9Q==
X-Google-Smtp-Source: AGHT+IGlHP8xv65eTrLYbxdWE98VqFYwvntUR3EJnNTNFNpHq0PTKvD5rL7yNMdrMiTPUx/B9MF63dK3fN9Vv0S008o=
X-Received: by 2002:a17:90b:3547:b0:28c:f4ba:a92d with SMTP id
 lt7-20020a17090b354700b0028cf4baa92dmr3598577pjb.40.1705430828065; Tue, 16
 Jan 2024 10:47:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240110102102.61587-1-tudor.ambarus@linaro.org> <20240110102102.61587-13-tudor.ambarus@linaro.org>
In-Reply-To: <20240110102102.61587-13-tudor.ambarus@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Tue, 16 Jan 2024 12:46:57 -0600
Message-ID: <CAPLW+4knt2P5yEJMRJsKydGUaa8RSMLxdVy-Kjq=bkGw9tA8Kg@mail.gmail.com>
Subject: Re: [PATCH 12/18] tty: serial: samsung: use TIOCSER_TEMT for tx_empty()
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
> The core expects for tx_empty() either TIOCSER_TEMT when the tx is
> empty or 0 otherwise. Respect the core and use TIOCSER_TEMT.
>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
>  drivers/tty/serial/samsung_tty.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsun=
g_tty.c
> index f2413da14b1d..46fba70f3d77 100644
> --- a/drivers/tty/serial/samsung_tty.c
> +++ b/drivers/tty/serial/samsung_tty.c
> @@ -990,11 +990,10 @@ static unsigned int s3c24xx_serial_tx_empty(struct =
uart_port *port)
>         if (ufcon & S3C2410_UFCON_FIFOMODE) {
>                 if ((ufstat & info->tx_fifomask) || (ufstat & info->tx_fi=
fofull))
>                         return 0;
> -
> -               return 1;
> +               return TIOCSER_TEMT;
>         }
>
> -       return s3c24xx_serial_txempty_nofifo(port);
> +       return s3c24xx_serial_txempty_nofifo(port) ? TIOCSER_TEMT : 0;

And because s3c24xx_serial_txempty_nofifo() might actually return 0x4,
and at least uart_get_lsr_info() tries to clear exactly 0x1 bit, this
brings functional change, which I think is in fact a fix. So a
"Fixed:" tag is needed here.

>  }
>
>  /* no modem control lines */
> --
> 2.43.0.472.g3155946c3a-goog
>
>
