From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: Problem using S3C2416's HSSPI
Date: Tue, 02 Oct 2012 10:08:59 +0200
Message-ID: <506AA11B.9050502@samsung.com>
References: <5069D39F.5010604@inov.pt> <201210012118.20657.heiko@sntech.de>
 <5069F1B3.8000203@gmail.com> <201210020147.47512.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:62539 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753717Ab2JBIJC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 2 Oct 2012 04:09:02 -0400
Received: from eusync3.samsung.com (mailout4.w1.samsung.com [210.118.77.14])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MB900GNQANYO660@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 02 Oct 2012 09:09:34 +0100 (BST)
Received: from [106.116.147.32] by eusync3.samsung.com
 (Oracle Communications Messaging Server 7u4-23.01(7.0.4.23.0) 64bit (built Aug
 10 2011)) with ESMTPA id <0MB900BFPAN0NW90@eusync3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 02 Oct 2012 09:09:00 +0100 (BST)
In-reply-to: <201210020147.47512.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>
Cc: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, =?ISO-8859-1?Q?Jos=E9_Miguel_Gon=E7alves?= <jose.goncalves@inov.pt>, linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>

On 10/02/2012 01:47 AM, Heiko St=FCbner wrote:
>> diff --git a/arch/arm/mach-s3c24xx/common-s3c2443.c
>> b/arch/arm/mach-s3c24xx/common-s3c2443.c index aeeb2be..aeb4a24 1006=
44
>> --- a/arch/arm/mach-s3c24xx/common-s3c2443.c
>> +++ b/arch/arm/mach-s3c24xx/common-s3c2443.c
>> @@ -559,7 +559,7 @@ static struct clk hsmmc1_clk =3D {
>>
>>  static struct clk hsspi_clk =3D {
>>         .name           =3D "spi",
>> -       .devname        =3D "s3c64xx-spi.0",
>> +       .devname        =3D "s3c2443-spi.0",
>>         .parent         =3D &clk_p,
>>         .enable         =3D s3c2443_clkcon_enable_p,
>>         .ctrlbit        =3D S3C2443_PCLKCON_HSSPI,
>> @@ -633,7 +633,7 @@ static struct clk_lookup s3c2443_clk_lookup[] =3D=
 {
>>         CLKDEV_INIT(NULL, "clk_uart_baud2", &clk_p),
>>         CLKDEV_INIT(NULL, "clk_uart_baud3", &clk_esys_uart.clk),
>>         CLKDEV_INIT("s3c-sdhci.1", "mmc_busclk.0", &hsmmc1_clk),
>> -       CLKDEV_INIT("s3c64xx-spi.0", "spi_busclk0", &hsspi_clk),
>> +       CLKDEV_INIT("s3c2443-spi.0", "spi_busclk0", &hsspi_clk),
>>  };
>=20
> ahaa ... that's the cause. As far as I was able to determine, in the =
patchset=20
> only the clocks were renamed and the different device names introduce=
d.
>=20
> The spi devices did not get a function to set the name, like for the =
rtc, adc=20
> and nand. The devices are named s3c6410-spi by default, so it seems o=
nly the=20
> s3c64xx machines should have a working spi currently.

That reminds me that I have some patches that set the SPI device names =
and
I have been using those for non-dt exynos platform. Yes, it looks like =
we
need a generic function for all Samsung machines that would override SP=
I
device names on all except mach-s3c64xx.

> I'm working on a patch to fix this for all Samsung arches.

OK. I have something like this too. Anyway it seems SPI is now broken o=
n
all non-dt machines except s3c64xx in kernel 3.6. Perhaps these patches
should be also sent now to stable@vger.kernel.org.

Regards,
Sylwester


--=20
Sylwester Nawrocki
Samsung Poland R&D Center
