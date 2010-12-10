From: Kyungmin Park <kyungmin.park@samsung.com>
Subject: Re: [RFC/PATCH v4 0/4] Multi Format Codec 5.0 driver for S5PC110 SoC
Date: Fri, 10 Dec 2010 11:40:44 +0900
Message-ID: <AANLkTikP6V47pcvJFyWS9gZHOG90qXDyU4BnQKLWgiJH@mail.gmail.com>
References: <1291901723-20361-1-git-send-email-k.debski@samsung.com>
	<026901cb9812$8e28c160$aa7a4420$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <026901cb9812$8e28c160$aa7a4420$%kim@samsung.com>
Sender: linux-media-owner@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Kamil Debski <k.debski@samsung.com>, linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org, m.szyprowski@samsung.com, pawel@osciak.com, jaeryul.oh@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Dec 10, 2010 at 11:32 AM, Kukjin Kim <kgene.kim@samsung.com> wr=
ote:
> Kamil Debski wrote:
>>
>> Hello,
>>
>> Last week v3 of this driver has been posted. Since then the driver w=
as
>> changed
>> to use the newest videobuf2 version - v6. Two very long functions ha=
ve
> been
>> split to make the code more readible. Minor changes include tidying =
the
>> comments and replacing remaining magic numbers with defines.
>>
>> I would be grateful for your comments. Original cover letter ant det=
ailed
>> change
>> log has been attached below.
>>
>> Best regards,
>> Kamil Debski
>>
>> * Changelog:
>>
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> =A0Changes since v3
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>
>> 1) Update to the v6 videobuf2 API (here thanks go to Marek Szyprowsk=
i)
>> - s5p_mfc_buf_negotiate and s5p_mfc_buf_setup_plane functions
>> have been merged
>> - queue initialization has been adapted to the new API
>> - use of the allocator memops has been changed, now there are single
>> memops for all the allocator contexts
>>
>> 2) Split of the s5p_mfc_try_run and s5p_mfc_handle_frame_int functio=
ns
>> - parts of the s5p_mfc_try_run function have been moved to separate
>> functions (s5p_mfc_get_new_ctx, s5p_mfc_run_dec_last_frames,
>> s5p_mfc_run_dec_frame, s5p_mfc_run_get_inst_no, s5p_mfc_run_return_i=
nst
>> s5p_mfc_run_init_dec,s5p_mfc_run_init_dec_buffers)
>> - s5p_mfc_handle_frame_int has been split to the following functions=
:
>> s5p_mfc_handle_frame_all_extracted, s5p_mfc_handle_frame_new
>> and s5p_mfc_handle_frame to handle different cases
>>
>> 3) Remove remaining magic numbers and tidy up comments
>>
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> =A0Changes since v2
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>
>> 1) Update to newest videobuf2 API
>> This is the major change from v2. The videobuf2 API will hopefully h=
ave no
>> more
>> major API changes. Buffer initialization has been moved from buf_pre=
pare
>> callback to buf_init to simplify the process. Locking mechanism has =
been
>> modified to the requirements of new videobuf2 version.
>> 2) Code cleanup
>> Removed more magic contants and replaced them with appropriate defin=
es.
>> Changed
>> code to use unlocked_ioctl instead of ioctl in v4l2 file ops.
>> 3) Allocators
>> All internal buffer allocations are done using the selected vb2 allo=
cator,
>> instead of using CMA functions directly.
>>
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> =A0Changes since v1
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>
>> 1) Cleanup accoridng to Peter Oh suggestions on the mailing list (Th=
anks).
>>
>> * Original cover letter:
>>
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> =A0Introduction
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>
>> The purpose of this RFC is to discuss the driver for a hw video code=
c
>> embedded in the new Samusng's SoCs. Multi Format Codec 5.0 is able t=
o
>> handle video decoding of in a range of formats.
>>
>> So far no hardware codec was supported in V4L2 and this would be the
>> first one. I guess there are more similar device that would benefit =
from
>> a V4L2 unified interface. I suggest a separate control class for cod=
ec
>> devices - V4L2_CTRL_CLASS_CODEC.
>>
>> Internally the driver uses videobuf2 framework and CMA memory alloca=
tor.
>> I am aware that those have not yet been merged, but I wanted to star=
t
>> discussion about the driver earlier so it could be merged sooner. Th=
e
>> driver posted here is the initial version, so I suppose it will requ=
ire
>> more work.
>>
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> =A0Device interface
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>
>> The driver principle is based on the idea of memory-to-memory device=
s:
>> it provides a single video node and each opened file handle gets its=
 own
