From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 0/7] s5p-fimc driver fixes for 3.0
Date: Thu, 02 Jun 2011 12:11:57 +0200
Message-ID: <1307009524-1208-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:35173 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933033Ab1FBKMO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 2 Jun 2011 06:12:14 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: m.szyprowski@samsung.com, kyungmin.park@samsung.com, s.nawrocki@samsung.com, sw0312.kim@samsung.com, riverful.kim@samsung.com

Hello,

the following are a few bugfix patches for s5p-fimc driver.
Except the kernel-doc comments corrections, debug trace cleanup
and the copyright update they fix the buffer allocation issue and 
possible memory leak on error path.

 drivers/media/video/s5p-fimc/fimc-capture.c |   21 ++----------------
 drivers/media/video/s5p-fimc/fimc-core.c    |   28 +++++++------------------
 drivers/media/video/s5p-fimc/fimc-core.h    |   29 ++++++++++++--------------
 3 files changed, 24 insertions(+), 54 deletions(-)

Regards,
--
Sylwester Nawrocki
Samsung Poland R&D Center
