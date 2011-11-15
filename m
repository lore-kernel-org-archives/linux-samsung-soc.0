From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 2/2] MAINTAINERS: Extend Samsung patterns to cover SPI and
 ASoC drivers
Date: Tue, 15 Nov 2011 18:14:22 +0900
Message-ID: <005701cca376$f6abbba0$e40332e0$%kim@samsung.com>
References: <1320923776-26626-1-git-send-email-broonie@opensource.wolfsonmicro.com>
 <1320923776-26626-2-git-send-email-broonie@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:17949 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754062Ab1KOJOY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 Nov 2011 04:14:24 -0500
Received: from epcpsbgm2.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LUP003QP2ZC53S0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 15 Nov 2011 18:14:23 +0900 (KST)
Received: from kgenekim ([12.23.120.114])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LUP000LH2ZYGQ50@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Tue, 15 Nov 2011 18:14:22 +0900 (KST)
In-reply-to: <1320923776-26626-2-git-send-email-broonie@opensource.wolfsonmicro.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Mark Brown' <broonie@opensource.wolfsonmicro.com>, 'Ben Dooks' <ben-linux@fluff.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, patches@opensource.wolfsonmicro.com, grant.likely@secretlab.ca

Mark Brown wrote:
> 
> Help people find the overall architecture.
> 
> Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
> ---
>  MAINTAINERS |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a21d4fb..9eca526 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1054,6 +1054,8 @@ F:	arch/arm/plat-s3c24xx/
>  F:	arch/arm/plat-s5p/
>  F:	drivers/*/*s3c2410*
>  F:	drivers/*/*/*s3c2410*
> +F:	drivers/spi/spi-s3c*
> +F:	sound/soc/samsung/*
> 
>  ARM/S3C2410 ARM ARCHITECTURE
>  M:	Ben Dooks <ben-linux@fluff.org>
> --
> 1.7.7.2

Hmm, I'm ok on this but needs Grant's opinion :)

(Cc'ed Grant Likely)

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
