Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA1B26656A
	for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Feb 2025 15:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739546862; cv=none; b=gCT+c+E2ljChaBrZktuF77yGhI7AkFsjZ9ZXUrsCj7GLNLdolw1xzhg04dIgbOxNDyZ73tVYC3XwXNrge5w5qpiw7C9B5tm4qOhzMUgTh8tP6Px0vZt2wjBHKEU5OmaDI+hAiKfnRtHlkzMPKFYdSpUeiRwXwA7ctTN+pTZs9Wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739546862; c=relaxed/simple;
	bh=XV8AT4C5Gp3NId7z/OQmyfyGNoiIpsTboDGzh/JM5Rg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eXowJ8XJT/Rflc78jBIqmPM0K/KjYBlOoSiyLL2EGMxar5oRiFzE50mBw3mgG7yy+NaJiIXEqrcyQz0qWSmgtZb2UtOOkcgvex6Fy5jYjqcFxE/z9VsrcwLHnfLzWvHTxZFTkIAsrQXZznL6pPPYD+5Kd5BVtImhB/yD8h2KR30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yQmypplA; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yQmypplA"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6fb3a611afdso14289007b3.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Feb 2025 07:27:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739546859; x=1740151659; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6wygEz6vt3imSF3NwvzsbaEgG5kEjxbe8ddM+Vd/l/w=;
        b=yQmypplAo+bysWaEaKZ3ULDutOw5rDZQx76SFfcPaxlN1GqcxvawtHCw+z5khRyH4E
         6JOQLVhbIZ84vug8gYJLFtVG2Nif3vc61k7W+1bdZwx4IyQvRnLoo+U3ZNm2ZOm8UPmt
         KV4y+vjOyxa2bCyJaKhiNPMxZTRIXhKk9ltgHzK3RIS1y8hR3kYJT8PsQNjHpkZZlQuk
         4hlW0QmB92m2JoDJ6pqm7/CGmfxmqkkbkoOlmzprHgQCe6IFshmHK6jGT9CfSTjjweab
         7ibkuy7PbGG68IreLZZwPDahVtfJvwucA3pa4NigZrFCLXNITu/tRGGNr4U9sWxtYYwl
         ekLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739546859; x=1740151659;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6wygEz6vt3imSF3NwvzsbaEgG5kEjxbe8ddM+Vd/l/w=;
        b=H+ED/6NCycHA1MKk2wjuqfW+uNlO3AId7KsqN3aNLYp3uSFvtyplAAgHJLt3DY0qmP
         uq5wX6wWmvIRBwh68FPofGvOnuvwK63AcoqZApdP2hakKbhSy7h3ovkHojtZj0ugUz9g
         rNfh4VJWuJPmqEvGoSMU5c8zEKxqsYRVvvKpbaJS0KAXN/3GoovuNTQNkfsbyUBwZ7so
         upAxU+0nwYOne6EWquspLEXMCWpURpnqcpnqYaevxGQFAif0GeKocpxjpet4E/d2Yq9S
         kwXkiOTNkORFt+8k986JLZyb9gUY/QeXXDmGW256saIN/N2c5XjDoOyufmWDsJAeC03L
         qjjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrQyB4sax54JuUB/2EfPKIM5JVQlUVvK7u98a/nkaFYNkEw7hEw7rrL3nLqE6QArhF/eG40YjfUYFClQlCsCasAw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNbG6RaUPa/iIYHpmYQs+JWv2EkDoCOm96TT8AaPAUpem1Fxif
	aZ7y7RTqHdxPzGD21YFVTWS2GMURMjdMVoy4TDDMEKpooQpbMhWOUcAl0ywPOuaK/5F3jgw8EVy
	FvFNP41KRQ3Rdl9So9Qpc1kn18gJ/cTVUgKcDIw==
X-Gm-Gg: ASbGncthz23LDFnXKRXYqExvhbKV5RCu56EviMVubDVyFgNPzbB2EEmmm3qOj7E4eXt
	jREdKmNYecpwHh+p17qauxQ1UO/zEYkzijAr8brlXZhUx6hObCTEr29zcv96oMb/Fnx6EVKzFYe
	qLvSPMCbTSo6+Axa8IEJLhXC3nPa6ab44=
X-Google-Smtp-Source: AGHT+IG4t59iStpuyGq1+m+dvxq6YGK16dQkcUOiGs7tsyDTNdFxcN+r/HnSGFs01wlQ6aVqrC6vhWCS/t0g0Qj+n0o=
X-Received: by 2002:a05:6902:f06:b0:e5b:21fe:d9bd with SMTP id
 3f1490d57ef6-e5da81026d3mr6137510276.10.1739546859693; Fri, 14 Feb 2025
 07:27:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250214-spi-s3c64xx-fifo-depth-v1-1-e1b1915e3ee7@linaro.org>
In-Reply-To: <20250214-spi-s3c64xx-fifo-depth-v1-1-e1b1915e3ee7@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Fri, 14 Feb 2025 09:27:29 -0600
X-Gm-Features: AWEUYZkkGWUD60LMpHEHi4hDR2nuH8MPeQ82wDcgpZ-r7ywAfZ4HSSClhEmifNo
Message-ID: <CAPLW+4n3bQOGDewkh1Yfftticp5n3sOnvmVxgNz=rnmWVf6vmg@mail.gmail.com>
Subject: Re: [PATCH] spi: s3c64xx: extend description of compatible's fifo_depth
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Andi Shyti <andi.shyti@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Denzeel Oliva <wachiturroxd150@gmail.com>, linux-spi@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 14, 2025 at 1:32=E2=80=AFAM Tudor Ambarus <tudor.ambarus@linaro=
.org> wrote:
>
> The FIFO depth specified with the compatibles's data is used where all
> the instances of the IP define the same FIFO depth. It naturally has
> higher precedence than the FIFO depth specified via DT. Specifying FIFO
> depth in DT becomes superfluous in this case. Extend comment about
> compatible's FIFO depth.
>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  drivers/spi/spi-s3c64xx.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
> index 389275dbc003..9c47f5741c5f 100644
> --- a/drivers/spi/spi-s3c64xx.c
> +++ b/drivers/spi/spi-s3c64xx.c
> @@ -139,7 +139,9 @@ struct s3c64xx_spi_dma_data {
>   * struct s3c64xx_spi_port_config - SPI Controller hardware info
>   * @fifo_lvl_mask: [DEPRECATED] use @{rx, tx}_fifomask instead.
>   * @rx_lvl_offset: [DEPRECATED] use @{rx,tx}_fifomask instead.
> - * @fifo_depth: depth of the FIFO.
> + * @fifo_depth: depth of the FIFOs. Used by compatibles where all the in=
stances
> + *              of the IP define the same FIFO depth. It has higher prec=
edence
> + *              than the FIFO depth specified via DT.
>   * @rx_fifomask: SPI_STATUS.RX_FIFO_LVL mask. Shifted mask defining the =
field's
>   *               length and position.
>   * @tx_fifomask: SPI_STATUS.TX_FIFO_LVL mask. Shifted mask defining the =
field's
>
> ---
> base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
> change-id: 20250214-spi-s3c64xx-fifo-depth-6787f108be83
>
> Best regards,
> --
> Tudor Ambarus <tudor.ambarus@linaro.org>
>
