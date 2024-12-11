Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852D01A83F4
	for <linux-samsung-soc@vger.kernel.org>; Wed, 11 Dec 2024 13:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733925108; cv=none; b=O1sAbtWXioqaQQzV5bTZNI/6SRtu/Llss/PhpA1V5v/NxPdlMdG+qOFIz4F7oDBsx/4Ctay8ve2vSKWWem3jHHJub+SWtGg2bZHTzCK6u+SVJJyZBGp6dkp6miiEbmYcRAWyZV/uA18bKiB5VXYATeEwMdn42vtM9y/ok+siENE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733925108; c=relaxed/simple;
	bh=5RXHiNPW/0Bon8rtfd5Eg2+l7xVOOJj6jcjOeLgJpNo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qawteI8BOZv/lc+vUWe2P7E2iLdIITBJks2a0jsVza+oGYz5BWBLQ4mPfj7B8rT9ZWZ5+O8hzSoWLsQy5tgJBNa7UVTxPx3Ulv5n1IOZnEPYVzFwKZi9Lg2JSCmILYRn1AERj2+k3wY6ci5Mf/+aeXrko/akWYxvcDrmySOhCa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=uY2VEw/t; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="uY2VEw/t"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2ffa49f623cso73180831fa.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 11 Dec 2024 05:51:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1733925104; x=1734529904; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K5u5RmdvUjaZNQ4ypOIRfpbzJHydPCUz5+IqYFCHDO8=;
        b=uY2VEw/tYHfSpbqgiSdsZSw0ALk6QYUWABS28IeCQwWhwPDbuP68bWIpm94UvdUBzO
         ywdZneXpQ/3KlTdLzVJCd+x7i0+fGh/DxWvIIYH4RwHaJZHJwp/vTb6FmtWvh4nNc7/a
         kBhxgZYIBIGYLjQg9eSlwrV6Yg52DreZgABZgycInaMj2aad/G+Vm/vJihmolORbS5zu
         uz7QDpP+NfDVU7P3cRWLL2l7Rn5U4+QEhK3Q7ayM82S7gOuvgaNTb5v7yNY4rqNEpmzt
         r8p48+1GoopyUkLbCldxKZgPOeP1eG4MGZVwP3ljTc6DqBCTAaeD+sAUfG9oiin9Sga2
         N50w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733925104; x=1734529904;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K5u5RmdvUjaZNQ4ypOIRfpbzJHydPCUz5+IqYFCHDO8=;
        b=vViWD+bhH0BWACxxK+1R2AhqqLxgBtt1TF3Nss8ZU2tweOe8aCFw0rmx5Bwjp0wbta
         8+a0pWAZhkNQKkZd9XqeJ01Ogyfwi4LPq3JCnkj3ZaECBumck3O5O6QRgFcBkt34l0cd
         ys4M0/YlWCs/MxM1yp4VXy/xFIbQjKze5mgEDeRzeAwZG0gg6YOg8ASXcvr53FmKAODQ
         FCWbwz+Man4zACXm9YC/FzPQa6X0CZYLAKS9Uht/7au9SuYHzLOHBYGM83c/9oskGtMn
         GAswliutPShI/GkMY/Sd5ejbjsnuboHtl+4pY5/AHKncl1rK6GJe/9NugTGfrq+OGJFA
         TYzw==
X-Forwarded-Encrypted: i=1; AJvYcCX2E9TgX2bKhStCRujm9W1zmCWi47kz6498EvfBOVm1EBorJEswRJDT5TnEcmIggOlwS1cvUIs1Z8vysImMV321YA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzR8RGoS7EvC+4VD1oVtHJwK217UNqAPUkW8qb6IuVv0bBFa8Dp
	4jhcbetZ9fopnynU/tyFlfawyXyXMZ19mBffi1ByB6l33EEbwx4vs8TJYH3CpjZ2z9tthUbbTVW
	S38rqLts2gQ8zJc0/mXbGmP62lARxp/FG4idF5g==
