Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F1C236C9C2;
	Fri, 29 May 2026 15:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780067055; cv=none; b=KM850Ae0pTjQCMhSc0Pnny2wL3wSnl6LMg17WjWtyPAlLEFwJu6azhFARYQiG3+0hBifQE0wTBNQKkIcLRRsNWhxvPdIhKutV4k9QmPXabCQkDjQ3pPdfu5NHugNdkaw5kWHFYIgtKQJhWGTKsm9hOPX74ow+StyB5w8WBUQZFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780067055; c=relaxed/simple;
	bh=bQ18QPLL+im82nhYKB017b2zavRhi7h41FQEYN6/t3k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ORve4DrGUVSdqk3J3eJyA9ExL75yxPMJoKobIJWSHmDlw0jYq4JbH7PCcJ0wWITR4QtUhUfZFjyt7z10Nw2yNVo8ZqsoOMJM9HdHxH7F6VDouCNXe9cVZEwNaoruXO3IfSwVJQ5STST7OYYYdA91gZUDR/RU1JZdKC1i+xznNYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=mgf3otVK; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="mgf3otVK"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 9A8231A373C;
	Fri, 29 May 2026 15:04:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 68007601FA;
	Fri, 29 May 2026 15:04:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8289D10888CC2;
	Fri, 29 May 2026 17:04:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780067045; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=fUWeaNsfFgJU6Qp2lS9wdzvNAu5L3srRKzUtR510ldk=;
	b=mgf3otVKPRUXFhpVnJ78Lp60lbpvE9XKk2jjeYH47r8V1MgE6/2/7CGUwnSZ5BbjM+ec2Q
	1a3MmW+WvM1X6MXUISKX9VbbPMOs3VTpwQ3yJkE0chnFTQ5lj3iga19mOl4E1U1/e5m9Gl
	ZwCPvE730Kp70jTlHWR7C1sEtlK+dPMUU6vAtQo5/7c4qqAA740HQ7UvGplbHoi6r5jcIK
	Wm3zdae3yU81FhvS2OMJN3OVOJ4lWi5OUe0AO5kzftu9S1HhwvzTJQHt0C6eer/PiJefBw
	BcM0i1ONwLzaJVERSNfcgPZbkcwrdXXHXv03nAJdIW9iUAEI5/xljJhlfnbs4g==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Arnd Bergmann <arnd@kernel.org>, soc@lists.linux.dev, Andrew Lunn
 <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Daniel Mack <daniel@zonque.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik
 <robert.jarzmik@free.fr>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Alim Akhtar <alim.akhtar@samsung.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH] ARM: select legacy gpiolib interfaces where used
In-Reply-To: <20260428162757.540823-1-arnd@kernel.org>
References: <20260428162757.540823-1-arnd@kernel.org>
Date: Fri, 29 May 2026 17:04:00 +0200
Message-ID: <87h5nq1cm7.fsf@BLaptop.bootlin.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Arnd Bergmann <arnd@kernel.org> writes:

> From: Arnd Bergmann <arnd@arndb.de>
>
> A few old machines have not been converted away from the old-style
> gpiolib interfaces. Make these select the new CONFIG_GPIOLIB_LEGACY
> symbol so the code still works where it is needed but can be left
> out otherwise.
>
> Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

for mv78xx0 and orion5x

Acked-by: Gregory CLEMENT <gregory.clement@bootlin.com>

Thanks,

Gregory
> ---
>  arch/arm/mach-mv78xx0/Kconfig     | 1 +
>  arch/arm/mach-orion5x/Kconfig     | 1 +
>  arch/arm/mach-pxa/Kconfig         | 1 +
>  arch/arm/mach-s3c/Kconfig.s3c64xx | 1 +
>  arch/arm/mach-sa1100/Kconfig      | 1 +
>  5 files changed, 5 insertions(+)
>
> diff --git a/arch/arm/mach-mv78xx0/Kconfig b/arch/arm/mach-mv78xx0/Kconfig
> index 9de3bbc09c3a..670e6587827e 100644
> --- a/arch/arm/mach-mv78xx0/Kconfig
> +++ b/arch/arm/mach-mv78xx0/Kconfig
> @@ -6,6 +6,7 @@ menuconfig ARCH_MV78XX0
>  	depends on ATAGS
>  	select CPU_FEROCEON
>  	select GPIOLIB
> +	select GPIOLIB_LEGACY
>  	select MVEBU_MBUS
>  	select FORCE_PCI
>  	select PLAT_ORION_LEGACY
> diff --git a/arch/arm/mach-orion5x/Kconfig b/arch/arm/mach-orion5x/Kconfig
> index ee449ca032d2..cef19bea6164 100644
> --- a/arch/arm/mach-orion5x/Kconfig
> +++ b/arch/arm/mach-orion5x/Kconfig
> @@ -5,6 +5,7 @@ menuconfig ARCH_ORION5X
>  	depends on CPU_LITTLE_ENDIAN
>  	select CPU_FEROCEON
>  	select GPIOLIB
> +	select GPIOLIB_LEGACY
>  	select MVEBU_MBUS
>  	select FORCE_PCI
>  	select PCI_QUIRKS
> diff --git a/arch/arm/mach-pxa/Kconfig b/arch/arm/mach-pxa/Kconfig
> index 10e472f4fa43..66e26990e2c8 100644
> --- a/arch/arm/mach-pxa/Kconfig
> +++ b/arch/arm/mach-pxa/Kconfig
> @@ -10,6 +10,7 @@ menuconfig ARCH_PXA
>  	select CPU_XSCALE if !CPU_XSC3
>  	select GPIO_PXA
>  	select GPIOLIB
> +	select GPIOLIB_LEGACY
>  	select PLAT_PXA
>  	help
>  	  Support for Intel/Marvell's PXA2xx/PXA3xx processor line.
> diff --git a/arch/arm/mach-s3c/Kconfig.s3c64xx b/arch/arm/mach-s3c/Kconfi=
g.s3c64xx
> index 8f40af063ad6..3f97fba8e4f5 100644
> --- a/arch/arm/mach-s3c/Kconfig.s3c64xx
> +++ b/arch/arm/mach-s3c/Kconfig.s3c64xx
> @@ -101,6 +101,7 @@ config MACH_WLF_CRAGG_6410
>  	depends on ATAGS
>  	depends on I2C=3Dy
>  	select CPU_S3C6410
> +	select GPIOLIB_LEGACY
>  	select LEDS_GPIO_REGISTER
>  	select S3C64XX_DEV_SPI0
>  	select S3C64XX_SETUP_FB_24BPP
> diff --git a/arch/arm/mach-sa1100/Kconfig b/arch/arm/mach-sa1100/Kconfig
> index 0fb4c24cfad5..e23700e0d6c8 100644
> --- a/arch/arm/mach-sa1100/Kconfig
> +++ b/arch/arm/mach-sa1100/Kconfig
> @@ -13,6 +13,7 @@ menuconfig ARCH_SA1100
>  	select CPU_FREQ
>  	select CPU_SA1100
>  	select GPIOLIB
> +	select GPIOLIB_LEGACY
>  	select IRQ_DOMAIN
>  	select ISA
>  	select NEED_MACH_MEMORY_H
> --=20
> 2.39.5
>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
