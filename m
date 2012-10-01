From: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Subject: Re: Problem using S3C2416's HSSPI
Date: Mon, 01 Oct 2012 21:40:35 +0200
Message-ID: <5069F1B3.8000203@gmail.com>
References: <5069D39F.5010604@inov.pt> <201210012118.20657.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bk0-f46.google.com ([209.85.214.46]:55451 "EHLO
	mail-bk0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751945Ab2JATlv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 1 Oct 2012 15:41:51 -0400
Received: by mail-bk0-f46.google.com with SMTP id jk13so5172019bkc.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 01 Oct 2012 12:41:50 -0700 (PDT)
In-Reply-To: <201210012118.20657.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>
Cc: =?ISO-8859-1?Q?Jos=E9_Miguel_Gon=E7alves?= <jose.goncalves@inov.pt>, linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>

Hi,

On 10/01/2012 09:18 PM, Heiko St=FCbner wrote:
> Hi Jos=E9,
>=20
> Am Montag, 1. Oktober 2012, 19:32:15 schrieb Jos=E9 Miguel Gon=E7alve=
s:
>> I'm trying to use the HSSPI controller on a S3C2416 based board but =
I'm
>> having some problems.
>>
>> I've added "&s3c64xx_device_spi0" to my array of platform devices an=
d added
>> a call to s3c64xx_spi0_set_platdata(NULL, 0, 1) before
>> platform_add_devices(). When the kernel starts I see the following e=
rror:
>>
>> s3c64xx-spi s3c6410-spi.0: Unable to acquire clock 'spi'
>> s3c64xx-spi: probe of s3c6410-spi.0 failed with error -2
>=20
> what kernel version do you use?
>=20
> I.e. the clock support for the s3c64xx-spi on s3c2443 and s3c2416 was=
 added
> through [1] in march - so it's not this old.

In this commit

commit a5238e360b715e9a1bb39d7d3537f78cc9e9e286
Author: Thomas Abraham <thomas.abraham@linaro.org>
Date:   Fri Jul 13 07:15:14 2012 +0900

    spi: s3c64xx: move controller information into driver data
   =20
    Platform data is used to specify controller hardware specific infor=
mation
    such as the tx/rx fifo level mask and bit offset of rx fifo level. =
Such
    information is not suitable to be supplied from device tree. Instea=
d,
    it can be moved into the driver data and removed from platform data=
=2E
   =20
    Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
    Acked-by: Jaswinder Singh <jaswinder.singh@linaro.org>
    Acked-by: Grant Likely <grant.likely@secretlab.ca>
    Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>

All "s3c64xx-spi.0" devname fields that you added were replaced with "s=
3c24xx-spi.0".
I wonder if that's not the reason clk_get(..., "spi"); fails in the spi=
-s3c64xx driver
used on mach-s3c24xx. But it of course depends on the kernel version, w=
e need to first=20
clarify that.
=20
diff --git a/arch/arm/mach-s3c24xx/common-s3c2443.c b/arch/arm/mach-s3c=
24xx/common-s3c2443.c
index aeeb2be..aeb4a24 100644
--- a/arch/arm/mach-s3c24xx/common-s3c2443.c
+++ b/arch/arm/mach-s3c24xx/common-s3c2443.c
@@ -559,7 +559,7 @@ static struct clk hsmmc1_clk =3D {
=20
 static struct clk hsspi_clk =3D {
        .name           =3D "spi",
-       .devname        =3D "s3c64xx-spi.0",
+       .devname        =3D "s3c2443-spi.0",
        .parent         =3D &clk_p,
        .enable         =3D s3c2443_clkcon_enable_p,
        .ctrlbit        =3D S3C2443_PCLKCON_HSSPI,
@@ -633,7 +633,7 @@ static struct clk_lookup s3c2443_clk_lookup[] =3D {
        CLKDEV_INIT(NULL, "clk_uart_baud2", &clk_p),
        CLKDEV_INIT(NULL, "clk_uart_baud3", &clk_esys_uart.clk),
        CLKDEV_INIT("s3c-sdhci.1", "mmc_busclk.0", &hsmmc1_clk),
-       CLKDEV_INIT("s3c64xx-spi.0", "spi_busclk0", &hsspi_clk),
+       CLKDEV_INIT("s3c2443-spi.0", "spi_busclk0", &hsspi_clk),
 };


> [1] http://lists.infradead.org/pipermail/linux-arm-kernel/2012-March/=
089086.html

--

Regards,
Sylwester
