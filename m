Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9692032A3CF
	for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Nov 2025 13:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763386961; cv=none; b=eu9kPiB6OFFeD7rj+Ad2sqlnRyQQMwULkGOnCu+sktNk8WXSwtpHmGR5sLG8vJv7E3gEYiOAwff6b4oHYdb5JBjj3lPr6bC7Qkpyz9eySHfQtRGLhfl6BP7PTixNLuNBoVOrjHKkY3zhfpva+IGyqAV+OqZctcZ7dRZpsSKOGVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763386961; c=relaxed/simple;
	bh=dE9Z082+kIr8nieAkLXb4pAh0TEEgaXQDogRXV03SfA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d6j97DT/un7lVfXNdxd1pAi2yVTFLJUNPdCzgBsF4WLeudhEruPM90M9adhB6DNDE+v9sJE+w41Tt1O0va1jPTamOi2Jgct07nG5OgjyYj7bPgXtv4WE1wx+wd8qW7ilOM8AuuG+gpr4c8s5ToxK5cLFMQEqqkXeLQAoRekKsqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P/XLo4Ol; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P/XLo4Ol"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-64166a57f3bso6739776a12.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Nov 2025 05:42:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763386958; x=1763991758; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dyfJuWLf/bqMX1u24r/U8Bs+x3WIyoG2lBJPEBmrdOU=;
        b=P/XLo4OlOqOha7tT3sLc5t0ql9JIO3fkrMMJgzyliX/S6sDp4T2SCW9nLa3TVDH9ep
         /Gjd/nwYC+qGtGdKw6oZlVuZb1yKy3KSJppO372nSQkSZoTSRw0o1BRZQsiNNjIOKDVL
         VcVTcpLgFPjtkxrMaAyi7d0ez1gO4eh6lAOMzfQ7yIdDREZ/rpSLmLu3vrFQ8EKP26S7
         e28pnd/gG4cByN6J+wEvGD8RqVUlf20QFvbncaJl2E/ciZkr8EhMstKYEnLDqREotyIS
         IbUqEcnyJlZxjWKiDDeI8dipbAEmwoXf7SEiqhQMIl8kCIg/OjfvqfUGuq/nvF91Foqp
         2deA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763386958; x=1763991758;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dyfJuWLf/bqMX1u24r/U8Bs+x3WIyoG2lBJPEBmrdOU=;
        b=vgiHhFuw1yzxcw3HtaA12QIpibjzWfByOi+bYU1gN9ygyKvo7UT+1og8eQMwueuVDQ
         FU8G6BkR7M8fS/DHHfWQ5CQX6pXWvYeKwEQA7mhCasTFyF+uPM6Y/jUzmQO8XxKtioT0
         yR9biZ2OQzRC/75Ec5woR1EGHAAAMv1GL3L+n2ElHPrzaQp8yNY233zgKqw5wGvBtDWP
         tL46rTrxHCva7O4FABcJ5uIFPlYDz0bXUYBRyPB0b4peqavjOQ5DPzvpkqMtKas1tiUU
         tkyV0gnvhtXjxnGSOmiE+qL/dfuKJDg9RwJAPRCwUZ9ESmekl22Ou98DF1Uf+8cBfeFn
         d4Rg==
X-Forwarded-Encrypted: i=1; AJvYcCWqEOHHxM20iTtvo04g0JBWTA5rbVBaRZ5NE7RdkVY9Ir6AgOw4OVxrW/xWfRcHjxBGSu4uP28qQ1qd0VfXkXLIWg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9PU98oY0bXbW7kGuNsXD2sE7I40hRFesUNFRlMuxUqJEJGbcz
	RFMj4Vv05g+YooQgZu3Fp5rsauV4aEkt42ZN02qaytmJkLivVPQY6dqd
