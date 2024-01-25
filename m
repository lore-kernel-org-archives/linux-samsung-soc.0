Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4C21339A9
	for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Jan 2024 18:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706209108; cv=none; b=sxWpf9T+jmxeh20wMEvEXt+8b/w5DieZ7yKWf2zsfgfcJUBEonnF4fzMhubRRRt2r1fbWXu8NA6x4y+Of/AsTQF8KWIAypbWLkzAIdFgNTroe8YQCPLPxSU0MZONktG0De8p/TVTVhs2PZ+LW4lywd2LoU16LjFM805DTV/Tpug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706209108; c=relaxed/simple;
	bh=/yuX+ZwAqeiEBG+9snyPxfUHA4kLw20Lq3tkl7WzUfU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ITnekcG3MLFB+ituY3U/jj1Hl4CUw4HWHTh8mRt62CTp0GR9m+NTq3nkf1lK0Axiv1NkDJvnYzr8SHziA7PwpUe/DU9fHNgctNjWNGArMXa3FLRVtEa53hdyLxlIj8mgwpLVh5EWi8wwEdGHfRa8sSh3s3qdr02OXDA7ICyydS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z5IALI8I; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z5IALI8I"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2906dffd8ddso4541643a91.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Jan 2024 10:58:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706209106; x=1706813906; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cKodC4CUWzXNZRd0RvY8kflDnv2+qlK7ZzKTDP0BS34=;
        b=Z5IALI8IARtyOtpRCxsnd1W3OOtIIGd8wZHPboiTW3oRYv9oOv0oPbvIzTPYchOJky
         k2UxtyH051QIyOstuDzppF8Uo6ESHt6h7LswT7KHEvH8XymbOJE8FlL2eiKMQNHLMfO5
         zrDWXTrhlt1LdB7CVNLSZ5UJ5p4lSDS7Fnpo/BZYuNjBY3cTWIVqYlh/H6v1plUt0IRo
         2q63v+wsbkvXlPondLo+MQThOsduqhhiRwvP7lCSIhRNkGLzPI4z61AiOLuWQZmEtREt
         1JwGQIoYisbgGsWwuC68mx6FirZKy9J8t+3t8/XKu82mLFZ3ZC08uU0Rb/HsHc/1aZmd
         uKeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706209106; x=1706813906;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cKodC4CUWzXNZRd0RvY8kflDnv2+qlK7ZzKTDP0BS34=;
        b=JICLUhVOiNfa5f+0ZnvA9PGG92FVZqrjWWBRbDlZQW9npOTE4Abfx/1PlCo2dtWUPZ
         U64JirsaS2s1JqYe7d3J9wqu+VUMYy8iT+gg/7olF4umifwd5jjz0E8dw+Bb/HqCUSgN
         W36TD6B2H5oYS/u8nHJhoR4V64TyO7Klro4RjQFoDR6A1pibedp2R3dQC1Ws+HKro1M7
         EgOFpdXPKJUnENOLiY54wFWMxlKPiVhPYgg6iPzy9fiTxipU+PbUVDAHXGQC6SbsIygs
         qzhEdvb7DkSTA+kxkJjUkXPxlcjeWUjkvpCxL1ZBks7t0K2ycjKws/Jobytu1Oo/li65
         zMwQ==
X-Gm-Message-State: AOJu0Yw/x2Bfxqw/m6y7tatvxRbTgjh4PNoEYEQ2P+JBQZLDLDSMjS75
	lSvbOR4KM8Io9WcMjBDGXnsb/+NNY9grIGzp7oHHxthnNJISYdAV9MyCAg8dCZHblbkhISxQceF
	hF5kQ9hIPRLLqeLZE5o+hMeYpGjElrO32IDzQ2w==
X-Google-Smtp-Source: AGHT+IHGqu+F52i8g1m/kMXpX3DElw6QjaxmyN1VJK+gS/nX+WAvT8nHp1ClH077kwlifFuyQq5EZg0+FOpZfc3CsKM=
X-Received: by 2002:a17:90a:1986:b0:292:bcc9:450e with SMTP id
 6-20020a17090a198600b00292bcc9450emr70570pji.11.1706209106577; Thu, 25 Jan
 2024 10:58:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240125145007.748295-1-tudor.ambarus@linaro.org> <20240125145007.748295-2-tudor.ambarus@linaro.org>
In-Reply-To: <20240125145007.748295-2-tudor.ambarus@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Thu, 25 Jan 2024 12:58:15 -0600
Message-ID: <CAPLW+4=kEhMz5eUCTLO5e4RCK23g+EWqRqcGQ-V9FNnL6jaFtg@mail.gmail.com>
Subject: Re: [PATCH v2 01/28] spi: s3c64xx: explicitly include <linux/io.h>
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
> The driver uses readl() but does not include <linux/io.h>.
>
> It is good practice to directly include all headers used, it avoids
> implicit dependencies and spurious breakage if someone rearranges
> headers and causes the implicit include to vanish.
>
> Include the missing header.
>
> Fixes: 230d42d422e7 ("spi: Add s3c64xx SPI Controller driver")

Not sure the "Fixes" tag is needed here. AFAIU, this patch doesn't fix
any actual bugs, seems more like a style fix to me. In other words,
I'm not convinced it has to be necessarily backported to stable
kernels. The same goes for another similar patch from this series.

> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
>  drivers/spi/spi-s3c64xx.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
> index 7f7eb8f742e4..c1cbc4780a3b 100644
> --- a/drivers/spi/spi-s3c64xx.c
> +++ b/drivers/spi/spi-s3c64xx.c
> @@ -10,6 +10,7 @@
>  #include <linux/clk.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/dmaengine.h>
> +#include <linux/io.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/spi/spi.h>
> --
> 2.43.0.429.g432eaa2c6b-goog
>
