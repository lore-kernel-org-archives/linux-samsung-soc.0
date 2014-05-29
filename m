From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH] drm/exynos: hdmi: remove the i2c drivers and use devtree
 - continued
Date: Thu, 29 May 2014 18:42:01 +0200
Message-ID: <53876359.8070304@gmail.com>
References: <1401381377-29973-1-git-send-email-lee.jones@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f178.google.com ([74.125.82.178]:45782 "EHLO
	mail-we0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751130AbaE2QmT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 29 May 2014 12:42:19 -0400
In-Reply-To: <1401381377-29973-1-git-send-email-lee.jones@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: kernel@stlinux.com, djkurtz@chromium.org, seanpaul@chromium.org, inki.dae@samsung.com, irlied@linux.ie, jy0922.shim@samsung.com, sw0312.kim@samsung.com, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org

Hi.

On 29.05.2014 18:36, Lee Jones wrote:
> There appears to have been a merge error on commit:
> 
>   2b76813: drm/exynos: hdmi: remove the i2c drivers and use
> 
> The original submission can be found at:
> 
>   https://patchwork.kernel.org/patch/3559541/
> 
> It looks like the commit was only half applied.  This patch aims
> to finish what was started by Daniel.
> 
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/gpu/drm/exynos/exynos_ddc.c     | 63 --------------------------------
>  drivers/gpu/drm/exynos/exynos_hdmi.h    | 23 ------------
>  drivers/gpu/drm/exynos/exynos_hdmiphy.c | 65 ---------------------------------
>  3 files changed, 151 deletions(-)
>  delete mode 100644 drivers/gpu/drm/exynos/exynos_ddc.c
>  delete mode 100644 drivers/gpu/drm/exynos/exynos_hdmi.h
>  delete mode 100644 drivers/gpu/drm/exynos/exynos_hdmiphy.c
> 

Obviously there is nothing to review, but still:

Reviewed-by: Tomasz Figa <t.figa@samsung.com>

Thanks for the patch.

Best regards,
Tomasz
