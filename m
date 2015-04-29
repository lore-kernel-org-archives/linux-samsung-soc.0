From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: Re: drm/exynos: mixer blending and layer order
Date: Wed, 29 Apr 2015 15:13:21 +0200
Message-ID: <229dcfe67a2ad84399cdc5090bca8cf8@math.uni-bielefeld.de>
References: <f71d728970bc036fdce8934a499aba9f@math.uni-bielefeld.de>
 <5539A6AC.2040509@samsung.com>
 <11162479524807936a88e382661b3df6@math.uni-bielefeld.de>
 <553DDC9D.2080405@samsung.com>
 <1914fda9b2c9c791a03f2dbe0364281e@math.uni-bielefeld.de>
 <55407EF4.9090608@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:52584 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1423097AbbD2NNY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 29 Apr 2015 09:13:24 -0400
In-Reply-To: <55407EF4.9090608@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Joonyoung Shim <jy0922.shim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, gustavo.padovan@collabora.co.uk, inki.dae@samsung.com

Hey Joonyoung,

On 2015-04-29 08:49, Joonyoung Shim wrote:
> Without zpos, user may select hw layer only via plane resources order 
> on
> latest exynos drm driver, but zpos can give obvious information to 
> user.
> Of course we can improve zpos property or remove it or as you said
> change meaning for layer priority for better usage, but i just say what
> current codes mean.
Ok, I think I have some good idea how to properly fix this, but I guess 
I should wait for Gustavos's plane cleanup to happen.


> I mean it can be invalidated when the layer has any above layers. To
> enable blending of layer can do regardless of opaque of behind layer,
> right? Please fix me if i misunderstand.
The plan is the following:
- For the bottom-most (enabled) layer we always disable any kind of 
blending. We can make this more generic if we should expose 
configuration of the background layer to userspace (but this is for the 
future).
- For all other (enabled) layers we setup blending depending on the 
pixelformat. If it's an alpha format, we enable blending, if not, 
disable blending.

Does this sound correct?

Something we can keep in mind for the future:
Attach a 'global alpha' DRM property to each plane so that we can setup 
blending even for non-alpha pixelformats. Range would be -1 to 0xff, 
where -1 would mean 'disable global-alpha. This would expose the 
MXR_GRP_CFG_WIN_BLEND_EN functionality.



> I already said it's ok to decide blending feature on/off of layer by
> pixel format.
Sorry, I misunderstood you there!


Also, maybe you can help me with this. The SoCs with no video processor 
(so 'is_vp_enabled=0'), how many layers does the mixer support there? Is 
it just one layer less (so no video layer), or is the video layer 
replaced by a normal non-video layer? The current code implies that 
there is one layer less, but I want to make sure I get this right! :)




With best wishes,
Tobias
