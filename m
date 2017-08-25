From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH v2 05/10] drm/exynos/mic: use mode info stored in CRTC
 to detect i80 mode
Date: Fri, 25 Aug 2017 11:55:30 +0900
Message-ID: <599F91A2.70107@samsung.com>
References: <1503581639-580-1-git-send-email-a.hajda@samsung.com>
        <CGME20170824133410eucas1p1bc901ed868b664922cda5fecc920dd0e@eucas1p1.samsung.com>
        <1503581639-580-6-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:26268 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754490AbdHYCzd (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 24 Aug 2017 22:55:33 -0400
In-reply-to: <1503581639-580-6-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>



2017년 08월 24일 22:33에 Andrzej Hajda 이(가) 쓴 글:
> MIC driver should use info from CRTC to check mode of work instead of
> illegally peeking into nodes of other devices.
> 
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_mic.c | 44 +++------------------------------
>  1 file changed, 4 insertions(+), 40 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_mic.c b/drivers/gpu/drm/exynos/exynos_drm_mic.c
> index 16bbee8..128ce176 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_mic.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_mic.c
> @@ -21,9 +21,12 @@
>  #include <linux/component.h>
>  #include <linux/pm_runtime.h>
>  #include <drm/drmP.h>
> +#include <drm/drm_encoder.h>
>  #include <linux/mfd/syscon.h>
>  #include <linux/regmap.h>
>  
> +#include <exynos_drm_drv.h>

Build error happened at here. It should be modified to '#include "exynos_drm_drv.h"'.
I can fix it.

Thanks,
Inki Dae
