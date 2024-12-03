Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D80CD1E1A39
	for <linux-samsung-soc@vger.kernel.org>; Tue,  3 Dec 2024 09:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733219107; cv=none; b=KoItafyTafbTZznRVnof34kUJ4fVGoAnd/XJ2nXVhF66rICn4uSfXIHwreVDsHdWTcCPgP7p+DttgTDgBncClgXk6DH8paoVjlPia62IFbwIpspUOfQkMRhcRe5ots/NuXO3k0Ih9jSgo+wCcn2crlqjZXzjQ6vKAitDujDh5+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733219107; c=relaxed/simple;
	bh=hbOn365bs5yETVST5WjLlAm0HzV2j1n+Xuu8Puz7x0s=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GZ12T1rNXMzqG29yrTVXyRjVhTBWXnmTEg/9D7UlKLTBhRbvfEbVf9T5jcVnCZk4hm2kfvPYVhNLt1sDd7sAyzB4pQPqceo/3QUVjfu4c2lktMHur/YATMMi2qvOZqFfyi5+3XJ0k4QiiIMDjPsOWA9oJamTOau25MhRJLnvw2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xnZl65/I; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xnZl65/I"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-434acf1f9abso48634475e9.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 03 Dec 2024 01:45:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733219104; x=1733823904; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5PWEsu+fpHnvhGCoqgtGpn1xa8q98K4tuJDqTm0nOwI=;
        b=xnZl65/ImMnYWxdhg14cs26lbqM0mCf2zh2SJxVC+DOuBUd3h5nNChTdPgU+i7CXcU
         XN58mMttUm0ZFG83QkI+cEDc+Y0ZrZIVUQH73nYfUK1WLuJKZIHiu5stqNrz2fbGwrFo
         1YyWEnPZTc4lJdDTbdNeN6irljsEUlW7YtgVc16RBq82tRvBh7Z3K5xB0Vr61TwY4fpK
         s0Et8SSpEpG+JJF5MtiYv7MLA0e/vrF2IH/1RyS52lXD010U9/kryMOBdc1GLrAOh+4E
         c0rEmIILig22Esl0oM/qnOXfXQfqdYt2ocu+eEvJe9P8ui2aKo2uoWhN8dOuFbeNM3dI
         ZaFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733219104; x=1733823904;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5PWEsu+fpHnvhGCoqgtGpn1xa8q98K4tuJDqTm0nOwI=;
        b=SwM7FdcC/5vC52Rr6lbd8o7Sn6patd6Nt0z5tJ4tl1+DAPG8LgvLNC5EMsg5nMUZj/
         FSReLukVwO4w32VVa00AOC04ZXvhf9qYRwR5c16k6IbbD3LXgtGZKGeplTaz+/An5wZ/
         8rhwOk8cPXlqLrxstaC5BDnahirC2tgj5VQRu3feN6BfMUtiAyVWsyDxiVa4p2VLW0+o
         VeJ7uMPUDi5JJohfhWcRm7UsQd3oKcdDSdTTGGVK068j+NqNW+jU9LnUxMXWZtxjw0JA
         K4r+u26h5zYWhDIqqIGjlkbz43HvloH8K2+dtbtz90xhjhqeQvvY2wt1vbCLC/ntuQuN
         HdvA==
X-Forwarded-Encrypted: i=1; AJvYcCV1wplVTaVSmlCeAt+x8kiuD/yXqUf7ZpeLhtSg+xKMiMdF1hwa2cJkzmoga0Zu222wuGmsmiDQqVnDxUn9Ovof+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxVH+6lFlgc48k1X2ZgS96SxF2/Dwyb0TRWFFvoU/YfDV4fOKho
	10fOi+7l7vstBTJg1NFNGSUzw47sPmdwytxdBiDEHk10fthlLHArDMAYkFAMSLI=
X-Gm-Gg: ASbGncvxP2eQX4p9RoCyAe9uSzRFJ4TwvF3BVKxeVXSsvXdZkhsZLsFXw8gb6kSdN12
	Fq+I322h/LlQsJoofF5vKg4h1hMYAa3a2YHHDtv3JKNITilXqBYmQcEPVDVt6J6U9Kav8qea1Du
	GkHu6baNr0wCitAZ/elCJi+SABLAV+n5juKMH07NfItMTGTZam+jTiCbDBzM2mIGdJ6KrCH3kkG
	Oy2ikicUkUfA2W+oSBJh+JvV+8/gEjt4AZiK/DpyDQ5nNcFjOnYgSo=
