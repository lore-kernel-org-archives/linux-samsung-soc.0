From: Ben Dooks <ben-linux@fluff.org>
Subject: [S3C-CLK] ARM: SAMSUNG: Move <plat/clock.h> to plat-samsung
Date: Fri,  8 Jan 2010 02:30:10 +0000
Message-ID: <1262917822-26004-3-git-send-email-ben-linux@fluff.org>
References: <1262917822-26004-1-git-send-email-ben-linux@fluff.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:57257 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751811Ab0AHCa1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 7 Jan 2010 21:30:27 -0500
In-Reply-To: <1262917822-26004-1-git-send-email-ben-linux@fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Move the <plat/clock.h> header to plat-samsung where it can be used by all
the platforms, and readies it for the next round of clock updates where
the clock code will be amalgamated.

Signed-off-by: Ben Dooks <ben-linux@fluff.org>
---
 .../include/plat/clock.h                           |    0
 1 files changed, 0 insertions(+), 0 deletions(-)
 rename arch/arm/{plat-s3c => plat-samsung}/include/plat/clock.h (100%)

diff --git a/arch/arm/plat-s3c/include/plat/clock.h b/arch/arm/plat-samsung/include/plat/clock.h
similarity index 100%
rename from arch/arm/plat-s3c/include/plat/clock.h
rename to arch/arm/plat-samsung/include/plat/clock.h
-- 
1.6.0.4
