From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [RFC PATCH v2 00/21] Add DSI display support for Exynos based
 boards
Date: Thu, 13 Mar 2014 14:41:10 +0100
Message-ID: <5321B576.5070409@samsung.com>
References: <1392204688-4591-1-git-send-email-a.hajda@samsung.com>
 <CAAQKjZOEAWG3jwTPOP7aBnpjyg8qLfq-Fcv_Mec2+fgmOULqEg@mail.gmail.com>
 <531998B5.7040002@samsung.com>
 <CAAQKjZN3PoXoEFRXzHA+vrMCLfTRYJ9g3rFjzodNRNh62hPuDw@mail.gmail.com>
 <532041FA.7070300@samsung.com>
 <CAAQKjZP5we8vdpNaDE87fVQjqxcxT5RF3My-2fJ5wtobC4uvgA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:52928 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751262AbaCMNlk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 13 Mar 2014 09:41:40 -0400
In-reply-to: <CAAQKjZP5we8vdpNaDE87fVQjqxcxT5RF3My-2fJ5wtobC4uvgA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>, Tomasz Figa <t.figa@samsung.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, DRI mailing list <dri-devel@lists.freedesktop.org>, Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>

On 03/13/2014 08:08 AM, Inki Dae wrote:
> 2014-03-12 20:16 GMT+09:00 Tomasz Figa <t.figa@samsung.com>:
>> On 12.03.2014 11:08, Inki Dae wrote:
>>> 2014-03-07 19:00 GMT+09:00 Andrzej Hajda <a.hajda@samsung.com>:
>>>> On 03/05/2014 03:56 AM, Inki Dae wrote:
>>>>> Hi Andrzej,
>>>>>
>>>>> Thanks for your contributions.
>>>>>
>>>>> 2014-02-12 20:31 GMT+09:00 Andrzej Hajda <a.hajda@samsung.com>:
>>>>>> Hi,
>>>>>>
>>>>>> This patchset adds drivers and bindings to the following devices:
>>>>>> - Exynos DSI master,
>>>>>> - S6E8AA0 DSI panel,
>>>>>> - TC358764 DSI/LVDS bridge,
>>>>>> - HV070WSA-100 LVDS panel.
>>>>>>
>>>>>> It adds also display support in DTS files for the following boards:
>>>>>> - Exynos4210/Trats,
>>>>>> - Exynos4412/Trats2,
>>>>>> - Exynos5250/Arndale.
>>>>>>
>>>>>> Things worth mentioning:
>>>>>>
>>>>>> 1. I have implemented DSI/LVDS bridge using drm_panel framework, ie.
>>>>>> the driver exposes drm_panel interface on DSI side, and interact with
>>>>>> panels on LVDS side using drm_panel framework. This approach seems to
>>>>>> me simpler and more natural than using drm_bridge.
>>>>> Can you give me more details about why you think better to use panel
>>>>> framework than using drm_bridge?  "Simpler" and "more natural" are
>>>>> ambiguous to me.
>>>> In this particular case DSI master expects on the other end
>>>> any device having DSI slave interface, it could be panel or bridge.
>>>> So it seems natural that both types of slave devices should expose
>>>> the same interface also  on programming level.
>>>> Another problem with drm_bridge is that it is not scalable -
>>>> if some manufacturer will decide to add another block between the bridge
>>>> and the panel there is no drm component which can be used for it.
>>>> Using drm_panel the way I have used in toshiba bridge makes scalability
>>>> possible,
>>>> it will be only a matter of adding a driver for new block and making
>>>> proper links in device tree, I see no easy way of doing it with
>>>> drm_bridge approach.
>>>
>>> Now drm_bridge may not cover all hardware. However drm_bridge has
>>> already been merged to mainline so I think we need to use drm_bridge
>>> somehow instead of using other one, and also we could extend
>>> drm_bridge if needed. It would be definitely impossible for a new
>>> framework to cover all hardware because there may be other hardware
>>> not appeared yet. That is what we are doing for mainline until now.
>>>
>> Well, maybe drm_bridge has been merged, but so has been drm_panel. Moreover,
>> merged code is not carved in stone, if there is a better option that could
>> replace it, users of it can be converted to the new approach and the old one
>> can be removed.
>>
>> As I believe Andrzej has demonstrated, drm_panel framework is clearly
>> superior over drm_bridge and I can't think of any good reason why it
>> couldn't become more generic and replace drm_bridge. Of course it can be
>> renamed then to something more generic appropriately.
>>
>>
>>>>
>>>>> Using same drm_panel framework for LDVS bridge and real panel drivers
>>>>> isn't reasonable to me as now because drm_panel framework would be for
>>>>> real panel device even if the use of drm_panel framework looks like
>>>>> suitable to LVDS bridge driver. I thought Sean's way, ptn3460 driver
>>>>> using drm_bride stuff, is good enough, and that would be why
>>>>> drm_bridge exists and why drm_encoder has drm_bridge.
>>>>>
>>>>> And I'm finding more generic way, how to handle LVDS bridge using
>>>>> super node so that  LVDS bridge driver isn't embedded to connector
>>>>> drivers such as eDP and MIPI-DSI, and dt binding of LVDS bridge can be
>>>>> done at top level of Exynos drm. Once the binding is done, encoder of
>>>>> display bus driver will have drm_bridge object of LVDS bridge driver
>>>>> so that display bus driver can handle LVDS bridge driver.
>>>> Could you explain what you mean by "dt binding of LVDS bridge can be
>>>> done at top level of Exynos drm" ? How it will look like if there
>>>> will be more bridges, one for DSI, one for HDMI, etc... What if there
>>>> will be two
>>>> bridges in one chain. How it will cope with video pipeline bindings?
>>>
>>> it was just my idea so I have no implementation about it yet.
>>>
>>> My idea is that crtc and encoder are binded at top level of Exynos drm
>>> as is. And for bridge support, the only difference is, in case that
>>> encoder driver has bridge, the dt binding of the encoder driver is
>>> done once last one between encoder and bridge driver is binded. It
>>> would mean that bridge driver can use driver model and it doesn't need
>>> to concern about probe order issue.
>>>
>>> For this, encoder driver with bridge, MIPI-DSI or eDP, would need to
>>> use component interfaces specific to Exynos drm. As a result, once the
>>> dt bindings of crtc and encoder are completed at top level, encoder
>>> driver has its own drm_bridge for bridge, and dt binding you proposed
>>> could be used without any change, and drm_panel could also be used
>>> only for real lcd panel driver.
>>>
>>> And below is a block diagram I think,
>>>
>>>                                    DRM KMS
>>>                     /                      |                 \
>>>                /                           |                      \
>>>           crtc                      encoder              connector
>>>             |                           /     \                          |
>>>             |                       /             \                      |
>>>             |                      |           drm_bridge   drm_panel
>>>             |                      |                   |                 |
>>>             |                      |                   |                 |
>>>          FIMD         MIPI-DSI    LVDS bridge    Panel
>>>
>> Hmm, this doesn't seem to be complete. Several bridges can be chained
>> together. Also I believe "Panel" and "drm_panel" on your diagram should be
>> basically the same. This leads to obvious conclusion that drm_bridge and
>> drm_panel should be merged and Andrzej has shown an example (and IMHO good)
>> way to do it, as drm_panel already provides a significant amount of existing
>> infrastructure.
>>
> Not opposite to using drm_panel framework. What I disagree is to
> implement encoder/connector to crtc driver, and to use drm_panel
> framework for bridge device.
> I tend to believe that obvious fact is that crtc driver, fimd, is not
> proper place that encoder and connector should be implemented. Is
> there other SoC using such way? I think other SoC guys had ever
> agonized about same issue.
Quick look at some mobile drm drivers:
1. tegra - in rgb pseudo-driver encoder/connector is bound to crtc device,
    it is separate file but the same device driver.
