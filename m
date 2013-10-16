From: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH] phy: exynos-mipi-video: Fix phy_power_off() callback
Date: Thu, 17 Oct 2013 08:10:13 +0900
Message-ID: <000401cecac4$dea1a7a0$9be4f6e0$%han@samsung.com>
References: <1381940896-9355-1-git-send-email-kishon@ti.com>
 <1381943025-1036-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:20008 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1761317Ab3JPXKP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 16 Oct 2013 19:10:15 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MUS00KDJB0TWJL0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 17 Oct 2013 08:10:14 +0900 (KST)
In-reply-to: <1381943025-1036-1-git-send-email-s.nawrocki@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sylwester Nawrocki' <s.nawrocki@samsung.com>, 'Kishon Vijay Abraham I' <kishon@ti.com>
Cc: 'Greg Kroah-Hartman' <gregkh@linuxfoundation.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Jingoo Han' <jg1.han@samsung.com>

On Thursday, October 17, 2013 2:04 AM, Sylwester Nawrocki wrote:
> 
> Fix argument passed to the register setup helper function so
> the phy is actually disabled. Now due to cut&paste error 1 is
> passed to both phy_power_on() and phy_power_off().
> 
> Reported by: Kyungmin Park <kyungmin.park@samsung.com>
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>

Reviewed-by: Jingoo Han <jg1.han@samsung.com>

Best regards,
Jingoo Han

> ---
> 
> This fixes a cut&paste typo which snicked in while doing very last
> adaptation to latest version of the phy framework.
> 
> Thanks,
> Sylwester
> ---
>  drivers/phy/phy-exynos-mipi-video.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/phy/phy-exynos-mipi-video.c b/drivers/phy/phy-exynos-mipi-video.c
> index b73b86a..0c5efab 100644
> --- a/drivers/phy/phy-exynos-mipi-video.c
> +++ b/drivers/phy/phy-exynos-mipi-video.c
> @@ -93,7 +93,7 @@ static int exynos_mipi_video_phy_power_off(struct phy *phy)
>  	struct video_phy_desc *phy_desc = phy_get_drvdata(phy);
>  	struct exynos_mipi_video_phy *state = to_mipi_video_phy(phy_desc);
> 
> -	return __set_phy_state(state, phy_desc->index, 1);
> +	return __set_phy_state(state, phy_desc->index, 0);
>  }
> 
>  static struct phy *exynos_mipi_video_phy_xlate(struct device *dev,
> --
> 1.7.9.5
