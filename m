Return-Path: <SRS0=zzT5=4U=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A46DFC3F2C6
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  3 Mar 2020 12:38:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 43CCB2073B
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  3 Mar 2020 12:38:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="jhO24TrP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727577AbgCCMid (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 3 Mar 2020 07:38:33 -0500
Received: from mailout1.w1.samsung.com ([210.118.77.11]:47743 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727440AbgCCMic (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 3 Mar 2020 07:38:32 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20200303123829euoutp015feb7d474a3fca129f0d0ef92602e44a~4y5UGsNQv2692426924euoutp01J
        for <linux-samsung-soc@vger.kernel.org>; Tue,  3 Mar 2020 12:38:29 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20200303123829euoutp015feb7d474a3fca129f0d0ef92602e44a~4y5UGsNQv2692426924euoutp01J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1583239109;
        bh=a0iIExIWe5iQpJ2euOMyvzNYGgkr7OzJxtYg1Y5vtBY=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=jhO24TrP4P4Z8dOv13tkE99kPXH0WFj3EQqUM6FVg5Jiy6vPljAH+pbmPy68Lvzww
         DIuDX9u4+T0GFTsQ1/uBNfWfUh053OrhkUIiowxb9fwzIZJlxTGUgap/OrPgrtoTtH
         PXYdS507M4Iku1376EPsNOCGrrptap/BRzEbrcr0=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200303123829eucas1p1d429cbaf5ec6007e6e5c4d1aac457e28~4y5Tzsyxq0208702087eucas1p1V;
        Tue,  3 Mar 2020 12:38:29 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 79.C5.60698.5CF4E5E5; Tue,  3
        Mar 2020 12:38:29 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200303123829eucas1p2c3b0687b385a078b9ccf584b25bb547f~4y5TYc5Hd2837228372eucas1p2r;
        Tue,  3 Mar 2020 12:38:29 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200303123829eusmtrp2c5bfb347f0fb65d9c27df70df394ca00~4y5TXonJl1058610586eusmtrp29;
        Tue,  3 Mar 2020 12:38:29 +0000 (GMT)
X-AuditID: cbfec7f5-a29ff7000001ed1a-cf-5e5e4fc555e6
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 8D.1B.08375.5CF4E5E5; Tue,  3
        Mar 2020 12:38:29 +0000 (GMT)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200303123828eusmtip2583f9f8913b8fe2fd8f03475d23fbb7e~4y5S3g4wO1024810248eusmtip2C;
        Tue,  3 Mar 2020 12:38:28 +0000 (GMT)
Subject: Re: [PATCH] drm/bridge: analogix_dp: Split bind() into probe() and
 real bind()
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org
Cc:     Jernej Skrabec <jernej.skrabec@siol.net>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Sandy Huang <hjc@rock-chips.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
From:   Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <30f64c8f-2a12-46c2-e5eb-505bbb2088ed@samsung.com>
Date:   Tue, 3 Mar 2020 13:38:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
        Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200302142615.14947-1-m.szyprowski@samsung.com>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrFKsWRmVeSWpSXmKPExsWy7djP87pH/ePiDA5MkrPYOGM9q8WVr+/Z
        LOZOqrW4+v0ls8WKLzPZLU6+ucpi0TlxCbvFpwf/mS1mnN/HZLH2yF12i0N90RYzJr9kc+Dx
        eH+jld1j56y77B6zO2ayepyYcInJ4373cSaPzUvqPf7O2s/i0bdlFaPHgd7JLB6fN8kFcEVx
        2aSk5mSWpRbp2yVwZZxZe5e94Jpbxfe581gaGK9bdTFyckgImEg8efOTpYuRi0NIYAWjxJrO
        f6wQzhdGid3XX0JlPjNKrOh+zALT0v7kDzNEYjmjxMv/z6Fa3jJKrPx6mK2LkYNDWCBS4ttf
        N5C4iMBsRolbx56BjWIWuMEkseL/R7BRbAKaEn8332QDsXkF7CQOb9jBCmKzCKhInDh/nR3E
        FhWIkJi2/R8jRI2gxMmZT8B6OYHq7/b3g9UwC8hLNG+dzQxhi0vcejKfCWSZhMBfdombV/4y
        Q9ztInFh5mUmCFtY4tXxLewQtozE/53zoeL1EvdXtDBDNHcwSmzdsBOq2VrizrlfYK8xA129
        fpc+iCkh4CjxtdcbwuSTuPFWEOIEPolJ26YzQ4R5JTrahCBmKErcP7sVap64xNILX9kmMCrN
        QvLYLCTPzELyzCyEtQsYWVYxiqeWFuempxYb56WW6xUn5haX5qXrJefnbmIEprjT/45/3cG4
        70/SIUYBDkYlHl4Jz7g4IdbEsuLK3EOMEhzMSiK8vpzRcUK8KYmVValF+fFFpTmpxYcYpTlY
        lMR5jRe9jBUSSE8sSc1OTS1ILYLJMnFwSjUw2vcc11vHtmaZ4cP7/KsdmNqmLmNd5ZGjW1PA
        M2VvrcWEysLVs44+Mn9TeO/NmXXMpjf+b1x5PWd564Te94lT9zYf3bK148TdCRpW/ktlbKf1
        6rCVflxr6RxhoZ8UXLkxteC33MqAx2rSsl/ZWlI6N4aFCTMf1u/6zXkmo/qt0M5jdSleDKEp
        SizFGYmGWsxFxYkA1bpayW0DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrHIsWRmVeSWpSXmKPExsVy+t/xe7pH/ePiDO7M5LDYOGM9q8WVr+/Z
        LOZOqrW4+v0ls8WKLzPZLU6+ucpi0TlxCbvFpwf/mS1mnN/HZLH2yF12i0N90RYzJr9kc+Dx
        eH+jld1j56y77B6zO2ayepyYcInJ4373cSaPzUvqPf7O2s/i0bdlFaPHgd7JLB6fN8kFcEXp
        2RTll5akKmTkF5fYKkUbWhjpGVpa6BmZWOoZGpvHWhmZKunb2aSk5mSWpRbp2yXoZZxZe5e9
        4Jpbxfe581gaGK9bdTFyckgImEi0P/nD3MXIxSEksJRRYvfylUwQCXGJ3fPfMkPYwhJ/rnWx
        QRS9ZpRom3aJtYuRg0NYIFLi2183kLiIwGxGiXUHVrGDOMwCt5gkDmz5yArRMZFR4sT012wg
        o9gENCX+br4JZvMK2Ekc3rCDFcRmEVCROHH+OjuILSoQIfF4YjsjRI2gxMmZT1hAbE6g+rv9
        /WA1zALqEn/mXWKGsOUlmrfOhrLFJW49mc80gVFoFpL2WUhaZiFpmYWkZQEjyypGkdTS4tz0
        3GJDveLE3OLSvHS95PzcTYzAuN527OfmHYyXNgYfYhTgYFTi4ZXwjIsTYk0sK67MPcQowcGs
        JMLryxkdJ8SbklhZlVqUH19UmpNafIjRFOi5icxSosn5wJSTVxJvaGpobmFpaG5sbmxmoSTO
        2yFwMEZIID2xJDU7NbUgtQimj4mDU6qBMfKEx4ei5v+bjr685G/ZLcH6Jvic98yjvMf/bfuW
        Js7eETk3OGrJibUrfefmv2wSTi6cI5zelVmUEdapGZDE+ea/1jwetXWHfx8uiG4VPHQteplZ
        0iT2m9dKBdq0u87tv9gbdul/nIhx4kdH6VXJfuUcl5hNX7gez5gclxp8U9jooNz/wrdhSizF
        GYmGWsxFxYkAQD/2FgEDAAA=
X-CMS-MailID: 20200303123829eucas1p2c3b0687b385a078b9ccf584b25bb547f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200302142626eucas1p25b7aec18264b1483fab9cceb86989aa8
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200302142626eucas1p25b7aec18264b1483fab9cceb86989aa8
References: <CGME20200302142626eucas1p25b7aec18264b1483fab9cceb86989aa8@eucas1p2.samsung.com>
        <20200302142615.14947-1-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 02.03.2020 15:26, Marek Szyprowski wrote:
> Analogix_dp driver acquires all its resources in ->bind() callback, what
> is a bit against the driver component based approach, where driver
> initialization is split into probe(), where all resources are gathered, and
> bind(), where objects are created and compound driver is initialized.
> Extract resource related operations to analogix_dp_probe() and
> analogix_dp_remove() and call them before/after registration of the device
> components from the main Exynos and Rockchip DP drivers.
>
> This fixes multiple tries of DRM compound driver bind() when example when
> DP PHY driver is not yet loaded/probed():
>
> [drm] Exynos DRM: using 14400000.fimd device for DMA mapping operations
> exynos-drm exynos-drm: bound 14400000.fimd (ops fimd_component_ops [exynosdrm])
> exynos-drm exynos-drm: bound 14450000.mixer (ops mixer_component_ops [exynosdrm])
> exynos-dp 145b0000.dp-controller: no DP phy configured
> exynos-drm exynos-drm: failed to bind 145b0000.dp-controller (ops exynos_dp_ops [exynosdrm]): -517
> exynos-drm exynos-drm: master bind failed: -517
> ...
> [drm] Exynos DRM: using 14400000.fimd device for DMA mapping operations
> exynos-drm exynos-drm: bound 14400000.fimd (ops hdmi_enable [exynosdrm])
> exynos-drm exynos-drm: bound 14450000.mixer (ops hdmi_enable [exynosdrm])
> exynos-drm exynos-drm: bound 145b0000.dp-controller (ops hdmi_enable [exynosdrm])
> exynos-drm exynos-drm: bound 14530000.hdmi (ops hdmi_enable [exynosdrm])
> [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
> Console: switching to colour frame buffer device 170x48
> exynos-drm exynos-drm: fb0: exynosdrmfb frame buffer device
> [drm] Initialized exynos 1.1.0 20180330 for exynos-drm on minor 1
> ...
>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>


I hope someone with rockchip will test the patch.

I am little bit worried about power/resource management:

1. dp->clock enabled in probe.

2. pm_runtime enabled in bind.

Both seems to me too early, but it could be hw issue and should be
addressed in separate patches if possible.


As I understand the patch tries to split things without changing order
of calls, so for me it is OK:


Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>

 --

Regards
Andrzej

> ---
>  .../drm/bridge/analogix/analogix_dp_core.c    | 33 ++++++++++++-------
>  drivers/gpu/drm/exynos/exynos_dp.c            | 15 ++++++---
>  .../gpu/drm/rockchip/analogix_dp-rockchip.c   | 15 +++++----
>  include/drm/bridge/analogix_dp.h              |  5 +--
>  4 files changed, 44 insertions(+), 24 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> index dfb59a5fefea..a89a03b66bf2 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> @@ -1646,8 +1646,7 @@ static ssize_t analogix_dpaux_transfer(struct drm_dp_aux *aux,
>  }
>  
>  struct analogix_dp_device *
> -analogix_dp_bind(struct device *dev, struct drm_device *drm_dev,
> -		 struct analogix_dp_plat_data *plat_data)
> +analogix_dp_probe(struct device *dev, struct analogix_dp_plat_data *plat_data)
>  {
>  	struct platform_device *pdev = to_platform_device(dev);
>  	struct analogix_dp_device *dp;
> @@ -1750,22 +1749,30 @@ analogix_dp_bind(struct device *dev, struct drm_device *drm_dev,
>  					irq_flags, "analogix-dp", dp);
>  	if (ret) {
>  		dev_err(&pdev->dev, "failed to request irq\n");
> -		goto err_disable_pm_runtime;
> +		return ERR_PTR(ret);
>  	}
>  	disable_irq(dp->irq);
>  
> +	return dp;
> +}
> +EXPORT_SYMBOL_GPL(analogix_dp_probe);
> +
> +int analogix_dp_bind(struct analogix_dp_device *dp, struct drm_device *drm_dev)
> +{
> +	int ret;
> +
>  	dp->drm_dev = drm_dev;
>  	dp->encoder = dp->plat_data->encoder;
>  
>  	dp->aux.name = "DP-AUX";
>  	dp->aux.transfer = analogix_dpaux_transfer;
> -	dp->aux.dev = &pdev->dev;
> +	dp->aux.dev = dp->dev;
>  
>  	ret = drm_dp_aux_register(&dp->aux);
>  	if (ret)
> -		return ERR_PTR(ret);
> +		return ret;
>  
> -	pm_runtime_enable(dev);
> +	pm_runtime_enable(dp->dev);
>  
>  	ret = analogix_dp_create_bridge(drm_dev, dp);
>  	if (ret) {
> @@ -1773,13 +1780,12 @@ analogix_dp_bind(struct device *dev, struct drm_device *drm_dev,
>  		goto err_disable_pm_runtime;
>  	}
>  
> -	return dp;
> +	return 0;
>  
>  err_disable_pm_runtime:
> +	pm_runtime_disable(dp->dev);
>  
> -	pm_runtime_disable(dev);
> -
> -	return ERR_PTR(ret);
> +	return ret;
>  }
>  EXPORT_SYMBOL_GPL(analogix_dp_bind);
>  
> @@ -1796,10 +1802,15 @@ void analogix_dp_unbind(struct analogix_dp_device *dp)
>  
>  	drm_dp_aux_unregister(&dp->aux);
>  	pm_runtime_disable(dp->dev);
> -	clk_disable_unprepare(dp->clock);
>  }
>  EXPORT_SYMBOL_GPL(analogix_dp_unbind);
>  
> +void analogix_dp_remove(struct analogix_dp_device *dp)
> +{
> +	clk_disable_unprepare(dp->clock);
> +}
> +EXPORT_SYMBOL_GPL(analogix_dp_remove);
> +
>  #ifdef CONFIG_PM
>  int analogix_dp_suspend(struct analogix_dp_device *dp)
>  {
> diff --git a/drivers/gpu/drm/exynos/exynos_dp.c b/drivers/gpu/drm/exynos/exynos_dp.c
> index 4785885c0f4f..558b78e8cc32 100644
> --- a/drivers/gpu/drm/exynos/exynos_dp.c
> +++ b/drivers/gpu/drm/exynos/exynos_dp.c
> @@ -184,13 +184,11 @@ static int exynos_dp_bind(struct device *dev, struct device *master, void *data)
>  
>  	dp->plat_data.encoder = encoder;
>  
> -	dp->adp = analogix_dp_bind(dev, dp->drm_dev, &dp->plat_data);
> -	if (IS_ERR(dp->adp)) {
> +	ret = analogix_dp_bind(dp->adp, dp->drm_dev);
> +	if (ret)
>  		dp->encoder.funcs->destroy(&dp->encoder);
> -		return PTR_ERR(dp->adp);
> -	}
>  
> -	return 0;
> +	return ret;
>  }
>  
>  static void exynos_dp_unbind(struct device *dev, struct device *master,
> @@ -250,12 +248,19 @@ static int exynos_dp_probe(struct platform_device *pdev)
>  	dp->ptn_bridge = bridge;
>  
>  out:
> +	dp->adp = analogix_dp_probe(dev, &dp->plat_data);
> +	if (IS_ERR(dp->adp))
> +		return PTR_ERR(dp->adp);
> +
>  	return component_add(&pdev->dev, &exynos_dp_ops);
>  }
>  
>  static int exynos_dp_remove(struct platform_device *pdev)
>  {
> +	struct exynos_dp_device *dp = platform_get_drvdata(pdev);
> +
>  	component_del(&pdev->dev, &exynos_dp_ops);
> +	analogix_dp_remove(dp->adp);
>  
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> index f38f5e113c6b..b85cf2582864 100644
> --- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> @@ -349,11 +349,9 @@ static int rockchip_dp_bind(struct device *dev, struct device *master,
>  	dp->plat_data.power_off = rockchip_dp_powerdown;
>  	dp->plat_data.get_modes = rockchip_dp_get_modes;
>  
> -	dp->adp = analogix_dp_bind(dev, dp->drm_dev, &dp->plat_data);
> -	if (IS_ERR(dp->adp)) {
> -		ret = PTR_ERR(dp->adp);
> +	ret = analogix_dp_bind(dp->adp, drm_dev);
> +	if (ret)
>  		goto err_cleanup_encoder;
> -	}
>  
>  	return 0;
>  err_cleanup_encoder:
> @@ -368,8 +366,6 @@ static void rockchip_dp_unbind(struct device *dev, struct device *master,
>  
>  	analogix_dp_unbind(dp->adp);
>  	dp->encoder.funcs->destroy(&dp->encoder);
> -
> -	dp->adp = ERR_PTR(-ENODEV);
>  }
>  
>  static const struct component_ops rockchip_dp_component_ops = {
> @@ -402,12 +398,19 @@ static int rockchip_dp_probe(struct platform_device *pdev)
>  
>  	platform_set_drvdata(pdev, dp);
>  
> +	dp->adp = analogix_dp_probe(dev, &dp->plat_data);
> +	if (IS_ERR(dp->adp))
> +		return PTR_ERR(dp->adp);
> +
>  	return component_add(dev, &rockchip_dp_component_ops);
>  }
>  
>  static int rockchip_dp_remove(struct platform_device *pdev)
>  {
> +	struct rockchip_dp_device *dp = platform_get_drvdata(pdev);
> +
>  	component_del(&pdev->dev, &rockchip_dp_component_ops);
> +	analogix_dp_remove(dp->adp);
>  
>  	return 0;
>  }
> diff --git a/include/drm/bridge/analogix_dp.h b/include/drm/bridge/analogix_dp.h
> index 7aa2f93da49c..b0dcc07334a1 100644
> --- a/include/drm/bridge/analogix_dp.h
> +++ b/include/drm/bridge/analogix_dp.h
> @@ -42,9 +42,10 @@ int analogix_dp_resume(struct analogix_dp_device *dp);
>  int analogix_dp_suspend(struct analogix_dp_device *dp);
>  
>  struct analogix_dp_device *
> -analogix_dp_bind(struct device *dev, struct drm_device *drm_dev,
> -		 struct analogix_dp_plat_data *plat_data);
> +analogix_dp_probe(struct device *dev, struct analogix_dp_plat_data *plat_data);
> +int analogix_dp_bind(struct analogix_dp_device *dp, struct drm_device *drm_dev);
>  void analogix_dp_unbind(struct analogix_dp_device *dp);
> +void analogix_dp_remove(struct analogix_dp_device *dp);
>  
>  int analogix_dp_start_crc(struct drm_connector *connector);
>  int analogix_dp_stop_crc(struct drm_connector *connector);


