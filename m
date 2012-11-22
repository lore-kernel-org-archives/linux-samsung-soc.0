From: Alexander Varnin <fenixk19@mail.ru>
Subject: Re: [PATCH] ARM: S3C2443: SPI clock channel setup is fixed
Date: Thu, 22 Nov 2012 11:57:02 +0400
Message-ID: <50ADDACE.9090709@mail.ru>
References: <50AAAABE.8090607@mail.ru> <0c8901cdc714$a567f7a0$f037e6e0$@org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from fallback2.mail.ru ([94.100.176.87]:57153 "EHLO
	fallback2.mail.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753915Ab2KVSex (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 22 Nov 2012 13:34:53 -0500
Received: from smtp21.mail.ru (smtp21.mail.ru [94.100.176.174])
	by fallback2.mail.ru (mPOP.Fallback_MX) with ESMTP id 29D02BCFFB33
	for <linux-samsung-soc@vger.kernel.org>; Thu, 22 Nov 2012 11:57:34 +0400 (MSK)
In-Reply-To: <0c8901cdc714$a567f7a0$f037e6e0$@org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org

I also want to point, that irq resource in arch/arm/plat-samsung/devs.c=
=20
for s3c2410-spi driver on S3C2443 points to wrong IRQ (SPI0 instead of=20
SPI1). I've solved it with board specific code, but it is not most=20
correct way, i think.

20.11.2012 15:46, Kukjin Kim =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> Alexander Varnin wrote:
>> Actually, SPI channel 0 on 2443 is mapped to HS SPI controller,
>> and to enable s3c2410-spi controller, we should power on channel
>> 1 in PCLKCON. There is no channel 0 SPI on s3c2443, so delete its
>> clock.
>>
>> Signed-off-by: Alexander Varnin <fenixk19@mail.ru>
>> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
>> ---
>>   arch/arm/mach-s3c24xx/clock-s3c2443.c |    6 ------
>>   1 files changed, 0 insertions(+), 6 deletions(-)
>>
>> diff --git a/arch/arm/mach-s3c24xx/clock-s3c2443.c
>> b/arch/arm/mach-s3c24xx/clock-s3c2443.c
>> index 7f689ce..bdaba59 100644
>> --- a/arch/arm/mach-s3c24xx/clock-s3c2443.c
>> +++ b/arch/arm/mach-s3c24xx/clock-s3c2443.c
>> @@ -158,12 +158,6 @@ static struct clk init_clocks_off[] =3D {
>>   		.devname	=3D "s3c2410-spi.0",
>>   		.parent		=3D &clk_p,
>>   		.enable		=3D s3c2443_clkcon_enable_p,
>> -		.ctrlbit	=3D S3C2443_PCLKCON_SPI0,
>> -	}, {
>> -		.name		=3D "spi",
>> -		.devname	=3D "s3c2410-spi.1",
>> -		.parent		=3D &clk_p,
>> -		.enable		=3D s3c2443_clkcon_enable_p,
>>   		.ctrlbit	=3D S3C2443_PCLKCON_SPI1,
>>   	}
>>   };
>> --
>> 1.7.2.5
> Applied, thanks.
>
> K-Gene <kgene@kernel.org>
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
