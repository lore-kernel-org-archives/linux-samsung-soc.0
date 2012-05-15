From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 1/2] ARM: S3C64XX: Initial hookup for Bells module on
 Cragganmore
Date: Tue, 15 May 2012 17:58:40 +0900
Message-ID: <07fd01cd3278$ec7c0ef0$c5742cd0$%kim@samsung.com>
References: <1337016041-16096-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:52152 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758312Ab2EOI6j (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 May 2012 04:58:39 -0400
Received: from epcpsbgm1.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M42003103IFV5C0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 15 May 2012 17:58:37 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M42004T73LP6A00@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 15 May 2012 17:58:37 +0900 (KST)
In-reply-to: <1337016041-16096-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Mark Brown' <broonie@opensource.wolfsonmicro.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, patches@opensource.wolfsonmicro.com

Mark Brown wrote:
> 
> The Bells module now has a number assigned to it. Also hook up the WM9081
> which is soldered down onto the board.
> 
> Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
> ---
>  arch/arm/mach-s3c64xx/mach-crag6410-module.c |    9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/mach-s3c64xx/mach-crag6410-module.c b/arch/arm/mach-s3c64xx/mach-crag6410-
> module.c
> index 0c9b0cb..dbd5771 100644
> --- a/arch/arm/mach-s3c64xx/mach-crag6410-module.c
> +++ b/arch/arm/mach-s3c64xx/mach-crag6410-module.c
> @@ -192,6 +192,11 @@ static const struct i2c_board_info wm1277_devs[] = {
>  	},
>  };
> 
> +static const struct i2c_board_info wm6230_i2c_devs[] = {
> +	{ I2C_BOARD_INFO("wm9081", 0x6c),
> +	  .platform_data = &wm9081_pdata, },
> +};
> +
>  static __devinitdata const struct {
>  	u8 id;
>  	const char *name;
> @@ -205,7 +210,9 @@ static __devinitdata const struct {
>  	{ .id = 0x03, .name = "1252-EV1 Glenlivet" },
>  	{ .id = 0x11, .name = "6249-EV2 Glenfarclas", },
>  	{ .id = 0x14, .name = "6271-EV1 Lochnagar" },
> -	{ .id = 0x15, .name = "XXXX-EV1 Bells" },
> +	{ .id = 0x15, .name = "6320-EV1 Bells",
> +	  .i2c_devs = wm6230_i2c_devs,
> +	  .num_i2c_devs = ARRAY_SIZE(wm6230_i2c_devs) },
>  	{ .id = 0x21, .name = "1275-EV1 Mortlach" },
>  	{ .id = 0x25, .name = "1274-EV1 Glencadam" },
>  	{ .id = 0x31, .name = "1253-EV1 Tomatin",
> --
> 1.7.10

OK, will apply.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
