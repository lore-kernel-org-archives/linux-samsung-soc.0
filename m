From: Ajay kumar <ajaynumb@gmail.com>
Subject: Re: [PATCH V4 05/10] drm/bridge: add helper functions to support
 bridge chain
Date: Fri, 20 Jun 2014 13:37:47 +0530
Message-ID: <CAEC9eQPV84fF0FfzR7FXP2ZiXAB-QKag7d_rPA94LDaBLXD0=A@mail.gmail.com>
References: <1402511228-18945-1-git-send-email-ajaykumar.rs@samsung.com>
	<1402511228-18945-6-git-send-email-ajaykumar.rs@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f180.google.com ([209.85.220.180]:55680 "EHLO
	mail-vc0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932451AbaFTIHt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 20 Jun 2014 04:07:49 -0400
In-Reply-To: <1402511228-18945-6-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ajay Kumar <ajaykumar.rs@samsung.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, devicetree@vger.kernel.org, Dae <inki.dae@samsung.com>, Sean Paul <seanpaul@google.com>, Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Thierry Reding <thierry.reding@gmail.com>, sunil joshi <joshi@samsung.com>, Prashanth G <prashanth.g@samsung.com>, =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>

ping.

On Wed, Jun 11, 2014 at 11:57 PM, Ajay Kumar <ajaykumar.rs@samsung.com> wrote:
> Add helper functions to create bridge chain and to call the
> corresponding next_bridge functions.
>
> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> Suggested-by: Rob Clark <robdclark@gmail.com>
> ---
>  include/drm/drm_crtc.h |   72 ++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 72 insertions(+)
>
> diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
> index a7fac56..ba6a0d2 100644
> --- a/include/drm/drm_crtc.h
> +++ b/include/drm/drm_crtc.h
> @@ -640,6 +640,7 @@ struct drm_bridge_funcs {
>  struct drm_bridge {
>         struct drm_device *dev;
>         struct list_head head;
> +       struct drm_bridge *next_bridge;
>
>         struct drm_mode_object base;
>
> @@ -1148,6 +1149,77 @@ drm_property_blob_find(struct drm_device *dev, uint32_t id)
>         return mo ? obj_to_blob(mo) : NULL;
>  }
>
> +static inline int drm_bridge_add_to_chain(struct drm_bridge *head,
> +                                         struct drm_bridge *last)
> +{
> +       struct drm_bridge *temp = head;
> +
> +       if (head && last) {
> +               while (temp->next_bridge)
> +                       temp = temp->next_bridge;
> +
> +               temp->next_bridge = last;
> +               return 0;
> +       }
> +
> +       return -EINVAL;
> +}
> +
> +static inline void drm_next_bridge_mode_fixup(struct drm_bridge *bridge,
> +                                       const struct drm_display_mode *mode,
> +                                       struct drm_display_mode *adjusted_mode)
> +{
> +       if (bridge && bridge->next_bridge && bridge->next_bridge->funcs &&
> +           bridge->next_bridge->funcs->mode_fixup)
> +               bridge->next_bridge->funcs->mode_fixup(bridge->next_bridge,
> +                                                       mode, adjusted_mode);
> +}
> +
> +static inline void drm_next_bridge_disable(struct drm_bridge *bridge)
> +{
> +       if (bridge && bridge->next_bridge && bridge->next_bridge->funcs &&
> +           bridge->next_bridge->funcs->disable)
> +               bridge->next_bridge->funcs->disable(bridge->next_bridge);
> +}
> +
> +static inline void drm_next_bridge_post_disable(struct drm_bridge *bridge)
> +{
> +       if (bridge && bridge->next_bridge && bridge->next_bridge->funcs &&
> +           bridge->next_bridge->funcs->post_disable)
> +               bridge->next_bridge->funcs->post_disable(bridge->next_bridge);
> +}
> +
> +static inline void drm_next_bridge_mode_set(struct drm_bridge *bridge,
> +                                       struct drm_display_mode *mode,
> +                                       struct drm_display_mode *adjusted_mode)
> +{
> +       if (bridge && bridge->next_bridge && bridge->next_bridge->funcs &&
> +           bridge->next_bridge->funcs->mode_set)
> +               bridge->next_bridge->funcs->mode_set(bridge->next_bridge,
> +                                                       mode, adjusted_mode);
> +}
> +
> +static inline void drm_next_bridge_pre_enable(struct drm_bridge *bridge)
> +{
> +       if (bridge && bridge->next_bridge && bridge->next_bridge->funcs &&
> +           bridge->next_bridge->funcs->pre_enable)
> +               bridge->next_bridge->funcs->pre_enable(bridge->next_bridge);
> +}
> +
> +static inline void drm_next_bridge_enable(struct drm_bridge *bridge)
> +{
> +       if (bridge && bridge->next_bridge && bridge->next_bridge->funcs &&
> +           bridge->next_bridge->funcs->enable)
> +               bridge->next_bridge->funcs->enable(bridge->next_bridge);
> +}
> +
> +static inline void drm_next_bridge_destroy(struct drm_bridge *bridge)
> +{
> +       if (bridge && bridge->next_bridge && bridge->next_bridge->funcs &&
> +           bridge->next_bridge->funcs->destroy)
> +               bridge->next_bridge->funcs->destroy(bridge->next_bridge);
> +}
> +
>  /* Plane list iterator for legacy (overlay only) planes. */
>  #define drm_for_each_legacy_plane(plane, planelist) \
>         list_for_each_entry(plane, planelist, head) \
> --
> 1.7.9.5
>
