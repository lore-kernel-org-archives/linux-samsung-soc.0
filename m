From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: Re: [PATCH 08/14] drm/exynos: atomic phase 1: add
 atomic_begin()/atomic_flush()
Date: Thu, 05 Feb 2015 11:48:18 +0900
Message-ID: <54D2D9F2.2060505@samsung.com>
References: <1422990871-21355-1-git-send-email-gustavo@padovan.org>
 <1422990871-21355-9-git-send-email-gustavo@padovan.org>
 <54D1CF05.8000804@samsung.com> <20150204143052.GI14009@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:10301 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751360AbbBECsN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 4 Feb 2015 21:48:13 -0500
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NJA002IQ2GA0KA0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 05 Feb 2015 11:48:11 +0900 (KST)
In-reply-to: <20150204143052.GI14009@phenom.ffwll.local>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Gustavo Padovan <gustavo@padovan.org>, linux-samsung-soc@vger.kernel.org, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, dri-devel@lists.freedesktop.org

Hi Daniel,

On 02/04/2015 11:30 PM, Daniel Vetter wrote:
> On Wed, Feb 04, 2015 at 04:49:25PM +0900, Joonyoung Shim wrote:
>> Hi,
>>
>> On 02/04/2015 04:14 AM, Gustavo Padovan wrote:
>>> From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
>>>
>>> Add CRTC callbacks .atomic_begin() .atomic_flush(). On exynos they
>>> unprotect the windows before the commit and protects it after based on
>>> a plane mask tha store which plane will be updated.
>>>
>>
>> I don't think they need now.
> 
> This does exactly what I wanted to do in my atomic poc but couldn't
> because of the massive layer hell that was still around in atomic. Haven't
> looked into the patch in details, so no full r-b but good enough for an
> 

I agree about its operation but i think it is unnecessary now. Because
it's exactly same operation with current codes.

> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> 
> Aside: If you think something doesn't need to be done please explain what
> you mean or at least ask about what you don't understand in a patch. As-is
> your review is pretty much unactionable.
> 

Yes, my fault, thanks for advice.

Thanks.

