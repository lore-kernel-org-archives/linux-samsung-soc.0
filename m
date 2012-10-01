From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: Re: Problem using S3C2416's HSSPI
Date: Mon, 1 Oct 2012 21:18:19 +0200
Message-ID: <201210012118.20657.heiko@sntech.de>
References: <5069D39F.5010604@inov.pt>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:52535 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750835Ab2JATSY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 1 Oct 2012 15:18:24 -0400
In-Reply-To: <5069D39F.5010604@inov.pt>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?iso-8859-1?q?Jos=E9_Miguel_Gon=E7alves?= <jose.goncalves@inov.pt>
Cc: linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>

Hi Jos=E9,

Am Montag, 1. Oktober 2012, 19:32:15 schrieb Jos=E9 Miguel Gon=E7alves:
> I'm trying to use the HSSPI controller on a S3C2416 based board but I=
'm
> having some problems.
>=20
> I've added "&s3c64xx_device_spi0" to my array of platform devices and=
 added
> a call to s3c64xx_spi0_set_platdata(NULL, 0, 1) before
> platform_add_devices(). When the kernel starts I see the following er=
ror:
>=20
> s3c64xx-spi s3c6410-spi.0: Unable to acquire clock 'spi'
> s3c64xx-spi: probe of s3c6410-spi.0 failed with error -2

what kernel version do you use?

I.e. the clock support for the s3c64xx-spi on s3c2443 and s3c2416 was a=
dded
through [1] in march - so it's not this old.=20


Heiko


[1] http://lists.infradead.org/pipermail/linux-arm-kernel/2012-March/08=
9086.html
