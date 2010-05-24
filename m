From: Ben Dooks <ben-linux@fluff.org>
Subject: [PATCH 2/8] ARM: SAMSUNG: Documentation: update directory layout
Date: Mon, 24 May 2010 04:30:03 +0100
Message-ID: <1274671809-9821-3-git-send-email-ben-linux@fluff.org>
References: <1274671809-9821-1-git-send-email-ben-linux@fluff.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:54849 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755987Ab0EXDa3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 23 May 2010 23:30:29 -0400
In-Reply-To: <1274671809-9821-1-git-send-email-ben-linux@fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Ben Dooks <ben-linux@fluff.org>

Update the directory layout in Documentation/arm/Samsung/Overview.txt
to reflect the changes that have been made in the latest kernel
updates.

Signed-off-by: Ben Dooks <ben-linux@fluff.org>
---
 Documentation/arm/Samsung/Overview.txt |   23 ++++++++++++++++-------
 1 files changed, 16 insertions(+), 7 deletions(-)

diff --git a/Documentation/arm/Samsung/Overview.txt b/Documentation/arm/Samsung/Overview.txt
index e8c5dfc..c3094ea 100644
--- a/Documentation/arm/Samsung/Overview.txt
+++ b/Documentation/arm/Samsung/Overview.txt
@@ -54,18 +54,27 @@ Layout
   specific information. It contains the base clock, GPIO and device definitions
   to get the system running.
 
-  plat-s3c is the s3c24xx/s3c64xx platform directory, although it is currently
-  involved in other builds this will be phased out once the relevant code is
-  moved elsewhere.
-
   plat-s3c24xx is for s3c24xx specific builds, see the S3C24XX docs.
 
-  plat-s3c64xx is for the s3c64xx specific bits, see the S3C24XX docs.
+  plat-s5p is for s5p specific builds, and contains common support for the
+  S5P specific systems. Not all S5Ps use all the features in this directory
+  due to differences in the hardware.
+
+
+Layout changes
+--------------
+
+  The old plat-s3c and plat-s5pc1xx directories have been removed, with
+  support moved to either plat-samsung or plat-s5p as necessary. These moves
+  where to simplify the include and dependency issues involved with having
+  so many different platform directories.
 
-  plat-s5p is for s5p specific builds, more to be added.
+  It was decided to remove plat-s5pc1xx as some of the support was already
+  in plat-s5p or plat-samsung, with the S5PC110 support added with S5PV210
+  the only user was the S5PC100. The S5PC100 specific items where moved to
+  arch/arm/mach-s5pc100.
 
 
-  [ to finish ]
 
 
 Port Contributors
-- 
1.6.3.3
