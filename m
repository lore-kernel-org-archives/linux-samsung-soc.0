From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [RFC/PATCH v4 0/4] Multi Format Codec 5.0 driver for S5PC110 SoC
Date: Fri, 10 Dec 2010 12:40:03 +0900
Message-ID: <028601cb981b$f04035f0$d0c0a1d0$%kim@samsung.com>
References: <1291901723-20361-1-git-send-email-k.debski@samsung.com>
 <026901cb9812$8e28c160$aa7a4420$%kim@samsung.com>
 <AANLkTikP6V47pcvJFyWS9gZHOG90qXDyU4BnQKLWgiJH@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-media-owner@vger.kernel.org>
In-reply-to: <AANLkTikP6V47pcvJFyWS9gZHOG90qXDyU4BnQKLWgiJH@mail.gmail.com>
Content-language: ko
Sender: linux-media-owner@vger.kernel.org
To: 'Kyungmin Park' <kyungmin.park@samsung.com>
Cc: 'Kamil Debski' <k.debski@samsung.com>, linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org, m.szyprowski@samsung.com, pawel@osciak.com, jaeryul.oh@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

Kyungmin Park wrote:
>=20
> On Fri, Dec 10, 2010 at 11:32 AM, Kukjin Kim <kgene.kim@samsung.com>
wrote:
> > Kamil Debski wrote:
> >>
> >> Hello,
> >>
> >> Last week v3 of this driver has been posted. Since then the driver=
 was
> >> changed
> >> to use the newest videobuf2 version - v6. Two very long functions =
have
> > been
> >> split to make the code more readible. Minor changes include tidyin=
g the
> >> comments and replacing remaining magic numbers with defines.
> >>
> >> I would be grateful for your comments. Original cover letter ant
detailed
> >> change
> >> log has been attached below.
> >>
> >> Best regards,
> >> Kamil Debski
> >>
> >> * Changelog:
> >>
> >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> =A0Changes since v3
> >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>
> >> 1) Update to the v6 videobuf2 API (here thanks go to Marek Szyprow=
ski)
> >> - s5p_mfc_buf_negotiate and s5p_mfc_buf_setup_plane functions
> >> have been merged
> >> - queue initialization has been adapted to the new API
> >> - use of the allocator memops has been changed, now there are sing=
le
> >> memops for all the allocator contexts
> >>
> >> 2) Split of the s5p_mfc_try_run and s5p_mfc_handle_frame_int funct=
ions
> >> - parts of the s5p_mfc_try_run function have been moved to separat=
e
> >> functions (s5p_mfc_get_new_ctx, s5p_mfc_run_dec_last_frames,
> >> s5p_mfc_run_dec_frame, s5p_mfc_run_get_inst_no, s5p_mfc_run_return=
_inst
> >> s5p_mfc_run_init_dec,s5p_mfc_run_init_dec_buffers)
> >> - s5p_mfc_handle_frame_int has been split to the following functio=
ns:
> >> s5p_mfc_handle_frame_all_extracted, s5p_mfc_handle_frame_new
> >> and s5p_mfc_handle_frame to handle different cases
> >>
> >> 3) Remove remaining magic numbers and tidy up comments
> >>
> >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> =A0Changes since v2
> >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>
> >> 1) Update to newest videobuf2 API
> >> This is the major change from v2. The videobuf2 API will hopefully=
 have
no
> >> more
> >> major API changes. Buffer initialization has been moved from
buf_prepare
> >> callback to buf_init to simplify the process. Locking mechanism ha=
s
been
> >> modified to the requirements of new videobuf2 version.
> >> 2) Code cleanup
> >> Removed more magic contants and replaced them with appropriate def=
ines.
> >> Changed
> >> code to use unlocked_ioctl instead of ioctl in v4l2 file ops.
> >> 3) Allocators
> >> All internal buffer allocations are done using the selected vb2
allocator,
> >> instead of using CMA functions directly.
> >>
> >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> =A0Changes since v1
> >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>
> >> 1) Cleanup accoridng to Peter Oh suggestions on the mailing list
(Thanks).
> >>
> >> * Original cover letter:
> >>
> >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> =A0Introduction
> >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>
> >> The purpose of this RFC is to discuss the driver for a hw video co=
dec
> >> embedded in the new Samusng's SoCs. Multi Format Codec 5.0 is able=
 to
