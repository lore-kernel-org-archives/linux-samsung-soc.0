From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/1] ARM: SAMSUNG: Remove description corresponding to a deleted element
Date: Tue, 12 Jun 2012 11:00:59 +0530
Message-ID: <1339479059-18527-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:46137 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751954Ab2FLFmS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 12 Jun 2012 01:42:18 -0400
Received: by dady13 with SMTP id y13so6382715dad.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 11 Jun 2012 22:42:18 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, thomas.abraham@linaro.org, sachin.kamat@linaro.org, patches@linaro.org

Commit 3c582647a9f84affd5c86e89d548157c62f8d9ca removed the default_win
element from the structure, but the description was not removed.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/plat-samsung/include/plat/fb.h |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/arch/arm/plat-samsung/include/plat/fb.h b/arch/arm/plat-samsung/include/plat/fb.h
index 536002f..b885322 100644
--- a/arch/arm/plat-samsung/include/plat/fb.h
+++ b/arch/arm/plat-samsung/include/plat/fb.h
@@ -43,7 +43,6 @@ struct s3c_fb_pd_win {
  * @setup_gpio: Setup the external GPIO pins to the right state to transfer
  *		the data from the display system to the connected display
  *		device.
- * @default_win: default window layer number to be used for UI layer.
  * @vidcon0: The base vidcon0 values to control the panel data format.
  * @vidcon1: The base vidcon1 values to control the panel data output.
  * @vtiming: Video timing when connected to a RGB type panel.
-- 
1.7.4.1
