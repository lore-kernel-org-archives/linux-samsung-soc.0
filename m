From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: Re: drm/exynos: mixer blending and layer order
Date: Thu, 30 Apr 2015 16:17:47 +0900
Message-ID: <5541D71B.6060206@samsung.com>
References: <f71d728970bc036fdce8934a499aba9f@math.uni-bielefeld.de>
 <5539A6AC.2040509@samsung.com>
 <11162479524807936a88e382661b3df6@math.uni-bielefeld.de>
 <553DDC9D.2080405@samsung.com>
 <1914fda9b2c9c791a03f2dbe0364281e@math.uni-bielefeld.de>
 <55407EF4.9090608@samsung.com>
 <229dcfe67a2ad84399cdc5090bca8cf8@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:63466 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750776AbbD3HRh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 30 Apr 2015 03:17:37 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NNL00KO3YXB9380@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 30 Apr 2015 16:17:35 +0900 (KST)
In-reply-to: <229dcfe67a2ad84399cdc5090bca8cf8@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Cc: linux-samsung-soc@vger.kernel.org, gustavo.padovan@collabora.co.uk, inki.dae@samsung.com

Hi Tobias,

On 04/29/2015 10:13 PM, Tobias Jakobi wrote:
> Hey Joonyoung,
> 
> On 2015-04-29 08:49, Joonyoung Shim wrote:
>> Without zpos, user may select hw layer only via plane resources order on
>> latest exynos drm driver, but zpos can give obvious information to user.
>> Of course we can improve zpos property or remove it or as you said
>> change meaning for layer priority for better usage, but i just say what
>> current codes mean.
> Ok, I think I have some good idea how to properly fix this, but I guess I should wait for Gustavos's plane cleanup to happen.
> 
> 
>> I mean it can be invalidated when the layer has any above layers. To
>> enable blending of layer can do regardless of opaque of behind layer,
>> right? Please fix me if i misunderstand.
> The plan is the following:
> - For the bottom-most (enabled) layer we always disable any kind of blending. We can make this more generic if we should expose configuration of the background layer to userspace (but this is for the future).
> - For all other (enabled) layers we setup blending depending on the pixelformat. If it's an alpha format, we enable blending, if not, disable blending.
> 
> Does this sound correct?
> 

Right.

> Something we can keep in mind for the future:
> Attach a 'global alpha' DRM property to each plane so that we can setup blending even for non-alpha pixelformats. Range would be -1 to 0xff, where -1 would mean 'disable global-alpha. This would expose the MXR_GRP_CFG_WIN_BLEND_EN functionality.
> 

Yeah, i think it's possible.

> 
> 
>> I already said it's ok to decide blending feature on/off of layer by
>> pixel format.
> Sorry, I misunderstood you there!
> 
> 
> Also, maybe you can help me with this. The SoCs with no video processor (so 'is_vp_enabled=0'), how many layers does the mixer support there? Is it just one layer less (so no video layer), or is the video layer replaced by a normal non-video layer? The current code implies that there is one layer less, but I want to make sure I get this right! :)
> 

Mixer supports three hw layers - graphic0, graphic1, video.

Exynos4 SoC series has video processor and it gets video data from DRAM
and after any processing, transfers to mixer video layer.

Exynos5 SoC series doesn't have video processor but there is gscaler
(general scaler) hw. It is generic M2M(memory to memory) hw to gets data
from DRAM and after any processing, transfer to memory, but it also can
transfer processing data to mixer video layer if changes some
configuration(call local path). Unfortunately, I heard local path from
gscaler to mixer video layer wasn't verified from exynos chip vender, so
there is no way to enable mixer video layer on exynos5 now.

Thanks.
