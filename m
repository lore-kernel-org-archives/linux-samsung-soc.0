From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [RFC/PATCH v4 0/4] Multi Format Codec 5.0 driver for S5PC110 SoC
Date: Fri, 10 Dec 2010 11:32:51 +0900
Message-ID: <026901cb9812$8e28c160$aa7a4420$%kim@samsung.com>
References: <1291901723-20361-1-git-send-email-k.debski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:59115 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751289Ab0LJCdI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 9 Dec 2010 21:33:08 -0500
In-reply-to: <1291901723-20361-1-git-send-email-k.debski@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kamil Debski' <k.debski@samsung.com>, linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: m.szyprowski@samsung.com, pawel@osciak.com, kyungmin.park@samsung.com, jaeryul.oh@samsung.com

Kamil Debski wrote:
> 
> Hello,
> 
> Last week v3 of this driver has been posted. Since then the driver was
> changed
> to use the newest videobuf2 version - v6. Two very long functions have
been
> split to make the code more readible. Minor changes include tidying the
> comments and replacing remaining magic numbers with defines.
> 
> I would be grateful for your comments. Original cover letter ant detailed
> change
> log has been attached below.
> 
> Best regards,
> Kamil Debski
> 
> * Changelog:
> 
> ==================
>  Changes since v3
> ==================
> 
> 1) Update to the v6 videobuf2 API (here thanks go to Marek Szyprowski)
> - s5p_mfc_buf_negotiate and s5p_mfc_buf_setup_plane functions
> have been merged
> - queue initialization has been adapted to the new API
> - use of the allocator memops has been changed, now there are single
> memops for all the allocator contexts
> 
> 2) Split of the s5p_mfc_try_run and s5p_mfc_handle_frame_int functions
> - parts of the s5p_mfc_try_run function have been moved to separate
> functions (s5p_mfc_get_new_ctx, s5p_mfc_run_dec_last_frames,
> s5p_mfc_run_dec_frame, s5p_mfc_run_get_inst_no, s5p_mfc_run_return_inst
> s5p_mfc_run_init_dec,s5p_mfc_run_init_dec_buffers)
> - s5p_mfc_handle_frame_int has been split to the following functions:
> s5p_mfc_handle_frame_all_extracted, s5p_mfc_handle_frame_new
> and s5p_mfc_handle_frame to handle different cases
> 
> 3) Remove remaining magic numbers and tidy up comments
> 
> ==================
>  Changes since v2
> ==================
> 
> 1) Update to newest videobuf2 API
> This is the major change from v2. The videobuf2 API will hopefully have no
> more
> major API changes. Buffer initialization has been moved from buf_prepare
> callback to buf_init to simplify the process. Locking mechanism has been
> modified to the requirements of new videobuf2 version.
> 2) Code cleanup
> Removed more magic contants and replaced them with appropriate defines.
> Changed
> code to use unlocked_ioctl instead of ioctl in v4l2 file ops.
> 3) Allocators
> All internal buffer allocations are done using the selected vb2 allocator,
> instead of using CMA functions directly.
> 
> ==================
>  Changes since v1
> ==================
> 
> 1) Cleanup accoridng to Peter Oh suggestions on the mailing list (Thanks).
> 
> * Original cover letter:
> 
> ==============
>  Introduction
> ==============
> 
> The purpose of this RFC is to discuss the driver for a hw video codec
> embedded in the new Samusng's SoCs. Multi Format Codec 5.0 is able to
> handle video decoding of in a range of formats.
> 
> So far no hardware codec was supported in V4L2 and this would be the
> first one. I guess there are more similar device that would benefit from
> a V4L2 unified interface. I suggest a separate control class for codec
> devices - V4L2_CTRL_CLASS_CODEC.
> 
> Internally the driver uses videobuf2 framework and CMA memory allocator.
> I am aware that those have not yet been merged, but I wanted to start
> discussion about the driver earlier so it could be merged sooner. The
> driver posted here is the initial version, so I suppose it will require
> more work.
> 
> ==================
>  Device interface
> ==================
> 
> The driver principle is based on the idea of memory-to-memory devices:
> it provides a single video node and each opened file handle gets its own
> private context with separate buffer queues. Each context consist of 2
> buffer queues: OUTPUT (for source buffers, i.e. encoded video frames)
> and CAPTURE (for destination buffers, i.e. decoded raw video frames).
> The process of decoding video data from stream is a bit more complicated
> than typical memory-to-memory processing, that's why the m2m framework
> is not directly used (it is too limited for this case). The main reason
> for this is the fact that the CAPTURE buffers can be dequeued in a
> different order than they queued. The hw block decides which buffer has
> been completely processed. This is due to the structure of most
> compressed video streams - use of B frames causes that decoding and
> display order may be different.
> 
> ==============================
>  Decoding initialization path
> ==============================
> 
> First the OUTPUT queue is initialized. With S_FMT the application
> chooses which video format to decode and what size should be the input
> buffer. Fourcc values have been defined for different codecs e.g.
> V4L2_PIX_FMT_H264 for h264. Then the OUTPUT buffers are requested and
> mmaped. The stream header frame is loaded into the first buffer, queued
> and streaming is enabled. At this point the hardware is able to start
> processing the stream header and afterwards it will have information
> about the video dimensions and the size of the buffers with raw video
> data.
> 
> The next step is setting up the CAPTURE queue and buffers. The width,
> height, buffer size and minimum number of buffers can be read with G_FMT
> call. The application can request more output buffer if necessary. After
> requesting and mmaping buffers the device is ready to decode video
> stream.
> 
> The stream frames (ES frames) are written to the OUTPUT buffers, and
> decoded video frames can be read from the CAPTURE buffers. When no more
> source frames are present a single buffer with bytesused set to 0 should
> be queued. This will inform the driver that processing should be
> finished and it can dequeue all video frames that are still left. The
> number of such frames is dependent on the stream and its internal
> structure (how many frames had to be kept as reference frames for
> decoding, etc).
> 
> ===============
>  Usage summary
> ===============
> 
> This is a step by step summary of the video decoding (from user
> application point of view, with 2 treads and blocking api):
> 
> 01. S_FMT(OUTPUT, V4L2_PIX_FMT_H264, ...)
> 02. REQ_BUFS(OUTPUT, n)
> 03. for i=1..n MMAP(OUTPUT, i)
> 04. put stream header to buffer #1
> 05. QBUF(OUTPUT, #1)
> 06. STREAM_ON(OUTPUT)
> 07. G_FMT(CAPTURE)
> 08. REQ_BUFS(CAPTURE, m)
> 09. for j=1..m MMAP(CAPTURE, j)
> 10. for j=1..m QBUF(CAPTURE, #j)
> 11. STREAM_ON(CAPTURE)
> 
> display thread:
> 12. DQBUF(CAPTURE) -> got decoded video data in buffer #j
> 13. display buffer #j
> 14. QBUF(CAPTURE, #j)
> 15. goto 12
> 
> parser thread:
> 16. put next ES frame to buffer #i
> 17. QBUF(OUTPUT, #i)
> 18. DQBUF(OUTPUT) -> get next empty buffer #i 19. goto 16
> 
> ...
> 
> Similar usage sequence can be achieved with single threaded application
> and non-blocking api with poll() call.
> 
> Branch with MFC, CMA and videobuf2 will be soon available at
> http://git.infradead.org/users/kmpark/linux-2.6-
> samsung/shortlog/refs/heads/vb2-mfc-fimc
> This tree is based on 2.6.37 rc4.
> 
> Please have a look at the code and the idea of how to introduce codec
> devices to V4L2. Comments will be very much appreciated.
> 
> Patch summary:
> 
> Kamil Debski (4):
>   Changes in include/linux/videodev2.h for MFC
>   MFC: Add MFC 5.1 driver to plat-s5p, mach-s5pv210 and mach-s5pv210
>   MFC: Added MFC 5.1 V4L2 driver
>   s5pv210: Enable MFC on Goni
> 
>  arch/arm/mach-s5pv210/Kconfig                   |    1 +
>  arch/arm/mach-s5pv210/clock.c                   |    6 +
>  arch/arm/mach-s5pv210/include/mach/map.h        |    4 +
>  arch/arm/mach-s5pv210/mach-goni.c               |    1 +
>  arch/arm/plat-s5p/Kconfig                       |    5 +
>  arch/arm/plat-s5p/Makefile                      |    1 +
>  arch/arm/plat-s5p/dev-mfc5.c                    |   37 +
>  arch/arm/plat-samsung/include/plat/devs.h       |    2 +
>  drivers/media/video/Kconfig                     |    8 +
>  drivers/media/video/Makefile                    |    1 +
>  drivers/media/video/s5p-mfc/Makefile            |    3 +
>  drivers/media/video/s5p-mfc/regs-mfc5.h         |  335 ++++
>  drivers/media/video/s5p-mfc/s5p_mfc.c           | 2031
> +++++++++++++++++++++++
>  drivers/media/video/s5p-mfc/s5p_mfc_common.h    |  222 +++
>  drivers/media/video/s5p-mfc/s5p_mfc_ctrls.h     |  173 ++
>  drivers/media/video/s5p-mfc/s5p_mfc_debug.h     |   47 +
>  drivers/media/video/s5p-mfc/s5p_mfc_intr.c      |   92 +
>  drivers/media/video/s5p-mfc/s5p_mfc_intr.h      |   26 +
>  drivers/media/video/s5p-mfc/s5p_mfc_memory.h    |   43 +
>  drivers/media/video/s5p-mfc/s5p_mfc_opr.c       |  870 ++++++++++
>  drivers/media/video/s5p-mfc/s5p_mfc_opr.h       |  131 ++
>  include/linux/videodev2.h                       |   48 +
>  25 files changed, 4136 insertions(+), 1 deletions(-)
>  create mode 100644 arch/arm/plat-s5p/dev-mfc5.c
>  create mode 100644 drivers/media/video/s5p-mfc/Makefile
>  create mode 100644 drivers/media/video/s5p-mfc/regs-mfc5.h
>  create mode 100644 drivers/media/video/s5p-mfc/s5p_mfc.c
>  create mode 100644 drivers/media/video/s5p-mfc/s5p_mfc_common.h
>  create mode 100644 drivers/media/video/s5p-mfc/s5p_mfc_ctrls.h
>  create mode 100644 drivers/media/video/s5p-mfc/s5p_mfc_debug.h
>  create mode 100644 drivers/media/video/s5p-mfc/s5p_mfc_intr.c
>  create mode 100644 drivers/media/video/s5p-mfc/s5p_mfc_intr.h
>  create mode 100644 drivers/media/video/s5p-mfc/s5p_mfc_memory.h
>  create mode 100644 drivers/media/video/s5p-mfc/s5p_mfc_opr.c
>  create mode 100644 drivers/media/video/s5p-mfc/s5p_mfc_opr.h
> 

Hi Kamil,

I think, should be added my e-mail in Cc...

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
