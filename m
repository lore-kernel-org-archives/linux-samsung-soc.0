From: Kamil Debski <k.debski@samsung.com>
Subject: RE: [RFC/PATCH v4 1/4] Changes in include/linux/videodev2.h for MFC 5.1
Date: Fri, 10 Dec 2010 11:10:37 +0100
Message-ID: <001201cb9852$820d48c0$8627da40$%debski@samsung.com>
References: <1291901723-20361-1-git-send-email-k.debski@samsung.com>
 <1291901723-20361-2-git-send-email-k.debski@samsung.com>
 <00e901cb981a$d3430eb0$79c92c10$%park@samsung.com>
 <4D01F0B6.8090800@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ks_c_5601-1987
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-media-owner@vger.kernel.org>
In-reply-to: <4D01F0B6.8090800@redhat.com>
Content-language: en-gb
Sender: linux-media-owner@vger.kernel.org
To: 'Mauro Carvalho Chehab' <mchehab@redhat.com>, jtp.park@samsung.com
Cc: linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>, pawel@osciak.com, kyungmin.park@samsung.com, jaeryul.oh@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

=46rom: Mauro Carvalho Chehab [mailto:mchehab@redhat.com]
> Em 10-12-2010 01:32, =B9=DA=C1=A4=C5=C2 escreveu:
> > Hi, Kamil
> >
> > What do you think modification of codec class control ID for MFC as
> > following.
> > 1. Define the CID base for MFC
> > 2. Separate decode & encode controls
> > 3. Separate common & codec-specific controls
> >
> >> Add fourcc values for compressed video stream formats and
> >> V4L2_CTRL_CLASS_CODEC. Also adds controls used by MFC 5.1 driver.
>=20
> This is a very bad idea. As much as possible, controls should be
> generic enough
> to avoid us to have the same control provided  by two different
> hardware.
>=20
> The only case were a control should be per-driver, is when the contro=
l
> is for some
> very specific implementation detail on that hardware, that it is
> unlikely that other
> chipsets will implement it at the same way.
>=20

I agree with Mauro. The point of having a general class for codecs
(V4L2_CID_CODEC_CLASS) is reusing same controls for different hardware.
I think that most controls, maybe all, could be used by other hw codecs=
=2E

> (snip)

Best regards,
--=20
Kamil Debski
Linux Platform Group
Samsung Poland R&D Center
