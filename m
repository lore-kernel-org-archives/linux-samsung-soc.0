From: Rob Clark <robdclark@gmail.com>
Subject: Re: [RFC V2 0/3] drm/bridge: panel and chaining
Date: Thu, 8 May 2014 14:28:12 -0400
Message-ID: <CAF6AEGtOpTxsvr9-4oo2JqKP6=LYxujDFR1x-n07otvnXb9miQ@mail.gmail.com>
References: <1399319548-16567-1-git-send-email-ajaykumar.rs@samsung.com>
	<536B26FC.507@samsung.com>
	<536B35E4.10705@samsung.com>
	<CAEC9eQNAactYm=E7XU7FqM8R7wKF=1WuTXFwg8AzWJSNj+W1Xg@mail.gmail.com>
	<536B7137.70503@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ig0-f176.google.com ([209.85.213.176]:44724 "EHLO
	mail-ig0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755076AbaEHS2N convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 8 May 2014 14:28:13 -0400
Received: by mail-ig0-f176.google.com with SMTP id hl10so133834igb.15
        for <linux-samsung-soc@vger.kernel.org>; Thu, 08 May 2014 11:28:12 -0700 (PDT)
In-Reply-To: <536B7137.70503@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Ajay kumar <ajaynumb@gmail.com>, "airlied@redhat.com" <airlied@redhat.com>, Thierry Reding <thierry.reding@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>, Ajay Kumar <ajaykumar.rs@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, sunil joshi <joshi@samsung.com>, Prashanth G <prashanth.g@samsung.com>, Sean Paul <seanpaul@chromium.org>, Daniel Vetter <daniel.vetter@ffwll.ch>

On Thu, May 8, 2014 at 7:57 AM, Inki Dae <inki.dae@samsung.com> wrote:
> On 2014=EB=85=84 05=EC=9B=94 08=EC=9D=BC 19:52, Ajay kumar wrote:
>> +Dave
>> +Thierry
>>
>> On Thu, May 8, 2014 at 1:14 PM, Inki Dae <inki.dae@samsung.com> wrot=
e:
>>>
>>> Just re-sending with text mode. Sorry for this.
>>>
>>>
>>> On 2014=EB=85=84 05=EC=9B=94 08=EC=9D=BC 15:41, Andrzej Hajda wrote=
:
>>>> On 05/05/2014 09:52 PM, Ajay Kumar wrote:
>>>>> This patchset is based on exynos-drm-next-todo branch of Inki Dae=
's tree at:
>>>>> git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.=
git
>>>>>
>>>>> I have just put up Rob's and Sean's idea of chaining up the bridg=
es
>>>>> in code, and have implemented basic panel controls as a chained b=
ridge.
>>>>> This works well with ptn3460 bridge chip on exynos5250-snow board=
=2E
>>>>>
>>>>> Still need to make use of standard list calls and figure out prop=
er way
>>>>> of deleting the bridge chain. So, this is just a rough version.
>>>>
>>>> As I understand this patchset tries to solve two things:
>>>> 1. Implement panel as drm_bridge, to ease support for hardware cha=
ins:
>>>> Crtc -> Encoder -> Bridge -> Panel
>>>> 2. Add support to drm_bridge chaining, to allow software chains:
>>>> drm_crtc -> drm_encoder -> drm_bridge -> drm_bridge,panel
>>>>
>>>> It is done using Russian doll schema, ops from the bridge calls th=
e same
>>>> ops from the next bridge and the next bridge ops can do the same.
>>>>
>>>> This schema means that all the bridges including the last one are =
seen
>>>> from the drm core point of view as a one big drm_bridge. Additiona=
lly in
>>>> this particular case, the first bridge (ptn3460) implements connec=
tor
>>>> so it is hard to guess what is the location of the 2nd bridge in v=
ideo
>>>> stream chain, sometimes it is after the connector, sometimes befor=
e.
>>>> All this is quite confusing.
>>>>
>>>> But if you look at the bridge from upstream video interface point =
of
>>>> view it is just a panel, edp panel in case of ptn3460, ie ptn3460 =
on its
>>>> video input side acts as a panel. On the output side it expects a =
panel,
>>>> lvds panel in this case.
>>>>
>>>> So why not implement ptn3460 bridge as drm_panel which internally =
uses
>>>> another drm_panel. With this approach everything fits much better.
>>>> You do not need those (pre|post)_(enable|disable) calls, you do no=
t need
>>>> to implement connector in the bridge and you have a driver followi=
ng
>>>> linux driver model. And no single bit changed in drm core.
>>>>
>>>> I have implemented this way DSI/LVDS bridge, it was sent as RFC [1=
][2].
>>>> It was not accepted as Inki preferred drm_bridge but as I see the
>>>
>>> Yes, in above email threads, I disagreed to using drm_panel framewo=
rk
>>> for bridge device, especially, to implement connector/encoder to cr=
tc
>>> driver.
>>>
>>> However, I thought that it'd be more generic way that lvds drivers =
use
>>> driver-model, and the use of drm_panel infrastructure would be suit=
able
>>> to doing this.
>>>
>>> So my intention in turn, was that LVDS driver uses integrated drm_b=
ridge
>>> based on drm_panel infrastructure[1], and RFC patch[2] for it. This=
 way
>>> is same as your proposal in the point that LVDS and Panel drivers u=
se
>>> driver-model. The only different point is that LVDS driver has some=
 ops
>>> specific to LVDS device, not using existing ops of drm_panel common=
ly:
>>> we may need to consider the characteristic of LVDS device.
>>>
>>> [1]:http://www.spinics.net/lists/dri-devel/msg55555.html
>>> [2]:http://www.spinics.net/lists/dri-devel/msg55658.html
>>>
>>> Thanks,
>>> Inki Dae
>> I am just consolidating the discussion happening here.
>> 1) This patchset started from a discussion wherein I tried to combin=
e
>> drm_panel with drm_bridge.
>>     https://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/m=
sg28943.html
>> 2) Sean and Rob suggested to implement a chain of bridges and then
>> consider adding
>>     basic panel controls as a bridge.
>> 3) Andrej's idea is to drop the existing bridge infrastructure and
>> implement ptn3460 using drm_panel,
>>     the same way he has implemented
>> http://permalink.gmane.org/gmane.linux.drivers.devicetree/61559.
>> 4) Inki's suggestion is to combine drm_bridge, drm_panel and
>> drm_enhance into a single
>>     drm_hw_block.
>>
>
> And more thing, we would need to consider image enhancer device place=
d
> between crtc and connector/encoder devices. And it'd better to rename
> drm_hw_block to drm_bridge, and existing drm_bridge relevant codes
> should be removed.

