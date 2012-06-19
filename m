From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 2/2] ARM: S3C64XX: Add WM5102 EVM to Cragganmore modules
Date: Tue, 19 Jun 2012 17:50:15 +0900
Message-ID: <019801cd4df8$8bcf9e00$a36eda00$%kim@samsung.com>
References: <1338398378-18268-1-git-send-email-broonie@opensource.wolfsonmicro.com>
 <1338398378-18268-2-git-send-email-broonie@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:46913 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753624Ab2FSIuR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 19 Jun 2012 04:50:17 -0400
Received: from epcpsbgm2.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M5U00G3XWJF0EB0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 19 Jun 2012 17:50:16 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M5U00GDZWJS4380@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 19 Jun 2012 17:50:16 +0900 (KST)
In-reply-to: <1338398378-18268-2-git-send-email-broonie@opensource.wolfsonmicro.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Mark Brown' <broonie@opensource.wolfsonmicro.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, patches@opensource.wolfsonmicro.com

Mark Brown wrote:
> 
> No platform data yet as driver is not yet merged.
> 
> Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
> ---
>  arch/arm/mach-s3c64xx/mach-crag6410-module.c |    7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm/mach-s3c64xx/mach-crag6410-module.c b/arch/arm/mach-
> s3c64xx/mach-crag6410-module.c
> index 985e255..f80761c 100644
> --- a/arch/arm/mach-s3c64xx/mach-crag6410-module.c
> +++ b/arch/arm/mach-s3c64xx/mach-crag6410-module.c
> @@ -192,6 +192,11 @@ static const struct i2c_board_info wm1277_devs[] = {
>  	},
>  };
> 
> +static const struct i2c_board_info wm5102_devs[] = {
> +	{ I2C_BOARD_INFO("wm5102", 0x1a),
> +	  .irq = GLENFARCLAS_PMIC_IRQ_BASE + WM831X_IRQ_GPIO_2, },
> +};
> +
>  static const struct i2c_board_info wm6230_i2c_devs[] = {
>  	{ I2C_BOARD_INFO("wm9081", 0x6c),
>  	  .platform_data = &wm9081_pdata, },
> @@ -229,6 +234,8 @@ static __devinitdata const struct {
>  	{ .id = 0x3c, .name = "1273-EV1 Longmorn" },
>  	{ .id = 0x3d, .name = "1277-EV1 Littlemill",
>  	  .i2c_devs = wm1277_devs, .num_i2c_devs =
> ARRAY_SIZE(wm1277_devs) },
> +	{ .id = 0x3e, .name = "WM5102-6271-EV1-CS127",
> +	  .i2c_devs = wm5102_devs, .num_i2c_devs =
> ARRAY_SIZE(wm5102_devs) },
>  };
> 
>  static __devinit int wlf_gf_module_probe(struct i2c_client *i2c,
> --
> 1.7.10

OK, will apply.
Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
