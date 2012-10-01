From: =?ISO-8859-1?Q?Jos=E9_Miguel_Gon=E7alves?= <jose.goncalves@inov.pt>
Subject: Re: Problem using S3C2416's HSSPI
Date: Mon, 01 Oct 2012 21:01:05 +0100
Message-ID: <5069F681.5000505@inov.pt>
References: <5069D39F.5010604@inov.pt> <201210012118.20657.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lmv.inov.pt ([146.193.64.2]:56424 "EHLO lmv.inov.pt"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752628Ab2JAUBj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 1 Oct 2012 16:01:39 -0400
In-Reply-To: <201210012118.20657.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>
Cc: linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, sylvester.nawrocki@gmail.com

On 10/01/2012 08:18 PM, Heiko St=FCbner wrote:
> Hi Jos=E9,
>
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
> what kernel version do you use?
>

I'm now using kernel 3.6.

Jos=E9 Gon=E7alves
