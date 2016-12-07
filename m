From: Archit Taneja <architt@codeaurora.org>
Subject: Re: [PATCH v2] drm/bridge: analogix: Don't return -EINVAL when panel
 not support PSR in PSR functions
Date: Wed, 7 Dec 2016 08:46:32 +0530
Message-ID: <5be43224-8360-2899-c75f-0fba57e812c6@codeaurora.org>
References: <1481072253-8917-1-git-send-email-wzz@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:47196 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751563AbcLGDQm (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 6 Dec 2016 22:16:42 -0500
In-Reply-To: <1481072253-8917-1-git-send-email-wzz@rock-chips.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: zain wang <wzz@rock-chips.com>, Sean Paul <seanpaul@chromium.org>, Daniel Vetter <daniel.vetter@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, David Airlie <airlied@linux.ie>
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, Mika Kahola <mika.kahola@intel.com>, =?UTF-8?Q?St=c3=a9phane_Marchesin?= <marcheu@chromium.org>, Tomasz Figa <tfiga@chromium.org>, dianders@chromium.org, Thierry Reding <treding@nvidia.com>, Heiko Stuebner <heiko@sntech.de>, Jingoo Han <jingoohan1@gmail.com>, Javier Martinez Canillas <javier@osg.samsung.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org



On 12/07/2016 06:27 AM, zain wang wrote:
> We will ignored PSR setting if panel not support it. So, in this case, we should
> return from analogix_dp_enable/disable_psr() without any error code.
> Let's retrun 0 instead of -EINVAL when panel not support PSR in
> analogix_dp_enable/disable_psr().

Thanks. Pushed to drm-misc after wrapping the commit
message text.

Archit

>
> Signed-off-by: zain wang <wzz@rock-chips.com>
> ---
>
> Changes in v2:
> - Remove dev_warn if panel not support PSR.
>
>  drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> index 6e0447f..eb9bf87 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> @@ -112,7 +112,7 @@ int analogix_dp_enable_psr(struct device *dev)
>  	struct edp_vsc_psr psr_vsc;
>
>  	if (!dp->psr_support)
> -		return -EINVAL;
> +		return 0;
>
>  	/* Prepare VSC packet as per EDP 1.4 spec, Table 6.9 */
>  	memset(&psr_vsc, 0, sizeof(psr_vsc));
> @@ -135,7 +135,7 @@ int analogix_dp_disable_psr(struct device *dev)
>  	struct edp_vsc_psr psr_vsc;
>
>  	if (!dp->psr_support)
> -		return -EINVAL;
> +		return 0;
>
>  	/* Prepare VSC packet as per EDP 1.4 spec, Table 6.9 */
>  	memset(&psr_vsc, 0, sizeof(psr_vsc));
>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
