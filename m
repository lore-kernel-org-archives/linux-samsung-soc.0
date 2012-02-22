From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH 2/2] ARM: S3C24XX: Move the DMA base code to mach-s3c24xx
Date: Thu, 23 Feb 2012 02:38:15 +0900
Message-ID: <4F452807.1090609@samsung.com>
References: <201202212221.41744.heiko@sntech.de> <201202212226.57559.heiko@sntech.de> <201202221721.41262.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pw0-f46.google.com ([209.85.160.46]:44153 "EHLO
	mail-pw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751995Ab2BVRiW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 22 Feb 2012 12:38:22 -0500
Received: by pbcun15 with SMTP id un15so392728pbc.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 22 Feb 2012 09:38:22 -0800 (PST)
In-Reply-To: <201202221721.41262.arnd@arndb.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, =?ISO-8859-1?Q?Heiko_St=FCbne?= =?ISO-8859-1?Q?r?= <heiko@sntech.de>, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, 'Ben Dooks' <ben-linux@fluff.org>, Vinod Koul <vinod.koul@intel.com>, Dan Williams <dan.j.williams@intel.com>

On 02/23/12 02:21, Arnd Bergmann wrote:
> On Tuesday 21 February 2012, Heiko St=FCbner wrote:
>> Signed-off-by: Heiko Stuebner<heiko@sntech.de>
>> ---
>>   arch/arm/mach-s3c24xx/Kconfig  |   18 +
>>   arch/arm/mach-s3c24xx/Makefile |    1 +
>>   arch/arm/mach-s3c24xx/dma.c    | 1469 ++++++++++++++++++++++++++++=
++++++++++++
>>   arch/arm/plat-s3c24xx/Kconfig  |   16 -
>>   arch/arm/plat-s3c24xx/Makefile |    1 -
>>   arch/arm/plat-s3c24xx/dma.c    | 1469 ----------------------------=
------------
>>   6 files changed, 1488 insertions(+), 1486 deletions(-)
>>   create mode 100644 arch/arm/mach-s3c24xx/dma.c
>>   delete mode 100644 arch/arm/plat-s3c24xx/dma.c
>>
>
> Wouldn't it be more appropriate to move this driver to
> drivers/dma/s3c24xx-dma.c instead?
>
Basically I agree, it is just specific dma only for s3c24xx though.

I think, for that, we need to update its driver when moving.

> Even if it doesn't (yet) use the dmaengine API, I think it's
> valuable to keep drivers with the same purpose together. We have
> had similar discussions in other subsystems and ended up moving
> the drivers into one directory first, followed by a conversion
> to a common API (if someone could be motivated to do that work).
>
Yes, and we need to move s3c24xx cpufreq to drivers/cpufreq and it will=
=20
be done soon.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
