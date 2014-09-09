From: =?UTF-8?B?S3J6eXN6dG9mIEtvesWCb3dza2k=?= <k.kozlowski@samsung.com>
Subject: Re: [PATCH] clk: samsung: exynos3250: fix mout_cam_blk parent list
Date: Tue, 09 Sep 2014 14:24:23 +0200
Message-ID: <540EF177.8090005@samsung.com>
References: <1410008613-20861-1-git-send-email-pankaj.dubey@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:30679 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752908AbaIIMY1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 9 Sep 2014 08:24:27 -0400
In-reply-to: <1410008613-20861-1-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Pankaj Dubey <pankaj.dubey@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: kgene.kim@samsung.com, tomasz.figa@gmail.com, s.nawrocki@samsung.com, mturquette@linaro.org, naushad@samsung.com

On 06.09.2014 15:03, Pankaj Dubey wrote:
> As per user manual of Exynos3250 SRC_CAM can select
> div_cam_blk_320 if it's value is 0xC, so placing
> div_cam_blk_320 at proper index in parent list of mout_cam_blk.
>
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> ---
>   drivers/clk/samsung/clk-exynos3250.c |    1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof

>
> diff --git a/drivers/clk/samsung/clk-exynos3250.c b/drivers/clk/samsung/clk-exynos3250.c
> index e1cb464..ba8f073f 100644
> --- a/drivers/clk/samsung/clk-exynos3250.c
> +++ b/drivers/clk/samsung/clk-exynos3250.c
> @@ -248,6 +248,7 @@ PNAME(group_sclk_cam_blk_p)	= { "xxti", "xusbxti",
>   				    "none", "none", "none",
>   				    "none", "div_mpll_pre",
>   				    "mout_epll_user", "mout_vpll",
> +				    "none", "none", "none",
>   				    "div_cam_blk_320", };
>   PNAME(group_sclk_fimd0_p)	= { "xxti", "xusbxti",
>   				    "m_bitclkhsdiv4_2l", "none",
>
