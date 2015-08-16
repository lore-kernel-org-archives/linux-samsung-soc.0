From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: drm/exynos: g2d userptr memory corruption
Date: Sun, 16 Aug 2015 14:48:17 +0200
Message-ID: <55D08691.3040405@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:55151 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751198AbbHPMsY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 16 Aug 2015 08:48:24 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, dri-devel@lists.sourceforge.net, Inki Dae <inki.dae@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>

Hello,

some time ago I checked whether I could use the userptr functionality to
do zero-copy from userspace allocated buffers via the G2D. This didn't
work out so well, so kinda put this to the bottom of my TODO list.

Now that IOMMU support has landed and Jan Kara has rewrote page pinning
using frame vectors (see [1]) I gave userptr another try.

The results are much better. I'm not experiencing any kernel lockups or
sysmmu pagefaults anymore. However the image now suffers from visual
artifacts. These images show the nature of the artifacts:
http://i.imgur.com/nzT6g3Y.jpg
http://i.imgur.com/wkuYI6X.jpg

The corruption always manifests itself in these pixel lines of fixed
size and wrong color.

I have written a testcase as part of libdrm for this issue:
https://github.com/tobiasjakobi/libdrm/commit/db8bf6844436598251f67a71fc334b929bfb2b71

It allocates N (N an even number) buffers which are aligned to the
system pagesize. Then it does this each iteration:
1) Fill the first N/2 buffers with random data
2) Copy the first half to the second half of the buffers
3) memcmp() first and second half (verification pass)

Usually this verification already fails on the first iteration. An
interesting observation is that increasing (!) the buffer size (so the
amount of pixels that have to copied per buffer grows) makes this issue
less likely to happen.

With the default 512x512 buffers however it happens, like I said above,
almost immediately.

I first suspected that the clock rate of the G2D was too high (I
overclock the engine from 200MHz to 400MHz here), but even with the
default clock there is no change to the behaviour.

While looking at the issue I remember this discussion [2] so while ago.

Adding Marek to Cc since I guess that this could be related to the IOMMU
as well (some missing flushing?).


With best wishes,
Tobias


[1] http://www.spinics.net/lists/linux-samsung-soc/msg45931.html
[2] http://lists.freedesktop.org/archives/dri-devel/2014-July/062675.html
