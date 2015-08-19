From: Jerome Glisse <jglisse@redhat.com>
Subject: Re: drm/exynos: g2d userptr memory corruption
Date: Wed, 19 Aug 2015 10:08:38 -0400
Message-ID: <20150819140838.GA3276@redhat.com>
References: <55D08691.3040405@math.uni-bielefeld.de>
 <1439807175.3050.30.camel@pengutronix.de>
 <55D200A6.4070304@gmx.net>
 <55D48A68.5090009@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:44886 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753997AbbHSOIm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 19 Aug 2015 10:08:42 -0400
Content-Disposition: inline
In-Reply-To: <55D48A68.5090009@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Cc: Tobias Jakobi <liquid.acid@gmx.net>, Lucas Stach <l.stach@pengutronix.de>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Inki Dae <inki.dae@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, ML dri-devel <dri-devel@lists.freedesktop.org>

On Wed, Aug 19, 2015 at 03:53:44PM +0200, Tobias Jakobi wrote:
> Adding J=E9r=F4me to Cc. I think he looked the userptr code before, s=
o maybe
> he has some idea what is going wrong here.
>=20
> I also had a look at the code, but my knowledge about the DMA API is
> almost nonexistant. However I can see that before doing any DMA via t=
he
> G2D on the buffer the code calls dma_map() on it, and also unmaps it
> when the commandlist is finished.
>=20
>=20
> With best wishes,
> Tobias
>=20
>=20
> Tobias Jakobi wrote:
> > Thanks Lucas for the explanation!
> >=20
> >=20
> > Lucas Stach wrote:
> >> Hi Tobias,
> >>
> >> Am Sonntag, den 16.08.2015, 14:48 +0200 schrieb Tobias Jakobi:
> >>> Hello,
> >>>
> >>> some time ago I checked whether I could use the userptr functiona=
lity to
> >>> do zero-copy from userspace allocated buffers via the G2D. This d=
idn't
> >>> work out so well, so kinda put this to the bottom of my TODO list=
=2E
> >>>
> >>> Now that IOMMU support has landed and Jan Kara has rewrote page p=
inning
> >>> using frame vectors (see [1]) I gave userptr another try.
> >>>
> >>> The results are much better. I'm not experiencing any kernel lock=
ups or
> >>> sysmmu pagefaults anymore. However the image now suffers from vis=
ual
> >>> artifacts. These images show the nature of the artifacts:
> >>> http://i.imgur.com/nzT6g3Y.jpg
> >>> http://i.imgur.com/wkuYI6X.jpg
> >>>
> >>> The corruption always manifests itself in these pixel lines of fi=
xed
> >>> size and wrong color.
> >>>
> >>> I have written a testcase as part of libdrm for this issue:
> >>> https://github.com/tobiasjakobi/libdrm/commit/db8bf6844436598251f=
67a71fc334b929bfb2b71
> >>>
> >>> It allocates N (N an even number) buffers which are aligned to th=
e
> >>> system pagesize. Then it does this each iteration:
> >>> 1) Fill the first N/2 buffers with random data
> >>> 2) Copy the first half to the second half of the buffers
> >>> 3) memcmp() first and second half (verification pass)
> >>>
> >>> Usually this verification already fails on the first iteration. A=
n
> >>> interesting observation is that increasing (!) the buffer size (s=
o the
> >>> amount of pixels that have to copied per buffer grows) makes this=
 issue
> >>> less likely to happen.
> >>>
> >>> With the default 512x512 buffers however it happens, like I said =
above,
> >>> almost immediately.
> >>>
> >> This is obviously a cache flush missing. The memory you get from
> >> userspace is normal cached memory, so to make it visible to the GP=
U you
> >> need to flush parts of the cache out to main memory.
> >>
> >> The corruption you are seeing is just unflushed cachelines. This a=
lso
> >> explains why increasing the buffer size helps: the more memory the=
 CPU
> >> touches the more cachelines will be flushed out to be replaced wit=
h new
> >> data.
> > I should point out that the snapshots I uploaded were done with a
> > different setup. There only the source memory of the G2D operation =
is a
> > userspace allocated buffer. The destination is a GEM buffer allocat=
ed
> > through libdrm, which is then used as framebuffer. So the issue alr=
eady
> > appears when just the source is userspace allocated.
> >=20

This is still consistent with cachelines issue. Is your GPU & IOMMU cac=
he
coherent with the CPU ? If not then it means you need to cache flush th=
e
buffer before you use it with the GPU. The dma API provide few helpers =
for
that.

Cheers,
J=E9r=F4me
