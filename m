From: Ajay kumar <ajaynumb@gmail.com>
Subject: Re: [PATCH V2 7/9] drm/bridge: ptn3460: add drm_panel controls
Date: Thu, 24 Apr 2014 22:25:06 +0530
Message-ID: <CAEC9eQPtBCtUtRsHsJ4u_58PX7_UrcVJRkL4XOoM9M1sT1eiCQ@mail.gmail.com>
References: <1398119958-32005-1-git-send-email-ajaykumar.rs@samsung.com>
	<1398119958-32005-8-git-send-email-ajaykumar.rs@samsung.com>
	<CAF6AEGtEa6rBarSXEkmZrreEKGcwTOCWhhx-OT9JmAhBhAk_Zw@mail.gmail.com>
	<CAEC9eQPiUdR_0gKVxmA8KhHD7z2AehRGOUU25e5zQz=PQyDqpA@mail.gmail.com>
	<CAEC9eQPPoU3wWgzOi6DQP=Lxq8EC-AOpRJS20uTjwZa=vfY_Rw@mail.gmail.com>
	<CAF6AEGuL3=bvBPGCDW5_db58ie23enY8VwNG7wCeQTn+JM4-Rw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f174.google.com ([209.85.220.174]:64912 "EHLO
	mail-vc0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932511AbaDXQzG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 24 Apr 2014 12:55:06 -0400
Received: by mail-vc0-f174.google.com with SMTP id ld13so3289009vcb.33
        for <linux-samsung-soc@vger.kernel.org>; Thu, 24 Apr 2014 09:55:06 -0700 (PDT)
In-Reply-To: <CAF6AEGuL3=bvBPGCDW5_db58ie23enY8VwNG7wCeQTn+JM4-Rw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rob Clark <robdclark@gmail.com>
Cc: Ajay Kumar <ajaykumar.rs@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, Sean Paul <seanpaul@google.com>, sunil joshi <joshi@samsung.com>, Prashanth G <prashanth.g@samsung.com>

Rob,

On Thu, Apr 24, 2014 at 9:41 PM, Rob Clark <robdclark@gmail.com> wrote:
> On Wed, Apr 23, 2014 at 3:02 PM, Ajay kumar <ajaynumb@gmail.com> wrote:
>> Sorry for the previous reply,
>>
>> Here goes the full explaination:
>>
>>> Rob,
>>>
>>> On Tue, Apr 22, 2014 at 5:04 PM, Rob Clark <robdclark@gmail.com> wrote:
>>>> So what about, rather than adding drm_panel support to each bridge
>>>> individually, we introduce a drm_panel_bridge (with a form of
>>>> chaining).. ie:
>>>>
>>>>   struct drm_panel_bridge {
>>>>     struct drm_bridge base;
>>>>     struct drm_panel *panel;
>>>>     struct drm_bridge *bridge; /* optional */
>>>>   };
>>>>
>>>>   static void drm_panel_bridge_enable(struct drm_bridge *bridge)
>>>>   {
>>>>     struct drm_panel_bridge *pb = to_panel_bridge(bridge);
>>>>     if (pb->bridge)
>>>>       pb->bridge->funcs->enable(pb->bridge);
>>>>     pb->panel->funcs->enable(pb->panel);
>>>>   }
>>>>
>> We cannot call them like this from crtc helpers in the order you mentioned,
>> since each individual bridge chip expects the panel controls at
>> different places.
>> I mean,
>> -- sometimes panel controls needs to be done before bridge
>> controls(ptn3460: before RST_N and PD_N)
>
> well, this is why bridge has pre-enable/enable/disable/post-disable
> hooks, so you can choose before or after..
These calls are for a bridge to sync with the encoder calls.
We might end up defining pre-enable/enable/disable/post-disable for a
panel to sync
with the bridge calls! I have explained below.

>> -- sometimes in between the bridge controls (ps8622: one panel control
>> before SLP_N and one after SLP_N)
>> -- sometimes panel controls needs to be done after bridge controls.
>
> I am not convinced that a generic panel/bridge adapter is not
> possible.  Maybe we need more fine grained fxn ptr callbacks, although
> seems like pre+post should give you enough.  It would certainly be
> easier than having to add panel support in each individual bridge
> driver (which seems like it will certainly result that only certain
> combinations of panel+bridge actually work as intended)
Ok. Consider this case:
Currently, we have the sequence as "bridge->pre_enable,
encoder_enable, bridge->enable"
And, the bridge should obviously be enabled in bridge->pre_enable.
Now, where do you choose to call panel->pre_enable?
-- as the first step of bridge->pre_enable, before we pull up/down bridge GPIOs.
-- at the last step of bridge->pre_enable, after we pull up/down the
bridge GPIOs.

Ideally, PTN3460 expects it to be the second case, and PS8625 expects
it to be the first case.
So, we will end up adding pre_pre_enable, post_pre_enable to
accomodate such scenarios.

So, we leave the choice for the individual bridge chip drivers to
implement panel
power up/down controls in the place where they wish to.


Thanks and regards,
 Ajay Kumar
