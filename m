From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH v2 4/4] drm/exynos: g2d: beautify probing message
Date: Mon, 26 Sep 2016 16:41:50 +0900
Message-ID: <57E8D13E.5000408@samsung.com>
References: <1474556240-14055-1-git-send-email-tjakobi@math.uni-bielefeld.de>
 <CGME20160922150204epcas1p1adfffbb204ff71401538e224ab4c62d5@epcas1p1.samsung.com>
 <1474556240-14055-5-git-send-email-tjakobi@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:40397 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752259AbcIZHlw (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 26 Sep 2016 03:41:52 -0400
Received: from epcpsbgm2new.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OE30158WPDMW630@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 26 Sep 2016 16:41:50 +0900 (KST)
In-reply-to: <1474556240-14055-5-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, m.szyprowski@samsung.com, a.hajda@samsung.com



2016년 09월 22일 23:57에 Tobias Jakobi 이(가) 쓴 글:
> Apply some 'make-up' in g2d_probe().

Just clean up. Picked it up.

> 
> Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_g2d.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_g2d.c b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
> index 73cd83f..410d170 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_g2d.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
> @@ -2423,7 +2423,7 @@ static int g2d_probe(struct platform_device *pdev)
>  		goto err_put_clk;
>  	}
>  
> -	dev_info(dev, "The exynos g2d(ver %d.%d) successfully probed\n",
> +	dev_info(dev, "The Exynos G2D (ver %d.%d) successfully probed.\n",
>  			G2D_HW_MAJOR_VER, G2D_HW_MINOR_VER);
>  
>  	return 0;
> 
