From: Ben Dooks <ben-linux@fluff.org>
Subject: [PATCH] ARM: SAMSUNG: Move map-base to plat-samsung
Date: Fri, 29 Jan 2010 09:02:13 +0000
Message-ID: <1264755741-16184-3-git-send-email-ben-linux@fluff.org>
References: <1264755741-16184-1-git-send-email-ben-linux@fluff.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:33731 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754929Ab0A2JCY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 29 Jan 2010 04:02:24 -0500
In-Reply-To: <1264755741-16184-1-git-send-email-ben-linux@fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Ben Dooks <ben-linux@fluff.org>

Move the map-base file to plat-samsung. To make the move easier, we do not
change the S3C_ prefix on many of the items as this would involve going
through altering all the dependencies.

Signed-off-by: Ben Dooks <ben-linux@fluff.org>
---
 .../include/plat/map-base.h                        |    0
 1 files changed, 0 insertions(+), 0 deletions(-)
 rename arch/arm/{plat-s3c => plat-samsung}/include/plat/map-base.h (100%)

diff --git a/arch/arm/plat-s3c/include/plat/map-base.h b/arch/arm/plat-samsung/include/plat/map-base.h
similarity index 100%
rename from arch/arm/plat-s3c/include/plat/map-base.h
rename to arch/arm/plat-samsung/include/plat/map-base.h
-- 
1.6.0.4