X-Gm-Gg: ASbGncszDZ5gnBSRQPUMM33by+7pJyywXd8u484W8/Xts/0+pviT7fS5Fw/ztNXj887
	UhWeiMfWhovWIjn4hukRPXtZM7VdFaLZjBGFWJ5lo78JAmboWu+WKrOlxm/Vqh7EjfP04rbSvYR
	VC0GeHRC1D/W5QJnwctzAYNMeY5Bsfh2YylQ7KX9qgOxnDow/8SABUthrf1DmuQ6yQho9WQkYYy
	yi1TmDa/XTLlYxmKyIzKujODqjQ/K1mwHbSL/4abo7OMsTHl2Lr7/Mw6HfNb/x9fPhY0rFvjVLJ
	i7xKTqlKuSyjMUYVzSe2P2k10twaSaAp3BIXKDN6IgSujuDADtNseFb+YN6M5kR0VzyffmkqJeP
	N3ybfgTddN8Ag3f7u8yoQuM65cor/dlXJpnBN3YJdV/mLec8INzxApViIiWH0R2N5auu8lNtMvl
	sbJkV/BQZmEkcZfEZ1TpLnq7NzPp9iUI7eFhHv9VvuMWukq9QY8SHNcA==
X-Google-Smtp-Source: AGHT+IFnA5p6VJ7v16pDk70y3Vr1baROyHyJjL+VaSJ2PY/KT68euuo6fGAWZdzMV7Ygf3aTKhxMTw==
X-Received: by 2002:a17:906:c107:b0:b6d:7288:973d with SMTP id a640c23a62f3a-b736795bf68mr1349907366b.56.1763386957491;
        Mon, 17 Nov 2025 05:42:37 -0800 (PST)
Received: from [192.168.1.101] (79-100-30-217.ip.btc-net.bg. [79.100.30.217])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fd8084csm1065257166b.34.2025.11.17.05.42.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 05:42:36 -0800 (PST)
Message-ID: <15549ffd-9ae6-428a-a9b0-73676fc252fa@gmail.com>
Date: Mon, 17 Nov 2025 15:42:33 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFT PATCH v2 2/5] pinctrl: samsung: fix incorrect pin-bank
 entries on Exynos2200/7885/8890/8895
To: Youngmin Nam <youngmin.nam@samsung.com>, krzk@kernel.org,
 s.nawrocki@samsung.com, alim.akhtar@samsung.com, linus.walleij@linaro.org,
 peter.griffin@linaro.org, semen.protsenko@linaro.org
Cc: ryu.real@samsung.com, d7271.choe@samsung.com,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251117074140.4090939-1-youngmin.nam@samsung.com>
 <CGME20251117073603epcas2p1366028012403591bd297764f91694181@epcas2p1.samsung.com>
 <20251117074140.4090939-3-youngmin.nam@samsung.com>
Content-Language: en-US
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <20251117074140.4090939-3-youngmin.nam@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/17/25 09:41, Youngmin Nam wrote:
> This patch corrects wrong pin bank table definitions for 4 SoCs based on
> their TRMs.
> 
> Exynos2200
> - gpq0/1/2 were using EXYNOS_PIN_BANK_EINTN(), which implies a
>   'bank_type_off' layout (.fld_width = {4,1,2,2,2,2}).
> - Per the SoC TRM these banks must use the 'alive' layout
>   (.fld_width = {4,1,4,4}).
> - Switch them to EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, ...).
> 
> Exynos7885
> - etc0, etc1: update bank type to match the SoC TRM.
> - gpq0 is a non-wakeup interrupt bank; change EINTW -> EINTN accordingly.
> 
> Exynos8890
> - Per the SoC TRM, rename bank ect0 to gpb3 and mark it as
>   a non-external interrupt bank.

Interesting, so there are disparities between vendor kernel drivers and
TRM?

> - gpi1, gpi2: update bank type to match the SoC TRM.
>   exynos8895_bank_type_off (.fld_width = {4,1,2,3,2,2}) ->
>   exynos5433_bank_type_off (.fld_width = {4,1,2,4,2,2})
Vendor kernel [1] points to these being bank_type_4 (4, 1, 2, 3, 2, 2)

[1] https://github.com/ananjaser1211/Cronos_8890/blob/0460c258d6910628410263dc838a81be8bda6776/drivers/pinctrl/samsung/pinctrl-exynos.c#L1281C24-L1281C35

> - Per the SoC TRM, mark etc1 as a non-external interrupt bank.
> - apply lower case style for hex numbers.
> 
> Exynos8895
> - gpa4 is a non-wakeup interrupt bank per the SoC TRM.
>   change EINTW -> EINTN. (The bank_type itself was correct and is kept
>   unchanged.)

