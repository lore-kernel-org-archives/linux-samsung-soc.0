From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: Re: [PATCH 0/5] drm/exynos: rework layer blending setup
Date: Fri, 22 May 2015 10:07:35 +0200
Message-ID: <b64b1d76e98e038c5b57355c06e31fdb@math.uni-bielefeld.de>
References: <1430919410-9917-1-git-send-email-tjakobi@math.uni-bielefeld.de>
 <555E43B5.2000000@math.uni-bielefeld.de> <555EAAE1.9030406@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:40574 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751783AbbEVIHi (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 22 May 2015 04:07:38 -0400
In-Reply-To: <555EAAE1.9030406@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Joonyoung Shim <jy0922.shim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, gustavo.padovan@collabora.co.uk, inki.dae@samsung.com

Hello Joonyoung,

On 2015-05-22 06:04, Joonyoung Shim wrote:
> Hi Tobias,
> 
> On 05/22/2015 05:44 AM, Tobias Jakobi wrote:
>> Gentle reminder that I still haven't heard anything about the series 
>> by
>> the Samsung guys ;)
>> 
> 
> Sorry for late, i'm busy and i think whether it's possible any way for
> this blending from exynos drm framework after atomic feature of exynos
> merged.
the code is largely independent of Gustavo's patches. It doesn't really 
make a lot of difference if it's merged before or after atomic. In fact 
I've already tested it with and without atomic.

If possible I would like this to be merged now, so that it can go into 
4.2. I also have the patches fixing the zpos issue waiting, which I'm 
planning to base on Gustavo's next cleanup series. But for this both the 
atomic and the layer work series need to get merged first.

With best wishes,
Tobias


> 
> Thanks.
> 
>> With best wishes,
>> Tobias
>> 
>> 
>> Tobias Jakobi wrote:
>>> Hello,
>>> 
>>> this is a rework of the layer blending setup in the Exynos DRM mixer. 
>>> The current setup is static and spread out through the mixer code. 
>>> This rework pushes all the configuration details into a layer_config 
>>> array, which specifies the priority of each layer.
>>> 
>>> Two arrays are currently found in the code, one for SoC versions with 
>>> a video processor (VP) and one for SoC versions without VP. The VP 
>>> gives us one additional layer, the video layer, which natively 
>>> supports the NV12/NV21 pixelformat.
>>> 
>>> The blending setup roughly works like this:
>>> 1) Find the bottom-most enabled layer. Disable all blending for this 
>>> layer. This is done because we currently don't expose modification of 
>>> the mixer background to userspace. Once this is done we can add more 
>>> flexibility here.
>>> 2) Find the next enabled layer in our layer stack. If the layer has a 
>>> framebuffer with an alpha-pixelformat attached, enable blending for 
>>> this layer. If not, disable blending.
>>> 3) Iterate (2) until all enabled layers are processed.
>>> 
>>> The series has been tested on a Hardkernel Odroid-X2 (Exynos4412, 
>>> which has a VP).
>>> 
>>> If you want to use libdrm's modetest to check the series, please 
>>> apply patches [1] and [2]. This should make it possible to also test 
>>> a plane with NV12 format (which is located 'behind' the primary 
>>> plane).
>>> 
>>> With best wishes,
>>> Tobias
>>> 
>>> [1] https://patchwork.kernel.org/patch/6349241/
>>> [2] https://patchwork.kernel.org/patch/6349261/
>>> 
>>> 
>>> Tobias Jakobi (5):
>>>   drm/exynos: mixer: refactor layer setup
>>>   drm/exynos: mixer: introduce mixer_layer_blending()
>>>   drm/exynos: mixer: remove all static blending setup
>>>   drm/exynos: mixer: do blending setup in mixer_cfg_layer()
>>>   drm/exynos: mixer: also allow ARGB1555 and ARGB4444
>>> 
>>>  drivers/gpu/drm/exynos/exynos_mixer.c | 246 
>>> +++++++++++++++++++++++++++++-----
>>>  drivers/gpu/drm/exynos/regs-mixer.h   |   1 +
>>>  2 files changed, 213 insertions(+), 34 deletions(-)
>>> 
>> 
>> 
