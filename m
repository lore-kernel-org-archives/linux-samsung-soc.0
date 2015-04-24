From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: Re: drm/exynos: mixer blending and layer order
Date: Fri, 24 Apr 2015 10:29:42 +0200
Message-ID: <11162479524807936a88e382661b3df6@math.uni-bielefeld.de>
References: <f71d728970bc036fdce8934a499aba9f@math.uni-bielefeld.de>
 <5539A6AC.2040509@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:43484 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S965999AbbDXI3o (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 24 Apr 2015 04:29:44 -0400
In-Reply-To: <5539A6AC.2040509@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Joonyoung Shim <jy0922.shim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, gustavo.padovan@collabora.co.uk, inki.dae@samsung.com

Hello Joonyoung,

On 2015-04-24 04:13, Joonyoung Shim wrote:
> Hi Tobias,
> 
> On 04/23/2015 09:28 PM, Tobias Jakobi wrote:
>> Hello,
>> 
>> I've noticed some inconsistency in what is currently exported as 
>> 'zpos' DRM propery to userspace. Currently we create three planes, 
>> where the zpos maps to the mixer 'win' (is this simply short for 
>> window?).
>> 
>> But this is wrong since the mixer layer configuration is currently 
>> done in this way (in mixer_win_reset()):
>> layer1 (win[1]) > layer0 (win[0]) > video (win[2])
>> 
>> So layer1 is at the top of our stack, and the video layer is at the 
>> bottom. So regardless on how you interpret the zpos property (0 being 
>> the top, or 0 being bottom), it doesn't give you accurate information 
>> on how the planes are ordered.
>> 
> 
> I know, actually here zpos doesn't mean order priority of layer, it is
> just real hardware layer. Exynos mixer has 3 hardware layer, graphic0
> layer, graphic1 layer and video layer, so zpos 0 means graphic0 layer,
> zpos 1 means graphic1 layer, zpos 2 means video layer.
I'm aware of that, but that doesn't solve the issue at hand: The 'zpos' 
property is completly meaningless at ths point, since it tells the DRM 
user absolutely nothing about the z-ordering of the planes. Either that 
should be fixed (what I'm looking into) or the property should just be 
dropped.



> 
> Thanks.
> 
>> Related to this is the issue of how to blend planes. When should 
>> blending of layer be enabled?
> 
> Current mixer codes permit blending about all layers except bottom 
> layer
> (just above background layer).
> 
>> We probably want to based this on three states:
>> - which layer are enabled
>> - which pixelformats are associated to the layers
> 
> This idea is ok but as i said, there is blending issue of background
> layer.
Any suggestions on how to fix that bg issue?

Ville has pointed out that, under the condition that bg is a simple 
color, that it could be exported as a crtc property, see [1]. We would 
need another 'bg_enabled' flag as well I guess.


> 
>> - in which order are the layers (*)
> 
> Now we don't permit to change order priority of layer.
That's not what I mean (see my example). What I mean is that it should 
make a difference if the layer with alpha-pixelformat is on top of some 
layer, or below.

Something like this:
- if layer[i] has non-alpha-pixelformat, don't enable any blending for 
that layer
- if layer[i] has alpha-pixelformat, and layer[i] is a the bottom of our 
layer-stack, don't enable any blending for that layer (*)
- if layer[i] has alpha-pixelformat, and there exists layer[j] which is 
located right below layer[i] in our stack, then enable blending

The configuration in (*) then would be the default setup, when just the 
primary plane is enabled, and no other planes are active.

The background would then just become another (virtual) layer.

I hope this is less confusing than my previous description. :)


> 
>> 
>> (*) So in the case of 'layer1 > layer0 > video', layer1 disabled, 
>> layer0/video enabled, layer0 having alpha-pixelformat, we want to 
>> blend layer0 and the video layer (so effectively making layer0 
>> translucent).
>> 
>> I'm trying to come up with a proposition for that issue in the next 
>> days, but it would really help to hear thoughts of you guys.
>> 
>> With best wishes,
>> Tobias
>> 
>> 
> 
> Thanks.

With best wishes,
Tobias


[1] http://article.gmane.org/gmane.comp.video.dri.devel/127749
