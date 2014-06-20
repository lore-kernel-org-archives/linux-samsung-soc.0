From: Ajay kumar <ajaynumb@gmail.com>
Subject: Re: [PATCH V4 10/10] drm/exynos: Add ps8622 lvds bridge discovery to
 DP driver
Date: Fri, 20 Jun 2014 13:39:28 +0530
Message-ID: <CAEC9eQN4HZgm6kquY2FLyc2_RBKxumRKkqcAoVNcgt5VKTXJ3Q@mail.gmail.com>
References: <1402511228-18945-1-git-send-email-ajaykumar.rs@samsung.com>
	<1402511228-18945-11-git-send-email-ajaykumar.rs@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ve0-f171.google.com ([209.85.128.171]:61114 "EHLO
	mail-ve0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S964810AbaFTIJ3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 20 Jun 2014 04:09:29 -0400
In-Reply-To: <1402511228-18945-11-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ajay Kumar <ajaykumar.rs@samsung.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, devicetree@vger.kernel.org, Dae <inki.dae@samsung.com>, Sean Paul <seanpaul@google.com>, Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Thierry Reding <thierry.reding@gmail.com>, sunil joshi <joshi@samsung.com>, Prashanth G <prashanth.g@samsung.com>, =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>, Rahul Sharma <rahul.sharma@samsung.com>

ping.

On Wed, Jun 11, 2014 at 11:57 PM, Ajay Kumar <ajaykumar.rs@samsung.com> wrote:
> From: Rahul Sharma <Rahul.Sharma@samsung.com>
>
> This patch adds ps8622 lvds bridge discovery code to the dp driver.
>
> Signed-off-by: Rahul Sharma <Rahul.Sharma@samsung.com>
> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_dp_core.c |    5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_dp_core.c b/drivers/gpu/drm/exynos/exynos_dp_core.c
> index 69535f7..87eabe7 100644
> --- a/drivers/gpu/drm/exynos/exynos_dp_core.c
> +++ b/drivers/gpu/drm/exynos/exynos_dp_core.c
> @@ -31,6 +31,7 @@
>  #include <drm/drm_panel.h>
>  #include <drm/bridge/ptn3460.h>
>  #include <drm/bridge/panel_binder.h>
> +#include <drm/bridge/ps8622.h>
>
>  #include "exynos_drm_drv.h"
>  #include "exynos_dp_core.h"
> @@ -999,6 +1000,10 @@ static int exynos_drm_attach_lcd_bridge(struct exynos_dp_device *dp,
>         if (find_bridge("nxp,ptn3460", &bridge)) {
>                 bridge_chain = ptn3460_init(dp->drm_dev, encoder, bridge.client,
>                                                                 bridge.node);
> +       } else if (find_bridge("parade,ps8622", &bridge) ||
> +                               find_bridge("parade,ps8625", &bridge)) {
> +               bridge_chain = ps8622_init(dp->drm_dev, encoder, bridge.client,
> +                                                               bridge.node);
>         }
>
>         if (bridge_chain && dp->edp_panel) {
> --
> 1.7.9.5
>
