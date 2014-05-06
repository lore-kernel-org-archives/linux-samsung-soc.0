From: Ajay kumar <ajaynumb@gmail.com>
Subject: Re: [RFC V2 1/3] drm: implement chaining of drm bridges
Date: Wed, 7 May 2014 01:21:12 +0530
Message-ID: <CAEC9eQO2u8e2OHyFaPZh2Zh5ZKxQAfW3Bmtqe+mAUEH591-ZHg@mail.gmail.com>
References: <1399319548-16567-1-git-send-email-ajaykumar.rs@samsung.com>
	<1399319548-16567-2-git-send-email-ajaykumar.rs@samsung.com>
	<CAOw6vbJYF=L_CyxA0MZ9kVE-G5LosDR5duhtZyuHYMA9Eb_-0A@mail.gmail.com>
	<CAF6AEGt-8ku0y+qhQvg8FRi_Jk1kKxhZ-an4wmycVTB5Zu-T3Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ve0-f179.google.com ([209.85.128.179]:42278 "EHLO
	mail-ve0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753974AbaEFTvN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 6 May 2014 15:51:13 -0400
Received: by mail-ve0-f179.google.com with SMTP id oy12so8421970veb.10
        for <linux-samsung-soc@vger.kernel.org>; Tue, 06 May 2014 12:51:12 -0700 (PDT)
In-Reply-To: <CAF6AEGt-8ku0y+qhQvg8FRi_Jk1kKxhZ-an4wmycVTB5Zu-T3Q@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <seanpaul@chromium.org>, Ajay Kumar <ajaykumar.rs@samsung.com>, dri-devel <dri-devel@lists.freedesktop.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, InKi Dae <inki.dae@samsung.com>, sunil joshi <joshi@samsung.com>, Prashanth G <prashanth.g@samsung.com>

Rob,


On Tue, May 6, 2014 at 9:42 PM, Rob Clark <robdclark@gmail.com> wrote:
> On Tue, May 6, 2014 at 11:55 AM, Sean Paul <seanpaul@chromium.org> wrote:
>> On Mon, May 5, 2014 at 12:52 PM, Ajay Kumar <ajaykumar.rs@samsung.com> wrote:
>>> As of now, we can have only one bridge hanging off the encoder.
>>> With this patch, we allow multiple bridges to hang onto the same encoder
>>> with the use of a simple next_bridge ptr.
>>>
>>> The drm core calls bridge->funcs for the first bridge which
>>> is attached to it, and its upto the individual bridge drivers
>>> to call bridge->funcs for the next bridge in the chain.
>>>
>>> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
>>> ---
>>>  drivers/gpu/drm/drm_crtc.c | 13 ++++++++++++-
>>>  include/drm/drm_crtc.h     |  2 ++
>>>  2 files changed, 14 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
>>> index d8b7099..fe9905f 100644
>>> --- a/drivers/gpu/drm/drm_crtc.c
>>> +++ b/drivers/gpu/drm/drm_crtc.c
>>> @@ -918,8 +918,10 @@ EXPORT_SYMBOL(drm_connector_unplug_all);
>>>   * Zero on success, error code on failure.
>>>   */
>>>  int drm_bridge_init(struct drm_device *dev, struct drm_bridge *bridge,
>>> -               const struct drm_bridge_funcs *funcs)
>>> +                       struct drm_encoder *encoder,
>>> +                       const struct drm_bridge_funcs *funcs)
>>
>>
>> IMO, we should let whoever is spawning the bridges chain them
>> together, instead of passing encoder in init().
>
> that plus, might be a good time to start adding some static-inline
> helper fxns for fxn ptr calls like we have for drm_panel..  not a big
> deal, but I guess it would be a good time to do it now before we start
> adding chained bridge calls in all the bridges.

Right, I will try to add a few:
-- to update next_bridge ptr and form a chain.
-- to call pre_enable, enable, disable and post_disable for the next
bridge in the list.

Ajay

>
> BR,
> -R
>
>> Sean
>>
>>
>>>  {
>>> +       struct drm_bridge *temp;
>>>         int ret;
>>>
>>>         drm_modeset_lock_all(dev);
>>> @@ -931,6 +933,15 @@ int drm_bridge_init(struct drm_device *dev, struct drm_bridge *bridge,
>>>         bridge->dev = dev;
>>>         bridge->funcs = funcs;
>>>
>>> +       if (encoder->bridge) {
>>> +               temp = encoder->bridge;
>>> +               while (temp->next_bridge)
>>> +                       temp = temp->next_bridge;
>>> +
>>> +               temp->next_bridge = bridge;
>>> +       } else
>>> +               encoder->bridge = bridge;
>>> +
>>>         list_add_tail(&bridge->head, &dev->mode_config.bridge_list);
>>>         dev->mode_config.num_bridge++;
>>>
>>> diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
>>> index e55fccb..bb6ed88 100644
>>> --- a/include/drm/drm_crtc.h
>>> +++ b/include/drm/drm_crtc.h
>>> @@ -619,6 +619,7 @@ struct drm_bridge_funcs {
>>>  struct drm_bridge {
>>>         struct drm_device *dev;
>>>         struct list_head head;
>>> +       struct drm_bridge *next_bridge;
>>>
>>>         struct drm_mode_object base;
>>>
>>> @@ -862,6 +863,7 @@ extern void drm_connector_cleanup(struct drm_connector *connector);
>>>  extern void drm_connector_unplug_all(struct drm_device *dev);
>>>
>>>  extern int drm_bridge_init(struct drm_device *dev, struct drm_bridge *bridge,
>>> +                          struct drm_encoder *encoder,
>>>                            const struct drm_bridge_funcs *funcs);
>>>  extern void drm_bridge_cleanup(struct drm_bridge *bridge);
>>>
>>> --
>>> 1.8.1.2
>>>
