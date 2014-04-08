From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 4/4] Revert
 "drm/exynos: add mout_hdmi clock in hdmi driver to change parent"
Date: Tue, 08 Apr 2014 17:52:11 +0200
Message-ID: <53441B2B.1020001@samsung.com>
References: <1396623201-26000-1-git-send-email-t.stanislaws@samsung.com>
 <1396623201-26000-5-git-send-email-t.stanislaws@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1396623201-26000-5-git-send-email-t.stanislaws@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Tomasz Stanislawski <t.stanislaws@samsung.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: kgene.kim@samsung.com, mturquette@linaro.org, sw0312.kim@samsung.com, rob.herring@calxeda.com, kishon@ti.com, a.hajda@samsung.com, kyungmin.park@samsung.com, sylvester.nawrocki@gmail.com
List-Id: linux-samsung-soc@vger.kernel.org

Hi Tomasz,

On 04.04.2014 16:53, Tomasz Stanislawski wrote:
> This reverts commit 59956d35a8618235ea715280b49447bb36f2c975.
>

Probably a reason why this commit is being reverted would be a good idea.

> Signed-off-by: Tomasz Stanislawski <t.stanislaws@samsung.com>
> ---
>   drivers/gpu/drm/exynos/exynos_hdmi.c |   14 ++++----------
>   1 file changed, 4 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
> index 9a6d652..8ebb4bf 100644
> --- a/drivers/gpu/drm/exynos/exynos_hdmi.c
> +++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
> @@ -75,7 +75,6 @@ struct hdmi_resources {
>   	struct clk			*sclk_pixel;
>   	struct clk			*sclk_hdmiphy;
>   	struct clk			*hdmiphy;
> -	struct clk			*mout_hdmi;
>   	struct regulator_bulk_data	*regul_bulk;
>   	int				regul_count;
>   };
> @@ -1282,7 +1281,7 @@ static void hdmi_v13_mode_apply(struct hdmi_context *hdata)
>   	}
>
>   	clk_disable_unprepare(hdata->res.sclk_hdmi);
> -	clk_set_parent(hdata->res.mout_hdmi, hdata->res.sclk_hdmiphy);
> +	clk_set_parent(hdata->res.sclk_hdmi, hdata->res.sclk_hdmiphy);
>   	clk_prepare_enable(hdata->res.sclk_hdmi);
>
>   	/* enable HDMI and timing generator */
> @@ -1449,7 +1448,7 @@ static void hdmi_v14_mode_apply(struct hdmi_context *hdata)
>   	}
>
>   	clk_disable_unprepare(hdata->res.sclk_hdmi);
> -	clk_set_parent(hdata->res.mout_hdmi, hdata->res.sclk_hdmiphy);
> +	clk_set_parent(hdata->res.sclk_hdmi, hdata->res.sclk_hdmiphy);
>   	clk_prepare_enable(hdata->res.sclk_hdmi);
>
>   	/* enable HDMI and timing generator */
> @@ -1475,7 +1474,7 @@ static void hdmiphy_conf_reset(struct hdmi_context *hdata)
>   	u32 reg;
>
>   	clk_disable_unprepare(hdata->res.sclk_hdmi);
> -	clk_set_parent(hdata->res.mout_hdmi, hdata->res.sclk_pixel);
> +	clk_set_parent(hdata->res.sclk_hdmi, hdata->res.sclk_pixel);
>   	clk_prepare_enable(hdata->res.sclk_hdmi);
>
>   	/* operation mode */
> @@ -1982,13 +1981,8 @@ static int hdmi_resources_init(struct hdmi_context *hdata)
>   		DRM_ERROR("failed to get clock 'hdmiphy'\n");
>   		goto fail;
>   	}
> -	res->mout_hdmi = devm_clk_get(dev, "mout_hdmi");
> -	if (IS_ERR(res->mout_hdmi)) {
> -		DRM_ERROR("failed to get clock 'mout_hdmi'\n");
> -		goto fail;
> -	}
>
> -	clk_set_parent(res->mout_hdmi, res->sclk_pixel);
> +	clk_set_parent(res->sclk_hdmi, res->sclk_pixel);
>
>   	res->regul_bulk = devm_kzalloc(dev, ARRAY_SIZE(supply) *
>   		sizeof(res->regul_bulk[0]), GFP_KERNEL);
>

Otherwise looks fine and will apply after all its dependencies are 
agreed upon.

Best regards,
Tomasz