> >> handle video decoding of in a range of formats.
> >>
> >> So far no hardware codec was supported in V4L2 and this would be t=
he
> >> first one. I guess there are more similar device that would benefi=
t
from
> >> a V4L2 unified interface. I suggest a separate control class for c=
odec
> >> devices - V4L2_CTRL_CLASS_CODEC.
> >>
> >> Internally the driver uses videobuf2 framework and CMA memory
allocator.
> >> I am aware that those have not yet been merged, but I wanted to st=
art
> >> discussion about the driver earlier so it could be merged sooner. =
The
> >> driver posted here is the initial version, so I suppose it will re=
quire
> >> more work.
> >>
> >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> =A0Device interface
> >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>
> >> The driver principle is based on the idea of memory-to-memory devi=
ces:
> >> it provides a single video node and each opened file handle gets i=
ts
own
> >> private context with separate buffer queues. Each context consist =
of 2
> >> buffer queues: OUTPUT (for source buffers, i.e. encoded video fram=
es)
> >> and CAPTURE (for destination buffers, i.e. decoded raw video frame=
s).
> >> The process of decoding video data from stream is a bit more
complicated
> >> than typical memory-to-memory processing, that's why the m2m frame=
work
> >> is not directly used (it is too limited for this case). The main r=
eason
> >> for this is the fact that the CAPTURE buffers can be dequeued in a
> >> different order than they queued. The hw block decides which buffe=
r has
> >> been completely processed. This is due to the structure of most
> >> compressed video streams - use of B frames causes that decoding an=
d
> >> display order may be different.
> >>
> >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> >> =A0Decoding initialization path
> >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> >>
> >> First the OUTPUT queue is initialized. With S_FMT the application
> >> chooses which video format to decode and what size should be the i=
nput
> >> buffer. Fourcc values have been defined for different codecs e.g.
> >> V4L2_PIX_FMT_H264 for h264. Then the OUTPUT buffers are requested =
and
> >> mmaped. The stream header frame is loaded into the first buffer, q=
ueued
> >> and streaming is enabled. At this point the hardware is able to st=
art
> >> processing the stream header and afterwards it will have informati=
on
> >> about the video dimensions and the size of the buffers with raw vi=
deo
> >> data.
> >>
> >> The next step is setting up the CAPTURE queue and buffers. The wid=
th,
> >> height, buffer size and minimum number of buffers can be read with
G_FMT
> >> call. The application can request more output buffer if necessary.
After
> >> requesting and mmaping buffers the device is ready to decode video
> >> stream.
> >>
> >> The stream frames (ES frames) are written to the OUTPUT buffers, a=
nd
> >> decoded video frames can be read from the CAPTURE buffers. When no=
 more