>> private context with separate buffer queues. Each context consist of=
 2
>> buffer queues: OUTPUT (for source buffers, i.e. encoded video frames=
)
>> and CAPTURE (for destination buffers, i.e. decoded raw video frames)=
=2E
>> The process of decoding video data from stream is a bit more complic=
ated
>> than typical memory-to-memory processing, that's why the m2m framewo=
rk
>> is not directly used (it is too limited for this case). The main rea=
son
>> for this is the fact that the CAPTURE buffers can be dequeued in a
>> different order than they queued. The hw block decides which buffer =
has
>> been completely processed. This is due to the structure of most
>> compressed video streams - use of B frames causes that decoding and
>> display order may be different.
>>
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
>> =A0Decoding initialization path
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
>>
>> First the OUTPUT queue is initialized. With S_FMT the application
>> chooses which video format to decode and what size should be the inp=
ut
>> buffer. Fourcc values have been defined for different codecs e.g.
>> V4L2_PIX_FMT_H264 for h264. Then the OUTPUT buffers are requested an=
d
>> mmaped. The stream header frame is loaded into the first buffer, que=
ued
>> and streaming is enabled. At this point the hardware is able to star=
t
>> processing the stream header and afterwards it will have information
>> about the video dimensions and the size of the buffers with raw vide=
o
>> data.
>>
>> The next step is setting up the CAPTURE queue and buffers. The width=
,
>> height, buffer size and minimum number of buffers can be read with G=
_FMT
>> call. The application can request more output buffer if necessary. A=
fter
>> requesting and mmaping buffers the device is ready to decode video
>> stream.
>>
>> The stream frames (ES frames) are written to the OUTPUT buffers, and
>> decoded video frames can be read from the CAPTURE buffers. When no m=
ore
>> source frames are present a single buffer with bytesused set to 0 sh=
ould
>> be queued. This will inform the driver that processing should be
>> finished and it can dequeue all video frames that are still left. Th=
e
>> number of such frames is dependent on the stream and its internal
>> structure (how many frames had to be kept as reference frames for
>> decoding, etc).
>>
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> =A0Usage summary
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>
>> This is a step by step summary of the video decoding (from user
>> application point of view, with 2 treads and blocking api):
>>
>> 01. S_FMT(OUTPUT, V4L2_PIX_FMT_H264, ...)
>> 02. REQ_BUFS(OUTPUT, n)
>> 03. for i=3D1..n MMAP(OUTPUT, i)
>> 04. put stream header to buffer #1
>> 05. QBUF(OUTPUT, #1)
>> 06. STREAM_ON(OUTPUT)
>> 07. G_FMT(CAPTURE)
>> 08. REQ_BUFS(CAPTURE, m)
>> 09. for j=3D1..m MMAP(CAPTURE, j)
>> 10. for j=3D1..m QBUF(CAPTURE, #j)
>> 11. STREAM_ON(CAPTURE)
>>
>> display thread:
>> 12. DQBUF(CAPTURE) -> got decoded video data in buffer #j
>> 13. display buffer #j
>> 14. QBUF(CAPTURE, #j)
>> 15. goto 12
>>
>> parser thread:
>> 16. put next ES frame to buffer #i
>> 17. QBUF(OUTPUT, #i)
>> 18. DQBUF(OUTPUT) -> get next empty buffer #i 19. goto 16
>>
>> ...
>>
>> Similar usage sequence can be achieved with single threaded applicat=
ion
>> and non-blocking api with poll() call.
>>
>> Branch with MFC, CMA and videobuf2 will be soon available at
>> http://git.infradead.org/users/kmpark/linux-2.6-
>> samsung/shortlog/refs/heads/vb2-mfc-fimc
>> This tree is based on 2.6.37 rc4.
>>
>> Please have a look at the code and the idea of how to introduce code=
c
>> devices to V4L2. Comments will be very much appreciated.
>>
>> Patch summary:
>>
>> Kamil Debski (4):
>> =A0 Changes in include/linux/videodev2.h for MFC
>> =A0 MFC: Add MFC 5.1 driver to plat-s5p, mach-s5pv210 and mach-s5pv2=
10
>> =A0 MFC: Added MFC 5.1 V4L2 driver
>> =A0 s5pv210: Enable MFC on Goni
>>
>> =A0arch/arm/mach-s5pv210/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 | =A0 =A01 +
>> =A0arch/arm/mach-s5pv210/clock.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 | =A0 =A06 +
>> =A0arch/arm/mach-s5pv210/include/mach/map.h =A0 =A0 =A0 =A0| =A0 =A0=
4 +
>> =A0arch/arm/mach-s5pv210/mach-goni.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0=
 =A01 +
>> =A0arch/arm/plat-s5p/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 | =A0 =A05 +
>> =A0arch/arm/plat-s5p/Makefile =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0| =A0 =A01 +
>> =A0arch/arm/plat-s5p/dev-mfc5.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0| =A0 37 +
>> =A0arch/arm/plat-samsung/include/plat/devs.h =A0 =A0 =A0 | =A0 =A02 =
+
>> =A0drivers/media/video/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 | =A0 =A08 +
>> =A0drivers/media/video/Makefile =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0| =A0 =A01 +
>> =A0drivers/media/video/s5p-mfc/Makefile =A0 =A0 =A0 =A0 =A0 =A0| =A0=
 =A03 +
>> =A0drivers/media/video/s5p-mfc/regs-mfc5.h =A0 =A0 =A0 =A0 | =A0335 =
++++
>> =A0drivers/media/video/s5p-mfc/s5p_mfc.c =A0 =A0 =A0 =A0 =A0 | 2031
>> +++++++++++++++++++++++
>> =A0drivers/media/video/s5p-mfc/s5p_mfc_common.h =A0 =A0| =A0222 +++
>> =A0drivers/media/video/s5p-mfc/s5p_mfc_ctrls.h =A0 =A0 | =A0173 ++
>> =A0drivers/media/video/s5p-mfc/s5p_mfc_debug.h =A0 =A0 | =A0 47 +
>> =A0drivers/media/video/s5p-mfc/s5p_mfc_intr.c =A0 =A0 =A0| =A0 92 +
>> =A0drivers/media/video/s5p-mfc/s5p_mfc_intr.h =A0 =A0 =A0| =A0 26 +
>> =A0drivers/media/video/s5p-mfc/s5p_mfc_memory.h =A0 =A0| =A0 43 +
>> =A0drivers/media/video/s5p-mfc/s5p_mfc_opr.c =A0 =A0 =A0 | =A0870 ++=
++++++++
>> =A0drivers/media/video/s5p-mfc/s5p_mfc_opr.h =A0 =A0 =A0 | =A0131 ++
>> =A0include/linux/videodev2.h =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 | =A0 48 +
>> =A025 files changed, 4136 insertions(+), 1 deletions(-)
>> =A0create mode 100644 arch/arm/plat-s5p/dev-mfc5.c
>> =A0create mode 100644 drivers/media/video/s5p-mfc/Makefile
>> =A0create mode 100644 drivers/media/video/s5p-mfc/regs-mfc5.h
>> =A0create mode 100644 drivers/media/video/s5p-mfc/s5p_mfc.c
>> =A0create mode 100644 drivers/media/video/s5p-mfc/s5p_mfc_common.h
>> =A0create mode 100644 drivers/media/video/s5p-mfc/s5p_mfc_ctrls.h
>> =A0create mode 100644 drivers/media/video/s5p-mfc/s5p_mfc_debug.h
>> =A0create mode 100644 drivers/media/video/s5p-mfc/s5p_mfc_intr.c
>> =A0create mode 100644 drivers/media/video/s5p-mfc/s5p_mfc_intr.h
>> =A0create mode 100644 drivers/media/video/s5p-mfc/s5p_mfc_memory.h
>> =A0create mode 100644 drivers/media/video/s5p-mfc/s5p_mfc_opr.c
>> =A0create mode 100644 drivers/media/video/s5p-mfc/s5p_mfc_opr.h
>>
>
> Hi Kamil,
>
> I think, should be added my e-mail in Cc...

No need to cc all, only machine specific only.
and I hope minimal modification at machine specific and move to media
if possible.

Thank you,
Kyungmin Park
