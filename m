From: Sean Paul <seanpaul@chromium.org>
Subject: Re: [PATCH V7 03/12] drm/bridge: Add helper functions for drm_bridge
Date: Tue, 28 Oct 2014 10:28:17 -0400
Message-ID: <CAOw6vbKGgaGHuaabmr+-R1tjPTm_Mg-2VzQxkTBa3iFtwneAsA@mail.gmail.com>
References: <1409149783-12416-1-git-send-email-ajaykumar.rs@samsung.com>
 <1409149783-12416-4-git-send-email-ajaykumar.rs@samsung.com>
 <20141027190137.GT26941@phenom.ffwll.local> <CAOw6vbLNOqp=X4epwDPb7zT-j2+oUuLoeV2S=x+oGPLQwK+Z7Q@mail.gmail.com>
 <CAEC9eQPQaYjL3ZxtDZBdKi2z5yANcHQ9s4ikYkxN95K9qvu01Q@mail.gmail.com>
 <CAKMK7uGoO5TBgLh4HSDjxUM=-WRfsQoDHusLmOYxLio-QBMEPQ@mail.gmail.com>
 <CAEC9eQNJb1TgK1ihvzvC0VjSJhm48WaFO5SVigPsqTOurK2UQw@mail.gmail.com> <CAKMK7uFX7rENLBmwE58rtCBXZ_pSF_uS5Poiuks7xfi+r=e9gw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ig0-f174.google.com ([209.85.213.174]:38300 "EHLO
	mail-ig0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751660AbaJ1O2l (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 28 Oct 2014 10:28:41 -0400
Received: by mail-ig0-f174.google.com with SMTP id hl2so162389igb.7
        for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Oct 2014 07:28:40 -0700 (PDT)
Received: from mail-ie0-f169.google.com (mail-ie0-f169.google.com. [209.85.223.169])
        by mx.google.com with ESMTPSA id z131sm697649iod.32.2014.10.28.07.28.39
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
        Tue, 28 Oct 2014 07:28:39 -0700 (PDT)
Received: by mail-ie0-f169.google.com with SMTP id tr6so779589ieb.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Oct 2014 07:28:39 -0700 (PDT)
In-Reply-To: <CAKMK7uFX7rENLBmwE58rtCBXZ_pSF_uS5Poiuks7xfi+r=e9gw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Ajay kumar <ajaynumb@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Ajay Kumar <ajaykumar.rs@samsung.com>, dri-devel <dri-devel@lists.freedesktop.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, InKi Dae <inki.dae@samsung.com>, Rob Clark <robdclark@gmail.com>, Jingoo Han <jg1.han@samsung.com>, Prashanth G <prashanth.g@samsung.com>, bhushan.r@samsung.com

On Tue, Oct 28, 2014 at 10:19 AM, Daniel Vetter <daniel@ffwll.ch> wrote:
> On Tue, Oct 28, 2014 at 1:28 PM, Ajay kumar <ajaynumb@gmail.com> wrote:
>> On Tue, Oct 28, 2014 at 3:31 PM, Daniel Vetter <daniel@ffwll.ch> wrote:
>>> On Tue, Oct 28, 2014 at 10:21 AM, Ajay kumar <ajaynumb@gmail.com> wrote:
>>>> Hi Daniel and Sean,
>>>>
>>>> Thanks for the comments!
>>>>
>>>> On Tue, Oct 28, 2014 at 1:28 AM, Sean Paul <seanpaul@chromium.org> wrote:
>>>>> On Mon, Oct 27, 2014 at 3:01 PM, Daniel Vetter <daniel@ffwll.ch> wrote:
>>>>>> So don't ask why but I accidentally ended up in a branch looking at this
>>>>>> patch and didn't like it. So very quick&grumpy review.
>>>>>>
>>>>>> First, please make the patch subject more descriptive: I'd expect a helper
>>>>>> function scaffolding like the various crtc/probe/dp ... helpers we already
>>>>>> have. You instead add code to untangle the probe ordering. Please say so.
>>>> Sure. I will reword it properly.
>>>>
>>>>>> More comments below.
>>>>>>
>>>>>> On Wed, Aug 27, 2014 at 07:59:37PM +0530, Ajay Kumar wrote:
>>>>>>> A set of helper functions are defined in this patch to make
>>>>>>> bridge driver probe independent of the drm flow.
>>>>>>>
>>>>>>> The bridge devices register themselves on a lookup table
>>>>>>> when they get probed by calling "drm_bridge_add".
>>>>>>>
>>>>>>> The parent encoder driver waits till the bridge is available
>>>>>>> in the lookup table(by calling "of_drm_find_bridge") and then
>>>>>>> continues with its initialization.
>>>>>>>
>>>>>>> The encoder driver should also call "drm_bridge_attach" to pass
>>>>>>> on the drm_device, encoder pointers to the bridge object.
>>>>>>>
>>>>>>> drm_bridge_attach inturn calls drm_bridge_init to register itself
>>>>>>> with the drm core. Later, it calls "bridge->funcs->attach" so that
>>>>>>> bridge can continue with other initializations.
>>>>>>>
>>>>>>> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
>>>>>>
>>>>>> [snip]
>>>>>>
>>>>>>> @@ -660,8 +662,11 @@ struct drm_bridge_funcs {
>>>>>>>   * @driver_private: pointer to the bridge driver's internal context
>>>>>>>   */
>>>>>>>  struct drm_bridge {
>>>>>>> -     struct drm_device *dev;
>>>>>>> +     struct device *dev;
>>>>>>
>>>>>> Please don't rename the ->dev pointer into drm. Because _all_ the other
>>>>>> drm structures still call it ->dev. Also, can't we use struct device_node
>>>>>> here like we do in the of helpers Russell added? See 7e435aad38083
>>>>>>
>>>>>
>>>>> I think this is modeled after the naming in drm_panel,
>>>> Right, The entire rework is based on how drm_panel framework is structured.
>>>>
>>>>> FWIW. However,
>>>>> seems reasonable to keep the device_node instead.
>>>> Yes, its visible that just device_node would be sufficient.
>>>> This will save us from renaming drm_device as well.
>>>>
>>>>>>> +     struct drm_device *drm;
>>>>>>> +     struct drm_encoder *encoder;
>>>>>>
>>>>>> This breaks bridge->bridge chaining (if we ever get there). It seems
>>>>>> pretty much unused anyway except for an EBUSY check. Can't you use
>>>>>> bridge->dev for that?
>>>>>>
>>>>>
>>>>> Yeah, I'd prefer to pass drm_device directly into drm_bridge_attach
>>>>> and leave it up to the caller to establish the proper chain.
>>>> Ok. I will use drm_device pointer directly instead of passing encoder pointer.
>>>
>>> Hm, if you do this can you pls also update drm_panel accordingly? It
>>> shouldn't be a lot of fuzz and would make things around drm+dt more
>>> consistent.
>> Are you talking about using struct device_node instead of struct device?
>> I guess you have misplaced the comment under the wrong section!
>
> Yeah, that should have been one up ;-)
>
>>>>>>>       struct list_head head;
>>>>>>> +     struct list_head list;
>>>>>>
>>>>>> These lists need better names. I know that the "head" is really awful,
>>>>>> especially since it's actually not the head of the list but just an
>>>>>> element.
>>>>>
>>>>> I think we can just rip bridge_list out of mode_config if we're going
>>>>> to keep track of bridges elsewhere. So we can nuke "head" and keep
>>>>> "list". This also means that bridge->destroy() goes away, but that's
>>>>> probably Ok if everything converts to the standalone driver model
>>>>> where we have driver->remove()
>>>>>
>>>>> Sean
>>>> Great! Thierry actually mentioned about this once, and we have the
>>>> confirmation now.
>>>>
>>>>>>>
>>>>>>>       struct drm_mode_object base;
>>>>>>
>>>>>>
>>>>>> Aside: I've noticed all this trying to update the kerneldoc for struct
>>>>>> drm_bridge, which just showed that this patch makes inconsistent changes.
>>>>>> Trying to write kerneldoc is a really great way to come up with better
>>>>>> interfaces imo.
>>>>>>
>>>>>> Cheers, Daniel
>>>> I din't get this actually. You want me to create Doc../drm_bridge.txt
>>>> or something similar?
>>>
>>> If you want to document drm_bridge then I recomment to sprinkle proper
>>> kerneldoc over drm_bridge.c and pull it all into the drm DocBook
>>> template. That way all the drm documentation is in one place. I've
>>> done that for drm_crtc.h in an unrelated patch series (but based upon
>>> a branch with your patch here included) and there's struct drm_bridge*
>>> in there. Hence why I've noticed.
>> Can you send a link for that?
>> And, is there any problem if the doc comes later?
>
> Since quite a while we've asked for the kerneldoc polish as part of
> each drm core patch series. It's just that drm_bridge/panel kinda have
> flown under the radar of the people usually asking for docs ;-)

Heh, sorry about that.

Sean



> -Daniel
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> +41 (0) 79 365 57 48 - http://blog.ffwll.ch
