From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: Re: drm/exynos: mixer blending and layer order
Date: Wed, 29 Apr 2015 15:49:24 +0900
Message-ID: <55407EF4.9090608@samsung.com>
References: <f71d728970bc036fdce8934a499aba9f@math.uni-bielefeld.de>
 <5539A6AC.2040509@samsung.com>
 <11162479524807936a88e382661b3df6@math.uni-bielefeld.de>
 <553DDC9D.2080405@samsung.com>
 <1914fda9b2c9c791a03f2dbe0364281e@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:59730 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S966115AbbD2GtP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 29 Apr 2015 02:49:15 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NNK00LCR2Y11470@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 29 Apr 2015 15:49:13 +0900 (KST)
In-reply-to: <1914fda9b2c9c791a03f2dbe0364281e@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Cc: linux-samsung-soc@vger.kernel.org, gustavo.padovan@collabora.co.uk, inki.dae@samsung.com

Hi Tobias,

On 04/28/2015 09:58 PM, Tobias Jakobi wrote:
> Hello Joonyoung,
> 
> On 2015-04-27 08:52, Joonyoung Shim wrote:
>> Hi Tobias,
>>
>> On 04/24/2015 05:29 PM, Tobias Jakobi wrote:
>>> Hello Joonyoung,
>>>
>>> On 2015-04-24 04:13, Joonyoung Shim wrote:
>>>> Hi Tobias,
>>>>
>>>> On 04/23/2015 09:28 PM, Tobias Jakobi wrote:
>>>>> Hello,
>>>>>
>>>>> I've noticed some inconsistency in what is currently exported as 'zpos' DRM propery to userspace. Currently we create three planes, where the zpos maps to the mixer 'win' (is this simply short for window?).
>>>>>
>>>>> But this is wrong since the mixer layer configuration is currently done in this way (in mixer_win_reset()):
>>>>> layer1 (win[1]) > layer0 (win[0]) > video (win[2])
>>>>>
>>>>> So layer1 is at the top of our stack, and the video layer is at the bottom. So regardless on how you interpret the zpos property (0 being the top, or 0 being bottom), it doesn't give you accurate information on how the planes are ordered.
>>>>>
>>>>
>>>> I know, actually here zpos doesn't mean order priority of layer, it is
>>>> just real hardware layer. Exynos mixer has 3 hardware layer, graphic0
>>>> layer, graphic1 layer and video layer, so zpos 0 means graphic0 layer,
>>>> zpos 1 means graphic1 layer, zpos 2 means video layer.
>>> I'm aware of that, but that doesn't solve the issue at hand: The 'zpos' property is completly meaningless at ths point, since it tells the DRM user absolutely nothing about the z-ordering of the planes. Either that should be fixed (what I'm looking into) or the property should just be dropped.
>>>
>>
>> The zpos was not for layer order priority and now user cannot select hw
>> layer which user wants to output without it.
> I don't understand this. The 'zpos' property is not necessary for the user to select a plane. I mean, it's not even a required property of a plane. Or did this change with atomic?
> 

Without zpos, user may select hw layer only via plane resources order on
latest exynos drm driver, but zpos can give obvious information to user.
Of course we can improve zpos property or remove it or as you said
change meaning for layer priority for better usage, but i just say what
current codes mean.

> Anyway, all I'm saying here is that 'zpos' is meaningless at this point. To restore meaning to the property it should reflect the order of the layers, or to use mixer terminology, the layer priority.
> 
> 
>>>> Thanks.
>>>>
>>>>> Related to this is the issue of how to blend planes. When should blending of layer be enabled?
>>>>
>>>> Current mixer codes permit blending about all layers except bottom layer
>>>> (just above background layer).
>>>>
>>>>> We probably want to based this on three states:
>>>>> - which layer are enabled
>>>>> - which pixelformats are associated to the layers
>>>>
>>>> This idea is ok but as i said, there is blending issue of background
>>>> layer.
>>> Any suggestions on how to fix that bg issue?
>>>
>>> Ville has pointed out that, under the condition that bg is a simple color, that it could be exported as a crtc property, see [1]. We would need another 'bg_enabled' flag as well I guess.
>>>
>>
>> First, i'm not sure whether it's right to enable blending of bottom
>> layer and bg layer. Now current code doesn't permit it. If we allow
>> it, i think it's ok to use crtc property but it is increased exynos
>> specific property.
> I think I can design the code in such a way that we can easily extend it once this feature appears. And it wouldn't be Exynos specific at all (since it originates from the Intel developers).
> 
> 
>>>>> - in which order are the layers (*)
>>>>
>>>> Now we don't permit to change order priority of layer.
>>> That's not what I mean (see my example). What I mean is that it should make a difference if the layer with alpha-pixelformat is on top of some layer, or below.
>>>
>>> Something like this:
>>> - if layer[i] has non-alpha-pixelformat, don't enable any blending for that layer
>>> - if layer[i] has alpha-pixelformat, and layer[i] is a the bottom of our layer-stack, don't enable any blending for that layer (*)
>>
>> The layer[i] is bottom, then why don't other all layers enable blending?
> Because it's wrong. If a layer has no alpha component, then it means that the layer is opaque. You can't see through an opaque layer, hence everything 'behind' it (which means that it has a lower plane priority) is not visible.
> 

I mean it can be invalidated when the layer has any above layers. To
enable blending of layer can do regardless of opaque of behind layer,
right? Please fix me if i misunderstand.

> If you enable blending regardless of the present of alpha, you also introduce subtle bugs. If a user specifies that his buffer has pixelformat XRGB, then this is an explicit request to ignore the content in 'X'. The user should be able to assume any data in 'X' is not considered by the DRM. If we now silently enable blending, we break that assumption.
> 

I already said it's ok to decide blending feature on/off of layer by
pixel format.

Thanks.

> This in turn then leads to userspace having to deal with this mess:
> https://github.com/endlessm/xf86-video-armsoc/commit/53ac6858071e8e2db92cdea28422beafee481cb6
> 
> 
> 
>> If The layer[0] is bottom and layer[1] is right above layer[0] and
>> alpha-pixelformat, i think it's possible blending of layer[1] and
>> layer[0].
> This plane setup is currently resolved in my code in the way you describe. I just need to do some cleaning up, so it might take some more time. :)
> 
> 
> With best wishes,
> Tobias
> 
> 
> 
