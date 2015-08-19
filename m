From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: Re: drm/exynos: g2d userptr memory corruption
Date: Wed, 19 Aug 2015 15:53:44 +0200
Message-ID: <55D48A68.5090009@math.uni-bielefeld.de>
References: <55D08691.3040405@math.uni-bielefeld.de> <1439807175.3050.30.camel@pengutronix.de> <55D200A6.4070304@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:43775 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753643AbbHSNxu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 19 Aug 2015 09:53:50 -0400
In-Reply-To: <55D200A6.4070304@gmx.net>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <liquid.acid@gmx.net>, Lucas Stach <l.stach@pengutronix.de>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Inki Dae <inki.dae@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, ML dri-devel <dri-devel@lists.freedesktop.org>, Jerome Glisse <jglisse@redhat.com>

Adding J=C3=A9r=C3=B4me to Cc. I think he looked the userptr code befor=
e, so maybe
he has some idea what is going wrong here.

I also had a look at the code, but my knowledge about the DMA API is
almost nonexistant. However I can see that before doing any DMA via the
G2D on the buffer the code calls dma_map() on it, and also unmaps it
when the commandlist is finished.


With best wishes,
Tobias


Tobias Jakobi wrote:
> Thanks Lucas for the explanation!
>=20
>=20
> Lucas Stach wrote:
>> Hi Tobias,
>>
>> Am Sonntag, den 16.08.2015, 14:48 +0200 schrieb Tobias Jakobi:
>>> Hello,
>>>
>>> some time ago I checked whether I could use the userptr functionali=
ty to
>>> do zero-copy from userspace allocated buffers via the G2D. This did=
n't
>>> work out so well, so kinda put this to the bottom of my TODO list.
>>>
>>> Now that IOMMU support has landed and Jan Kara has rewrote page pin=
ning
>>> using frame vectors (see [1]) I gave userptr another try.
>>>
>>> The results are much better. I'm not experiencing any kernel lockup=
s or
>>> sysmmu pagefaults anymore. However the image now suffers from visua=
l
>>> artifacts. These images show the nature of the artifacts:
>>> http://i.imgur.com/nzT6g3Y.jpg
>>> http://i.imgur.com/wkuYI6X.jpg
>>>
>>> The corruption always manifests itself in these pixel lines of fixe=
d
>>> size and wrong color.
>>>
>>> I have written a testcase as part of libdrm for this issue:
>>> https://github.com/tobiasjakobi/libdrm/commit/db8bf6844436598251f67=
a71fc334b929bfb2b71
>>>
>>> It allocates N (N an even number) buffers which are aligned to the
>>> system pagesize. Then it does this each iteration:
>>> 1) Fill the first N/2 buffers with random data
>>> 2) Copy the first half to the second half of the buffers
>>> 3) memcmp() first and second half (verification pass)
>>>
>>> Usually this verification already fails on the first iteration. An
>>> interesting observation is that increasing (!) the buffer size (so =
the
>>> amount of pixels that have to copied per buffer grows) makes this i=
ssue
>>> less likely to happen.
>>>
>>> With the default 512x512 buffers however it happens, like I said ab=
ove,
>>> almost immediately.
>>>
>> This is obviously a cache flush missing. The memory you get from
>> userspace is normal cached memory, so to make it visible to the GPU =
you
>> need to flush parts of the cache out to main memory.
>>
>> The corruption you are seeing is just unflushed cachelines. This als=
o
>> explains why increasing the buffer size helps: the more memory the C=
PU
>> touches the more cachelines will be flushed out to be replaced with =
new
>> data.
> I should point out that the snapshots I uploaded were done with a
> different setup. There only the source memory of the G2D operation is=
 a
> userspace allocated buffer. The destination is a GEM buffer allocated
> through libdrm, which is then used as framebuffer. So the issue alrea=
dy
> appears when just the source is userspace allocated.
>=20
> What works however is an operation between GEM to GEM. However this
> might be related to the default allocation flags libdrm uses.
>=20
>=20
>=20
>> So you need to go and have a look at dma_map() and dma_sync_*_for_*(=
)
>> and friends.
>>
>> Regards,
>> Lucas
>>
>=20
>=20
> With best wishes,
> Tobias
>=20
>=20
