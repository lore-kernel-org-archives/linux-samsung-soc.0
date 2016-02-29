From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v5 3/5] drm: simplify initialization of rotation property
Date: Mon, 29 Feb 2016 16:09:31 +0100
Message-ID: <20160229150931.GB32705@phenom.ffwll.local>
References: <1453905883-6807-1-git-send-email-m.szyprowski@samsung.com>
 <1453905883-6807-4-git-send-email-m.szyprowski@samsung.com>
 <20160229150640.GA32705@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f47.google.com ([74.125.82.47]:36732 "EHLO
	mail-wm0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750871AbcB2PIw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 29 Feb 2016 10:08:52 -0500
Received: by mail-wm0-f47.google.com with SMTP id n186so53883216wmn.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Feb 2016 07:08:51 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20160229150640.GA32705@phenom.ffwll.local>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, Inki Dae <inki.dae@samsung.com>, Daniel Vetter <daniel@ffwll.ch>, Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Gustavo Padovan <gustavo@padovan.org>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, vincent.abriou@st.com, fabien.dessenne@st.com

On Mon, Feb 29, 2016 at 04:06:40PM +0100, Daniel Vetter wrote:
> On Wed, Jan 27, 2016 at 03:44:41PM +0100, Marek Szyprowski wrote:
> > This patch simplifies initialization of generic rotation property and
> > aligns the code to match recently introduced function for intializing
> > generic zpos property. It also adds missing documentation.
> > 
> > Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> 
> I merged patches 3-5 to drm-misc, thanks. For the blending mode I'd like
> to gather a few more acks from people who have been proposing ideas in the
> past (would speed up if you cc them next time around).

Blergh, I meant patches 1-3 are merged ofc ;-)
> 
> Thanks, Daniel
> > ---
> >  drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c | 10 ++++-----
> >  drivers/gpu/drm/drm_crtc.c                      | 29 ++++++++++++++++++++-----
> >  drivers/gpu/drm/i915/intel_display.c            |  6 ++---
> >  drivers/gpu/drm/msm/mdp/mdp5/mdp5_plane.c       |  3 +--
> >  drivers/gpu/drm/omapdrm/omap_drv.c              |  3 +--
> >  include/drm/drm_crtc.h                          |  4 ++--
> >  6 files changed, 33 insertions(+), 22 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
> > index 1ffe9c329c46..4f9606cdf0f2 100644
> > --- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
> > +++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
> > @@ -967,12 +967,10 @@ atmel_hlcdc_plane_create_properties(struct drm_device *dev)
> >  	if (!props->alpha)
> >  		return ERR_PTR(-ENOMEM);
> >  
> > -	dev->mode_config.rotation_property =
> > -			drm_mode_create_rotation_property(dev,
> > -							  BIT(DRM_ROTATE_0) |
> > -							  BIT(DRM_ROTATE_90) |
> > -							  BIT(DRM_ROTATE_180) |
> > -							  BIT(DRM_ROTATE_270));
> > +	drm_mode_create_rotation_property(dev, BIT(DRM_ROTATE_0) |
> > +					       BIT(DRM_ROTATE_90) |
> > +					       BIT(DRM_ROTATE_180) |
> > +					       BIT(DRM_ROTATE_270));
> >  	if (!dev->mode_config.rotation_property)
> >  		return ERR_PTR(-ENOMEM);
> >  
> > diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
> > index d40bab29747e..822ad6928144 100644
> > --- a/drivers/gpu/drm/drm_crtc.c
> > +++ b/drivers/gpu/drm/drm_crtc.c
> > @@ -5875,10 +5875,23 @@ void drm_mode_config_cleanup(struct drm_device *dev)
> >  }
> >  EXPORT_SYMBOL(drm_mode_config_cleanup);
> >  
> > -struct drm_property *drm_mode_create_rotation_property(struct drm_device *dev,
> > -						       unsigned int supported_rotations)
> > +/**
> > + * drm_mode_create_rotation_property - create generic rotation property
> > + * @dev: DRM device
> > + * @supported_rotations: bitmask of supported rotation modes
> > + *
> > + * This function initializes generic rotation property and enables support
> > + * for it in drm core. Drivers can then attach this property to planes to enable
> > + * support for different rotation modes.
> > + *
> > + * Returns:
> > + * Zero on success, negative errno on failure.
> > + */
> > +int drm_mode_create_rotation_property(struct drm_device *dev,
> > +				      unsigned int supported_rotations)
> >  {
> > -	static const struct drm_prop_enum_list props[] = {
> > +	struct drm_property *prop;
> > +	static const struct drm_prop_enum_list values[] = {
> >  		{ DRM_ROTATE_0,   "rotate-0" },
> >  		{ DRM_ROTATE_90,  "rotate-90" },
> >  		{ DRM_ROTATE_180, "rotate-180" },
> > @@ -5887,9 +5900,13 @@ struct drm_property *drm_mode_create_rotation_property(struct drm_device *dev,
> >  		{ DRM_REFLECT_Y,  "reflect-y" },
> >  	};
> >  
> > -	return drm_property_create_bitmask(dev, 0, "rotation",
> > -					   props, ARRAY_SIZE(props),
> > -					   supported_rotations);
> > +	prop = drm_property_create_bitmask(dev, 0, "rotation", values,
> > +				ARRAY_SIZE(values), supported_rotations);
> > +	if (!prop)
> > +		return -ENOMEM;
> > +
> > +	dev->mode_config.rotation_property = prop;
> > +	return 0;
> >  }
> >  EXPORT_SYMBOL(drm_mode_create_rotation_property);
> >  
> > diff --git a/drivers/gpu/drm/i915/intel_display.c b/drivers/gpu/drm/i915/intel_display.c
> > index 2f00828ccc6e..1bce8750c308 100644
> > --- a/drivers/gpu/drm/i915/intel_display.c
> > +++ b/drivers/gpu/drm/i915/intel_display.c
> > @@ -14046,8 +14046,7 @@ void intel_create_rotation_property(struct drm_device *dev, struct intel_plane *
> >  		if (INTEL_INFO(dev)->gen >= 9)
> >  			flags |= BIT(DRM_ROTATE_90) | BIT(DRM_ROTATE_270);
> >  
> > -		dev->mode_config.rotation_property =
> > -			drm_mode_create_rotation_property(dev, flags);
> > +		drm_mode_create_rotation_property(dev, flags);
> >  	}
> >  	if (dev->mode_config.rotation_property)
> >  		drm_object_attach_property(&plane->base.base,
> > @@ -14183,8 +14182,7 @@ static struct drm_plane *intel_cursor_plane_create(struct drm_device *dev,
> >  
> >  	if (INTEL_INFO(dev)->gen >= 4) {
> >  		if (!dev->mode_config.rotation_property)
> > -			dev->mode_config.rotation_property =
> > -				drm_mode_create_rotation_property(dev,
> > +			drm_mode_create_rotation_property(dev,
> >  							BIT(DRM_ROTATE_0) |
> >  							BIT(DRM_ROTATE_180));
> >  		if (dev->mode_config.rotation_property)
> > diff --git a/drivers/gpu/drm/msm/mdp/mdp5/mdp5_plane.c b/drivers/gpu/drm/msm/mdp/mdp5/mdp5_plane.c
> > index 432c09836b0e..8defeec0d453 100644
> > --- a/drivers/gpu/drm/msm/mdp/mdp5/mdp5_plane.c
> > +++ b/drivers/gpu/drm/msm/mdp/mdp5/mdp5_plane.c
> > @@ -76,8 +76,7 @@ static void mdp5_plane_install_rotation_property(struct drm_device *dev,
> >  		return;
> >  
> >  	if (!dev->mode_config.rotation_property)
> > -		dev->mode_config.rotation_property =
> > -			drm_mode_create_rotation_property(dev,
> > +		drm_mode_create_rotation_property(dev,
> >  			BIT(DRM_REFLECT_X) | BIT(DRM_REFLECT_Y));
> >  
> >  	if (dev->mode_config.rotation_property)
> > diff --git a/drivers/gpu/drm/omapdrm/omap_drv.c b/drivers/gpu/drm/omapdrm/omap_drv.c
> > index dfafdb602ad2..c6ce2b31f1c5 100644
> > --- a/drivers/gpu/drm/omapdrm/omap_drv.c
> > +++ b/drivers/gpu/drm/omapdrm/omap_drv.c
> > @@ -304,8 +304,7 @@ static int omap_modeset_init_properties(struct drm_device *dev)
> >  	struct omap_drm_private *priv = dev->dev_private;
> >  
> >  	if (priv->has_dmm) {
> > -		dev->mode_config.rotation_property =
> > -			drm_mode_create_rotation_property(dev,
> > +		drm_mode_create_rotation_property(dev,
> >  				BIT(DRM_ROTATE_0) | BIT(DRM_ROTATE_90) |
> >  				BIT(DRM_ROTATE_180) | BIT(DRM_ROTATE_270) |
> >  				BIT(DRM_REFLECT_X) | BIT(DRM_REFLECT_Y));
> > diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
> > index 4f32a358d631..702f4f28f580 100644
> > --- a/include/drm/drm_crtc.h
> > +++ b/include/drm/drm_crtc.h
> > @@ -2494,8 +2494,8 @@ extern int drm_format_plane_cpp(uint32_t format, int plane);
> >  extern int drm_format_horz_chroma_subsampling(uint32_t format);
> >  extern int drm_format_vert_chroma_subsampling(uint32_t format);
> >  extern const char *drm_get_format_name(uint32_t format);
> > -extern struct drm_property *drm_mode_create_rotation_property(struct drm_device *dev,
> > -							      unsigned int supported_rotations);
> > +extern int drm_mode_create_rotation_property(struct drm_device *dev,
> > +					     unsigned int supported_rotations);
> >  extern unsigned int drm_rotation_simplify(unsigned int rotation,
> >  					  unsigned int supported_rotations);
> >  
> > -- 
> > 1.9.2
> > 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
