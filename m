From: Randy Li <ayaka@soulik.info>
Subject: [PATCH v6 3/3] devicetree: bindings: Add vendor prefix for Topeet.
Date: Thu,  8 Sep 2016 05:58:55 +0800
Message-ID: <1473285535-21996-4-git-send-email-ayaka@soulik.info>
References: <1473285535-21996-1-git-send-email-ayaka@soulik.info>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1473285535-21996-1-git-send-email-ayaka@soulik.info>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: mark.rutland@arm.com, linux@armlinux.org.uk, kgene@kernel.org, krzk@kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, robh@kernel.org, Randy Li <ayaka@soulik.info>
List-Id: linux-samsung-soc@vger.kernel.org

Add TOPEET, a ARM devlopment board vendor in China mainland.

Signed-off-by: Randy Li <ayaka@soulik.info>
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 7958a60..fa64536 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -269,6 +269,7 @@ technologic	Technologic Systems
 thine	THine Electronics, Inc.
 ti	Texas Instruments
 tlm	Trusted Logic Mobility
+topeet  Topeet
 toradex	Toradex AG
 toshiba	Toshiba Corporation
 toumaz	Toumaz
-- 
2.7.4