> 
>>
>> Thanks.
>>
>>> For that we create two new exynos_crtc callbacks: .win_protect() and
>>> .win_unprotect(). The only driver that implement those now is FIMD.
>>>
>>> Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
>>> ---
>>>  drivers/gpu/drm/exynos/exynos_drm_crtc.c  | 34 ++++++++++++++++++
>>>  drivers/gpu/drm/exynos/exynos_drm_drv.h   |  4 +++
>>>  drivers/gpu/drm/exynos/exynos_drm_fimd.c  | 57 ++++++++++++++++++++++---------
>>>  drivers/gpu/drm/exynos/exynos_drm_plane.c |  4 +++
>>>  4 files changed, 82 insertions(+), 17 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.c b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
>>> index 09d4780..be36cca 100644
>>> --- a/drivers/gpu/drm/exynos/exynos_drm_crtc.c
>>> +++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
>>> @@ -147,6 +147,38 @@ static void exynos_drm_crtc_disable(struct drm_crtc *crtc)
>>>  	}
>>>  }
>>>  
>>> +static void exynos_crtc_atomic_begin(struct drm_crtc *crtc)
>>> +{
>>> +	struct exynos_drm_crtc *exynos_crtc = to_exynos_crtc(crtc);
>>> +	struct drm_plane *plane;
>>> +	int index = 0;
>>> +
>>> +	list_for_each_entry(plane, &crtc->dev->mode_config.plane_list, head) {
>>> +		if (exynos_crtc->ops->win_protect &&
>>> +		    exynos_crtc->plane_mask & (0x01 << index))
>>> +			exynos_crtc->ops->win_protect(exynos_crtc, index);
>>> +
>>> +		index++;
>>> +	}
>>> +}
>>> +
>>> +static void exynos_crtc_atomic_flush(struct drm_crtc *crtc)
>>> +{
>>> +	struct exynos_drm_crtc *exynos_crtc = to_exynos_crtc(crtc);
>>> +	struct drm_plane *plane;
>>> +	int index = 0;
>>> +
>>> +	list_for_each_entry(plane, &crtc->dev->mode_config.plane_list, head) {
>>> +		if (exynos_crtc->ops->win_unprotect &&
>>> +		    exynos_crtc->plane_mask & (0x01 << index))
>>> +			exynos_crtc->ops->win_unprotect(exynos_crtc, index);
>>> +
>>> +		index++;
>>> +	}
>>> +
>>> +	exynos_crtc->plane_mask = 0;
>>> +}
>>> +
>>>  static struct drm_crtc_helper_funcs exynos_crtc_helper_funcs = {
>>>  	.dpms		= exynos_drm_crtc_dpms,
>>>  	.prepare	= exynos_drm_crtc_prepare,
>>> @@ -155,6 +187,8 @@ static struct drm_crtc_helper_funcs exynos_crtc_helper_funcs = {
>>>  	.mode_set	= exynos_drm_crtc_mode_set,
>>>  	.mode_set_base	= exynos_drm_crtc_mode_set_base,
>>>  	.disable	= exynos_drm_crtc_disable,
>>> +	.atomic_begin	= exynos_crtc_atomic_begin,
>>> +	.atomic_flush	= exynos_crtc_atomic_flush,
>>>  };
>>>  
>>>  static int exynos_drm_crtc_page_flip(struct drm_crtc *crtc,
>>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
>>> index cad54e7..43efd9f 100644
>>> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
>>> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
>>> @@ -194,6 +194,8 @@ struct exynos_drm_crtc_ops {
>>>  	void (*win_enable)(struct exynos_drm_crtc *crtc, int zpos);
>>>  	void (*win_disable)(struct exynos_drm_crtc *crtc, int zpos);
>>>  	void (*te_handler)(struct exynos_drm_crtc *crtc);
>>> +	void (*win_protect)(struct exynos_drm_crtc *crtc, int zpos);
>>> +	void (*win_unprotect)(struct exynos_drm_crtc *crtc, int zpos);
>>>  };
>>>  
>>>  enum exynos_crtc_mode {
>>> @@ -214,6 +216,7 @@ enum exynos_crtc_mode {
>>>   *	we can refer to the crtc to current hardware interrupt occurred through
>>>   *	this pipe value.
>>>   * @dpms: store the crtc dpms value
>>> + * @plane_mask: store planes to be updated on atomic modesetting
>>>   * @mode: store the crtc mode value
>>>   * @event: vblank event that is currently queued for flip
>>>   * @ops: pointer to callbacks for exynos drm specific functionality
>>> @@ -224,6 +227,7 @@ struct exynos_drm_crtc {
>>>  	enum exynos_drm_output_type	type;
>>>  	unsigned int			pipe;
>>>  	unsigned int			dpms;
>>> +	unsigned int			plane_mask;
>>>  	enum exynos_crtc_mode		mode;
>>>  	wait_queue_head_t		pending_flip_queue;
>>>  	struct drm_pending_vblank_event	*event;
>>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
>>> index ebb4cdc..f498d86 100644
>>> --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
>>> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
>>> @@ -585,6 +585,16 @@ static void fimd_shadow_protect_win(struct fimd_context *ctx,
>>>  {
>>>  	u32 reg, bits, val;
>>>  
>>> +	/*
>>> +	 * SHADOWCON/PRTCON register is used for enabling timing.
>>> +	 *
>>> +	 * for example, once only width value of a register is set,
>>> +	 * if the dma is started then fimd hardware could malfunction so
>>> +	 * with protect window setting, the register fields with prefix '_F'
>>> +	 * wouldn't be updated at vsync also but updated once unprotect window
>>> +	 * is set.
>>> +	 */
>>> +
>>>  	if (ctx->driver_data->has_shadowcon) {
>>>  		reg = SHADOWCON;
>>>  		bits = SHADOWCON_WINx_PROTECT(win);
>>> @@ -627,20 +637,6 @@ static void fimd_win_commit(struct exynos_drm_crtc *crtc, int zpos)
>>>  		return;
>>>  	}
>>>  
>>> -	/*
>>> -	 * SHADOWCON/PRTCON register is used for enabling timing.
>>> -	 *
>>> -	 * for example, once only width value of a register is set,
>>> -	 * if the dma is started then fimd hardware could malfunction so
>>> -	 * with protect window setting, the register fields with prefix '_F'
>>> -	 * wouldn't be updated at vsync also but updated once unprotect window
>>> -	 * is set.
>>> -	 */
>>> -
>>> -	/* protect windows */
>>> -	fimd_shadow_protect_win(ctx, win, true);
>>> -
>>> -
>>>  	offset = plane->fb_x * (plane->bpp >> 3);
>>>  	offset += plane->fb_y * plane->pitch;
>>>  
>>> @@ -722,9 +718,6 @@ static void fimd_win_commit(struct exynos_drm_crtc *crtc, int zpos)
>>>  	if (ctx->driver_data->has_shadowcon)
>>>  		fimd_enable_shadow_channel_path(ctx, win, true);
>>>  
>>> -	/* Enable DMA channel and unprotect windows */
>>> -	fimd_shadow_protect_win(ctx, win, false);
>>> -
>>>  	plane->enabled = true;
>>>  
>>>  	if (ctx->i80_if)
>>> @@ -947,6 +940,34 @@ static void fimd_te_handler(struct exynos_drm_crtc *crtc)
>>>  		drm_handle_vblank(ctx->drm_dev, ctx->pipe);
>>>  }
>>>  
>>> +static void fimd_win_protect(struct exynos_drm_crtc *crtc, int zpos)
>>> +{
>>> +	struct fimd_context *ctx = crtc->ctx;
>>> +	int win = zpos;
>>> +
>>> +	if (win == DEFAULT_ZPOS)
>>> +		win = ctx->default_win;
>>> +
>>> +	if (win < 0 || win >= WINDOWS_NR)
>>> +		return;
>>> +
>>> +	fimd_shadow_protect_win(ctx, win, true);
>>> +}
>>> +
>>> +static void fimd_win_unprotect(struct exynos_drm_crtc *crtc, int zpos)
>>> +{
>>> +	struct fimd_context *ctx = crtc->ctx;
>>> +	int win = zpos;
>>> +
>>> +	if (win == DEFAULT_ZPOS)
>>> +		win = ctx->default_win;
>>> +
>>> +	if (win < 0 || win >= WINDOWS_NR)
>>> +		return;
>>> +
>>> +	fimd_shadow_protect_win(ctx, win, false);
>>> +}
>>> +
>>>  static struct exynos_drm_crtc_ops fimd_crtc_ops = {
>>>  	.dpms = fimd_dpms,
>>>  	.mode_fixup = fimd_mode_fixup,
>>> @@ -957,6 +978,8 @@ static struct exynos_drm_crtc_ops fimd_crtc_ops = {
>>>  	.win_commit = fimd_win_commit,
>>>  	.win_disable = fimd_win_disable,
>>>  	.te_handler = fimd_te_handler,
>>> +	.win_protect = fimd_win_protect,
>>> +	.win_unprotect = fimd_win_unprotect,
>>>  };
>>>  
>>>  static irqreturn_t fimd_irq_handler(int irq, void *dev_id)
>>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.c b/drivers/gpu/drm/exynos/exynos_drm_plane.c
>>> index a3b0687..363d59d 100644
>>> --- a/drivers/gpu/drm/exynos/exynos_drm_plane.c
>>> +++ b/drivers/gpu/drm/exynos/exynos_drm_plane.c
>>> @@ -65,6 +65,7 @@ static int exynos_plane_get_size(int start, unsigned length, unsigned last)
>>>  int exynos_check_plane(struct drm_plane *plane, struct drm_framebuffer *fb)
>>>  {
>>>  	struct exynos_drm_plane *exynos_plane = to_exynos_plane(plane);
>>> +	struct exynos_drm_crtc *exynos_crtc = to_exynos_crtc(plane->crtc);
>>>  	int nr;
>>>  	int i;
>>>  
>>> @@ -83,6 +84,9 @@ int exynos_check_plane(struct drm_plane *plane, struct drm_framebuffer *fb)
>>>  				i, (unsigned long)exynos_plane->dma_addr[i]);
>>>  	}
>>>  
>>> +	if (exynos_crtc)
>>> +		exynos_crtc->plane_mask += 1 << exynos_plane->zpos;
>>> +
>>>  	return 0;
>>>  }
>>>  
>>>
>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> http://lists.freedesktop.org/mailman/listinfo/dri-devel
> 
