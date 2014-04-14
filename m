From: Tomasz Stanislawski <t.stanislaws@samsung.com>
Subject: Re: [PATCH 1/4] drm: exynos: hdmi: simplify extracting hpd-gpio from
 DT
Date: Mon, 14 Apr 2014 17:49:53 +0200
Message-ID: <534C03A1.6040005@samsung.com>
References: <1397487622-3577-1-git-send-email-t.stanislaws@samsung.com>
 <1397487622-3577-2-git-send-email-t.stanislaws@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1397487622-3577-2-git-send-email-t.stanislaws@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Cc: pawel.moll@arm.com, b.zolnierkie@samsung.com, sw0312.kim@samsung.com, kyungmin.park@samsung.com, robh+dt@kernel.org, m.chehab@samsung.com, rahul.sharma@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

On 04/14/2014 05:00 PM, Tomasz Stanislawski wrote:
> This patch eliminates redundant checks while retrieving HPD gpio from DT during
> HDMI's probe().
> 
> Signed-off-by: Tomasz Stanislawski <t.stanislaws@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_hdmi.c |   13 ++++---------
>  1 file changed, 4 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
> index 9a6d652..d2d6e2e 100644
> --- a/drivers/gpu/drm/exynos/exynos_hdmi.c
> +++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
> @@ -2016,23 +2016,18 @@ static struct s5p_hdmi_platform_data *drm_hdmi_dt_parse_pdata
>  {
>  	struct device_node *np = dev->of_node;
>  	struct s5p_hdmi_platform_data *pd;
> -	u32 value;
>  
>  	pd = devm_kzalloc(dev, sizeof(*pd), GFP_KERNEL);
>  	if (!pd)
> -		goto err_data;
> +		return NULL;
>  
> -	if (!of_find_property(np, "hpd-gpio", &value)) {
> +	pd->hpd_gpio = of_get_named_gpio(np, "hpd-gpio", 0);
> +	if (gpio_is_valid(pd->hpd_gpio)) {

Sorry. Should be !gpio_is_valid().

>  		DRM_ERROR("no hpd gpio property found\n");
> -		goto err_data;
> +		return NULL;
>  	}
>  
> -	pd->hpd_gpio = of_get_named_gpio(np, "hpd-gpio", 0);
> -
>  	return pd;
> -
> -err_data:
> -	return NULL;
>  }
>  
>  static struct of_device_id hdmi_match_types[] = {
> 
