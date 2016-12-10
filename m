From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: [PATCH v2 1/3] Documentation: bindings: Add binding doc for exynos
 enable method
Date: Sat, 10 Dec 2016 16:16:00 +0530
Message-ID: <1481366762-26413-2-git-send-email-pankaj.dubey@samsung.com>
References: <1481366762-26413-1-git-send-email-pankaj.dubey@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:52029 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752924AbcLJKni (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 10 Dec 2016 05:43:38 -0500
Received: from epcpsbgm2new.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OHY01TOITSMBT60@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 10 Dec 2016 19:43:36 +0900 (KST)
In-reply-to: <1481366762-26413-1-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: krzk@kernel.org, kgene@kernel.org, javier@osg.samsung.com, thomas.ab@samsung.com, Pankaj Dubey <pankaj.dubey@samsung.com>, Rob Herring <robh+dt@kernel.org>

Add "samsung,exynos-smp" as enable-method for Samsung's Exynos SoC.

CC: Rob Herring <robh+dt@kernel.org> 
Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
---
 Documentation/devicetree/bindings/arm/cpus.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/cpus.txt b/Documentation/devicetree/bindings/arm/cpus.txt
index e6782d5..12730c8 100644
--- a/Documentation/devicetree/bindings/arm/cpus.txt
+++ b/Documentation/devicetree/bindings/arm/cpus.txt
@@ -209,6 +209,7 @@ nodes to be present and contain the properties described below.
 			    "renesas,apmu"
 			    "rockchip,rk3036-smp"
 			    "rockchip,rk3066-smp"
+			    "samsung,exynos-smp"
 			    "ste,dbx500-smp"
 
 	- cpu-release-addr
-- 
2.7.4
