From: Inki Dae <inki.dae@samsung.com>
Subject: Re: drm/exynos: getting the video processor to work
Date: Wed, 22 Apr 2015 23:26:50 +0900
Message-ID: <5537AFAA.3080909@samsung.com>
References: <55356FEE.7030109@math.uni-bielefeld.de>
 <5536FF93.6000107@samsung.com> <5537398B.3080607@samsung.com>
 <6af982f487367524dd6ff38bd6746ae6@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:39555 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756198AbbDVO0x (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 22 Apr 2015 10:26:53 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NN70002NPGRFW20@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 22 Apr 2015 23:26:51 +0900 (KST)
In-reply-to: <6af982f487367524dd6ff38bd6746ae6@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Cc: Joonyoung Shim <jy0922.shim@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

Hi Tobias,

On 2015=EB=85=84 04=EC=9B=94 22=EC=9D=BC 21:23, Tobias Jakobi wrote:
> Hello Inki and Joonyoung,
>=20
> On 2015-04-22 08:02, Inki Dae wrote:
>> On 2015=EB=85=84 04=EC=9B=94 22=EC=9D=BC 10:55, Joonyoung Shim wrote=
:
>>> Hi Tobias,
>>>
>>> On 04/21/2015 06:30 AM, Tobias Jakobi wrote:
>>>> Hello,
>>>>
>>>> I've spend some time on figuring out how to use the VP on my
>>>> Exynos4412.
>>>> I noticed that currently it seems to be pretty broken (I've put a =
full
>>>> crashlog with drm.debug=3D0xff at the end).
>>>>
>>>> As far as I can see, the problem stems from conflicting buffer
>>>> counts in
>>>> the driver.
>>>>
>>>> Let's start with vp_video_buffer(), there buf_num gets set to '2' =
when
>>>> DRM_FORMAT_NV12 is encountered as pixelformat. Which results in th=
e VP
>>>> reading luma data from the plane's dma_addr[0] and chroma from
>>>> dma_addr[1].
>>>>
>>>> But dma_addr[1] is never correctly set. It should be set by
>>>> exynos_check_plane(), but the loop only does one iteration since
>>>> exynos_drm_fb_get_buf_cnt() returns 1.
>>>>
>>>> Which is due to special case handling in
>>>> exynos_drm_format_num_buffers(). At least for the buffers that lib=
drm's
>>>> modetest creates this case handling triggers and reduces buffer
>>>> count to
>>>> '1'.
>>>>
>>>
>>> This is just pixel format issue and mixer driver is not completed a=
bout
>>> that. The exynos mixer can support two NV12 formats.
>>
>> To clarify it, NV12 and other NVXX formats have only two planes.
> That was also my impression. NV12 and NV21 are always bi-planar, with
> the only difference that NV21 has U/V order reversed (when comparing =
it
> to NV12). There is no uni-planar NV12/NV21. See also:
> https://wiki.videolan.org/YUV#NV12.2FNV21

Right. However, there is a case that we should consider for Exynos SoC.
Exynos SoC has a Hardware video codec which is called MFC. This hardwar=
e
can use a special function for improving decoding and encoding
performance, which makes it possible for Y and CbCr data are placed in
separated memory banks. So for this, a V4L2 guy of Samsung added a new
format - NV12M - to v4l2 fourcc header.

AFAIK, the pixels of NV12 format would consist into,
yyyyyyyyyy
yyyyyyyyyy
uvuvuvuvu

The memory region of each data - y or uv - is continuous each other. In
this case, the base address of each gem buffer is same.


On the other hand, the pixels of NV12M consist into,
yyyyyyyyyy
yyyyyyyyyy
=2E................
uvuvuvuvu

The memory region of each data - y or uv - isn't continuous each other.
So Exynos driver identifies image format according to two cases above.
In this case, the base address of each gem buffer is different.

=46or more information, refer to exynos_drm_format_num_buffers function=
=2E

>=20
>=20
>>> First, NV12 format having just one buffer(Y plane and CbCr plane us=
e a
>>> same buffer but differ their start index.)
>>
>> So it is called packed YUV format and drm_fourcc header defines thes=
e
>> formats as follows,
>>
>> DRM_FORMAT_YUYV
>> DRM_FORMAT_YVYU
>> DRM_FORMAT_UYVY
>> DRM_FORMAT_VYUY
>> DRM_FORMAT_AYUV
> I'd like to know if any other formats except for NV12/NV21 are really
> supported by the video processor? Because I don't see any indication =
for

=46irst, above my comment was wrong. For this, I sent email again.

Anyway, only NV12/NV21 + NV12/21 tiled are supported - this format
contains macro blocks, which is specific to MFC (Hardware Video codec
for Exynos SoC). However, we should consider NV12M format as I mentione=
d
above.

> that. It's just NV12/NV21 and the tiled variants, which are there to
> make it easier to handle data from the MFC block.
>=20
>=20
>>> Second, NV12 format having split two buffers(one is for Y plane, ot=
her
>>> is for CbCr plane)
>>
>> All NVXX formats should be considered only for separated two buffers=
=2E
> Does is even make any difference for the VP if luma and chroma are in
> different buffers or in a single one, just with an offset between
> luma/chroma? I think not, because the VP just gets a dma_addr for bot=
h
> and then fetches data from that position.
>=20
>=20
>>> Current mixer driver considers only second NV12 format, we can know=
 it
>>> from following comment in mixer driver.
>>>
>>> /* TODO: single buffer format NV12, NV21 */
>>
>> So, it seems like wrong comment. Until now, it seems that we have be=
en
>> calling the packed YUV format as NVXX format and calling the NVXX fo=
rmat
>> as NVXXM. And Exynos SoC have even NVXXMT whose format consists into
>> many macro blocks and which has separated two buffers.
> I think getting just regular (un-tiled) NV12/NV21 working should come
> first, then we can think about how to handle the tiled formats (proba=
bly
> with the newly introduced fb modifiers).

Already commented above.

Thanks,
Inki Dae

>=20
> I've patched the mixer so that it passes valid pointers for luma/chro=
ma
> but I still get a crash (sysmmu) sooner or later. So there seems to b=
e
> more issues than just this pixelformat/buffercount one.
>=20
>=20
>=20
>> We would need to make Exynos drivers suitable to fourcc.
>>
>> Thanks,
>> Inki Dae
>=20
>=20
> With best wishes,
> Tobias
>=20
>=20
