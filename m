From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH 1/6] include/drm: color_mgmt: Add enum labels
Date: Thu, 17 Jan 2019 21:47:22 +0200
Message-ID: <20190117194722.GJ20097@intel.com>
References: <1544789421-5265-1-git-send-email-c.manszewski@samsung.com>
 <CGME20181214121032eucas1p24af580721ebd6f86a4f9ddf701957ab6@eucas1p2.samsung.com>
 <1544789421-5265-2-git-send-email-c.manszewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1544789421-5265-2-git-send-email-c.manszewski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Christoph Manszewski <c.manszewski@samsung.com>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <maxime.ripard@bootlin.com>, linux-samsung-soc@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, David Airlie <airlied@linux.ie>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>, Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Dec 14, 2018 at 01:10:16PM +0100, Christoph Manszewski wrote:
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

These enum values don't mean anything really. The strings are what
matter for the uapi.

The default for YCbCr needs to be limited range, the default for RGB
needs to be full range. So I think this would really require a separate
prop for each.

But is there an actual usecase for this stuff?

>  };
>  
>  int drm_plane_create_color_properties(struct drm_plane *plane,
> -- 
> 2.7.4
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Ville Syrjälä
Intel
