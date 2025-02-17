Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E807F187FEC
	for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Feb 2025 05:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739771996; cv=none; b=GIqC6q//8Xcl+cSF3ogmC2CLUeVH2sWhXe6He17NOAQT/ygEGU9Th8tEfnZIoP5IWuV/yfCPpTgz15zwVz2IpM1qY8WdNrpl5rgm6fkImK1zGRaZUQdekkmSnFB2lO60xg9e2qdH9z5z9VSPZ0v2vEcxa40MDdmnmaNMS0H8eGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739771996; c=relaxed/simple;
	bh=XhfjgMSAuRSs2znPuM48XM+9QFL2tFdRY8gdMa1wOEA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GgRvTzuKEIrdCQE3pdwsYjGXTSTR5+iXyDsZrj2lpNKGI19zFlaApwMrKgo9QtN9RX5bODl29CU7+Prcm65NKOtPNv13q5zPdKJmDLVoS4T+Wip/E4rV4aDYiN+E/huLEd/gm7crsTiicMteZIZpQIatDo80A2UXwXC4XUM+UG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tJx9ieG9; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tJx9ieG9"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4397dff185fso7086665e9.2
        for <linux-samsung-soc@vger.kernel.org>; Sun, 16 Feb 2025 21:59:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739771993; x=1740376793; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SKNrAXFMRF1ydsmaXbtU5o3X4WRvqMlFPYNBXI8d+nE=;
        b=tJx9ieG9WPNh+osgb9xqsrYlGESheXTM5r1eqaKyRKhMf+fAWE1yDEARuMVTh+IAhl
         enJ3tG/JHzwSAq4kLLZjoHRuAGRZ6KxZOxCI706xOvDLzQ1XagZ3Zi9PNIKiyhPS0970
         iqeB1UzfQ1iKt5zVKBF/wGvrlkXuj9Sm0ZLafoSAD7a7U1IP8XoHln4rceUgma83xjra
         qcEo56f+lbEIRavAec1KKy7ErKisgw+Ajhe+jf9WbrMvMBm78saOB/s0CrJ8AqnaZljJ
         718IX7LtcPgMNV5++swZKarwf4G3DMC9pdBzHwyeHDLJpovhqpeAR0j4db57BXPyH7P6
         Ft3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739771993; x=1740376793;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SKNrAXFMRF1ydsmaXbtU5o3X4WRvqMlFPYNBXI8d+nE=;
        b=C5+fKEeprURNlzZ+Lz/3y2nzD6AklJmsqU9yPoMFaX9tvJ0BS5bePyTJ8ZsqTb/3G7
         w06BBJMs7syfbGXy1Gqd869k5kansP2kJUkn7uWgENiQaxu4OfM+psuER613uYBeJ1L9
         PqxKV7ze1pEaCnMkmEgJmOd39UKvLKfD7U/bgY8zn8+i8m0T+ij2g5k0CoG49+ryjoIx
         xmFpQEgMNQ358oYnTOiqOSURVKnuwa+CCiZqAvvTYBTY8c63nEUlou2dTkpJaSjNc/+K
         1e5y4bgLUKtey4NEwgs8tfF6ms3o3aOyITeAGe653fJVr7RS2rTLbBoP1+k4sVsr4A8o
         bvqw==
X-Forwarded-Encrypted: i=1; AJvYcCUGYdjHKy3FaKJ/4FwLFtiIHwswTZhKnAxqSe+4qJ5sFJ9120Hx3CzfKtIBWhNnfslsaj/W5cqiiImBwf91spqM1g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzyB1Q3naUyxKCR5TaSBXKF9qil0BwkHFW67DDM+ET2i+ijieZ2
	nLSm4ceIzsa77RQ+KUplod/bgRIPTC0vVuoaMS8hCioyBsR4R/CcKbDU5rjiUIY=
X-Gm-Gg: ASbGnctg7Uu5az4gJjSJEScbOWfqZ56Btq9/FbkEUXWUf9EobIjmFu3nMeRDnW+esId
	0n23td4q7OKX4ft6ML7q7lxdxUaoFUMngdo6RFkg2vjCC+L7MLfUsXIAfh7wYV0ajzG5kVN0XeB
	KZwqt+wwuME12wuGtaSkXtr7bP8DkXKDeNh0YWZzGxtFN6nFz5PqLCLDQR3NaTcxJmZEupbJmal
	T/ftClr8SNofeTMhj+OXQ8LHYj1kbQGrUbD7GdlYbUWkhHr8luE6HYsmkWyeznOVP3uF5mRKcLW
	qLc7NXy7Nvmo9yb8Vo0=
X-Google-Smtp-Source: AGHT+IHXacwvM4hwCgbWYgWUY/7LPCli/NI7dw475tRtNjJvs0k+XD4odztNdHIEn2nleZzsjkFFbw==
X-Received: by 2002:a05:600c:35c9:b0:439:5590:6d2f with SMTP id 5b1f17b1804b1-4396e6ab197mr74259555e9.12.1739771993191;
        Sun, 16 Feb 2025 21:59:53 -0800 (PST)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43989087517sm8102405e9.8.2025.02.16.21.59.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Feb 2025 21:59:52 -0800 (PST)
