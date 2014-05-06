From: Sean Paul <seanpaul@chromium.org>
Subject: Re: [RFC V2 1/3] drm: implement chaining of drm bridges
Date: Tue, 6 May 2014 13:03:08 -0700
Message-ID: <CAOw6vbJqJ9RQ3eAWLvNuxD0AJD5YoQikChxNKhEeL-pTBm_W8Q@mail.gmail.com>
References: <1399319548-16567-1-git-send-email-ajaykumar.rs@samsung.com>
 <1399319548-16567-2-git-send-email-ajaykumar.rs@samsung.com>
 <CAOw6vbJYF=L_CyxA0MZ9kVE-G5LosDR5duhtZyuHYMA9Eb_-0A@mail.gmail.com> <CAEC9eQMj3yo_U63bHAxgB+biyFKMTk0GF1mkNz2xVkV6NAYfZA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ie0-f182.google.com ([209.85.223.182]:59821 "EHLO
	mail-ie0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750982AbaEFUDc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 6 May 2014 16:03:32 -0400
Received: by mail-ie0-f182.google.com with SMTP id tp5so10356182ieb.41
        for <linux-samsung-soc@vger.kernel.org>; Tue, 06 May 2014 13:03:31 -0700 (PDT)
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com [209.85.213.170])
        by mx.google.com with ESMTPSA id vu3sm41874704igc.6.2014.05.06.13.03.29
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
        Tue, 06 May 2014 13:03:29 -0700 (PDT)
Received: by mail-ig0-f170.google.com with SMTP id r10so6255019igi.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 06 May 2014 13:03:29 -0700 (PDT)
In-Reply-To: <CAEC9eQMj3yo_U63bHAxgB+biyFKMTk0GF1mkNz2xVkV6NAYfZA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ajay kumar <ajaynumb@gmail.com>
Cc: Ajay Kumar <ajaykumar.rs@samsung.com>, dri-devel <dri-devel@lists.freedesktop.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Rob Clark <robdclark@gmail.com>, InKi Dae <inki.dae@samsung.com>, sunil joshi <joshi@samsung.com>, Prashanth G <prashanth.g@samsung.com>

On Tue, May 6, 2014 at 12:45 PM, Ajay kumar <ajaynumb@gmail.com> wrote:
> Sean,
>
>
> On Tue, May 6, 2014 at 9:25 PM, Sean Paul <seanpaul@chromium.org> wrote:
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
> For this, we have to modify drm_bridge_init to return a bridge pointer

Sorry, I don't follow this. You are passing in the bridge pointer, so
presumably you already have it.

Sean



> and
> then, as Rob is suggesting, we can have some helper functions to update
> next_bridge ptr to form a bridge chain, and these functions can be called from
> the corresponding encoder implementation.
>
> Ajay
>
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
