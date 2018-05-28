From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH 08/12] drm/bridge: tc358764: Add DSI to LVDS bridge driver
Date: Mon, 28 May 2018 09:24:55 -0700
Message-ID: <153d1f8c-a0b4-b189-34b5-42a81d15f66b@infradead.org>
References: <1527500833-16005-1-git-send-email-m.purski@samsung.com>
 <CGME20180528094728eucas1p128e8a44fa6c3bcb29d056a8191c039af@eucas1p1.samsung.com>
 <1527500833-16005-9-git-send-email-m.purski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1527500833-16005-9-git-send-email-m.purski@samsung.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Maciej Purski <m.purski@samsung.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thierry Reding <thierry.reding@gmail.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Archit Taneja <architt@codeaurora.org>, Andrzej Hajda <a.hajda@samsung.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On 05/28/2018 02:47 AM, Maciej Purski wrote:
> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> index fa2c799..58e19af 100644
> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -110,6 +110,13 @@ config DRM_THINE_THC63LVD1024
>  	---help---
>  	  Thine THC63LVD1024 LVDS/parallel converter driver.
>  
> +config DRM_TOSHIBA_TC358764
> +	tristate "TC358764 DSI/LVDS bridge"
> +	depends on DRM && DRM_PANEL
> +	depends on OF
> +	select DRM_MIPI_DSI
> +	select VIDEOMODE_HELPERS
> +

Kconfig symbols with "prompt strings" should also have help text.

I expected checkpatch to catch that, but I tested it and there was no warning
from checkpatch about help text.  OTOH, there was a warning that there are
2 lines in this patch that end with whitespace, so that should be fixed.

Did you use checkpatch (scripts/checkpatch.pl)?

>  config DRM_TOSHIBA_TC358767
>  	tristate "Toshiba TC358767 eDP bridge"
>  	depends on OF

thanks,
-- 
~Randy
