From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH 4/4] ARM: dts: Use OF graph for DP to panel connection in
 exynos5800-peach-pi
Date: Mon, 7 Dec 2015 22:44:05 -0300
Message-ID: <566635E5.9070404@osg.samsung.com>
References: <1449492758-19989-1-git-send-email-inki.dae@samsung.com>
 <1449492758-19989-5-git-send-email-inki.dae@samsung.com>
 <56658C78.8090509@osg.samsung.com>
 <CAAQKjZMgse2n0TcjLiBxDn6ddTNSaRKMxoBqU7u8u002W=hRWQ@mail.gmail.com>
 <566628EF.5090202@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:45339 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932193AbbLHBoQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 7 Dec 2015 20:44:16 -0500
In-Reply-To: <566628EF.5090202@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Inki Dae <daeinki@gmail.com>
Cc: DRI mailing list <dri-devel@lists.freedesktop.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Kukjin Kim <kgene.kim@samsung.com>

Hello Krzysztof,

On 12/07/2015 09:48 PM, Krzysztof Kozlowski wrote:
> On 08.12.2015 00:36, Inki Dae wrote:
>> Hi Javier,
>>
>> 2015-12-07 22:41 GMT+09:00 Javier Martinez Canillas <javier@osg.samsung.com>:
>>> Hello Inki,
>>>
>>> On 12/07/2015 09:52 AM, Inki Dae wrote:
>>>> From: Javier Martinez Canillas <javier@osg.samsung.com>
>>>>
>>>
>>> Thanks a lot for posting this patch.
>>>
>>>> The DT binding for the Exynos DRM Display Port (DP) driver isn't consistent
>>>> since it uses a phandle to describe the connection between the DP port and
>>>> the display panel but uses the OF graph ports and endpoints to describe the
>>>> connection betwen the DP port, a bridge chip and the panel.
>>>>
>>>> The Exynos DP driver and the DT binding have been changed to allow also to
>>>> describe the DP port to panel connection using ports / endpoints (OF graph)
>>>> so this patch changes the Exynos5800 Peach Pi DT to make it consistent with
>>>> the Exynos5420 Peach Pit that has a eDP to LVDS chip and uses OF graph too.
>>>>
>>>> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
>>>> Tested-by: Javier Martinez Canillas <javier@osg.samsung.com>
>>>
>>> This tag was not in my original patch, it's true that I tested
>>> it but will someone believe me? ;)
>>
>> Oops. I confused you spread Reviewed-by and Tested-by here and there.
>> Don't worry about that. Will remove it if you don't give me Tested-by.
>> :)
> 
> Actually authorship (the "From") in this case means Tested-by. Author
> always tests the patch so it would look weird if we start adding
> tested-by to our own patches, right?
>

Exactly, that's what I tried to say. It's implied that the
author tested her/his own patch in the best possible way.
 
> Dear Inki,
> However the patch misses your SoB. You touched and sent it so please
> extend the SoB chain-of-blame.
>

Right, I missed that.

> Best regards,
> Krzysztof
> 

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