I don't object to changing the name to hw_block or something else.
Although to avoid introducing too much confusion in this discussion,
for now I am calling it bridge/drm_bridge_funcs/etc for now ;-)

BR,
-R

> Thanks,
> Inki Dae
>
>> I am currently trying to implement (2):chaining of bridges, and I
>> think we have not yet
>> reached to a consensus. So adding few other people from drm communit=
y
>> to comment.
>>
>> Regards,
>> Ajay
>>
>>>> problems with drm_bridges I have decide to attract attention to mu=
ch
>>>> more cleaner solution.
>>>>
>>>> [1]: http://permalink.gmane.org/gmane.linux.drivers.devicetree/615=
59
>>>> [2]: http://permalink.gmane.org/gmane.linux.kernel.samsung-soc/270=
44
>>>>
>>>> Regards
>>>> Andrzej
>>>>
>>>>
>>>>>
>>>>> Ajay Kumar (3):
>>>>>   [RFC V2 1/3] drm: implement chaining of drm bridges
>>>>>   [RFC V2 2/3] drm/bridge: add a dummy panel driver to support lv=
ds bridges
>>>>>   [RFC V2 3/3] drm/bridge: ptn3460: support bridge chaining
>>>>>
>>>>>  .../bindings/drm/bridge/bridge_panel.txt           |  45 ++++
>>>>>  drivers/gpu/drm/bridge/Kconfig                     |   6 +
>>>>>  drivers/gpu/drm/bridge/Makefile                    |   1 +
>>>>>  drivers/gpu/drm/bridge/bridge_panel.c              | 240 +++++++=
++++++++++++++
>>>>>  drivers/gpu/drm/bridge/ptn3460.c                   |  21 +-
>>>>>  drivers/gpu/drm/drm_crtc.c                         |  13 +-
>>>>>  include/drm/bridge/bridge_panel.h                  |  37 ++++
>>>>>  include/drm/drm_crtc.h                             |   2 +
>>>>>  8 files changed, 360 insertions(+), 5 deletions(-)
>>>>>  create mode 100644 Documentation/devicetree/bindings/drm/bridge/=
bridge_panel.txt
>>>>>  create mode 100644 drivers/gpu/drm/bridge/bridge_panel.c
>>>>>  create mode 100644 include/drm/bridge/bridge_panel.h
>>>>>
>>>>
>>>> --
>>>> To unsubscribe from this list: send the line "unsubscribe linux-sa=
msung-soc" in
>>>> the body of a message to majordomo@vger.kernel.org
>>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>>>
>>>
>>
>
