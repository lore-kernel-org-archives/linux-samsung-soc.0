From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: Re: drm/exynos: mixer blending and layer order
Date: Fri, 24 Apr 2015 11:13:00 +0900
Message-ID: <5539A6AC.2040509@samsung.com>
References: <f71d728970bc036fdce8934a499aba9f@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:25717 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753450AbbDXCMz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 23 Apr 2015 22:12:55 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NNA0026IGTHOD20@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 24 Apr 2015 11:12:53 +0900 (KST)
In-reply-to: <f71d728970bc036fdce8934a499aba9f@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, linux-samsung-soc@vger.kernel.org
Cc: gustavo.padovan@collabora.co.uk, inki.dae@samsung.com

Hi Tobias,

On 04/23/2015 09:28 PM, Tobias Jakobi wrote:
> Hello,
> 
> I've noticed some inconsistency in what is currently exported as 'zpos' DRM propery to userspace. Currently we create three planes, where the zpos maps to the mixer 'win' (is this simply short for window?).
> 
> But this is wrong since the mixer layer configuration is currently done in this way (in mixer_win_reset()):
> layer1 (win[1]) > layer0 (win[0]) > video (win[2])
> 
> So layer1 is at the top of our stack, and the video layer is at the bottom. So regardless on how you interpret the zpos property (0 being the top, or 0 being bottom), it doesn't give you accurate information on how the planes are ordered.
> 

I know, actually here zpos doesn't mean order priority of layer, it is
just real hardware layer. Exynos mixer has 3 hardware layer, graphic0
layer, graphic1 layer and video layer, so zpos 0 means graphic0 layer,
zpos 1 means graphic1 layer, zpos 2 means video layer.

Thanks.

> Related to this is the issue of how to blend planes. When should blending of layer be enabled?

Current mixer codes permit blending about all layers except bottom layer
(just above background layer).

> We probably want to based this on three states:
> - which layer are enabled
> - which pixelformats are associated to the layers

This idea is ok but as i said, there is blending issue of background
layer.

> - in which order are the layers (*)

Now we don't permit to change order priority of layer.

> 
> (*) So in the case of 'layer1 > layer0 > video', layer1 disabled, layer0/video enabled, layer0 having alpha-pixelformat, we want to blend layer0 and the video layer (so effectively making layer0 translucent).
> 
> I'm trying to come up with a proposition for that issue in the next days, but it would really help to hear thoughts of you guys.
> 
> With best wishes,
> Tobias
> 
> 

Thanks.
