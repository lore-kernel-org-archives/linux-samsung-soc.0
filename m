From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: SAMSUNG: Add missing variable declaration in
 s3c64xx_spi1_set_platdata()
Date: Fri, 14 Sep 2012 13:41:38 +0900
Message-ID: <01af01cd9233$3a4b4050$aee1c0f0$%kim@samsung.com>
References: <1347542282-11954-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:9522 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751390Ab2INElj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 14 Sep 2012 00:41:39 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MAB00ME7P0YOPK0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 14 Sep 2012 13:41:38 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.199])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MAB00IGHP1EBLE0@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 14 Sep 2012 13:41:38 +0900 (KST)
In-reply-to: <1347542282-11954-1-git-send-email-s.nawrocki@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sylwester Nawrocki' <s.nawrocki@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, sw0312.kim@samsung.com, 'Kyungmin Park' <kyungmin.park@samsung.com>

Sylwester Nawrocki wrote:
> 
> Fixes regression introduced in commit 4d0efdd5889b1c81a62aa07a
> "ARM: SAMSUNG: Modify s3c64xx_spi{0|1|2}_set_platdata function"
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  arch/arm/plat-samsung/devs.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm/plat-samsung/devs.c b/arch/arm/plat-samsung/devs.c
> index fc49f3d..2195209 100644
> --- a/arch/arm/plat-samsung/devs.c
> +++ b/arch/arm/plat-samsung/devs.c
> @@ -1591,6 +1591,8 @@ struct platform_device s3c64xx_device_spi1 = {
>  void __init s3c64xx_spi1_set_platdata(int (*cfg_gpio)(void), int
> src_clk_nr,
>  						int num_cs)
>  {
> +	struct s3c64xx_spi_info pd;
> +
>  	/* Reject invalid configuration */
>  	if (!num_cs || src_clk_nr < 0) {
>  		pr_err("%s: Invalid SPI configuration\n", __func__);
> --
> 1.7.11.3

Applied, thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
