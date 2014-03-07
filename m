From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [RFC PATCH v2 00/21] Add DSI display support for Exynos based
 boards
Date: Fri, 07 Mar 2014 11:00:21 +0100
Message-ID: <531998B5.7040002@samsung.com>
References: <1392204688-4591-1-git-send-email-a.hajda@samsung.com>
 <CAAQKjZOEAWG3jwTPOP7aBnpjyg8qLfq-Fcv_Mec2+fgmOULqEg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:20419 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751013AbaCGKAj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 7 Mar 2014 05:00:39 -0500
In-reply-to: <CAAQKjZOEAWG3jwTPOP7aBnpjyg8qLfq-Fcv_Mec2+fgmOULqEg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: DRI mailing list <dri-devel@lists.freedesktop.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>

On 03/05/2014 03:56 AM, Inki Dae wrote:
> Hi Andrzej,
>
> Thanks for your contributions.
>
> 2014-02-12 20:31 GMT+09:00 Andrzej Hajda <a.hajda@samsung.com>:
>> Hi,
>>
>> This patchset adds drivers and bindings to the following devices:
>> - Exynos DSI master,
>> - S6E8AA0 DSI panel,
>> - TC358764 DSI/LVDS bridge,
>> - HV070WSA-100 LVDS panel.
>>
>> It adds also display support in DTS files for the following boards:
>> - Exynos4210/Trats,
>> - Exynos4412/Trats2,
>> - Exynos5250/Arndale.
>>
>> Things worth mentioning:
>>
>> 1. I have implemented DSI/LVDS bridge using drm_panel framework, ie.
>> the driver exposes drm_panel interface on DSI side, and interact with
>> panels on LVDS side using drm_panel framework. This approach seems to
>> me simpler and more natural than using drm_bridge.
> Can you give me more details about why you think better to use panel
> framework than using drm_bridge?  "Simpler" and "more natural" are
> ambiguous to me.
In this particular case DSI master expects on the other end
any device having DSI slave interface, it could be panel or bridge.
So it seems natural that both types of slave devices should expose
the same interface also  on programming level.
Another problem with drm_bridge is that it is not scalable -
if some manufacturer will decide to add another block between the bridge
and the panel there is no drm component which can be used for it.
Using drm_panel the way I have used in toshiba bridge makes scalability
possible,
it will be only a matter of adding a driver for new block and making
proper links in device tree, I see no easy way of doing it with
drm_bridge approach.


>
> Using same drm_panel framework for LDVS bridge and real panel drivers
> isn't reasonable to me as now because drm_panel framework would be for
> real panel device even if the use of drm_panel framework looks like
> suitable to LVDS bridge driver. I thought Sean's way, ptn3460 driver
> using drm_bride stuff, is good enough, and that would be why
> drm_bridge exists and why drm_encoder has drm_bridge.
>
> And I'm finding more generic way, how to handle LVDS bridge using
> super node so that  LVDS bridge driver isn't embedded to connector
> drivers such as eDP and MIPI-DSI, and dt binding of LVDS bridge can be
> done at top level of Exynos drm. Once the binding is done, encoder of
> display bus driver will have drm_bridge object of LVDS bridge driver
> so that display bus driver can handle LVDS bridge driver.
Could you explain what you mean by "dt binding of LVDS bridge can be
done at top level of Exynos drm" ? How it will look like if there
will be more bridges, one for DSI, one for HDMI, etc... What if there
will be two
bridges in one chain. How it will cope with video pipeline bindings?
>
> Will review your patch series soon.
Thanks in advance.

Regards
Andrzej