X-Gm-Gg: ASbGncvcybD0qgat1MDRUiCGpdVsanhikzkf3Re+gEd/EC4f7Dr1oyt+CImsn0MNeGw
	OiPvNtMIQGRHQLE79xZWepRHlQrUoLRyLRtldcKPy/0q+3N3mY557NoOfAZvc7w3RnFE=
X-Google-Smtp-Source: AGHT+IGKBM2RHn3r5FHvAN79XFFY0ttT3PZY+kel/8viJybfPo8tUMJz3XMjpyYvMjhuaoWZgYhmLbZS3eutGd3rKdo=
X-Received: by 2002:a05:6512:3e01:b0:540:1fb5:3f9f with SMTP id
 2adb3069b0e04-5402a609ab6mr1031866e87.47.1733925103496; Wed, 11 Dec 2024
 05:51:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241211051019.176131-1-chensong_2000@189.cn>
In-Reply-To: <20241211051019.176131-1-chensong_2000@189.cn>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 11 Dec 2024 14:51:32 +0100
Message-ID: <CAMRc=MfpwuMh-MH1UEHKky09iAs4g9=iGFPptARXzoZrVS8hdQ@mail.gmail.com>
Subject: Re: [PATCH v2] regulator:s5m8767: Fully convert to GPIO descriptors
To: Song Chen <chensong_2000@189.cn>
Cc: krzk@kernel.org, lgirdwood@gmail.com, broonie@kernel.org, lee@kernel.org, 
	linus.walleij@linaro.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 11, 2024 at 6:10=E2=80=AFAM Song Chen <chensong_2000@189.cn> wr=
ote:
>
> This converts s5m8767 regulator driver to use GPIO descriptors.
>
> ---
> v1 - v2:
> 1, reedit commit message.
> 2, remove development code.
> 3, print error msg in dev_err_probe.
> 4, doesn't set gpiod directions until successfully requesting
>    all gpiods. It's pretty much equivalent with original code.
>
> Signed-off-by: Song Chen <chensong_2000@189.cn>
> ---
>  drivers/regulator/s5m8767.c      | 106 ++++++++++++++-----------------
>  include/linux/mfd/samsung/core.h |   4 +-
>  2 files changed, 48 insertions(+), 62 deletions(-)
>
> diff --git a/drivers/regulator/s5m8767.c b/drivers/regulator/s5m8767.c
> index d25cd81e3f36..b23df037336b 100644
> --- a/drivers/regulator/s5m8767.c
> +++ b/drivers/regulator/s5m8767.c
> @@ -5,7 +5,7 @@
>
>  #include <linux/cleanup.h>
>  #include <linux/err.h>
> -#include <linux/of_gpio.h>
> +#include <linux/of.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
> @@ -35,8 +35,8 @@ struct s5m8767_info {
>         u8 buck2_vol[8];
>         u8 buck3_vol[8];
>         u8 buck4_vol[8];
> -       int buck_gpios[3];
> -       int buck_ds[3];
> +       struct gpio_desc *buck_gpios[3];
> +       struct gpio_desc *buck_ds[3];
>         int buck_gpioindex;
>  };
>
> @@ -272,9 +272,9 @@ static inline int s5m8767_set_high(struct s5m8767_inf=
o *s5m8767)
>  {
>         int temp_index =3D s5m8767->buck_gpioindex;
>
> -       gpio_set_value(s5m8767->buck_gpios[0], (temp_index >> 2) & 0x1);
> -       gpio_set_value(s5m8767->buck_gpios[1], (temp_index >> 1) & 0x1);
> -       gpio_set_value(s5m8767->buck_gpios[2], temp_index & 0x1);
> +       gpiod_set_value(s5m8767->buck_gpios[0], (temp_index >> 2) & 0x1);
> +       gpiod_set_value(s5m8767->buck_gpios[1], (temp_index >> 1) & 0x1);
> +       gpiod_set_value(s5m8767->buck_gpios[2], temp_index & 0x1);
>

It seems to me that these GPIOs are always manipulated at once. Maybe
consider adding fwnode_gpiod_get_index_array() to GPIO core and using
it here to shrink the code a bit more?

Bart