> >> source frames are present a single buffer with bytesused set to 0
should
> >> be queued. This will inform the driver that processing should be
> >> finished and it can dequeue all video frames that are still left. =
The
> >> number of such frames is dependent on the stream and its internal
> >> structure (how many frames had to be kept as reference frames for
> >> decoding, etc).
> >>
> >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> =A0Usage summary
> >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>
> >> This is a step by step summary of the video decoding (from user
> >> application point of view, with 2 treads and blocking api):
> >>
> >> 01. S_FMT(OUTPUT, V4L2_PIX_FMT_H264, ...)
> >> 02. REQ_BUFS(OUTPUT, n)
> >> 03. for i=3D1..n MMAP(OUTPUT, i)
> >> 04. put stream header to buffer #1
> >> 05. QBUF(OUTPUT, #1)
> >> 06. STREAM_ON(OUTPUT)
> >> 07. G_FMT(CAPTURE)
> >> 08. REQ_BUFS(CAPTURE, m)
> >> 09. for j=3D1..m MMAP(CAPTURE, j)
> >> 10. for j=3D1..m QBUF(CAPTURE, #j)
> >> 11. STREAM_ON(CAPTURE)
> >>
> >> display thread:
> >> 12. DQBUF(CAPTURE) -> got decoded video data in buffer #j
> >> 13. display buffer #j
> >> 14. QBUF(CAPTURE, #j)
> >> 15. goto 12
> >>
> >> parser thread:
> >> 16. put next ES frame to buffer #i
> >> 17. QBUF(OUTPUT, #i)
> >> 18. DQBUF(OUTPUT) -> get next empty buffer #i 19. goto 16
> >>
> >> ...
> >>
> >> Similar usage sequence can be achieved with single threaded applic=
ation
> >> and non-blocking api with poll() call.
> >>
> >> Branch with MFC, CMA and videobuf2 will be soon available at
> >> http://git.infradead.org/users/kmpark/linux-2.6-
> >> samsung/shortlog/refs/heads/vb2-mfc-fimc
> >> This tree is based on 2.6.37 rc4.
> >>
> >> Please have a look at the code and the idea of how to introduce co=
dec
> >> devices to V4L2. Comments will be very much appreciated.
> >>
> >> Patch summary:
> >>
> >> Kamil Debski (4):
> >> =A0 Changes in include/linux/videodev2.h for MFC
> >> =A0 MFC: Add MFC 5.1 driver to plat-s5p, mach-s5pv210 and mach-s5p=
v210
> >> =A0 MFC: Added MFC 5.1 V4L2 driver
> >> =A0 s5pv210: Enable MFC on Goni
> >>
> >> =A0arch/arm/mach-s5pv210/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 | =A0 =A01 +
> >> =A0arch/arm/mach-s5pv210/clock.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 | =A0 =A06 +
> >> =A0arch/arm/mach-s5pv210/include/mach/map.h =A0 =A0 =A0 =A0| =A0 =A0=
4 +
> >> =A0arch/arm/mach-s5pv210/mach-goni.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 |=
 =A0 =A01 +
> >> =A0arch/arm/plat-s5p/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 | =A0 =A05 +
> >> =A0arch/arm/plat-s5p/Makefile =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0| =A0 =A01 +
> >> =A0arch/arm/plat-s5p/dev-mfc5.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0| =A0 37 +
> >> =A0arch/arm/plat-samsung/include/plat/devs.h =A0 =A0 =A0 | =A0 =A0=
2 +
> >> =A0drivers/media/video/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 | =A0 =A08 +
> >> =A0drivers/media/video/Makefile =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0| =A0 =A01 +
> >> =A0drivers/media/video/s5p-mfc/Makefile =A0 =A0 =A0 =A0 =A0 =A0| =A0=
 =A03 +
> >> =A0drivers/media/video/s5p-mfc/regs-mfc5.h =A0 =A0 =A0 =A0 | =A033=
5 ++++
> >> =A0drivers/media/video/s5p-mfc/s5p_mfc.c =A0 =A0 =A0 =A0 =A0 | 203=
1
> >> +++++++++++++++++++++++
> >> =A0drivers/media/video/s5p-mfc/s5p_mfc_common.h =A0 =A0| =A0222 ++=
+
> >> =A0drivers/media/video/s5p-mfc/s5p_mfc_ctrls.h =A0 =A0 | =A0173 ++
> >> =A0drivers/media/video/s5p-mfc/s5p_mfc_debug.h =A0 =A0 | =A0 47 +
> >> =A0drivers/media/video/s5p-mfc/s5p_mfc_intr.c =A0 =A0 =A0| =A0 92 =
+
> >> =A0drivers/media/video/s5p-mfc/s5p_mfc_intr.h =A0 =A0 =A0| =A0 26 =
+
> >> =A0drivers/media/video/s5p-mfc/s5p_mfc_memory.h =A0 =A0| =A0 43 +
> >> =A0drivers/media/video/s5p-mfc/s5p_mfc_opr.c =A0 =A0 =A0 | =A0870 =
++++++++++
> >> =A0drivers/media/video/s5p-mfc/s5p_mfc_opr.h =A0 =A0 =A0 | =A0131 =
++
> >> =A0include/linux/videodev2.h =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 | =A0 48 +
> >> =A025 files changed, 4136 insertions(+), 1 deletions(-)
> >> =A0create mode 100644 arch/arm/plat-s5p/dev-mfc5.c
> >> =A0create mode 100644 drivers/media/video/s5p-mfc/Makefile
> >> =A0create mode 100644 drivers/media/video/s5p-mfc/regs-mfc5.h
> >> =A0create mode 100644 drivers/media/video/s5p-mfc/s5p_mfc.c
> >> =A0create mode 100644 drivers/media/video/s5p-mfc/s5p_mfc_common.h
> >> =A0create mode 100644 drivers/media/video/s5p-mfc/s5p_mfc_ctrls.h
> >> =A0create mode 100644 drivers/media/video/s5p-mfc/s5p_mfc_debug.h
> >> =A0create mode 100644 drivers/media/video/s5p-mfc/s5p_mfc_intr.c
> >> =A0create mode 100644 drivers/media/video/s5p-mfc/s5p_mfc_intr.h
> >> =A0create mode 100644 drivers/media/video/s5p-mfc/s5p_mfc_memory.h
> >> =A0create mode 100644 drivers/media/video/s5p-mfc/s5p_mfc_opr.c
> >> =A0create mode 100644 drivers/media/video/s5p-mfc/s5p_mfc_opr.h
> >>
> >
> > Hi Kamil,
> >
> > I think, should be added my e-mail in Cc...
>=20
> No need to cc all, only machine specific only.
> and I hope minimal modification at machine specific and move to media
> if possible.
>=20
Should be reviewed proper maintainer even though it is small changes.
Really, I don't want to argue to you about my maintaining ship...

And I have a wondering about your sign.
Did you really check this patch before Kamil's submitting?
Unfortunately, I don't think so...

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
