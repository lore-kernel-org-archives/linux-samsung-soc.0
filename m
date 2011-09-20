From: Ajay Kumar <ajaykumar.rs@samsung.com>
Subject: [PATCH 0/3] FB: Add window positioning support
Date: Tue, 20 Sep 2011 11:30:38 -0400
Message-ID: <1316532641-2657-1-git-send-email-ajaykumar.rs@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:57311 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754744Ab1ITJ2w (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 Sep 2011 05:28:52 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: FlorianSchandinat@gmx.de, linux-samsung-soc@vger.kernel.org, linux-fbdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: lethal@linux-sh.org, jg1.han@samsung.com, m.szyprowski@samsung.com, kgene.kim@samsung.com, ben-linux@fluff.org, banajit.g@samsung.com

This patchset adds support for positioning the overlay windows on the LCD.

These patches are based on the discussion about adding features to fbdev at:
http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg06292.html

To Florian:
  	include: fb: Add definiton for window positioning structure
  	video: s3c-fb: Modify s3c-fb driver to support window positioning

To Kukjin,
  	ARM: SAMSUNG: Embed window positioning data structure in s3c-fb plat
  		      data

 arch/arm/plat-samsung/include/plat/fb.h |    3 ++
 drivers/video/s3c-fb.c                  |   37 ++++++++++++++++++++++++++----
 include/linux/fb.h                      |    7 ++++++
 3 files changed, 42 insertions(+), 5 deletions(-)
