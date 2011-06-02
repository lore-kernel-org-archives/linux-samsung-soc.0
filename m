From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 2/7] s5p-fimc: Fix V4L2_PIX_FMT_RGB565X description
Date: Thu, 02 Jun 2011 12:11:59 +0200
Message-ID: <1307009524-1208-3-git-send-email-s.nawrocki@samsung.com>
References: <1307009524-1208-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:9512 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933329Ab1FBKN0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 2 Jun 2011 06:13:26 -0400
In-reply-to: <1307009524-1208-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: m.szyprowski@samsung.com, kyungmin.park@samsung.com, s.nawrocki@samsung.com, sw0312.kim@samsung.com, riverful.kim@samsung.com

Remove V4L2_MBUS_FMT_RGB565_2X8_BE media code entry as
camera interface supports only packed YUYV formats.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/media/video/s5p-fimc/fimc-core.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/drivers/media/video/s5p-fimc/fimc-core.c b/drivers/media/video/s5p-fimc/fimc-core.c
index dc91a85..f1c7119 100644
--- a/drivers/media/video/s5p-fimc/fimc-core.c
+++ b/drivers/media/video/s5p-fimc/fimc-core.c
@@ -42,7 +42,6 @@ static struct fimc_fmt fimc_formats[] = {
 		.color		= S5P_FIMC_RGB565,
 		.memplanes	= 1,
 		.colplanes	= 1,
-		.mbus_code	= V4L2_MBUS_FMT_RGB565_2X8_BE,
 		.flags		= FMT_FLAGS_M2M,
 	}, {
 		.name		= "BGR666",
-- 
1.7.5.2
