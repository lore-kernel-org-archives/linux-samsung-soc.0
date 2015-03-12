From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [PATCH] phy: exynos-mipi-video: Fix unbalanced lock on non-regmap
 path
Date: Thu, 12 Mar 2015 11:02:43 +0530
Message-ID: <550124FB.2080506@ti.com>
References: <1426032383.5707.1.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bear.ext.ti.com ([192.94.94.41]:56044 "EHLO bear.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751107AbbCLFc5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 12 Mar 2015 01:32:57 -0400
In-Reply-To: <1426032383.5707.1.camel@phoenix>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>
Cc: Julia Lawall <Julia.Lawall@lip6.fr>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, Kyungmin Park <kyungmin.park@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>



On Wednesday 11 March 2015 05:36 AM, Axel Lin wrote:
> Remove the second lock on non-regmap path.
>
> Fixes: 278270e39efa (phy: exynos-mipi-video: Use spin_lock to protct state->regmap rmw operations)
> Reported-by: Julia Lawall <Julia.Lawall@lip6.fr>
> Signed-off-by: Axel Lin <axel.lin@ingics.com>

merged after squashing it with the original patch.

Thanks
Kishon
> ---
>   drivers/phy/phy-exynos-mipi-video.c | 1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/drivers/phy/phy-exynos-mipi-video.c b/drivers/phy/phy-exynos-mipi-video.c
> index 8d6d117..df7519a 100644
> --- a/drivers/phy/phy-exynos-mipi-video.c
> +++ b/drivers/phy/phy-exynos-mipi-video.c
> @@ -75,7 +75,6 @@ static int __set_phy_state(struct exynos_mipi_video_phy *state,
>   	} else {
>   		addr = state->regs + EXYNOS_MIPI_PHY_CONTROL(id / 2);
>
> -		spin_lock(&state->slock);
>   		val = readl(addr);
>   		if (on)
>   			val |= reset;
>
