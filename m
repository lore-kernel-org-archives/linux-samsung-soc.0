From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH v7 9/9] drm: exynos: exynos_hdmi: use
 cec_notifier_conn_(un)register
Date: Mon, 19 Aug 2019 11:32:50 +0200
Message-ID: <afb078a4-fcc0-348f-a44a-1bc42f9d0562@xs4all.nl>
References: <20190814104520.6001-1-darekm@google.com>
 <20190814104520.6001-10-darekm@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190814104520.6001-10-darekm@google.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dariusz Marcinkiewicz <darekm@google.com>, dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org, David Airlie <airlied@linux.ie>, Seung-Woo Kim <sw0312.kim@samsung.com>, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On 8/14/19 12:45 PM, Dariusz Marcinkiewicz wrote:
> Use the new cec_notifier_conn_(un)register() functions to
> (un)register the notifier for the HDMI connector, and fill in
> the cec_connector_info.
> 
> Changes since v2:
> 	- removed unnecessary call to invalidate phys address before
> 	deregistering the notifier,
> 	- use cec_notifier_phys_addr_invalidate instead of setting
> 	invalid address on a notifier.
> 
> Signed-off-by: Dariusz Marcinkiewicz <darekm@google.com>
> Tested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Regards,

	Hans

> ---
>  drivers/gpu/drm/exynos/exynos_hdmi.c | 31 ++++++++++++++++------------
>  1 file changed, 18 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
> index bc1565f1822ab..d532b468d9af5 100644
> --- a/drivers/gpu/drm/exynos/exynos_hdmi.c
> +++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
> @@ -852,6 +852,10 @@ static enum drm_connector_status hdmi_detect(struct drm_connector *connector,
>  
>  static void hdmi_connector_destroy(struct drm_connector *connector)
>  {
> +	struct hdmi_context *hdata = connector_to_hdmi(connector);
> +
> +	cec_notifier_conn_unregister(hdata->notifier);
> +
>  	drm_connector_unregister(connector);
>  	drm_connector_cleanup(connector);
>  }
> @@ -935,6 +939,7 @@ static int hdmi_create_connector(struct drm_encoder *encoder)
>  {
>  	struct hdmi_context *hdata = encoder_to_hdmi(encoder);
>  	struct drm_connector *connector = &hdata->connector;
> +	struct cec_connector_info conn_info;
>  	int ret;
>  
>  	connector->interlace_allowed = true;
> @@ -957,6 +962,15 @@ static int hdmi_create_connector(struct drm_encoder *encoder)
>  			DRM_DEV_ERROR(hdata->dev, "Failed to attach bridge\n");
>  	}
>  
> +	cec_fill_conn_info_from_drm(&conn_info, connector);
> +
> +	hdata->notifier = cec_notifier_conn_register(hdata->dev, NULL,
> +						     &conn_info);
> +	if (hdata->notifier == NULL) {
> +		ret = -ENOMEM;
> +		DRM_DEV_ERROR(hdata->dev, "Failed to allocate CEC notifier\n");
> +	}
> +
>  	return ret;
>  }
>  
> @@ -1528,8 +1542,8 @@ static void hdmi_disable(struct drm_encoder *encoder)
>  		 */
>  		mutex_unlock(&hdata->mutex);
>  		cancel_delayed_work(&hdata->hotplug_work);
> -		cec_notifier_set_phys_addr(hdata->notifier,
> -					   CEC_PHYS_ADDR_INVALID);
> +		if (hdata->notifier)
> +			cec_notifier_phys_addr_invalidate(hdata->notifier);
>  		return;
>  	}
>  
> @@ -2006,12 +2020,6 @@ static int hdmi_probe(struct platform_device *pdev)
>  		}
>  	}
>  
> -	hdata->notifier = cec_notifier_get(&pdev->dev);
> -	if (hdata->notifier == NULL) {
> -		ret = -ENOMEM;
> -		goto err_hdmiphy;
> -	}
> -
>  	pm_runtime_enable(dev);
>  
>  	audio_infoframe = &hdata->audio.infoframe;
> @@ -2023,7 +2031,7 @@ static int hdmi_probe(struct platform_device *pdev)
>  
>  	ret = hdmi_register_audio_device(hdata);
>  	if (ret)
> -		goto err_notifier_put;
> +		goto err_runtime_disable;
>  
>  	ret = component_add(&pdev->dev, &hdmi_component_ops);
>  	if (ret)
> @@ -2034,8 +2042,7 @@ static int hdmi_probe(struct platform_device *pdev)
>  err_unregister_audio:
>  	platform_device_unregister(hdata->audio.pdev);
>  
> -err_notifier_put:
> -	cec_notifier_put(hdata->notifier);
> +err_runtime_disable:
>  	pm_runtime_disable(dev);
>  
>  err_hdmiphy:
> @@ -2054,12 +2061,10 @@ static int hdmi_remove(struct platform_device *pdev)
>  	struct hdmi_context *hdata = platform_get_drvdata(pdev);
>  
>  	cancel_delayed_work_sync(&hdata->hotplug_work);
> -	cec_notifier_set_phys_addr(hdata->notifier, CEC_PHYS_ADDR_INVALID);
>  
>  	component_del(&pdev->dev, &hdmi_component_ops);
>  	platform_device_unregister(hdata->audio.pdev);
>  
> -	cec_notifier_put(hdata->notifier);
>  	pm_runtime_disable(&pdev->dev);
>  
>  	if (!IS_ERR(hdata->reg_hdmi_en))
> 
