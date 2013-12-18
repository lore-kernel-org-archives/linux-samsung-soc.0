From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH] clk: samsung: exynos4: Correct SRC_MFC register
Date: Wed, 18 Dec 2013 15:54:30 +0100
Message-ID: <4859492.2SOgx7UbdE@amdc1227>
References: <1385097668-24620-1-git-send-email-sw0312.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:16675 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755189Ab3LROys (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 18 Dec 2013 09:54:48 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MY000HNLC3A0600@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 18 Dec 2013 14:54:46 +0000 (GMT)
In-reply-to: <1385097668-24620-1-git-send-email-sw0312.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Seung-Woo Kim <sw0312.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, mturquette@linaro.org, kgene.kim@samsung.com, kyungmin.park@samsung.com

On Friday 22 of November 2013 14:21:08 Seung-Woo Kim wrote:
> The SRC_MFC register was incorrect. This patch corrects it.
> 
> Signed-off-by: Seung-Woo Kim <sw0312.kim@samsung.com>
> ---
>  drivers/clk/samsung/clk-exynos4.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/clk/samsung/clk-exynos4.c b/drivers/clk/samsung/clk-exynos4.c
> index ad5ff50..1a7c1b9 100644
> --- a/drivers/clk/samsung/clk-exynos4.c
> +++ b/drivers/clk/samsung/clk-exynos4.c
> @@ -39,7 +39,7 @@
>  #define SRC_TOP1		0xc214
>  #define SRC_CAM			0xc220
>  #define SRC_TV			0xc224
> -#define SRC_MFC			0xcc28
> +#define SRC_MFC			0xc228
>  #define SRC_G3D			0xc22c
>  #define E4210_SRC_IMAGE		0xc230
>  #define SRC_LCD0		0xc234
> 

Applied into samsung-clk fixes branch.

Best regards,
Tomasz
