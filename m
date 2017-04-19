From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [RFC 0/8] drm/exynos: misc fixes and more
Date: Wed, 19 Apr 2017 10:46:00 +0900
Message-ID: <58F6C158.2070403@samsung.com>
References: <1491314581-18086-1-git-send-email-tjakobi@math.uni-bielefeld.de>
 <CGME20170411105302epcas4p2c240e966d3f7381eac7213662933a178@epcas4p2.samsung.com>
 <11ca839f-2b2d-6a76-aac1-03be93a5dffc@math.uni-bielefeld.de>
 <58ED9279.5030001@samsung.com>
 <417f7071-6a4b-d2f3-7fdb-57779858104a@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:36330 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933222AbdDSBqI (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 18 Apr 2017 21:46:08 -0400
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OOM024GUVKPVX30@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 19 Apr 2017 10:46:01 +0900 (KST)
In-reply-to: <417f7071-6a4b-d2f3-7fdb-57779858104a@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Cc: linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, a.hajda@samsung.com

Hello Tobias,


2017년 04월 16일 20:51에 Tobias Jakobi 이(가) 쓴 글:
> Hello Inki,
> 
> 
> Inki Dae wrote:
>> Hello Tobias,
>>
>> 2017년 04월 11일 19:52에 Tobias Jakobi 이(가) 쓴 글:
>>> Hello Inki,
>>>
>>> please don't forget to review this series.
>>
>> Thanks for your contribution, and don't worry about that. Will review this series.
> 
> 
> Thank you for the confirmation!
> 
> In the meantime, i.e. until we have figured out the IOMMU pagefault, it
> would make sense to reject the combination "interlaced mode + video
> plane". Should I prepare a patch for that?
> 

I think you may be only person who could look into this as of now. Other person including me would have other tasks more important than this.

Thanks,
Inki Dae

> 
> With best wishes,
> Tobias
> 
> 
> 
>> Just sharing a plan for -next,
>>
>> I plan to have pull-request after reviewing a patch set[1] posted by Andrzej.
>> After that, I will start to review your patch set - we would need to enough review this RFC patch set. 
>>
>> It would be very helpful to me if other people could review this.
>>
>>
>> Thanks,
>> Inki Dae
>>
>> [1] https://lists.freedesktop.org/archives/dri-devel/2017-April/138112.html
>>
>>
>>>
>>> Also some pointers concerning the video plane flickering and the
>>> interlacing issue would be very welcome.
>>>
>>> Looking at the current register defines for MXR_INT_EN suggests that
>>> there are at least three more type of interrupt available. Any chance
>>> these could be documented? I hope to get some more insight into this
>>> issue, which apparantly is caused by insufficient bandwidth.
>>>
>>> For the interlacing issue I have done partial progress. I now longer see
>>> a IOMMU pagefault, but the video plane is heavily corrupted. Also the
>>> dimensions look wrong.
>>>
>>> While I can somehow guess that VP_MODE_LINE_SKIP does, the
>>> VP_MODE_FIELD_ID_AUTO_TOGGLING flag still remains a mystery to me. If
>>> possible, I request some documentation for this as well.
>>>
>>>
>>> With best wishes,
>>> Tobias
>>>
>>>
>>>
>>> Tobias Jakobi wrote:
>>>> Hello,
>>>>
>>>> some recent work I did on Exynos. Patches are based on [1] and [2].
>>>>
>>>> Summary:
>>>> (a) Enables support for NV12MT in the mixer.
>>>> (b) Sanitizes buffer pitch for HW with restrictions.
>>>> (c) Misc fixes
>>>>
>>>> While testing the NV12MT part, I made these interesting observations.
>>>>
>>>> (1) I used 1920x1080 XRGB8888 on the primary plane, and 1280x768 on the
>>>> video plane. With this configuration, it does not matter if you're
>>>> using NV12 or NV12MT, the video plane occasionally flickers or shows
>>>> heavy artifacting. Reducing the size of the primary plane, e.g. to
>>>> 32x32 solves this issue, so my guess is that this is memory bandwidth
>>>> issue. Does someone know if one can check for buffer underflows of the
>>>> mixer with respect to data passed from the VP?
>>>>
>>>> (2) Using 1920x1080i (so an interlaced mode) and NV12, the board
>>>> immediately dies with an IOMMU pagefault at address zero. I'm
>>>> currently investigating this, and it looks like that the VP setup
>>>> is wrong here. In particular it should be the source (!) height
>>>> and vertical position that should be halfed in interlaced mode, and
>>>> not the destination. Need to look more into this.
>>>>
>>>> Anyway, both the issues are independant of the patches, so please
>>>> review! :-)
>>>>
>>>> With best wishes,
>>>> Tobias
>>>>
>>>>
>>>> [1] http://www.spinics.net/lists/linux-samsung-soc/msg58640.html
>>>> [2] http://www.spinics.net/lists/linux-samsung-soc/msg58644.html
>>>>
>>>> Tobias Jakobi (8):
>>>>   drm/exynos: mixer: fix chroma comment in vp_video_buffer()
>>>>   drm/exynos: mixer: enable NV12MT support for the video plane
>>>>   drm/exynos: mixer: simplify {vp_video,mixer_graph}_buffer()
>>>>   drm/exynos: mixer: remove src offset from mixer_graph_buffer()
>>>>   drm/exynos: introduce BYTE_PITCH capability
>>>>   drm/exynos: add BYTE_PITCH cap for all supported planes
>>>>   drm/exynos: consistent use of cpp
>>>>   drm/exynos: simplify set_pixfmt() in DECON and FIMD drivers
>>>>
>>>>  drivers/gpu/drm/exynos/exynos5433_drm_decon.c | 17 +++++------
>>>>  drivers/gpu/drm/exynos/exynos7_drm_decon.c    | 13 +++-----
>>>>  drivers/gpu/drm/exynos/exynos_drm_drv.h       |  2 ++
>>>>  drivers/gpu/drm/exynos/exynos_drm_fb.c        |  2 ++
>>>>  drivers/gpu/drm/exynos/exynos_drm_fimd.c      | 17 ++++-------
>>>>  drivers/gpu/drm/exynos/exynos_drm_plane.c     | 37 ++++++++++++++++++++++
>>>>  drivers/gpu/drm/exynos/exynos_mixer.c         | 44 ++++++++-------------------
>>>>  7 files changed, 71 insertions(+), 61 deletions(-)
>>>>
>>>
>>> --
>>> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
>>> the body of a message to majordomo@vger.kernel.org
>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>>
>>>
>>>
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> 
> 
