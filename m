From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v7 05/17] drm: bridge: analogix/dp: dynamic parse sync_pol
 & interlace & dynamic_range
Date: Mon, 12 Oct 2015 15:54:03 +0900
Message-ID: <561B590B.6090806@samsung.com>
References: <1444491357-26095-1-git-send-email-ykk@rock-chips.com>
 <1444624149-16180-1-git-send-email-ykk@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1444624149-16180-1-git-send-email-ykk@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yakir Yang <ykk@rock-chips.com>, Inki Dae <inki.dae@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Jingoo Han <jingoohan1@gmail.com>, Thierry Reding <treding@nvidia.com>, Rob Herring <robh+dt@kernel.org>, joe@perches.com, Heiko Stuebner <heiko@sntech.de>, Mark Yao <mark.yao@rock-chips.com>
Cc: Russell King <linux@arm.linux.org.uk>, djkurtz@chromium.org, dianders@chromium.org, Sean Paul <seanpaul@chromium.org>, Kukjin Kim <kgene@kernel.org>, Kumar Gala <galak@codeaurora.org>, emil.l.velikov@gmail.com, Ian Campbell <ijc+devicetree@hellion.org.uk>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, Kishon Vijay Abraham I <kishon@ti.com>, Pawel Moll <pawel.moll@arm.com>, ajaynumb@gmail.com, robherring2@gmail.com, javier@osg.samsung.com, Andy Yan <andy.yan@rock-chips.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On 12.10.2015 13:29, Yakir Yang wrote:
> Both hsync/vsync polarity and interlace mode can be parsed from
> drm display mode, and dynamic_range and ycbcr_coeff can be judge
> by the video code.
> 
> But presumably Exynos still relies on the DT properties, so take
> good use of mode_fixup() in to achieve the compatibility hacks.
> 
> Signed-off-by: Yakir Yang <ykk@rock-chips.com>
> ---
> *just add a note that this is v7 of only fifth patch.*
> 
> Changes in v7:
> - Back to use the of_property_read_bool() interfacs to provoid backward
>   compatibility of "hsync-active-high" "vsync-active-high" "interlaced"
>   to avoid -EOVERFLOW error (Krzysztof)
> 
> Changes in v6: None
> Changes in v5:
> - Switch video timing type to "u32", so driver could use "of_property_read_u32"
>   to get the backword timing values. Krzysztof suggest me that driver could use
>   the "of_property_read_bool" to get backword timing values, but that interfacs
>   would modify the original drm_display_mode timing directly (whether those
>   properties exists or not).
> 
> Changes in v4:
> - Provide backword compatibility with samsung. (Krzysztof)
> 
> Changes in v3:
> - Dynamic parse video timing info from struct drm_display_mode and
>   struct drm_display_info. (Thierry)
> 
> Changes in v2: None
> 
>  drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 148 +++++++++++++--------
>  drivers/gpu/drm/bridge/analogix/analogix_dp_core.h |   2 +-
>  drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c  |  14 +-
>  3 files changed, 103 insertions(+), 61 deletions(-)
> 

Looks good and backward compatible to me:
Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
