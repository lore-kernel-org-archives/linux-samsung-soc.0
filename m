From: Gustavo Padovan <gustavo@padovan.org>
Subject: Re: [PATCH 10/10] drm/exynos: atomic dpms support
Date: Thu, 2 Apr 2015 11:08:37 -0300
Message-ID: <20150402140837.GA6970@joana>
References: <1427471939-27345-10-git-send-email-gustavo@padovan.org>
 <1427742717-21469-1-git-send-email-gustavo@padovan.org>
 <551D058A.3010805@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qc0-f169.google.com ([209.85.216.169]:34438 "EHLO
	mail-qc0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753075AbbDBOIl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 2 Apr 2015 10:08:41 -0400
Received: by qcay5 with SMTP id y5so67551697qca.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 02 Apr 2015 07:08:40 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <551D058A.3010805@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Joonyoung Shim <jy0922.shim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, inki.dae@samsung.com, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

Hi Joonyoung,

2015-04-02 Joonyoung Shim <jy0922.shim@samsung.com>:

> Hi,
> 
> On 03/31/2015 04:11 AM, Gustavo Padovan wrote:
> > From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> > 
> > Run dpms operations through the atomic intefaces. This basically removes
> > the .dpms() callback from econders and crtcs and use .disable() and
> > .enable() to turn the crtc on and off.
> > 
> > Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> > ---
> >  drivers/gpu/drm/exynos/exynos_dp_core.c     |  2 +-
> >  drivers/gpu/drm/exynos/exynos_drm_crtc.c    | 99 ++++++++++++++++-------------
> >  drivers/gpu/drm/exynos/exynos_drm_dpi.c     |  2 +-
> >  drivers/gpu/drm/exynos/exynos_drm_drv.h     |  4 +-
> >  drivers/gpu/drm/exynos/exynos_drm_dsi.c     |  2 +-
> >  drivers/gpu/drm/exynos/exynos_drm_encoder.c | 27 ++------
> >  drivers/gpu/drm/exynos/exynos_drm_fbdev.c   |  3 -
> >  drivers/gpu/drm/exynos/exynos_drm_plane.c   |  1 -
> >  drivers/gpu/drm/exynos/exynos_drm_vidi.c    |  2 +-
> >  drivers/gpu/drm/exynos/exynos_hdmi.c        |  2 +-
> >  10 files changed, 67 insertions(+), 77 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/exynos/exynos_dp_core.c b/drivers/gpu/drm/exynos/exynos_dp_core.c
> > index 6704d5c..e030d16 100644
> > --- a/drivers/gpu/drm/exynos/exynos_dp_core.c
> > +++ b/drivers/gpu/drm/exynos/exynos_dp_core.c
> > @@ -949,7 +949,7 @@ static void exynos_dp_connector_destroy(struct drm_connector *connector)
> >  }
> >  
> >  static struct drm_connector_funcs exynos_dp_connector_funcs = {
> > -	.dpms = drm_helper_connector_dpms,
> > +	.dpms = drm_atomic_helper_connector_dpms,
> >  	.fill_modes = drm_helper_probe_single_connector_modes,
> >  	.detect = exynos_dp_detect,
> >  	.destroy = exynos_dp_connector_destroy,
> > diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.c b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
> > index 0db7b91..b493993 100644
> > --- a/drivers/gpu/drm/exynos/exynos_drm_crtc.c
> > +++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
> > @@ -22,51 +22,57 @@
> >  #include "exynos_drm_encoder.h"
> >  #include "exynos_drm_plane.h"
> >  
> > -static void exynos_drm_crtc_dpms(struct drm_crtc *crtc, int mode)
> > +static void exynos_drm_crtc_enable(struct drm_crtc *crtc)
> >  {
> >  	struct exynos_drm_crtc *exynos_crtc = to_exynos_crtc(crtc);
> > +	struct exynos_drm_plane *exynos_plane = to_exynos_plane(crtc->primary);
> >  
> > -	DRM_DEBUG_KMS("crtc[%d] mode[%d]\n", crtc->base.id, mode);
> > -
> > -	if (exynos_crtc->dpms == mode) {
> > -		DRM_DEBUG_KMS("desired dpms mode is same as previous one.\n");
> > +	if (WARN_ON(exynos_crtc->enabled))
> 
> I'm not sure this is really important condition to report warning.

Sure. I think I can remove it.

> 
> >  		return;
> > -	}
> > -
> > -	if (mode > DRM_MODE_DPMS_ON) {
> > -		/* wait for the completion of page flip. */
> > -		if (!wait_event_timeout(exynos_crtc->pending_flip_queue,
> > -				(exynos_crtc->event == NULL), HZ/20))
> > -			exynos_crtc->event = NULL;
> > -		drm_crtc_vblank_off(crtc);
> > -	}
> >  
> >  	if (exynos_crtc->ops->dpms)
> > -		exynos_crtc->ops->dpms(exynos_crtc, mode);
> > +		exynos_crtc->ops->dpms(exynos_crtc, DRM_MODE_DPMS_ON);
> >  
> > -	exynos_crtc->dpms = mode;
> > +	exynos_crtc->enabled = true;
> >  
> > -	if (mode == DRM_MODE_DPMS_ON)
> > -		drm_crtc_vblank_on(crtc);
> > -}
> > +	drm_crtc_vblank_on(crtc);
> >  
> > -static void exynos_drm_crtc_prepare(struct drm_crtc *crtc)
> > -{
> > -	/* drm framework doesn't check NULL. */
> > +	if (exynos_crtc->ops->win_commit)
> > +		exynos_crtc->ops->win_commit(exynos_crtc, exynos_plane->zpos);
> > +
> > +	if (exynos_crtc->ops->commit)
> > +		exynos_crtc->ops->commit(exynos_crtc);
> >  }
> >  
> > -static void exynos_drm_crtc_commit(struct drm_crtc *crtc)
> > +static void exynos_drm_crtc_disable(struct drm_crtc *crtc)
> >  {
> >  	struct exynos_drm_crtc *exynos_crtc = to_exynos_crtc(crtc);
> > -	struct exynos_drm_plane *exynos_plane = to_exynos_plane(crtc->primary);
> > +	struct drm_plane *plane;
> > +	int ret;
> > +
> > +	if (WARN_ON(!exynos_crtc->enabled))
> > +		return;
> >  
> > -	exynos_drm_crtc_dpms(crtc, DRM_MODE_DPMS_ON);
> > +	/* wait for the completion of page flip. */
> > +	if (!wait_event_timeout(exynos_crtc->pending_flip_queue,
> > +				(exynos_crtc->event == NULL), HZ/20))
> > +		exynos_crtc->event = NULL;
> >  
> > -	if (exynos_crtc->ops->win_commit)
> > -		exynos_crtc->ops->win_commit(exynos_crtc, exynos_plane->zpos);
> > +	drm_crtc_vblank_off(crtc);
> >  
> > -	if (exynos_crtc->ops->commit)
> > -		exynos_crtc->ops->commit(exynos_crtc);
> > +	if (exynos_crtc->ops->dpms)
> > +		exynos_crtc->ops->dpms(exynos_crtc, DRM_MODE_DPMS_OFF);
> > +
> > +	exynos_crtc->enabled = false;
> > +
> > +	drm_for_each_legacy_plane(plane, &crtc->dev->mode_config.plane_list) {
> > +		if (plane->crtc != crtc)
> > +			continue;
> > +
> > +		ret = plane->funcs->disable_plane(plane);
> > +		if (ret)
> > +			DRM_ERROR("Failed to disable plane %d\n", ret);
> > +	}
> >  }
> >  
> >  static bool
> > @@ -95,32 +101,36 @@ exynos_drm_crtc_mode_set_nofb(struct drm_crtc *crtc)
> >  		exynos_crtc->ops->commit(exynos_crtc);
> >  }
> >  
> > -static void exynos_drm_crtc_disable(struct drm_crtc *crtc)
> > +static int exynos_crtc_atomic_check(struct drm_crtc *crtc,
> > +				     struct drm_crtc_state *state)
> >  {
> > -	struct drm_plane *plane;
> > +	struct exynos_drm_crtc *exynos_crtc = to_exynos_crtc(crtc);
> >  	int ret;
> >  
> > -	exynos_drm_crtc_dpms(crtc, DRM_MODE_DPMS_OFF);
> > +	if (exynos_crtc->event)
> > +		return -EBUSY;
> >  
> > -	drm_for_each_legacy_plane(plane, &crtc->dev->mode_config.plane_list) {
> > -		if (plane->crtc != crtc)
> > -			continue;
> > +	if (state->event) {
> > +		ret = drm_vblank_get(crtc->dev, exynos_crtc->pipe);
> > +		if (ret) {
> > +			DRM_ERROR("failed to acquire vblank counter\n");
> > +			return ret;
> > +		}
> >  
> > -		ret = plane->funcs->disable_plane(plane);
> > -		if (ret)
> > -			DRM_ERROR("Failed to disable plane %d\n", ret);
> > +		exynos_crtc->event = state->event;
> >  	}
> > +
> > +	return 0;
> >  }
> >  
> >  static struct drm_crtc_helper_funcs exynos_crtc_helper_funcs = {
> > -	.dpms		= exynos_drm_crtc_dpms,
> > -	.prepare	= exynos_drm_crtc_prepare,
> > -	.commit		= exynos_drm_crtc_commit,
> > +	.enable		= exynos_drm_crtc_enable,
> > +	.disable	= exynos_drm_crtc_disable,
> 
> By this change, funcs->dpms should be changed to funcs->disable on
> hdmi_dpms function of drivers/gpu/drm/exynos/exynos_hdmi.c or any idea?
> 
> 	case DRM_MODE_DPMS_OFF:
> 		/*
> 		 * The SFRs of VP and Mixer are updated by Vertical Sync of
> 		 * Timing generator which is a part of HDMI so the sequence
> 		 * to disable TV Subsystem should be as following,
> 		 *	VP -> Mixer -> HDMI
> 		 *
> 		 * Below codes will try to disable Mixer and VP(if used)
> 		 * prior to disabling HDMI.
> 		 */
> 		if (crtc)
> 			funcs = crtc->helper_private;
> 		if (funcs && funcs->dpms)
> 			(*funcs->dpms)(crtc, mode);
> 
> 		hdmi_poweroff(hdata);
> 		break;

You are right, I've forgot about this hdmi case. I'll change it.

> 
> >  	.mode_fixup	= exynos_drm_crtc_mode_fixup,
> >  	.mode_set	= drm_helper_crtc_mode_set,
> >  	.mode_set_nofb	= exynos_drm_crtc_mode_set_nofb,
> >  	.mode_set_base	= drm_helper_crtc_mode_set_base,
> > -	.disable	= exynos_drm_crtc_disable,
> > +	.atomic_check	= exynos_crtc_atomic_check,
> >  };
> >  
> >  static void exynos_drm_crtc_destroy(struct drm_crtc *crtc)
> > @@ -162,7 +172,6 @@ struct exynos_drm_crtc *exynos_drm_crtc_create(struct drm_device *drm_dev,
> >  
> >  	init_waitqueue_head(&exynos_crtc->pending_flip_queue);
> >  
> > -	exynos_crtc->dpms = DRM_MODE_DPMS_OFF;
> >  	exynos_crtc->pipe = pipe;
> >  	exynos_crtc->type = type;
> >  	exynos_crtc->ops = ops;
> > @@ -193,7 +202,7 @@ int exynos_drm_crtc_enable_vblank(struct drm_device *dev, int pipe)
> >  	struct exynos_drm_crtc *exynos_crtc =
> >  		to_exynos_crtc(private->crtc[pipe]);
> >  
> > -	if (exynos_crtc->dpms != DRM_MODE_DPMS_ON)
> > +	if (!exynos_crtc->enabled)
> >  		return -EPERM;
> >  
> >  	if (exynos_crtc->ops->enable_vblank)
> > @@ -208,7 +217,7 @@ void exynos_drm_crtc_disable_vblank(struct drm_device *dev, int pipe)
> >  	struct exynos_drm_crtc *exynos_crtc =
> >  		to_exynos_crtc(private->crtc[pipe]);
> >  
> > -	if (exynos_crtc->dpms != DRM_MODE_DPMS_ON)
> > +	if (!exynos_crtc->enabled)
> >  		return;
> >  
> >  	if (exynos_crtc->ops->disable_vblank)
> > diff --git a/drivers/gpu/drm/exynos/exynos_drm_dpi.c b/drivers/gpu/drm/exynos/exynos_drm_dpi.c
> > index ced5c23..6dc328e 100644
> > --- a/drivers/gpu/drm/exynos/exynos_drm_dpi.c
> > +++ b/drivers/gpu/drm/exynos/exynos_drm_dpi.c
> > @@ -60,7 +60,7 @@ static void exynos_dpi_connector_destroy(struct drm_connector *connector)
> >  }
> >  
> >  static struct drm_connector_funcs exynos_dpi_connector_funcs = {
> > -	.dpms = drm_helper_connector_dpms,
> > +	.dpms = drm_atomic_helper_connector_dpms,
> >  	.detect = exynos_dpi_detect,
> >  	.fill_modes = drm_helper_probe_single_connector_modes,
> >  	.destroy = exynos_dpi_connector_destroy,
> > diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
> > index a1013aa..a7b708e 100644
> > --- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
> > +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
> > @@ -205,7 +205,7 @@ struct exynos_drm_crtc_ops {
> >   *	drm framework doesn't support multiple irq yet.
> >   *	we can refer to the crtc to current hardware interrupt occurred through
> >   *	this pipe value.
> > - * @dpms: store the crtc dpms value
> > + * @enabled: if the crtc is enabled or not
> >   * @event: vblank event that is currently queued for flip
> >   * @ops: pointer to callbacks for exynos drm specific functionality
> >   * @ctx: A pointer to the crtc's implementation specific context
> > @@ -214,7 +214,7 @@ struct exynos_drm_crtc {
> >  	struct drm_crtc			base;
> >  	enum exynos_drm_output_type	type;
> >  	unsigned int			pipe;
> > -	unsigned int			dpms;
> > +	bool				enabled;
> >  	wait_queue_head_t		pending_flip_queue;
> >  	struct drm_pending_vblank_event	*event;
> >  	struct exynos_drm_crtc_ops	*ops;
> > diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> > index 6e9c2c3..28233a5 100644
> > --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> > +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> > @@ -1458,7 +1458,7 @@ static void exynos_dsi_connector_destroy(struct drm_connector *connector)
> >  }
> >  
> >  static struct drm_connector_funcs exynos_dsi_connector_funcs = {
> > -	.dpms = drm_helper_connector_dpms,
> > +	.dpms = drm_atomic_helper_connector_dpms,
> >  	.detect = exynos_dsi_detect,
> >  	.fill_modes = drm_helper_probe_single_connector_modes,
> >  	.destroy = exynos_dsi_connector_destroy,
> > diff --git a/drivers/gpu/drm/exynos/exynos_drm_encoder.c b/drivers/gpu/drm/exynos/exynos_drm_encoder.c
> > index 57de0bd..0648ba4 100644
> > --- a/drivers/gpu/drm/exynos/exynos_drm_encoder.c
> > +++ b/drivers/gpu/drm/exynos/exynos_drm_encoder.c
> > @@ -32,17 +32,6 @@ struct exynos_drm_encoder {
> >  	struct exynos_drm_display	*display;
> >  };
> >  
> > -static void exynos_drm_encoder_dpms(struct drm_encoder *encoder, int mode)
> > -{
> > -	struct exynos_drm_encoder *exynos_encoder = to_exynos_encoder(encoder);
> > -	struct exynos_drm_display *display = exynos_encoder->display;
> > -
> > -	DRM_DEBUG_KMS("encoder dpms: %d\n", mode);
> > -
> > -	if (display->ops->dpms)
> > -		display->ops->dpms(display, mode);
> > -}
> > -
> >  static bool
> >  exynos_drm_encoder_mode_fixup(struct drm_encoder *encoder,
> >  			       const struct drm_display_mode *mode,
> > @@ -76,12 +65,7 @@ static void exynos_drm_encoder_mode_set(struct drm_encoder *encoder,
> >  		display->ops->mode_set(display, adjusted_mode);
> >  }
> >  
> > -static void exynos_drm_encoder_prepare(struct drm_encoder *encoder)
> > -{
> > -	/* drm framework doesn't check NULL. */
> > -}
> 
> This function is related with below flow on disable_outputs fuction of
> drivers/gpu/drm/drm_atomic_helper.c
> 
> 		/* Right function depends upon target state. */
> 		if (connector->state->crtc && funcs->prepare)
> 			funcs->prepare(encoder);
> 		else if (funcs->disable)
> 			funcs->disable(encoder);
> 		else
> 			funcs->dpms(encoder, DRM_MODE_DPMS_OFF);
> 
> I'm not sure it's right to call funcs->disable instead of
> funcs->prepare.

If you look the steps below this flow with the fix to avoid a full modeset
from Daniel Vetter (4218a32 in dri-devel/drm-next) you will see the if the 
code get at this point of the it is because it will disable the connector.
So call ->disable here is exactly the right call.

> 
> > -
> > -static void exynos_drm_encoder_commit(struct drm_encoder *encoder)
> > +static void exynos_drm_encoder_enable(struct drm_encoder *encoder)
> >  {
> >  	struct exynos_drm_encoder *exynos_encoder = to_exynos_encoder(encoder);
> >  	struct exynos_drm_display *display = exynos_encoder->display;
> > @@ -95,10 +79,13 @@ static void exynos_drm_encoder_commit(struct drm_encoder *encoder)
> >  
> >  static void exynos_drm_encoder_disable(struct drm_encoder *encoder)
> >  {
> > +	struct exynos_drm_encoder *exynos_encoder = to_exynos_encoder(encoder);
> > +	struct exynos_drm_display *display = exynos_encoder->display;
> >  	struct drm_plane *plane;
> >  	struct drm_device *dev = encoder->dev;
> >  
> > -	exynos_drm_encoder_dpms(encoder, DRM_MODE_DPMS_OFF);
> > +	if (display->ops->dpms)
> > +		display->ops->dpms(display, DRM_MODE_DPMS_OFF);
> >  
> >  	/* all planes connected to this encoder should be also disabled. */
> >  	drm_for_each_legacy_plane(plane, &dev->mode_config.plane_list) {
> > @@ -108,11 +95,9 @@ static void exynos_drm_encoder_disable(struct drm_encoder *encoder)
> >  }
> >  
> >  static struct drm_encoder_helper_funcs exynos_encoder_helper_funcs = {
> > -	.dpms		= exynos_drm_encoder_dpms,
> >  	.mode_fixup	= exynos_drm_encoder_mode_fixup,
> >  	.mode_set	= exynos_drm_encoder_mode_set,
> > -	.prepare	= exynos_drm_encoder_prepare,
> > -	.commit		= exynos_drm_encoder_commit,
> > +	.enable		= exynos_drm_encoder_enable,
> >  	.disable	= exynos_drm_encoder_disable,
> >  };
> >  
> > diff --git a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
> > index e71e331..e0b085b 100644
> > --- a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
> > +++ b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
> > @@ -275,9 +275,6 @@ int exynos_drm_fbdev_init(struct drm_device *dev)
> >  
> >  	}
> >  
> > -	/* disable all the possible outputs/crtcs before entering KMS mode */
> > -	drm_helper_disable_unused_functions(dev);
> > -
> 
> I think this is not related with atomic dpms support, if this needs,
> could you make another patch?

Yes, it is, once you port exynos to use atomic dpms we start getting warning
from this functions, the correct solution is to remove it. Other subsystems
followed the same approach.

I'm sending an updated patch set in a bit.

	Gustavo