2. imx - crtc and encoder are separated, but parallel driver is a pure
    virtual device driver, no hw associated with it.
3. shmob - crtc, encoder and connector are in the same device.
4. omap - all drm components are created in omap_drv, physical devices
    are bound to them using internal framework.

I prefer to avoid creating virtual devices, I think the simpler solution
for parallel output for now could be something like in tegra.

Generally I tend to omap solution but instead of creating internal
framework use what we have already, ie drm_panel.

Btw I do not see drm_panel as sth strange in this context,
for example in the chain:
FIMD --> DSIM --> DSI/LVDS --> Panel
any device in the chain sees device on the right side of the link as a
panel. Ie.
FIMD sees RGB panel,
DSIM sees DSI panel,
bridge sees LVDS panel.

>
> And I'm not sure that how several bridges can be chained together so
> can you show me the real case, real hardware? If there is my missing
> something and we cannot really cover such hardware support with
> drm_bridge framework, I think we could consider to use drm_panel
> framework instead of drm_bridge. And maybe, we may need opinions from
> other maintainers.

Real cases I have showed in another thread:
FIMD --> MIE --> DSI --> DSI/LVDS --> Panel

Five hw devices in the chain, we are not able to map them
to 3+1 drm components 1:1, something should be squashed.
Probably squashing MIE with FIMD would be a some solution.
But in place of MIE there can be also mDNIe --> FIMDlite.
So we need another sub-framework or bunch of conditionals
to handle it.
On the other side drm_panel would solve these problems
in generic way.

Regards
Andrzej

>
> Thanks,
> Inki Dae
>
>> Best regards,
>> Tomasz
>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> http://lists.freedesktop.org/mailman/listinfo/dri-devel
