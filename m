From: Alexander Varnin <fenixk19@mail.ru>
Subject: Re: [PATCH] ARM: S3C2443: SPI clock channel setup is fixed
Date: Thu, 22 Nov 2012 12:29:42 +0400
Message-ID: <50ADE276.3030501@mail.ru>
References: <50AAAABE.8090607@mail.ru> <0c8901cdc714$a567f7a0$f037e6e0$@org> <50ADDACE.9090709@mail.ru> <0f6d01cdc88a$8a0c5b00$9e251100$@org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from fallback1.mail.ru ([94.100.176.18]:35142 "EHLO
	fallback1.mail.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755817Ab2KVSuz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 22 Nov 2012 13:50:55 -0500
Received: from smtp29.i.mail.ru (smtp29.i.mail.ru [94.100.177.89])
	by fallback1.mail.ru (mPOP.Fallback_MX) with ESMTP id C8F61C44606
	for <linux-samsung-soc@vger.kernel.org>; Thu, 22 Nov 2012 12:30:12 +0400 (MSK)
In-Reply-To: <0f6d01cdc88a$8a0c5b00$9e251100$@org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org

22.11.2012 12:22, Kukjin Kim =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> SPI1). I've solved it with board specific code, but it is not most
>> correct way, i think.
>>
> Hmm, if provided platform_device is in plat-samsung/devs.c cannot sup=
port, we can do as you said temporarily but we know it's wrong way beca=
use the value depends on SoC not board.
>
> How about following?
>
> 8<--------------------------------
> diff --git a/arch/arm/mach-s3c24xx/s3c2443.c b/arch/arm/mach-s3c24xx/=
s3c2443.c
> index 165b6a6..22eead3 100644
> --- a/arch/arm/mach-s3c24xx/s3c2443.c
> +++ b/arch/arm/mach-s3c24xx/s3c2443.c
> @@ -82,6 +82,10 @@ int __init s3c2443_init(void)
>   	s3c_device_wdt.resource[1].start =3D IRQ_S3C2443_WDT;
>   	s3c_device_wdt.resource[1].end   =3D IRQ_S3C2443_WDT;
>
> +	/* change SPI IRQ number */
> +	s3c_device_spi0.resource[1].start =3D IRQ_SPI1;
> +	s3c_device_spi0.resource[1].end =3D IRQ_SPI1;
> +
>   	return device_register(&s3c2443_dev);
>   }
> 8<--------------------------------
>
> K-Gene <kgene@kernel.org>
>
Yes, that is a fix. Thanks.