Message-ID: <88b00cc53cd5cb3682a29d6a2ec491c7640129ce.camel@linaro.org>
Subject: Re: [PATCH v2] phy: exynos5-usbdrd: Fix broken USB on Exynos5422
 (TYPEC dependency)
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Vinod Koul
 <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Krzysztof
 Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Peter
 Griffin <peter.griffin@linaro.org>, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Date: Mon, 17 Feb 2025 05:59:51 +0000
In-Reply-To: <20250216114136.245814-1-krzysztof.kozlowski@linaro.org>
References: <20250216114136.245814-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2-2 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Krzysztof,

On Sun, 2025-02-16 at 12:41 +0100, Krzysztof Kozlowski wrote:
> Older Exynos designs, like Exynos5422, do not have USB Type-C and the
> USB DRD PHY does not really depend on Type-C for these devices at all.
> Incorrectly added optional dependency on CONFIG_TYPEC caused this driver
> to be missing for exynos_defconfig and as result Exynos5422-based boards
> like Hardkernel Odroid HC1 failed to probe USB.
>=20
> However ARM64 boards should have CONFIG_TYPEC enabled and in proper
> state (e.g. =3Dy when PHY_EXYNOS5_USBDRD is =3Dy) for proper USB support =
on
> Google GS101 boards.
>=20
> Add itermediate CONFIG_PHY_EXYNOS5_USBDRD_TYPEC symbol to skip TYPEC on
> older boards, while still expressing optional dependency.
>=20
> Reported-by: Krzysztof Kozlowski <krzk@kernel.org>
> Closes: https://krzk.eu/#/builders/21/builds/6139
> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Closes: https://lore.kernel.org/all/3c0b77e6-357d-453e-8b63-4757c3231bde@=
samsung.com/
> Fixes: 09dc674295a3 ("phy: exynos5-usbdrd: subscribe to orientation notif=
ier if required")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>=20
> ---
>=20
> Patch for issue in linux-next
>=20
> Changes in v2:
> 1. Add PHY_EXYNOS5_USBDRD_TYPEC, so arm64 defconfig will have both
> =C2=A0=C2=A0 symbols in-sync
> ---
> =C2=A0drivers/phy/samsung/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 12 +++++++++++-
> =C2=A0drivers/phy/samsung/phy-exynos5-usbdrd.c |=C2=A0 1 +
> =C2=A02 files changed, 12 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/phy/samsung/Kconfig b/drivers/phy/samsung/Kconfig
> index 7fba571c0e2b..b20ac6b75993 100644
> --- a/drivers/phy/samsung/Kconfig
> +++ b/drivers/phy/samsung/Kconfig
> @@ -77,12 +77,22 @@ config PHY_S5PV210_USB2
> =C2=A0	=C2=A0 particular SoC is compiled in the driver. In case of S5PV21=
0 two phys
> =C2=A0	=C2=A0 are available - device and host.
> =C2=A0
> +# None of ARM32 Samsung boards use Type-C, however newer ARM64 do and
> +# PHY_EXYNOS5_USBDRD driver needs TYPEC to be in a matching state to avo=
id link
> +# failures (see optional dependencies in kconfig-language.rst).=C2=A0 In=
termediate
> +# PHY_EXYNOS5_USBDRD_TYPEC symbol allows to skip TYPEC on ARM32 boards.
> +config PHY_EXYNOS5_USBDRD_TYPEC
> +	tristate
> +	depends on ARCH_EXYNOS
> +	depends on ARM || TYPEC || !TYPEC
> +	default y
> +
> =C2=A0config PHY_EXYNOS5_USBDRD
> =C2=A0	tristate "Exynos5 SoC series USB DRD PHY driver"
> =C2=A0	depends on (ARCH_EXYNOS && OF) || COMPILE_TEST
> =C2=A0	depends on HAS_IOMEM
> -	depends on TYPEC || (TYPEC=3Dn && COMPILE_TEST)

Is it not possible to just drop the '&& COMPILE_TEST' part to make
it
  depends on TYPEC || TYPEC=3Dn
or
  depends on TYPEC || !TYPEC
(without any of the other changes)?

If not, why not, are there corner cases that doesn't catch? Some
minimal testing seems to suggest that that works, too.

Cheers,
Andre'

> =C2=A0	depends on USB_DWC3_EXYNOS
> +	depends on PHY_EXYNOS5_USBDRD_TYPEC
> =C2=A0	select GENERIC_PHY
> =C2=A0	select MFD_SYSCON
> =C2=A0	default y
> diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsu=
ng/phy-exynos5-usbdrd.c
> index ff2436f11d68..6d571dff2898 100644
> --- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
> +++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
> @@ -1456,6 +1456,7 @@ static int exynos5_usbdrd_setup_notifiers(struct ex=
ynos5_usbdrd_phy *phy_drd)
> =C2=A0{
> =C2=A0	int ret;
> =C2=A0
> +	/* See CONFIG_PHY_EXYNOS5_USBDRD_TYPEC */
> =C2=A0	if (!IS_ENABLED(CONFIG_TYPEC))
> =C2=A0		return 0;
> =C2=A0

