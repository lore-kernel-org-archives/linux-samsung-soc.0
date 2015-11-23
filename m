From: Hyungwon Hwang <human.hwang@samsung.com>
Subject: Re: [PATCH v2 00/13] drm/exynos: async G2D and g2d_move()
Date: Mon, 23 Nov 2015 11:35:53 +0900
Message-ID: <20151123113553.7861d6b3@hwh-ubuntu>
References: <1448218123-21292-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:56687 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752959AbbKWCf4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 22 Nov 2015 21:35:56 -0500
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NY802IUXXVULG00@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 23 Nov 2015 11:35:54 +0900 (KST)
In-reply-to: <1448218123-21292-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, human.hwang@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, emil.l.velikov@gmail.com, jy0922.shim@samsung.com, inki.dae@samsung.com

Hello Tobias,

I reviewed this whole patchset, and it looks good to me. Also I tested
it on my odroid u3, and all works fine. Thanks you for your effort.

Tested-by: Hyungwon Hwang <human.hwang@samsung.com>
Reviewed-by: Hyungwon Hwang <human.hwang@samsung.com>

BRs,
Hyungwon Hwang

On Sun, 22 Nov 2015 19:48:30 +0100
Tobias Jakobi <tjakobi@math.uni-bielefeld.de> wrote:

> Hello,
> 
> this series mostly touches G2D code. It introduces the following:
> 
> (1) drmHandleEvent2() is added to enable processing of vendor-specific
>     events. This will be used to expose asynchronous operation of the
>     G2D. The necessary kernel infrastructure is already there since
>     a lot of kernel versions. [This touches libdrm core code!]
> 
> (2) The necessary infrastructure to handle G2D events. This includes
>     adding g2d_config_event() and g2d_exec2() to the public API.
>     A test application is provided to ensure that everything works
>     as expected.
> 
> (3) A small performance test application which can be used to measure
>     the speed of solid color clear operations. Interesting for
>     benchmarking and plotting colorful graphs (e.g. through
>     Mathematica).
> 
> (4) g2d_move() which works similar to g2d_copy() but like the C
>     memmove() properly handles overlapping buffer copies.
>     Again a test application is present to check that this
>     indeed does what it should.
> 
> (5) Various small changes. A framebuffer colorformat fix for the
>     general G2D test application. Moving the currently unused
>     g2d_reset() to the public API. Adding a counterpart to
>     exynos_bo_map() to unmap buffers again.
> 
> (6) Last but not least a small bump of the Exynos version number.
> 
> Please review and let me know what I should change/improve.
> 
> 
> With best wishes,
> Tobias
> 
> P.S.: Most patches were submitted already some time ago but never
> made it upstream. So if something looks familiar, don't worry! ;)
> 
> Changes since v1:
> - Added wording changes suggested by Hyungwon Hwang.
> - Added binaries for new test applications to .gitignore.
> - Collected r-b and t-b tags.
> 
> Tobias Jakobi (13):
>   drm: Implement drmHandleEvent2()
>   exynos: Introduce exynos_handle_event()
>   tests/exynos: add fimg2d performance analysis
>   exynos/fimg2d: add g2d_config_event
>   exynos: fimg2d: add g2d_exec2
>   tests/exynos: add fimg2d event test
>   tests/exynos: use XRGB8888 for framebuffer
>   exynos: fimg2d: add g2d_set_direction
>   exynos/fimg2d: add g2d_move
>   tests/exynos: add test for g2d_move
>   exynos/fimg2d: add exynos_bo_unmap()
>   exynos/fimg2d: add g2d_reset() to public API
>   exynos: bump version number
> 
>  .gitignore                         |   2 +
>  exynos/exynos-symbol-check         |   5 +
>  exynos/exynos_drm.c                |  48 ++++++
>  exynos/exynos_drm.h                |  12 ++
>  exynos/exynos_drmif.h              |  27 +++
>  exynos/exynos_fimg2d.c             | 165 +++++++++++++++++--
>  exynos/exynos_fimg2d.h             |  49 ++++++
>  exynos/libdrm_exynos.pc.in         |   2 +-
>  tests/exynos/Makefile.am           |  26 ++-
>  tests/exynos/exynos_fimg2d_event.c | 326
> ++++++++++++++++++++++++++++++++++++
> tests/exynos/exynos_fimg2d_perf.c  | 327
> +++++++++++++++++++++++++++++++++++++
> tests/exynos/exynos_fimg2d_test.c  | 134 ++++++++++++++-
> xf86drm.h                          |  21 +++
> xf86drmMode.c                      |  10 +- 14 files changed, 1138
> insertions(+), 16 deletions(-) create mode 100644
> tests/exynos/exynos_fimg2d_event.c create mode 100644
> tests/exynos/exynos_fimg2d_perf.c
> 
