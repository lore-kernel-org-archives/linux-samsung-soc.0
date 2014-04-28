From: Ajay kumar <ajaynumb@gmail.com>
Subject: Re: [PATCH V2 7/9] drm/bridge: ptn3460: add drm_panel controls
Date: Mon, 28 Apr 2014 18:38:48 +0530
Message-ID: <CAEC9eQNvWXnDhfsJJnd-T8sa4qD6jWsTpmr9tPKAC5UopED=jQ@mail.gmail.com>
References: <1398119958-32005-1-git-send-email-ajaykumar.rs@samsung.com>
	<1398119958-32005-8-git-send-email-ajaykumar.rs@samsung.com>
	<CAF6AEGtEa6rBarSXEkmZrreEKGcwTOCWhhx-OT9JmAhBhAk_Zw@mail.gmail.com>
	<CAEC9eQPiUdR_0gKVxmA8KhHD7z2AehRGOUU25e5zQz=PQyDqpA@mail.gmail.com>
	<CAEC9eQPPoU3wWgzOi6DQP=Lxq8EC-AOpRJS20uTjwZa=vfY_Rw@mail.gmail.com>
	<CAF6AEGuL3=bvBPGCDW5_db58ie23enY8VwNG7wCeQTn+JM4-Rw@mail.gmail.com>
	<CAEC9eQPtBCtUtRsHsJ4u_58PX7_UrcVJRkL4XOoM9M1sT1eiCQ@mail.gmail.com>
	<CAF6AEGspP6itAuioyQSQapvbG95MzFvJABg2UrgvNaX7hempsg@mail.gmail.com>
	<CAEC9eQOtDtwswxBV_qCmm_23TYY74PuiYt=SS+Z=vPw0ZOFijg@mail.gmail.com>
	<CAEC9eQPxsdtKZdFx91gkNbbrQM+Ch9TpguzPe55-YUFM0=zOVw@mail.gmail.com>
	<CAEC9eQPvYQqU2Xem2sCYW0tM9+d68+4WLfC47G79NUXE4kzpMg@mail.gmail.com>
	<CAKMK7uEOo=0hhgmqztVG+nZEXLrYvg4fWFmjrUUHj+tRPhfm7A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f176.google.com ([209.85.220.176]:57031 "EHLO
	mail-vc0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751656AbaD1NIt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 28 Apr 2014 09:08:49 -0400
Received: by mail-vc0-f176.google.com with SMTP id lc6so7867853vcb.7
        for <linux-samsung-soc@vger.kernel.org>; Mon, 28 Apr 2014 06:08:48 -0700 (PDT)
In-Reply-To: <CAKMK7uEOo=0hhgmqztVG+nZEXLrYvg4fWFmjrUUHj+tRPhfm7A@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Daniel Vetter <daniel@ffwll.ch>, Rob Clark <robdclark@gmail.com>
Cc: "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, Sean Paul <seanpaul@google.com>, sunil joshi <joshi@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Prashanth G <prashanth.g@samsung.com>, Ajay Kumar <ajaykumar.rs@samsung.com>

Daniel,

On Sun, Apr 27, 2014 at 6:25 PM, Daniel Vetter <daniel@ffwll.ch> wrote:
> On Fri, Apr 25, 2014 at 8:17 AM, Ajay kumar <ajaynumb@gmail.com> wrote:
>> We can call panel_enable/disable at the right point. Even the bridge chips
>> expect the same. So, I am not ok with combining the bridge and panel and
>> calling the fxn pointers from crtc_helpers.
>> So, either we leave it the way it is in this patch (call drm_panel
>> functions at right points) or
>> we don't use drm_panel to control the panel sequence and instead use few DT
>> properties and regulators, inside the bridge chip driver.
>
> That wasn't really suggested, but instead the idea was to provide a
> default drm_bridge which wraps the drm_panel so that you could more
> easily chain them up.
What do you mean by "default" drm_bridge?
I just want to clear few things. Let me explain what I have understood:
What I understand is that Rob wants me to create a common
structure which wraps up drm_panel and drm_bridge into a single structure:
  struct drm_panel_bridge {
    struct drm_bridge base;
    struct drm_panel *panel;
    struct drm_bridge *bridge; /* optional */  ==> Really not sure why
this is needed!
  };

  static void drm_panel_bridge_enable(struct drm_bridge *bridge)
  {
    struct drm_panel_bridge *pb = to_panel_bridge(bridge);
    if (pb->bridge)
      pb->bridge->funcs->enable(pb->bridge);
    pb->panel->funcs->enable(pb->panel);
  }

And now, the above function becomes a common function
(also with an ordering issue btw panel and bridge).
Where do we keep it? And, where do we call it from?

> Also I'm not really happy that the bridge callbacks have been added to
> the drm helpers (I'd prefer if driver callbacks would bear that
> responsibility). But you can always create your own drm_bridge
> integration.
Do you mean, the bridge calls should be moved out of common drm_helper
functions and called from platform specific drivers instead?

> In any case your concern that drivers need to control
> when certain callbacks are called is shared by everyone here afaics.
> And I also don't see any issues with Rob's proposal in this regard.
> -Daniel
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> +41 (0) 79 365 57 48 - http://blog.ffwll.ch

Please let me know if my understanding is correct and correct me if
there is a misconception.

Regards,
Ajay Kumar
