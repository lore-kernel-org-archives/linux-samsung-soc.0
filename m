From: Ajay kumar <ajaynumb@gmail.com>
Subject: Re: [RFC V2 0/3] drm/bridge: panel and chaining
Date: Thu, 15 May 2014 20:21:40 +0530
Message-ID: <CAEC9eQPpED8LewNsTnUNkkk0YB3hnQXyqQ+x+_iKJfwXMuQPig@mail.gmail.com>
References: <1399319548-16567-1-git-send-email-ajaykumar.rs@samsung.com>
	<536B26FC.507@samsung.com>
	<CAF6AEGvWxCS-NX4uLjyMqc==7X9znn8PJ0AmJ6aFqqHYSBgsrQ@mail.gmail.com>
	<536C9B2B.2010006@samsung.com>
	<CAF6AEGsd8xViZWroUgsT5Lf_DZhbC5-V_ycR_HOtqdUH9QbA1A@mail.gmail.com>
	<20140515103256.GH6434@ulmo>
	<20140515123452.GP8790@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f182.google.com ([209.85.220.182]:33514 "EHLO
	mail-vc0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754051AbaEOOvl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 15 May 2014 10:51:41 -0400
Received: by mail-vc0-f182.google.com with SMTP id la4so4476035vcb.41
        for <linux-samsung-soc@vger.kernel.org>; Thu, 15 May 2014 07:51:41 -0700 (PDT)
In-Reply-To: <20140515123452.GP8790@phenom.ffwll.local>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Rob Clark <robdclark@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>, "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, Daniel Vetter <daniel.vetter@ffwll.ch>, sunil joshi <joshi@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Prashanth G <prashanth.g@samsung.com>, Ajay Kumar <ajaykumar.rs@samsung.com>, Sean Paul <seanpaul@chromium.org>

On Thu, May 15, 2014 at 6:04 PM, Daniel Vetter <daniel@ffwll.ch> wrote:
> On Thu, May 15, 2014 at 12:32:58PM +0200, Thierry Reding wrote:
>> On Fri, May 09, 2014 at 09:59:34AM -0400, Rob Clark wrote:
>> > On Fri, May 9, 2014 at 5:08 AM, Andrzej Hajda <a.hajda@samsung.com> wrote:
>> [...]
>> > > 4. And the last thing, it is more about the concept/design. drm_bridge,
>> > > drm_hw_block suggests that those interfaces describes the whole device:
>> > > bridge, panel, whatever.
>> >
>> > hmm, I don't think this is the case.  I can easily see things like:
>> >
>> >   struct foo_panel {
>> >     struct drm_panel base;
>> >     struct drm_bridge bridge;
>> >     ...
>> >   }
>> >
>> > where a panel implementation implements both panel and bridge.  In
>> > fact that is kinda what I was encouraging.
>>
>> For lack of a better entry point into the discussion, let me pick this
>> example. It seems like in general we all agree that the basic structure
>> would have to be something like this:
>>
>>       CRTC -> encoder -> bridge [ -> bridge ... ] -> panel
>>
>> Where panel could optionally be a bridge/panel hybrid as Rob pointed
>> out. I'm not sure if there's panels like this, but I suspect the use
>> case would be where a panel had built-in controls to modify the image in
>> some fashion (brightness, saturation, ...). I think those things exist
>> in DCS for example.
>>
>> What's missing here, and if I understand correctly what Sean said about
>> the connector type, what we need to solve is how to wire up the
>> connector so that it reflects the correct type. So the above would have
>> to become something like this:
>>
>>       CRTC -> encoder -> bridge [ -> bridge ... ] -> panel
>>               connector -----------------------------^
>
> This is kinda always how I've thought it should play out: The last item in
> the chain actually implements the drm connector, everyone else just
> ignores it.
The last bridge or the panel?


>> One of the problems with that approach is that panel is more than just a
>> video sink. It also controls the panel (and optionally backlight) power.
>> The standard DRM connector helpers don't work well in that case, because
>> drm_helper_connector_dpms() forwards changes to the CRTC and encoder,
>> though that could possibly be solved by wrapping it in a small custom
>> implementation that also controls the panel. Anyway, that's really just
>> an implementation detail.
Why did this discussion come up? Are we going to call panel controls
from a common layer?


> I don't see an issue with the dpms really. At worst the overall kms driver
> (which provides the crtc and encoder implementation) needs to pass a
> suitable dpms implementation for the drm_bridge to use in the connector.
> Or we could just move this vfunc into the core kms funtion table since
> everyone uses the same (well except i915, but that's a different story).
>
> dpms changes would then still be driven through the crtc -> encoder ->
> bridge ... chain.
>
>> So once a complete chain from encoder to panel has been created, we need
>> a way to find the appropriate connector type. Perhaps to achieve that it
>> would be useful to instantiate the connector by the bridge that's
>> connected to the panel. So essentially something like this:
>>
>>       struct drm_bridge {
>>               /* to allow chaining */
>>               struct drm_bridge *next;
>>               /* for bridges directly connected to a panel or monitor */
>>               struct drm_connector *connector;
>>               /* for bridges directly connected to a panel */
>>               struct drm_panel *panel;
>
> Imo these two shouldn't be here, but instead should be embedded into the
> overall structure the drm_bridge driver is using.
>>
>>               ...
>>       };
>>
>> To make this work in a generic way, I think we're missing one bridge
>> instance. Currently the bridge in an encoder is completely optional, so
>> if there is no bridge in the system this needs to be special cased. One
>> way to unify this would be to make drm_encoder implement drm_bridge, or
>> an alternative would be to make drm_panel implement a bridge. Both can
>> possibly be dummies stubbed out with simple helpers.
>
> Yeah, imo if the panel isn't just a dumb thing but needs to actively take
> part in the modeset dance, it simply needs to implement itself as a
> drm_bridge+panel combo and do the magic in the various hooks provided.

And, what does one mean when a real panel should implement both
drm_panel and drm_bridge?
who will call drm_bridge->funcs for the panel?, and
who will call drm_panel->funcs for the panel?
Can someone please elaborate this with existing implementation details
for bridge and panel? I am really getting confused.

>> I wonder if this would have any consequences on Dave's DP MST work,
>> since presumably an MST hub could be considered a bridge. In that case I
>> guess there would need to be support for multiple "next" bridges,
>> perhaps a simple doubly-linked list instead of a next pointer. The first
>> bridge would then be used to model the hub's input and child bridges
>> would be used to model each
>> of the outputs.
>
> DP is standardize. No need to wrestle the complexity through a drm_bridge,
> since code reuse anywhere else (non-DP) will be know to be zero. And for
> all the guys implementing a DP output can simply use the helpers. So I
> don't see an upside of this idea.
>
> Imo we should restrict drm_bridge to all the crazy transcoder chips/blocks
> commonly found on SoCs which all do non-standard stuff and where we
> actually have an established or anticipated need for sharing.
> -Daniel
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> +41 (0) 79 365 57 48 - http://blog.ffwll.ch


Thanks,
Ajay
