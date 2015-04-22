From: Inki Dae <inki.dae@samsung.com>
Subject: Re: drm/exynos: getting the video processor to work
Date: Wed, 22 Apr 2015 15:02:51 +0900
Message-ID: <5537398B.3080607@samsung.com>
References: <55356FEE.7030109@math.uni-bielefeld.de>
 <5536FF93.6000107@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:29776 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756049AbbDVGCx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 22 Apr 2015 02:02:53 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NN700M2C24RWRA0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 22 Apr 2015 15:02:52 +0900 (KST)
In-reply-to: <5536FF93.6000107@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Joonyoung Shim <jy0922.shim@samsung.com>
Cc: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

On 2015=EB=85=84 04=EC=9B=94 22=EC=9D=BC 10:55, Joonyoung Shim wrote:
> Hi Tobias,
>=20
> On 04/21/2015 06:30 AM, Tobias Jakobi wrote:
>> Hello,
>>
>> I've spend some time on figuring out how to use the VP on my Exynos4=
412.
>> I noticed that currently it seems to be pretty broken (I've put a fu=
ll
>> crashlog with drm.debug=3D0xff at the end).
>>
>> As far as I can see, the problem stems from conflicting buffer count=
s in
>> the driver.
>>
>> Let's start with vp_video_buffer(), there buf_num gets set to '2' wh=
en
>> DRM_FORMAT_NV12 is encountered as pixelformat. Which results in the =
VP
>> reading luma data from the plane's dma_addr[0] and chroma from dma_a=
ddr[1].
>>
>> But dma_addr[1] is never correctly set. It should be set by
>> exynos_check_plane(), but the loop only does one iteration since
>> exynos_drm_fb_get_buf_cnt() returns 1.
>>
>> Which is due to special case handling in
>> exynos_drm_format_num_buffers(). At least for the buffers that libdr=
m's
>> modetest creates this case handling triggers and reduces buffer coun=
t to
>> '1'.
>>
>=20
> This is just pixel format issue and mixer driver is not completed abo=
ut
> that. The exynos mixer can support two NV12 formats.

To clarify it, NV12 and other NVXX formats have only two planes.

>=20
> First, NV12 format having just one buffer(Y plane and CbCr plane use =
a
> same buffer but differ their start index.)

So it is called packed YUV format and drm_fourcc header defines these
formats as follows,

DRM_FORMAT_YUYV
DRM_FORMAT_YVYU
DRM_FORMAT_UYVY
DRM_FORMAT_VYUY
DRM_FORMAT_AYUV

> Second, NV12 format having split two buffers(one is for Y plane, othe=
r
> is for CbCr plane)

All NVXX formats should be considered only for separated two buffers.

>=20
> Current mixer driver considers only second NV12 format, we can know i=
t
> from following comment in mixer driver.
>=20
> /* TODO: single buffer format NV12, NV21 */

So, it seems like wrong comment. Until now, it seems that we have been
calling the packed YUV format as NVXX format and calling the NVXX forma=
t
as NVXXM. And Exynos SoC have even NVXXMT whose format consists into
many macro blocks and which has separated two buffers.

We would need to make Exynos drivers suitable to fourcc.

Thanks,
Inki Dae
