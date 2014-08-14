From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH] drm/exynos: dsi: fix exynos_dsi_set_pll() wrong return
 value
Date: Thu, 14 Aug 2014 09:21:14 +0200
Message-ID: <53EC636A.9020402@samsung.com>
References: <1407982956-18923-1-git-send-email-yj44.cho@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1407982956-18923-1-git-send-email-yj44.cho@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: YoungJun Cho <yj44.cho@samsung.com>, airlied@linux.ie, dri-devel@lists.freedesktop.org
Cc: kgene.kim@samsung.com, sw0312.kim@samsung.com, kyungmin.park@samsung.com, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi YoungJun,

Thanks for spotting it.

On 08/14/2014 04:22 AM, YoungJun Cho wrote:
> The type of this function is unsigned long, and it is expected
> to return proper fout value or zero if something is wrong.
> So this patch fixes wrong return value for error cases.
>
> Signed-off-by: YoungJun Cho <yj44.cho@samsung.com>
> Acked-by: Inki Dae <inki.dae@samsung.com>
> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
Acked-by: Andrzej Hajda <a.hajda@samsung.com>

Regards
Andrzej
> ---
>  drivers/gpu/drm/exynos/exynos_drm_dsi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> index 86aebd8..061017b 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> @@ -421,7 +421,7 @@ static unsigned long exynos_dsi_set_pll(struct exynos_dsi *dsi,
>  	if (!fout) {
>  		dev_err(dsi->dev,
>  			"failed to find PLL PMS for requested frequency\n");
> -		return -EFAULT;
> +		return 0;
>  	}
>  	dev_dbg(dsi->dev, "PLL freq %lu, (p %d, m %d, s %d)\n", fout, p, m, s);
>  
> @@ -453,7 +453,7 @@ static unsigned long exynos_dsi_set_pll(struct exynos_dsi *dsi,
>  	do {
>  		if (timeout-- == 0) {
>  			dev_err(dsi->dev, "PLL failed to stabilize\n");
> -			return -EFAULT;
> +			return 0;
>  		}
>  		reg = readl(dsi->reg_base + DSIM_STATUS_REG);
>  	} while ((reg & DSIM_PLL_STABLE) == 0);
