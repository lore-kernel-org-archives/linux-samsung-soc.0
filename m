From: Ajay kumar <ajaynumb@gmail.com>
Subject: Re: [PATCH V2 7/8] drm/bridge: Add i2c based driver for ptn3460 bridge
Date: Wed, 30 Jul 2014 21:44:32 +0530
Message-ID: <CAEC9eQOnTEsCD1fKw_Ac0mDt=hJBU5MzHOSfSRmpM0MY2pMRjQ@mail.gmail.com>
References: <1406316130-4744-1-git-send-email-ajaykumar.rs@samsung.com>
	<1406316130-4744-8-git-send-email-ajaykumar.rs@samsung.com>
	<20140730120504.GJ29590@ulmo>
	<CAEC9eQPERoZjPV5=P_Re_Bs7gT7Q5Q_Z6sJViuxoG8oo9O3=-w@mail.gmail.com>
	<20140730154054.GE1345@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f181.google.com ([209.85.220.181]:50318 "EHLO
	mail-vc0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755207AbaG3QOe (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 30 Jul 2014 12:14:34 -0400
In-Reply-To: <20140730154054.GE1345@ulmo>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Ajay Kumar <ajaykumar.rs@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, InKi Dae <inki.dae@samsung.com>, Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Sean Paul <seanpaul@google.com>, Jingoo Han <jg1.han@samsung.com>, sunil joshi <joshi@samsung.com>, Prashanth G <prashanth.g@samsung.com>, Sean Paul <seanpaul@chromium.org>

On Wed, Jul 30, 2014 at 9:10 PM, Thierry Reding
<thierry.reding@gmail.com> wrote:
> On Wed, Jul 30, 2014 at 08:46:44PM +0530, Ajay kumar wrote:
>> On Wed, Jul 30, 2014 at 5:35 PM, Thierry Reding <thierry.reding@gmail.com> wrote:
>> > On Sat, Jul 26, 2014 at 12:52:09AM +0530, Ajay Kumar wrote:
> [...]
>> >> +int ptn3460_post_encoder_init(struct drm_bridge *bridge)
>> >> +{
>> >> +     struct ptn3460_bridge *ptn_bridge = bridge->driver_private;
>> >> +     int ret;
>> >> +
>> >> +     /* bridge is attached to encoder.
>> >> +      * safe to remove it from the bridge_lookup table.
>> >> +      */
>> >> +     drm_bridge_remove_from_lookup(bridge);
>> >
>> > No, you should never do this. First, you're not adding it back to the
>> > registry when the bridge is detached, so unloading and reloading the
>> > display driver will fail. Second there should never be a need to remove
>> > it from the registry as long as the driver itself is loaded. If you're
>> > concerned about a single bridge being used multiple times, there's
>> > already code to handle that in your previous patch:
>> >
>> >         int drm_bridge_attach_encoder(...)
>> >         {
>> >                 ...
>> >
>> >                 if (bridge->encoder)
>> >                         return -EBUSY;
>> >
>> >                 ...
>> >         }
>> >
>> > Generally the registry should contain a list of bridges that have been
>> > registered, whether they're used or not is irrelevant.
>> I was just wondering if it is ok to have a node in two independent lists?
>> bridge_lookup_table and the other mode_config.bridge_list?
>
> Oh, it reuses the head field for the registry. I hadn't noticed before.
> No, you certainly can't have the same node in two lists. Honestly I
> don't quite understand why there was a need to expose drm_bridge as a
> drm_mode_object in the first place since it's never exported to
> userspace.
>
> So I think that perhaps we could simply get rid of the base field and
> not tie in drm_bridge objects with the DRM object as we currently do.
> But until Sean or Rob comment on this it might be better to simply add
> another struct list_head field for the registry. That way both can
> coexist and we can independently still decide to remove the base and
> head fields if they're no longer needed.
Ok. What shall I name the new list_head?

>> >> +     ret = drm_connector_init(bridge->drm_dev, &ptn_bridge->connector,
>> >> +                     &ptn3460_connector_funcs, DRM_MODE_CONNECTOR_LVDS);
>> >> +     if (ret) {
>> >> +             DRM_ERROR("Failed to initialize connector with drm\n");
>> >> +             return ret;
>> >> +     }
>> >> +     drm_connector_helper_add(&ptn_bridge->connector,
>> >> +                                     &ptn3460_connector_helper_funcs);
>> >> +     drm_connector_register(&ptn_bridge->connector);
>> >> +     drm_mode_connector_attach_encoder(&ptn_bridge->connector,
>> >> +                                                     bridge->encoder);
>> >> +
>> >> +     if (ptn_bridge->panel)
>> >> +             drm_panel_attach(ptn_bridge->panel, &ptn_bridge->connector);
>> >> +
>> >> +     return ret;
>> >> +}
>> >
>> > I'm thinking that eventually we'll want to register the connector only
>> > when a panel is attached to the bridge. This will only become important
>> > when we implement bridge chaining because if you instantiate a connector
>> > for each bridge then you'll get a list of connectors for the DRM device
>> > representing the output of each bridge rather than just the final one
>> > that goes to the display.
>> So, do not initialize connector if there is no panel? and, get_modes
>> via panel instead of doing it by edid-emulation?
>
> If there's no panel, then there's nothing to connect the connector to,
> so it's unneeded. Also if you have chained bridges, then each bridge
> would expose a connector and it would become impossible to choose the
> correct one. So only the final bridge in the chain should instantiate
> the connector.
Since there is only a single bridge when it comes to ptn3460/ps8622, lets
not talk about chaining of bridges now.
And, I agree that if there is no panel, then no need to register connector.

> .get_modes() still needs to be done from the bridge because that is the
> most closely connected to the display controller and therefore dictates
> the timing that the display controller needs to generate.
>
> Querying the panel's .get_modes() might be useful to figure out which
> emulation mode to use in the bridge.
But, get_modes from panel returns me only the no_of_modes but
not the actual mode structure. How do I compare the list of supported
emulation modes?

Ajay
