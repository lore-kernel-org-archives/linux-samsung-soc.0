From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [RFC 4/4] drm: exynos: add MDNIE and IELCD to FIMD pp list
Date: Tue, 01 Apr 2014 11:06:53 +0200
Message-ID: <533A81AD.8010307@samsung.com>
References: <1395238975-24600-1-git-send-email-ajaykumar.rs@samsung.com>
 <1395238975-24600-5-git-send-email-ajaykumar.rs@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1395238975-24600-5-git-send-email-ajaykumar.rs@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Ajay Kumar <ajaykumar.rs@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Shirish S <s.shirish@samsung.com>, seanpaul@google.com, sw0312.kim@samsung.com, joshi@samsung.com, ajaynumb@gmail.com, marcheu@chromium.org, prashanth.g@samsung.com, Rahul Sharma <rahul.sharma@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Ajay,

Thanks for the patch.

On 03/19/2014 03:22 PM, Ajay Kumar wrote:
> This patch adds code to add MDNIE and IELCD onto the
> list of FIMD PP.
> 
> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> Signed-off-by: Shirish S <s.shirish@samsung.com>
> Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_fimd.c | 17 +++++++++++++++++
>  drivers/gpu/drm/exynos/exynos_fimd_pp.h  |  2 ++
>  2 files changed, 19 insertions(+)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> index a584d8e..d5a32fb 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> @@ -160,8 +160,25 @@ static int fimd_mgr_initialize(struct exynos_drm_manager *mgr,
>  {
>  	struct fimd_context *ctx = mgr->ctx;
>  	struct exynos_drm_private *priv;
> +	struct exynos_fimd_pp *mdnie_pp = NULL, *ielcd_pp = NULL;
> +	int ret;
> +
>  	priv = drm_dev->dev_private;
>  
> +	ret = exynos_mdnie_init(ctx->dev, &mdnie_pp);
> +	if (!ret && mdnie_pp) {

Why do not check ret only?

> +		ret = exynos_ielcd_init(ctx->dev, &ielcd_pp);
> +		if (!ret && ielcd_pp) {
> +			fimd_add_pp_to_list(ctx, mdnie_pp);
> +			fimd_add_pp_to_list(ctx, ielcd_pp);
> +			ctx->enable_pp = true;
> +			ctx->pp_running = false;
> +		} else {
> +			DRM_INFO("No ielcd node present, "
> +					"MDNIE feature will be disabled\n");
> +		}
> +	}
> +

You can put it all into separate routine and you will have much cleaner
code:
{
	...
	ret = exynos_mdnie_init(ctx->dev, &mdnie_pp);
	if (!ret)
		return ret;

	ret = exynos_ielcd_init(ctx->dev, &ielcd_pp);
	if (!ret)
		return ret;

	fimd_add_pp_to_list(ctx, mdnie_pp);
	fimd_add_pp_to_list(ctx, ielcd_pp);
	ctx->enable_pp = true;
	ctx->pp_running = false;
}

Anyway, there is no removal code.

Regards
Andrzej

>  	mgr->drm_dev = ctx->drm_dev = drm_dev;
>  	mgr->pipe = ctx->pipe = priv->pipe++;
>  
> diff --git a/drivers/gpu/drm/exynos/exynos_fimd_pp.h b/drivers/gpu/drm/exynos/exynos_fimd_pp.h
> index 528d3cb..b980742 100644
> --- a/drivers/gpu/drm/exynos/exynos_fimd_pp.h
> +++ b/drivers/gpu/drm/exynos/exynos_fimd_pp.h
> @@ -49,4 +49,6 @@ struct exynos_fimd_pp {
>  	void *ctx;
>  };
>  
> +extern int exynos_mdnie_init(struct device *dev, struct exynos_fimd_pp **pp);
> +extern int exynos_ielcd_init(struct device *dev, struct exynos_fimd_pp **pp);
>  #endif
> 
