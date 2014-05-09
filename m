From: Rob Clark <robdclark@gmail.com>
Subject: Re: [RFC V2 0/3] drm/bridge: panel and chaining
Date: Fri, 9 May 2014 09:59:34 -0400
Message-ID: <CAF6AEGsd8xViZWroUgsT5Lf_DZhbC5-V_ycR_HOtqdUH9QbA1A@mail.gmail.com>
References: <1399319548-16567-1-git-send-email-ajaykumar.rs@samsung.com>
	<536B26FC.507@samsung.com>
	<CAF6AEGvWxCS-NX4uLjyMqc==7X9znn8PJ0AmJ6aFqqHYSBgsrQ@mail.gmail.com>
	<536C9B2B.2010006@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ig0-f175.google.com ([209.85.213.175]:56168 "EHLO
	mail-ig0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751520AbaEIN7f (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 9 May 2014 09:59:35 -0400
Received: by mail-ig0-f175.google.com with SMTP id uq10so1143154igb.8
        for <linux-samsung-soc@vger.kernel.org>; Fri, 09 May 2014 06:59:34 -0700 (PDT)
In-Reply-To: <536C9B2B.2010006@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, Daniel Vetter <daniel.vetter@ffwll.ch>, sunil joshi <joshi@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Ajay kumar <ajaynumb@gmail.com>, Prashanth G <prashanth.g@samsung.com>, Ajay Kumar <ajaykumar.rs@samsung.com>

On Fri, May 9, 2014 at 5:08 AM, Andrzej Hajda <a.hajda@samsung.com> wrote:
> On 05/08/2014 08:24 PM, Rob Clark wrote:
>> On Thu, May 8, 2014 at 2:41 AM, Andrzej Hajda <a.hajda@samsung.com> wrote:
>>> On 05/05/2014 09:52 PM, Ajay Kumar wrote:
>>>> This patchset is based on exynos-drm-next-todo branch of Inki Dae's tree at:
>>>> git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git
>>>>
>>>> I have just put up Rob's and Sean's idea of chaining up the bridges
>>>> in code, and have implemented basic panel controls as a chained bridge.
>>>> This works well with ptn3460 bridge chip on exynos5250-snow board.
>>>>
>>>> Still need to make use of standard list calls and figure out proper way
>>>> of deleting the bridge chain. So, this is just a rough version.
>>>
>>> As I understand this patchset tries to solve two things:
>>> 1. Implement panel as drm_bridge, to ease support for hardware chains:
>>> Crtc -> Encoder -> Bridge -> Panel
>>> 2. Add support to drm_bridge chaining, to allow software chains:
>>> drm_crtc -> drm_encoder -> drm_bridge -> drm_bridge,panel
>>>
>>> It is done using Russian doll schema, ops from the bridge calls the same
>>> ops from the next bridge and the next bridge ops can do the same.
>>>
>>> This schema means that all the bridges including the last one are seen
>>> from the drm core point of view as a one big drm_bridge. Additionally in
>>> this particular case, the first bridge (ptn3460) implements connector
>>> so it is hard to guess what is the location of the 2nd bridge in video
>>> stream chain, sometimes it is after the connector, sometimes before.
>>> All this is quite confusing.
>>>
>>> But if you look at the bridge from upstream video interface point of
>>> view it is just a panel, edp panel in case of ptn3460, ie ptn3460 on its
>>> video input side acts as a panel. On the output side it expects a panel,
>>> lvds panel in this case.
>>
>> tbh, this is mostly about what we call it.  Perhaps "bridge" isn't the
>> best name.. I wouldn't object to changing it.
>>
>> But my thinking was to leave in drm_panel_funcs things that are just
>> needed by the connector (get_modes().. and maybe some day we need
>> detect/etc).  Then leave everything else in drm_bridge_funcs.  A panel
>> could (if needed) implement both interfaces.
>>
>> That is basically the same as what you are proposing, but without
>> renaming bridge to panel ;-)
>
> Good to hear that. However there are points which are not clear for me.
> But first lets clarify names, I will use panel and bridge words
> to describe the hardware, and drm_panel, drm_bridge to describe the
> software interfaces.
>
> What bothers me:
> 1. You want to leave connector related callbacks in drm_panel and
> the rest in drm_bridge. In case of ptn3460 it does not work, ptn3460
> must implement connector internally because of this limitation. I guess
> it is quite typical bridge. This problem does not exists in case
> of using drm_panel for ptn3460.
>
> 2. drm_bridge is attached to the encoder, this and the callback order
> suggests the video data flow should be as below:
> drm_crtc -> drm_encoder [-> drm_bridge] -> drm_connector [-> drm_panel]
>
> ptn3460 implements drm_bridge and drm_connector so it suggests its
> drm_bridge should be the last one, so there should be no place to add
> lvds panel implemented as a drm_bridge after it, as it is done in this
> patchset.
>
> Additionally it clearly shows that there should be two categories of
> drm_bridges - non-terminal and terminal.
>
> 3. drm_dev uses all-or-nothing approach, ie. it will start only when all
> its components are up. It simplifies synchronization but is quite
> fragile - the whole drm will be down due to error in some of its components.
> For this reason I prefer drm_panel as it is not real drm component
> it can be attached/detached to/from drm_connector anytime. I am not
> really sure but drm_bridge does not allow for that.

So I do think we need to stick to this all-or-nothing approach for
anything that is visible to userspace
(drm_{plane,crtc,encoder,connector}).  We don't currently have a way
to "hotplug" those so I don't see a real smooth upgrade path to add
that in a backwards compatible way that won't cause problems with old
userspace.

But, that said, we have more flexibility with things not visible to
userspace (drm_{panel,bridge}).  I'm not sure how much we want to
allow things to be completely dynamic (we already have some hard
enough locking fun).  But proposals/rfcs/etc welcome.

I guess I'm not completely familiar w/ ptn3460, but the fact that it
needs to implement drm_connector makes me a bit suspicious.  Seems
like a symptom of missing things in drm_panel_funcs.  It would be
better to always create the connector statically, and just have
_detect() -> disconnected if panel==NULL.

> Real life example to show importance of it: I have a phone with MIPI-DSI
> panel and HDMI. Due to initialization issues HDMI bridge driver
> sometimes fails during probe and the drmdev do not start. Of course this
> is development stage so I have serial console I can diagnose the
> problem, disable HDMI, fix the problem, etc...
> But what happens in case of end-user. He will see black screen - bricked
> phone. In case the bridge will be implemented using drm_panel
> he will have working phone with broken HDMI, much better.

well, tbh, I don't think an end-user will see the device if hdmi were broken ;-)

I suppose if bridge/panel where loaded dynamically (or at least after
drm device and drm_{connector,encoder,etc} are created, it would help
a bit here.  I'd kinda hope that isn't the only benefit/reason to make
things more dynamic.  Especially if we allow bridges/panels to be
unloaded.. (just loading them dynamically doesn't seem as scary from
locking perspective)

> 4. And the last thing, it is more about the concept/design. drm_bridge,
> drm_hw_block suggests that those interfaces describes the whole device:
> bridge, panel, whatever.

hmm, I don't think this is the case.  I can easily see things like:

  struct foo_panel {
    struct drm_panel base;
    struct drm_bridge bridge;
    ...
  }

where a panel implementation implements both panel and bridge.  In
fact that is kinda what I was encouraging.

BR,
-R

> In my approach I have an interface
> to describe only one video input port of the device. And drm_panel is
> in fact misleading name, drm_sink may be better. So real panel
> would implement drm_sink interface. Bridge would implement drm_sink
> interface and it will request other drm_sink interface, to interact with
> the panel which is after it.
> This approach seems to me more flexible. Beside things I have described
> above it will allow to implement also more complicated devices, dsi
> hubs, video mixers, etc.
>
>
> Regards
> Andrzej
>
>>
>> BR,
>> -R
>>
>>> So why not implement ptn3460 bridge as drm_panel which internally uses
>>> another drm_panel. With this approach everything fits much better.
>>> You do not need those (pre|post)_(enable|disable) calls, you do not need
>>> to implement connector in the bridge and you have a driver following
>>> linux driver model. And no single bit changed in drm core.
>>>
>>> I have implemented this way DSI/LVDS bridge, it was sent as RFC [1][2].
>>> It was not accepted as Inki preferred drm_bridge but as I see the
>>> problems with drm_bridges I have decide to attract attention to much
>>> more cleaner solution.
>>>
>>> [1]: http://permalink.gmane.org/gmane.linux.drivers.devicetree/61559
>>> [2]: http://permalink.gmane.org/gmane.linux.kernel.samsung-soc/27044
>>>
>>> Regards
>>> Andrzej
>>>
>>>
>>>>
>>>> Ajay Kumar (3):
>>>>   [RFC V2 1/3] drm: implement chaining of drm bridges
>>>>   [RFC V2 2/3] drm/bridge: add a dummy panel driver to support lvds bridges
>>>>   [RFC V2 3/3] drm/bridge: ptn3460: support bridge chaining
>>>>
>>>>  .../bindings/drm/bridge/bridge_panel.txt           |  45 ++++
>>>>  drivers/gpu/drm/bridge/Kconfig                     |   6 +
>>>>  drivers/gpu/drm/bridge/Makefile                    |   1 +
>>>>  drivers/gpu/drm/bridge/bridge_panel.c              | 240 +++++++++++++++++++++
>>>>  drivers/gpu/drm/bridge/ptn3460.c                   |  21 +-
>>>>  drivers/gpu/drm/drm_crtc.c                         |  13 +-
>>>>  include/drm/bridge/bridge_panel.h                  |  37 ++++
>>>>  include/drm/drm_crtc.h                             |   2 +
>>>>  8 files changed, 360 insertions(+), 5 deletions(-)
>>>>  create mode 100644 Documentation/devicetree/bindings/drm/bridge/bridge_panel.txt
>>>>  create mode 100644 drivers/gpu/drm/bridge/bridge_panel.c
>>>>  create mode 100644 include/drm/bridge/bridge_panel.h
>>>>
>>>
>
