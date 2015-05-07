From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [RFT PATCH v2 0/3] drm/exynos: Fix build breakage on !DRM_EXYNOS_FIMD
Date: Thu, 07 May 2015 11:16:58 +0200
Message-ID: <554B2D8A.6070209@collabora.co.uk>
References: <1430957086-25005-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1430957086-25005-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@linux.ie>, Kukjin Kim <kgene@kernel.org>, Jingoo Han <jg1.han@samsung.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hello Krzysztof,

On 05/07/2015 02:04 AM, Krzysztof Kozlowski wrote:
> From: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
> 
> Hi,
> 
> This is second try to fix the build breakage introduced in 1c363c7cccf6
> ("drm/exynos: Enable DP clock to fix display on Exynos5250 and other").
> 
> The fix is not trivial so I am kindly asking for testing on Chromebook
> and other DP-enabled boards (I don't have Chromebook right now).
> 

For all the series:

Reviewed-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>

> Tested on Exynos4412 Trats2 board.
> 

On Exynos5250 Snow, Exynos5420 Peach Pit and Exynos5800 Peach Pi Chromebooks:

Tested-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>

> Best regards,
> Krzysztof
> 

Best regards,
Javier