Also differs here [2]

[2] https://github.com/Neternels/exynos8895_kernel/blob/5eb1b4159bc466602e7634b1f7a4f471f4c027e2/drivers/pinctrl/samsung/pinctrl-exynos.c#L1799

> - apply lower case style for hex numbers.
> 
> This aligns the pin-bank tables with the documented bitfield layouts and
> wakeup domains. No DT/ABI change.

I suspect the changes are valid, unless trms also don't contain false
information. In any case, this makes me wonder if there are more
instances of such errors for older SoCs.

Reviewed-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>

> 
> Signed-off-by: Youngmin Nam <youngmin.nam@samsung.com>
> Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
> Tested-by: Sam Protsenko <semen.protsenko@linaro.org>

I wonder, what was this tested on?

> ---
>  .../pinctrl/samsung/pinctrl-exynos-arm64.c    | 40 +++++++++----------
>  1 file changed, 20 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
> index d11b2d4ca913..b4a7d86b82fe 100644
> --- a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
> +++ b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
> @@ -95,9 +95,9 @@ static const struct samsung_pin_bank_data exynos2200_pin_banks0[] __initconst =
>  	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x40, "gpa2", 0x08),
>  	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x60, "gpa3", 0x0c),
>  	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x80, "gpa4", 0x10),
> -	EXYNOS_PIN_BANK_EINTN(4, 0xa0, "gpq0"),
> -	EXYNOS_PIN_BANK_EINTN(2, 0xc0, "gpq1"),
> -	EXYNOS_PIN_BANK_EINTN(2, 0xe0, "gpq2"),
> +	EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, 4, 0xa0, "gpq0"),
> +	EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, 2, 0xc0, "gpq1"),
> +	EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, 2, 0xe0, "gpq2"),
>  };
>  
>  /* pin banks of exynos2200 pin-controller - CMGP */
> @@ -768,12 +768,12 @@ const struct samsung_pinctrl_of_match_data exynos7870_of_data __initconst = {
>  
>  /* pin banks of exynos7885 pin-controller 0 (ALIVE) */
>  static const struct samsung_pin_bank_data exynos7885_pin_banks0[] __initconst = {
> -	EXYNOS_PIN_BANK_EINTN(3, 0x000, "etc0"),
> -	EXYNOS_PIN_BANK_EINTN(3, 0x020, "etc1"),
> +	EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, 3, 0x000, "etc0"),
> +	EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, 3, 0x020, "etc1"),
>  	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x040, "gpa0", 0x00),
>  	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x060, "gpa1", 0x04),
>  	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x080, "gpa2", 0x08),
> -	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 5, 0x0a0, "gpq0", 0x0c),
> +	EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, 5, 0x0a0, "gpq0"),
>  };
>  
>  /* pin banks of exynos7885 pin-controller 1 (DISPAUD) */
> @@ -1502,7 +1502,7 @@ static const struct samsung_pin_bank_data exynos8890_pin_banks1[] __initconst =
>  /* pin banks of exynos8890 pin-controller 2 (CCORE) */
>  static const struct samsung_pin_bank_data exynos8890_pin_banks2[] __initconst = {
>  	/* Must start with EINTG banks, ordered by EINT group number. */
> -	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x000, "etc0", 0x00),
> +	EXYNOS9_PIN_BANK_EINTN(exynos8895_bank_type_off, 2, 0x000, "gpb3"),
>  };
>  
>  /* pin banks of exynos8890 pin-controller 3 (ESE) */
> @@ -1520,8 +1520,8 @@ static const struct samsung_pin_bank_data exynos8890_pin_banks4[] __initconst =
>  /* pin banks of exynos8890 pin-controller 5 (FSYS0) */
>  static const struct samsung_pin_bank_data exynos8890_pin_banks5[] __initconst = {
>  	/* Must start with EINTG banks, ordered by EINT group number. */
> -	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x000, "gpi1", 0x00),
> -	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x020, "gpi2", 0x04),
> +	EXYNOS9_PIN_BANK_EINTG(exynos5433_bank_type_off, 4, 0x000, "gpi1", 0x00),
> +	EXYNOS9_PIN_BANK_EINTG(exynos5433_bank_type_off, 8, 0x020, "gpi2", 0x04),
>  };
>  
>  /* pin banks of exynos8890 pin-controller 6 (FSYS1) */
> @@ -1544,15 +1544,15 @@ static const struct samsung_pin_bank_data exynos8890_pin_banks8[] __initconst =
>  	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 6, 0x040, "gpd1", 0x08),
>  	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x060, "gpd2", 0x0c),
>  	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x080, "gpd3", 0x10),
> -	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x0A0, "gpb1", 0x14),
> -	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x0C0, "gpb2", 0x18),
> -	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 3, 0x0E0, "gpb0", 0x1c),
> +	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x0a0, "gpb1", 0x14),
> +	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x0c0, "gpb2", 0x18),
> +	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 3, 0x0e0, "gpb0", 0x1c),
>  	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 5, 0x100, "gpc0", 0x20),
>  	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 5, 0x120, "gpc1", 0x24),
>  	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 6, 0x140, "gpc2", 0x28),
>  	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x160, "gpc3", 0x2c),
>  	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x180, "gpk0", 0x30),
> -	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 7, 0x1A0, "etc1", 0x34),
> +	EXYNOS9_PIN_BANK_EINTN(exynos8895_bank_type_off, 7, 0x1a0, "etc1"),
>  };
>  
>  /* pin banks of exynos8890 pin-controller 9 (PERIC1) */
> @@ -1563,9 +1563,9 @@ static const struct samsung_pin_bank_data exynos8890_pin_banks9[] __initconst =
>  	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x040, "gpe6", 0x08),
>  	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x060, "gpj1", 0x0c),
>  	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x080, "gpj2", 0x10),
> -	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x0A0, "gpe2", 0x14),
> -	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x0C0, "gpe3", 0x18),
> -	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x0E0, "gpe4", 0x1c),
> +	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x0a0, "gpe2", 0x14),
> +	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x0c0, "gpe3", 0x18),
> +	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x0e0, "gpe4", 0x1c),
>  	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x100, "gpe1", 0x20),
>  	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x120, "gpe7", 0x24),
>  	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 3, 0x140, "gpg0", 0x28),
> @@ -1647,7 +1647,7 @@ static const struct samsung_pin_bank_data exynos8895_pin_banks0[] __initconst =
>  	EXYNOS9_PIN_BANK_EINTW(bank_type_alive, 8, 0x040, "gpa1", 0x04),
>  	EXYNOS9_PIN_BANK_EINTW(bank_type_alive, 8, 0x060, "gpa2", 0x08),
>  	EXYNOS9_PIN_BANK_EINTW(bank_type_alive, 8, 0x080, "gpa3", 0x0c),
> -	EXYNOS9_PIN_BANK_EINTW(bank_type_alive, 7, 0x0a0, "gpa4", 0x24),
> +	EXYNOS9_PIN_BANK_EINTN(bank_type_alive, 7, 0x0a0, "gpa4"),
>  };
>  
>  /* pin banks of exynos8895 pin-controller 1 (ABOX) */
> @@ -1695,15 +1695,15 @@ static const struct samsung_pin_bank_data exynos8895_pin_banks7[] __initconst =
>  	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 3, 0x000, "gpb0", 0x00),
>  	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 5, 0x020, "gpc0", 0x04),
>  	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 5, 0x040, "gpc1", 0x08),
> -	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x060, "gpc2", 0x0C),
> +	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x060, "gpc2", 0x0c),
>  	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x080, "gpc3", 0x10),
>  	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 4, 0x0a0, "gpk0", 0x14),
>  	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x0c0, "gpe5", 0x18),
> -	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x0e0, "gpe6", 0x1C),
> +	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x0e0, "gpe6", 0x1c),
>  	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x100, "gpe2", 0x20),
>  	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x120, "gpe3", 0x24),
>  	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x140, "gpe4", 0x28),
> -	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 4, 0x160, "gpf0", 0x2C),
> +	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 4, 0x160, "gpf0", 0x2c),
>  	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x180, "gpe1", 0x30),
>  	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 2, 0x1a0, "gpg0", 0x34),
>  };
