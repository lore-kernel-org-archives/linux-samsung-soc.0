From: Ajay Kumar <ajaykumar.rs@samsung.com>
Subject: [PATCH 0/2] video: s3c-fb: Add window positioning support
Date: Thu, 25 Aug 2011 15:51:55 -0400
Message-ID: <1314301917-9938-1-git-send-email-ajaykumar.rs@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:23826 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750846Ab1HYNyr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 25 Aug 2011 09:54:47 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-fbdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: FlorianSchandinat@gmx.de, lethal@linux-sh.org, jg1.han@samsung.com, m.szyprowski@samsung.com, ben-linux@fluff.org, banajit.g@samsung.com

These patches are created against "for-next" branch of Kukjin Kim's tree at:
git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git

This patch adds support for positioning of the FB windows on the LCD screen.

This patchset creates an ioctl and defines a data structure which are
specific to samsung SOCs, to hold the window position.

Just as a note, there are many drivers like mx3fb.c, au1200fb.c and OMAP
seem to be doing window/plane positioning in their driver code.
Is it possible to have this window positioning support at a common place?

For instance, we can have a common struture and ioctl number in 
include/linux/fb.h as below:

	#define FBIOPOS_OVERLAY_WIN    _IOW('F', 0x21, struct fb_overlay_win_pos)

	struct fb_overlay_win_pos {
		__u32 win_pos_x;  /* x-offset of window from LCD(0,0) */
		__u32 win_pos_y;  /* y-offset of window from LCD(0,0) */
	};

where LCD(0,0) means the first pixel of the LCD screen.
Individual drivers can have implementation for this ioctl.

To Kukjin Kim,
  [PATCH 1/2] ARM: SAMSUNG: Add Window Positioning Support for s3c-fb driver

To Paul Mundt, Florian Tobias Schandinat
  [PATCH 2/2] video: s3c-fb: Modify s3c-fb driver to support window positioning

 arch/arm/plat-samsung/include/plat/fb.h |   14 +++++++++++
 drivers/video/s3c-fb.c                  |   37 ++++++++++++++++++++++++++----
 2 files changed, 46 insertions(+), 5 deletions(-)
