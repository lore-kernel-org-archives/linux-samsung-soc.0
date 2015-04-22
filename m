From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: Re: drm/exynos: getting the video processor to work
Date: Thu, 23 Apr 2015 08:57:39 +0900
Message-ID: <55383573.2020508@samsung.com>
References: <55356FEE.7030109@math.uni-bielefeld.de>
 <5536FF93.6000107@samsung.com> <5537398B.3080607@samsung.com>
 <6af982f487367524dd6ff38bd6746ae6@math.uni-bielefeld.de>
 <5537AFAA.3080909@samsung.com>
 <1bef64f6ef1b48a520e0e08d66367233@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:48153 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965598AbbDVX5h (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 22 Apr 2015 19:57:37 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NN80089QFVYUI40@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 23 Apr 2015 08:57:34 +0900 (KST)
In-reply-to: <1bef64f6ef1b48a520e0e08d66367233@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Inki Dae <inki.dae@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

Hi Tobias,

On 04/22/2015 11:56 PM, Tobias Jakobi wrote:
> Hello Inki,
> 
> 
> On 2015-04-22 16:26, Inki Dae wrote:
>> Right. However, there is a case that we should consider for Exynos SoC.
>> Exynos SoC has a Hardware video codec which is called MFC. This hardware
>> can use a special function for improving decoding and encoding
>> performance, which makes it possible for Y and CbCr data are placed in
>> separated memory banks. So for this, a V4L2 guy of Samsung added a new
>> format - NV12M - to v4l2 fourcc header.
>>
>> AFAIK, the pixels of NV12 format would consist into,
>> yyyyyyyyyy
>> yyyyyyyyyy
>> uvuvuvuvu
>>
>> The memory region of each data - y or uv - is continuous each other. In
>> this case, the base address of each gem buffer is same.
>>
>>
>> On the other hand, the pixels of NV12M consist into,
>> yyyyyyyyyy
>> yyyyyyyyyy
>> .................
>> uvuvuvuvu
>>
>> The memory region of each data - y or uv - isn't continuous each other.
>> So Exynos driver identifies image format according to two cases above.
>> In this case, the base address of each gem buffer is different.
>>
>> For more information, refer to exynos_drm_format_num_buffers function.
> I don't see how this is relevant here. The VP doesn't gain anything from the fact that it can pull data from different memory banks. It's just the MFC that benefits from that.
> 
> Why does the VP need to know whether the data is NV12 or NV12M? When we get this data from userspace, then in the case of NV12 we always get two planes (yielding two handles, two pitches, two offsets). The VP then gets configured with two dma_addr, one for luma plane, one for chroma. If luma and chroma are contiguous in memory doesn't make any difference here.
> 

I feel it is just each other different implementation issue, not right
and wrong. If you are interested, could you please make a patch to
support NV12 format(including NV12M)? Maybe will have to modify or
remove exynos_drm_format_num_buffers function and delivery each buffer
informations to mixer driver via struct exynos_drm_plane. I think it's
not difficult to do.

Thanks.

> Correct me if I'm wrong, but I think this whole NV12/NV12M business is strictly related to the video decoding / v4l2 side.
> 
> 
> 
>> Anyway, only NV12/NV21 + NV12/21 tiled are supported - this format
>> contains macro blocks, which is specific to MFC (Hardware Video codec
>> for Exynos SoC). However, we should consider NV12M format as I mentioned
>> above.
> Thanks for the confirmation, but as I said above, I don't see why we should consider NV12M for the DRM / presentation side.
> 
> 
> With best wishes,
> Tobias
> 
> 
