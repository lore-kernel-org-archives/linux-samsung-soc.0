From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 11/13] drm/irq: Document return values more consistently
Date: Tue, 16 Dec 2014 19:02:29 +0100
Message-ID: <20141216180229.GB2711@phenom.ffwll.local>
References: <1418748815-15434-1-git-send-email-thierry.reding@gmail.com>
 <1418748815-15434-11-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f180.google.com ([209.85.212.180]:50059 "EHLO
	mail-wi0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751218AbaLPSBy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 16 Dec 2014 13:01:54 -0500
Received: by mail-wi0-f180.google.com with SMTP id n3so13401802wiv.13
        for <linux-samsung-soc@vger.kernel.org>; Tue, 16 Dec 2014 10:01:52 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1418748815-15434-11-git-send-email-thierry.reding@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, Philipp Zabel <p.zabel@pengutronix.de>, Gerd Hoffmann <kraxel@redhat.com>, Mark Yao <mark.yao@rock-chips.com>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, linux-samsung-soc@vger.kernel.org

On Tue, Dec 16, 2014 at 05:53:33PM +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Some of the functions are documented inconsistently. Add Returns:
> sections where missing and use consistent style to describe the return
> value.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>

With the comment in patch 9 addressed patches 1-11 are

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/drm_irq.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_irq.c b/drivers/gpu/drm/drm_irq.c
> index b34900a8e172..ef5d993f06ee 100644
> --- a/drivers/gpu/drm/drm_irq.c
> +++ b/drivers/gpu/drm/drm_irq.c
> @@ -991,6 +991,9 @@ EXPORT_SYMBOL(drm_crtc_send_vblank_event);
>   * drm_vblank_enable - enable the vblank interrupt on a CRTC
>   * @dev: DRM device
>   * @pipe: CRTC index
> + *
> + * Returns:
> + * Zero on success or a negative error code on failure.
>   */
>  static int drm_vblank_enable(struct drm_device *dev, unsigned int pipe)
>  {
> @@ -1035,7 +1038,7 @@ static int drm_vblank_enable(struct drm_device *dev, unsigned int pipe)
>   * This is the legacy version of drm_crtc_vblank_get().
>   *
>   * Returns:
> - * Zero on success, nonzero on failure.
> + * Zero on success or a negative error code on failure.
>   */
>  int drm_vblank_get(struct drm_device *dev, unsigned int pipe)
>  {
> @@ -1072,7 +1075,7 @@ EXPORT_SYMBOL(drm_vblank_get);
>   * This is the native kms version of drm_vblank_off().
>   *
>   * Returns:
> - * Zero on success, nonzero on failure.
> + * Zero on success or a negative error code on failure.
>   */
>  int drm_crtc_vblank_get(struct drm_crtc *crtc)
>  {
> -- 
> 2.1.3
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