X-Google-Smtp-Source: AGHT+IEwrGlccw2Q5NJeLCrjOJfzlF1e1ATvEELN9LKQRaP3CAlsVnOMmTkjoN9Q1iKRn0Rh/ruRRA==
X-Received: by 2002:a05:600c:46d0:b0:434:a160:3647 with SMTP id 5b1f17b1804b1-434d09c0babmr15386255e9.12.1733219104223;
        Tue, 03 Dec 2024 01:45:04 -0800 (PST)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434aa78c202sm213466555e9.26.2024.12.03.01.45.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 01:45:03 -0800 (PST)
Message-ID: <18629c9edd295a524a1c9764f013a0e97e0b275f.camel@linaro.org>
Subject: Re: [PATCH 1/4] power: supply: add support for max77759 fuel gauge
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: t.antoine@uclouvain.be, Sebastian Reichel <sre@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Dimitri Fedrau <dima.fedrau@gmail.com>, Catalin
 Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Peter
 Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Date: Tue, 03 Dec 2024 09:45:02 +0000
In-Reply-To: <8f585460a1bc52f78a6d0867aed87398bde30152.camel@linaro.org>
References: <20241202-b4-gs101_max77759_fg-v1-0-98d2fa7bfe30@uclouvain.be>
	 <20241202-b4-gs101_max77759_fg-v1-1-98d2fa7bfe30@uclouvain.be>
	 <c377f3302c6c282ad826211c859e2b65bb1222cb.camel@linaro.org>
	 <8f585460a1bc52f78a6d0867aed87398bde30152.camel@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1-4 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2024-12-03 at 07:23 +0000, Andr=C3=A9 Draszik wrote:
> On Tue, 2024-12-03 at 06:47 +0000, Andr=C3=A9 Draszik wrote:
> > Hi Thomas,
> >=20
> > Thanks for looking into this!
> >=20
> > > From: Thomas Antoine <t.antoine@uclouvain.be>
> > >=20
> > > The Maxim max77759 fuel gauge has the same interface as the Maxim max=
1720x
> > > except for the non-volatile memory slave address which is not availab=
le.
> >=20
> > It is not fully compatible, and it also has a lot more registers.
> >=20
> > For example, the voltage now is not in register 0xda as this driver ass=
umes.
> > With these changes, POWER_SUPPLY_PROP_VOLTAGE_NOW just reads as 0. 0xda
> > doesn't exist in max77759
> >=20
> > I haven't compared in depth yet, though.
>=20
> Regarding the regmap in this driver, please see below comparison I had
> collected some time ago:
>=20
> 	regmap_reg_range(0x24, 0x26), // exists
> 	regmap_reg_range(0x30, 0x31), // exists
> 	regmap_reg_range(0x33, 0x34), // exists
> 	regmap_reg_range(0x37, 0x37), // exists
> 	regmap_reg_range(0x3B, 0x3C), // exists
> 	regmap_reg_range(0x40, 0x41), // exists
> 	regmap_reg_range(0x43, 0x44), // exists
> 	regmap_reg_range(0x47, 0x49), // exists
> 	regmap_reg_range(0x4B, 0x4C), // exists
> 	regmap_reg_range(0x4E, 0xAF), // 0x4e 0x4f exists
> 	regmap_reg_range(0xB1, 0xB3), // exists
> 	regmap_reg_range(0xB5, 0xB7), // exists
> 	regmap_reg_range(0xBF, 0xD0), // 0xd0 exists
> 	0xd1 .. 0xdb don't exist
> 	regmap_reg_range(0xDB, 0xDB),
> 	regmap_reg_range(0xE0, 0xFF), // 0xfb 0xff exist
>=20
> the comments refer to whether or not the register exists in max77759

I think this should make it more clear:
allow:
	regmap_reg_range(0x00, 0xff),
deny:
	regmap_reg_range(0x50, 0xaf),
	regmap_reg_range(0xc0, 0xcf),
	regmap_reg_range(0xd1, 0xdb),
	regmap_reg_range(0xe0, 0xfa),
	regmap_reg_range(0xfc, 0xfe),

Cheers,
Andre'

