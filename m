From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v7 9/9] drm: exynos: exynos_hdmi: use
 cec_notifier_conn_(un)register
Date: Wed, 28 Aug 2019 10:39:51 +0200
Message-ID: <6bbfb6f8-15c2-9ad2-8857-898f4c6435a3@samsung.com>
References: <20190814104520.6001-1-darekm@google.com>
        <CGME20190814104630epcas3p44755443f37e78b2613f7dda35d71bb71@epcas3p4.samsung.com>
        <20190814104520.6001-10-darekm@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190814104520.6001-10-darekm@google.com>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Dariusz Marcinkiewicz <darekm@google.com>, dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl
Cc: Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On 8/14/19 12:45, Dariusz Marcinkiewicz wrote:
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

Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>

> diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
> index bc1565f1822ab..d532b468d9af5 100644
> --- a/drivers/gpu/drm/exynos/exynos_hdmi.c
> +++ b/drivers/gpu/drm/exynos/exynos_hdmi.c

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


> -err_notifier_put:
> -	cec_notifier_put(hdata->notifier);
> +err_runtime_disable:
>  	pm_runtime_disable(dev);

nit: I think err_rpm_disable or err_pm_runtime_disable could be better 
     label names.

-- 
Thanks,
Sylwester
