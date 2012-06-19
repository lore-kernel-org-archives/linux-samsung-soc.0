From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 1/2] ARM: S3C64XX: Add module identification for Balblair
 Cragganmore module
Date: Tue, 19 Jun 2012 17:50:11 +0900
Message-ID: <019701cd4df8$89387860$9ba96920$%kim@samsung.com>
References: <1338398378-18268-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:8467 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752251Ab2FSIuM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 19 Jun 2012 04:50:12 -0400
Received: from epcpsbgm1.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M5U004DNWELQO60@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 19 Jun 2012 17:50:12 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M5U00G0IWJNIRG0@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 19 Jun 2012 17:50:11 +0900 (KST)
In-reply-to: <1338398378-18268-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Mark Brown' <broonie@opensource.wolfsonmicro.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, patches@opensource.wolfsonmicro.com

Mark Brown wrote:
> 
> Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
> ---
>  arch/arm/mach-s3c64xx/mach-crag6410-module.c |    1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/mach-s3c64xx/mach-crag6410-module.c b/arch/arm/mach-
> s3c64xx/mach-crag6410-module.c
> index dbd5771..985e255 100644
> --- a/arch/arm/mach-s3c64xx/mach-crag6410-module.c
> +++ b/arch/arm/mach-s3c64xx/mach-crag6410-module.c
> @@ -219,6 +219,7 @@ static __devinitdata const struct {
>  	  .spi_devs = wm1253_devs, .num_spi_devs =
> ARRAY_SIZE(wm1253_devs) },
>  	{ .id = 0x32, .name = "XXXX-EV1 Caol Illa" },
>  	{ .id = 0x33, .name = "XXXX-EV1 Oban" },
> +	{ .id = 0x34, .name = "WM0010-6320-CS42 Balblair" },
>  	{ .id = 0x39, .name = "1254-EV1 Dallas Dhu",
>  	  .i2c_devs = wm1254_devs, .num_i2c_devs =
> ARRAY_SIZE(wm1254_devs) },
>  	{ .id = 0x3a, .name = "1259-EV1 Tobermory",
> --
> 1.7.10

OK, will apply.
Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
