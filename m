From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [RFC V2 0/3] drm/bridge: panel and chaining
Date: Thu, 08 May 2014 16:31:16 +0900
Message-ID: <536B32C4.2020809@samsung.com>
References: <1399319548-16567-1-git-send-email-ajaykumar.rs@samsung.com>
 <536B26FC.507@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:59616 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751132AbaEHHbT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 8 May 2014 03:31:19 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N58008JPVK4WV40@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 08 May 2014 16:31:17 +0900 (KST)
In-reply-to: <536B26FC.507@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: Ajay Kumar <ajaykumar.rs@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, joshi@samsung.com, ajaynumb@gmail.com, prashanth.g@samsung.com, Rob Clark <robdclark@gmail.com>, seanpaul@chromium.org, daniel.vetter@ffwll.ch


Hi Andrzej


On 2014=EB=85=84 05=EC=9B=94 08=EC=9D=BC 15:41, Andrzej Hajda wrote:
> On 05/05/2014 09:52 PM, Ajay Kumar wrote:
>> This patchset is based on exynos-drm-next-todo branch of Inki Dae's =
tree at:
>> git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git
>>
>> I have just put up Rob's and Sean's idea of chaining up the bridges
>> in code, and have implemented basic panel controls as a chained brid=
ge.
>> This works well with ptn3460 bridge chip on exynos5250-snow board.
>>
>> Still need to make use of standard list calls and figure out proper =
way
>> of deleting the bridge chain. So, this is just a rough version.
>
> As I understand this patchset tries to solve two things:
> 1. Implement panel as drm_bridge, to ease support for hardware chains=
:
> Crtc -> Encoder -> Bridge -> Panel
> 2. Add support to drm_bridge chaining, to allow software chains:
> drm_crtc -> drm_encoder -> drm_bridge -> drm_bridge,panel
>
> It is done using Russian doll schema, ops from the bridge calls the s=
ame
> ops from the next bridge and the next bridge ops can do the same.
>
> This schema means that all the bridges including the last one are see=
n
> from the drm core point of view as a one big drm_bridge. Additionally=
 in
> this particular case, the first bridge (ptn3460) implements connector
> so it is hard to guess what is the location of the 2nd bridge in vide=
o
> stream chain, sometimes it is after the connector, sometimes before.
> All this is quite confusing.
>
> But if you look at the bridge from upstream video interface point of
> view it is just a panel, edp panel in case of ptn3460, ie ptn3460 on =
its
> video input side acts as a panel. On the output side it expects a pan=
el,
> lvds panel in this case.
>
> So why not implement ptn3460 bridge as drm_panel which internally use=
s
> another drm_panel. With this approach everything fits much better.
> You do not need those (pre|post)_(enable|disable) calls, you do not n=
eed
> to implement connector in the bridge and you have a driver following
> linux driver model. And no single bit changed in drm core.
>
> I have implemented this way DSI/LVDS bridge, it was sent as RFC [1][2=
].
> It was not accepted as Inki preferred drm_bridge but as I see the
> problems with drm_bridges I have decide to attract attention to much

Yes, in above email threads, I disagreed to using drm_panel framework=20
for bridge device, especially, to implement connector/encoder to crtc=20
driver.

However, I thought that it'd be more generic way that lvds drivers use=20
driver-model, and the use of drm_panel infrastructure would be suitable=
=20
to doing this.

So my intention in turn,  was that LVDS driver uses integrated=20
drm_bridge based on drm_panel infrastructure[1], and RFC patch[2] for=20
it. This way is same as your proposal in the point that LVDS and Panel=20
drivers use driver-model. The only different point is that LVDS driver=20
has some ops specific to LVDS device, not using existing ops of=20
drm_panel commonly: we may need to consider the characteristic of LVDS=20
device.

[1]:http://www.spinics.net/lists/dri-devel/msg55555.html
[2]:http://www.spinics.net/lists/dri-devel/msg55658.html

Thanks,
Inki Dae

> more cleaner solution.
>
> [1]: http://permalink.gmane.org/gmane.linux.drivers.devicetree/61559
> [2]: http://permalink.gmane.org/gmane.linux.kernel.samsung-soc/27044
>
> Regards
> Andrzej
>
>
>>
>> Ajay Kumar (3):
>>    [RFC V2 1/3] drm: implement chaining of drm bridges
>>    [RFC V2 2/3] drm/bridge: add a dummy panel driver to support lvds=
 bridges
>>    [RFC V2 3/3] drm/bridge: ptn3460: support bridge chaining
>>
>>   .../bindings/drm/bridge/bridge_panel.txt           |  45 ++++
>>   drivers/gpu/drm/bridge/Kconfig                     |   6 +
>>   drivers/gpu/drm/bridge/Makefile                    |   1 +
>>   drivers/gpu/drm/bridge/bridge_panel.c              | 240 +++++++++=
++++++++++++
>>   drivers/gpu/drm/bridge/ptn3460.c                   |  21 +-
>>   drivers/gpu/drm/drm_crtc.c                         |  13 +-
>>   include/drm/bridge/bridge_panel.h                  |  37 ++++
>>   include/drm/drm_crtc.h                             |   2 +
>>   8 files changed, 360 insertions(+), 5 deletions(-)
>>   create mode 100644 Documentation/devicetree/bindings/drm/bridge/br=
idge_panel.txt
>>   create mode 100644 drivers/gpu/drm/bridge/bridge_panel.c
>>   create mode 100644 include/drm/bridge/bridge_panel.h
>>
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
