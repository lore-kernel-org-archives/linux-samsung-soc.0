From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH 1/6] include/drm: color_mgmt: Add enum labels
Date: Thu, 17 Jan 2019 18:32:06 +0900
Message-ID: <f51289f2-e94f-40f4-2a61-054d87914030@samsung.com>
References: <1544789421-5265-1-git-send-email-c.manszewski@samsung.com>
        <CGME20181214121032eucas1p24af580721ebd6f86a4f9ddf701957ab6@eucas1p2.samsung.com>
        <1544789421-5265-2-git-send-email-c.manszewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1544789421-5265-2-git-send-email-c.manszewski@samsung.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Christoph Manszewski <c.manszewski@samsung.com>, dri-devel@lists.freedesktop.org
Cc: Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@linux.ie>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

18. 12. 14. 오후 9:10에 Christoph Manszewski 이(가) 쓴 글:
> Range setting makes sense for YCbCr and RGB buffers. Current
> drm_color_range enum labels suggest use with YCbCr buffers.
> Create enum labels without colorspace specification.
> 
> Signed-off-by: Christoph Manszewski <c.manszewski@samsung.com>
> ---
>  include/drm/drm_color_mgmt.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/include/drm/drm_color_mgmt.h b/include/drm/drm_color_mgmt.h
> index 90ef9996d9a4..52f6d5221a0d 100644
> --- a/include/drm/drm_color_mgmt.h
> +++ b/include/drm/drm_color_mgmt.h
> @@ -62,6 +62,8 @@ enum drm_color_range {
>  	DRM_COLOR_YCBCR_LIMITED_RANGE,
>  	DRM_COLOR_YCBCR_FULL_RANGE,
>  	DRM_COLOR_RANGE_MAX,
> +	DRM_COLOR_LIMITED_RANGE = DRM_COLOR_YCBCR_LIMITED_RANGE,
> +	DRM_COLOR_FULL_RANGE = DRM_COLOR_YCBCR_FULL_RANGE,

I don't see why above two types are needed. Is there any case that the range checking behavior should be different according to the color space?
And even if there is that case, I think you have to put DRM_COLOR_RANG_MAX under DRM_COLOR_FULL_RANGE.

Thanks,
Inki Dae

>  };
>  
>  int drm_plane_create_color_properties(struct drm_plane *plane,
> 
