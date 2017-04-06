From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: Re: [PATCH] drm/exynos: clean up description of exynos_drm_crtc
Date: Thu, 6 Apr 2017 19:10:15 +0200
Message-ID: <f308d21f-2b72-031f-1d33-c458a006f7e3@math.uni-bielefeld.de>
References: <CGME20170406012110epcas1p3b013a6c11a9df4b76070540d73355534@epcas1p3.samsung.com>
 <1491441669-5446-1-git-send-email-inki.dae@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:57355 "EHLO
        smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1752588AbdDFRKS (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 6 Apr 2017 13:10:18 -0400
In-Reply-To: <1491441669-5446-1-git-send-email-inki.dae@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>, dri-devel@lists.freedesktop.org
Cc: airlied@linux.ie, linux-samsung-soc@vger.kernel.org

Hello Inki,


Inki Dae wrote:
> This patch removes unnecessary descriptions on
> exynos_drm_crtc structure and adds one description
> which specifies what pipe_clk member does.
> 
> pipe_clk support had been added by below patch without any description,
> 	 drm/exynos: add support for pipeline clock to the framework
I would put the commit id here. That makes it easier to look up the
commit your refer to.


> Signed-off-by: Inki Dae <inki.dae@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_drv.h | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
> index 527bf1d..b0462cc 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
> @@ -152,12 +152,10 @@ struct exynos_drm_clk {
>   *
>   * @base: crtc object.
>   * @type: one of EXYNOS_DISPLAY_TYPE_LCD and HDMI.
> - * @enabled: if the crtc is enabled or not
> - * @event: vblank event that is currently queued for flip
> - * @wait_update: wait all pending planes updates to finish
> - * @pending_update: number of pending plane updates in this crtc
>   * @ops: pointer to callbacks for exynos drm specific functionality
>   * @ctx: A pointer to the crtc's implementation specific context
> + * @pipe_clk: A pipe clock structure which includes a callback function
> +	      for enabling DP clock of FIMD and HDMI PHY clock.
This is wrong/inconsistent with the rest of the documentation. pipe_clk
is not a struct, but a pointer.

I would suggest to follow. Just document that we have a pointer to <add
escription> here (compare docu for 'ops' and 'ctx').
And then put the later bits ("...callback function for enabling DP
clock...") directly to the definition of 'struct exynos_drm_clk' (which
is currently lacking any kind of docu).


- Tobias

>   */
>  struct exynos_drm_crtc {
>  	struct drm_crtc			base;
> 
