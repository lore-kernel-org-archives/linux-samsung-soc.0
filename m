From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: [PATCH 1/3] ARM: S5P: Set default rate of xusbxti clock
Date: Fri,  2 Dec 2011 12:08:16 +0530
Message-ID: <1322807898-14825-2-git-send-email-pankaj.dubey@samsung.com>
References: <1322807898-14825-1-git-send-email-pankaj.dubey@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:53148 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751728Ab1LBGkd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 2 Dec 2011 01:40:33 -0500
Received: by mail-iy0-f174.google.com with SMTP id e36so3699997iag.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 01 Dec 2011 22:40:33 -0800 (PST)
In-Reply-To: <1322807898-14825-1-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linaro-dev@lists.linaro.org
Cc: kgene.kim@samsung.com, pankaj.dubey@samsung.com

From: Pankaj <pankaj.dubey@samsung.com>

Initialize xusbxti clock's default value here.
So that code duplication in all other mach-board.c can be avoided.

Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
---
 arch/arm/plat-s5p/clock.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/arm/plat-s5p/clock.c b/arch/arm/plat-s5p/clock.c
index 5f84a3f..6fb9049 100644
--- a/arch/arm/plat-s5p/clock.c
+++ b/arch/arm/plat-s5p/clock.c
@@ -38,6 +38,7 @@ struct clk clk_ext_xtal_mux = {
 struct clk clk_xusbxti = {
 	.name		= "xusbxti",
 	.id		= -1,
+	.rate		= 24000000,
 };
 
 struct clk s5p_clk_27m = {
-- 
1.7.4.1
