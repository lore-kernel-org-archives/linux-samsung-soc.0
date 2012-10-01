From: =?ISO-8859-1?Q?Jos=E9_Miguel_Gon=E7alves?= <jose.goncalves@inov.pt>
Subject: Problem using S3C2416's HSSPI
Date: Mon, 01 Oct 2012 18:32:15 +0100
Message-ID: <5069D39F.5010604@inov.pt>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lmv.inov.pt ([146.193.64.2]:50022 "EHLO lmv.inov.pt"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751620Ab2JARj1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 1 Oct 2012 13:39:27 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>, Kukjin Kim <kgene.kim@samsung.com>

Hi,

I'm trying to use the HSSPI controller on a S3C2416 based board but I'm=
 having=20
some problems.

I've added "&s3c64xx_device_spi0" to my array of platform devices and a=
dded a call=20
to s3c64xx_spi0_set_platdata(NULL, 0, 1) before platform_add_devices().=
 When the=20
kernel starts I see the following error:

s3c64xx-spi s3c6410-spi.0: Unable to acquire clock 'spi'
s3c64xx-spi: probe of s3c6410-spi.0 failed with error -2

So I reckon I'm still missing some kind of initialization. Can someone =
help me on=20
this?

Best regards,
Jos=E9 Gon=E7alves
