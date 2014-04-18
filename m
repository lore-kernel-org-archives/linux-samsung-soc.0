From: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH 4/7] drm/exynos: add exynos_dp_panel driver registration to
 drm driver
Date: Fri, 18 Apr 2014 17:57:03 +0900
Message-ID: <000201cf5ae4$2b073650$8115a2f0$%han@samsung.com>
References: <1397658786-26138-1-git-send-email-ajaykumar.rs@samsung.com>
 <1397658786-26138-5-git-send-email-ajaykumar.rs@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1397658786-26138-5-git-send-email-ajaykumar.rs@samsung.com>
Content-language: ko
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: 'Ajay Kumar' <ajaykumar.rs@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, seanpaul@google.com, abrestic@chromium.org, joshi@samsung.com, dri-devel@lists.freedesktop.org, a.hajda@samsung.com, kyungmin.park@samsung.com, ajaynumb@gmail.com, treding@nvidia.com, prashanth.g@samsung.com, rahul.sharma@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

On Wednesday, April 16, 2014 11:33 PM, Ajay Kumar wrote:
> 
> Register exynos_dp_panel before the list of exynos crtcs and
> connectors are probed.
> 
> This is needed because exynos_dp_panel should be registered to
> the drm_panel list via panel-exynos-dp probe, i.e much before
> exynos_dp_bind calls of_drm_find_panel().
> 
> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_drv.c | 11 +++++++++++
>  drivers/gpu/drm/exynos/exynos_drm_drv.h |  1 +
>  2 files changed, 12 insertions(+)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
> index 1d1c604..47266e7 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
> @@ -560,12 +560,23 @@ static int exynos_drm_platform_probe(struct platform_device *pdev)
>  		goto err_unregister_ipp;
>  #endif
> 
> +#ifdef CONFIG_DRM_PANEL_EXYNOS_DP
> +	ret = platform_driver_register(&exynos_dp_panel_driver);
> +	if (ret < 0)
> +		goto err_unregister_dp_panel;
> +#endif
> +
>  	ret = component_master_add(&pdev->dev, &exynos_drm_ops);
>  	if (ret < 0)
>  		DRM_DEBUG_KMS("re-tried by last sub driver probed later.\n");
> 
>  	return 0;
> 
> +#ifdef CONFIG_DRM_PANEL_EXYNOS_DP
> +	platform_driver_unregister(&exynos_dp_panel_driver);
> +err_unregister_dp_panel:
> +#endif

Please add platform_driver_unregister() to exynos_drm_platform_remove(),
as well as exynos_drm_platform_probe().

Best regards,
Jingoo Han

> +
>  #ifdef CONFIG_DRM_EXYNOS_IPP
>  	exynos_platform_device_ipp_unregister();
>  err_unregister_ipp:
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
> index 257ce09..f606290 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
> @@ -368,4 +368,5 @@ extern struct platform_driver fimc_driver;
>  extern struct platform_driver rotator_driver;
>  extern struct platform_driver gsc_driver;
>  extern struct platform_driver ipp_driver;
> +extern struct platform_driver exynos_dp_panel_driver;
>  #endif
> --
> 1.8.1.2
