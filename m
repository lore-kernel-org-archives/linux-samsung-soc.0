From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: Re: drm/exynos: mixer blending and layer order
Date: Tue, 28 Apr 2015 14:58:54 +0200
Message-ID: <1914fda9b2c9c791a03f2dbe0364281e@math.uni-bielefeld.de>
References: <f71d728970bc036fdce8934a499aba9f@math.uni-bielefeld.de>
 <5539A6AC.2040509@samsung.com>
 <11162479524807936a88e382661b3df6@math.uni-bielefeld.de>
 <553DDC9D.2080405@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:50654 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S965557AbbD1M66 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 28 Apr 2015 08:58:58 -0400
In-Reply-To: <553DDC9D.2080405@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Joonyoung Shim <jy0922.shim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, gustavo.padovan@collabora.co.uk, inki.dae@samsung.com

Hello Joonyoung,

On 2015-04-27 08:52, Joonyoung Shim wrote:
> Hi Tobias,
> 
> On 04/24/2015 05:29 PM, Tobias Jakobi wrote:
>> Hello Joonyoung,
>> 
>> On 2015-04-24 04:13, Joonyoung Shim wrote:
>>> Hi Tobias,
>>> 
>>> On 04/23/2015 09:28 PM, Tobias Jakobi wrote:
>>>> Hello,
>>>> 
>>>> I've noticed some inconsistency in what is currently exported as 
>>>> 'zpos' DRM propery to userspace. Currently we create three planes, 
>>>> where the zpos maps to the mixer 'win' (is this simply short for 
>>>> window?).
>>>> 
>>>> But this is wrong since the mixer layer configuration is currently 
>>>> done in this way (in mixer_win_reset()):
>>>> layer1 (win[1]) > layer0 (win[0]) > video (win[2])
>>>> 
>>>> So layer1 is at the top of our stack, and the video layer is at the 
>>>> bottom. So regardless on how you interpret the zpos property (0 
>>>> being the top, or 0 being bottom), it doesn't give you accurate 
>>>> information on how the planes are ordered.
>>>> 
>>> 
>>> I know, actually here zpos doesn't mean order priority of layer, it 
>>> is
>>> just real hardware layer. Exynos mixer has 3 hardware layer, graphic0
>>> layer, graphic1 layer and video layer, so zpos 0 means graphic0 
>>> layer,
>>> zpos 1 means graphic1 layer, zpos 2 means video layer.
>> I'm aware of that, but that doesn't solve the issue at hand: The 
>> 'zpos' property is completly meaningless at ths point, since it tells 
>> the DRM user absolutely nothing about the z-ordering of the planes. 
>> Either that should be fixed (what I'm looking into) or the property 
>> should just be dropped.
>> 
> 
> The zpos was not for layer order priority and now user cannot select hw
> layer which user wants to output without it.
I don't understand this. The 'zpos' property is not necessary for the 
user to select a plane. I mean, it's not even a required property of a 
plane. Or did this change with atomic?

Anyway, all I'm saying here is that 'zpos' is meaningless at this point. 
To restore meaning to the property it should reflect the order of the 
layers, or to use mixer terminology, the layer priority.


>>> Thanks.
>>> 
>>>> Related to this is the issue of how to blend planes. When should 
>>>> blending of layer be enabled?
>>> 
>>> Current mixer codes permit blending about all layers except bottom 
>>> layer
>>> (just above background layer).
>>> 
>>>> We probably want to based this on three states:
>>>> - which layer are enabled
>>>> - which pixelformats are associated to the layers
>>> 
>>> This idea is ok but as i said, there is blending issue of background
>>> layer.
>> Any suggestions on how to fix that bg issue?
>> 
>> Ville has pointed out that, under the condition that bg is a simple 
>> color, that it could be exported as a crtc property, see [1]. We would 
>> need another 'bg_enabled' flag as well I guess.
>> 
> 
> First, i'm not sure whether it's right to enable blending of bottom
> layer and bg layer. Now current code doesn't permit it. If we allow
> it, i think it's ok to use crtc property but it is increased exynos
> specific property.
I think I can design the code in such a way that we can easily extend it 
once this feature appears. And it wouldn't be Exynos specific at all 
(since it originates from the Intel developers).


>>>> - in which order are the layers (*)
>>> 
>>> Now we don't permit to change order priority of layer.
>> That's not what I mean (see my example). What I mean is that it should 
>> make a difference if the layer with alpha-pixelformat is on top of 
>> some layer, or below.
>> 
>> Something like this:
>> - if layer[i] has non-alpha-pixelformat, don't enable any blending for 
>> that layer
>> - if layer[i] has alpha-pixelformat, and layer[i] is a the bottom of 
>> our layer-stack, don't enable any blending for that layer (*)
> 
> The layer[i] is bottom, then why don't other all layers enable 
> blending?
Because it's wrong. If a layer has no alpha component, then it means 
that the layer is opaque. You can't see through an opaque layer, hence 
everything 'behind' it (which means that it has a lower plane priority) 
is not visible.

If you enable blending regardless of the present of alpha, you also 
introduce subtle bugs. If a user specifies that his buffer has 
pixelformat XRGB, then this is an explicit request to ignore the content 
in 'X'. The user should be able to assume any data in 'X' is not 
considered by the DRM. If we now silently enable blending, we break that 
assumption.

This in turn then leads to userspace having to deal with this mess:
https://github.com/endlessm/xf86-video-armsoc/commit/53ac6858071e8e2db92cdea28422beafee481cb6



> If The layer[0] is bottom and layer[1] is right above layer[0] and
> alpha-pixelformat, i think it's possible blending of layer[1] and
> layer[0].
This plane setup is currently resolved in my code in the way you 
describe. I just need to do some cleaning up, so it might take some more 
time. :)


With best wishes,
Tobias
