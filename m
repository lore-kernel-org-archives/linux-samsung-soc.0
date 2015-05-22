From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: Re: [PATCH 0/5] drm/exynos: rework layer blending setup
Date: Fri, 22 May 2015 13:04:49 +0900
Message-ID: <555EAAE1.9030406@samsung.com>
References: <1430919410-9917-1-git-send-email-tjakobi@math.uni-bielefeld.de>
 <555E43B5.2000000@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:34714 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750707AbbEVEEv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 22 May 2015 00:04:51 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NOQ00D9MGO0U0C0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 22 May 2015 13:04:48 +0900 (KST)
In-reply-to: <555E43B5.2000000@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, gustavo.padovan@collabora.co.uk, inki.dae@samsung.com

Hi Tobias,

On 05/22/2015 05:44 AM, Tobias Jakobi wrote:
> Gentle reminder that I still haven't heard anything about the series by
> the Samsung guys ;)
> 

Sorry for late, i'm busy and i think whether it's possible any way for
this blending from exynos drm framework after atomic feature of exynos
merged.

Thanks.

> With best wishes,
> Tobias
> 
> 
> Tobias Jakobi wrote:
>> Hello,
>>
>> this is a rework of the layer blending setup in the Exynos DRM mixer. The current setup is static and spread out through the mixer code. This rework pushes all the configuration details into a layer_config array, which specifies the priority of each layer.
>>
>> Two arrays are currently found in the code, one for SoC versions with a video processor (VP) and one for SoC versions without VP. The VP gives us one additional layer, the video layer, which natively supports the NV12/NV21 pixelformat.
>>
>> The blending setup roughly works like this:
>> 1) Find the bottom-most enabled layer. Disable all blending for this layer. This is done because we currently don't expose modification of the mixer background to userspace. Once this is done we can add more flexibility here.
>> 2) Find the next enabled layer in our layer stack. If the layer has a framebuffer with an alpha-pixelformat attached, enable blending for this layer. If not, disable blending.
>> 3) Iterate (2) until all enabled layers are processed.
>>
>> The series has been tested on a Hardkernel Odroid-X2 (Exynos4412, which has a VP).
>>
>> If you want to use libdrm's modetest to check the series, please apply patches [1] and [2]. This should make it possible to also test a plane with NV12 format (which is located 'behind' the primary plane).
>>
>> With best wishes,
>> Tobias
>>
>> [1] https://patchwork.kernel.org/patch/6349241/
>> [2] https://patchwork.kernel.org/patch/6349261/
>>
>>
>> Tobias Jakobi (5):
>>   drm/exynos: mixer: refactor layer setup
>>   drm/exynos: mixer: introduce mixer_layer_blending()
>>   drm/exynos: mixer: remove all static blending setup
>>   drm/exynos: mixer: do blending setup in mixer_cfg_layer()
>>   drm/exynos: mixer: also allow ARGB1555 and ARGB4444
>>
>>  drivers/gpu/drm/exynos/exynos_mixer.c | 246 +++++++++++++++++++++++++++++-----
>>  drivers/gpu/drm/exynos/regs-mixer.h   |   1 +
>>  2 files changed, 213 insertions(+), 34 deletions(-)
>>
> 
> 
