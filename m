From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: Re: drm/exynos: getting the video processor to work
Date: Wed, 22 Apr 2015 14:23:40 +0200
Message-ID: <6af982f487367524dd6ff38bd6746ae6@math.uni-bielefeld.de>
References: <55356FEE.7030109@math.uni-bielefeld.de>
 <5536FF93.6000107@samsung.com> <5537398B.3080607@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:40381 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752524AbbDVMXn convert rfc822-to-8bit
	(ORCPT <rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 22 Apr 2015 08:23:43 -0400
In-Reply-To: <5537398B.3080607@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Joonyoung Shim <jy0922.shim@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

Hello Inki and Joonyoung,

On 2015-04-22 08:02, Inki Dae wrote:
> On 2015=EB=85=84 04=EC=9B=94 22=EC=9D=BC 10:55, Joonyoung Shim wrote:
>> Hi Tobias,
>>=20
>> On 04/21/2015 06:30 AM, Tobias Jakobi wrote:
>>> Hello,
>>>=20
>>> I've spend some time on figuring out how to use the VP on my=20
>>> Exynos4412.
>>> I noticed that currently it seems to be pretty broken (I've put a=20
>>> full
>>> crashlog with drm.debug=3D0xff at the end).
>>>=20
>>> As far as I can see, the problem stems from conflicting buffer coun=
ts=20
>>> in
>>> the driver.
>>>=20
>>> Let's start with vp_video_buffer(), there buf_num gets set to '2'=20
>>> when
>>> DRM_FORMAT_NV12 is encountered as pixelformat. Which results in the=
=20
>>> VP
>>> reading luma data from the plane's dma_addr[0] and chroma from=20
>>> dma_addr[1].
>>>=20
>>> But dma_addr[1] is never correctly set. It should be set by
>>> exynos_check_plane(), but the loop only does one iteration since
>>> exynos_drm_fb_get_buf_cnt() returns 1.
>>>=20
>>> Which is due to special case handling in
>>> exynos_drm_format_num_buffers(). At least for the buffers that=20
>>> libdrm's
>>> modetest creates this case handling triggers and reduces buffer cou=
nt=20
>>> to
>>> '1'.
>>>=20
>>=20
>> This is just pixel format issue and mixer driver is not completed=20
>> about
>> that. The exynos mixer can support two NV12 formats.
>=20
> To clarify it, NV12 and other NVXX formats have only two planes.
That was also my impression. NV12 and NV21 are always bi-planar, with=20
the only difference that NV21 has U/V order reversed (when comparing it=
=20
to NV12). There is no uni-planar NV12/NV21. See also:
https://wiki.videolan.org/YUV#NV12.2FNV21


>> First, NV12 format having just one buffer(Y plane and CbCr plane use=
 a
>> same buffer but differ their start index.)
>=20
> So it is called packed YUV format and drm_fourcc header defines these
> formats as follows,
>=20
> DRM_FORMAT_YUYV
> DRM_FORMAT_YVYU
> DRM_FORMAT_UYVY
> DRM_FORMAT_VYUY
> DRM_FORMAT_AYUV
I'd like to know if any other formats except for NV12/NV21 are really=20
supported by the video processor? Because I don't see any indication fo=
r=20
that. It's just NV12/NV21 and the tiled variants, which are there to=20
make it easier to handle data from the MFC block.


>> Second, NV12 format having split two buffers(one is for Y plane, oth=
er
>> is for CbCr plane)
>=20
> All NVXX formats should be considered only for separated two buffers.
Does is even make any difference for the VP if luma and chroma are in=20
different buffers or in a single one, just with an offset between=20
luma/chroma? I think not, because the VP just gets a dma_addr for both=20
and then fetches data from that position.


>> Current mixer driver considers only second NV12 format, we can know =
it
>> from following comment in mixer driver.
>>=20
>> /* TODO: single buffer format NV12, NV21 */
>=20
> So, it seems like wrong comment. Until now, it seems that we have bee=
n
> calling the packed YUV format as NVXX format and calling the NVXX=20
> format
> as NVXXM. And Exynos SoC have even NVXXMT whose format consists into
> many macro blocks and which has separated two buffers.
I think getting just regular (un-tiled) NV12/NV21 working should come=20
first, then we can think about how to handle the tiled formats (probabl=
y=20
with the newly introduced fb modifiers).

I've patched the mixer so that it passes valid pointers for luma/chroma=
=20
but I still get a crash (sysmmu) sooner or later. So there seems to be=20
more issues than just this pixelformat/buffercount one.



> We would need to make Exynos drivers suitable to fourcc.
>=20
> Thanks,
> Inki Dae


With best wishes,
Tobias
