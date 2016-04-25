From: Eric Engestrom <eric@engestrom.ch>
Subject: [PATCH 10/41] Documentation: dt: display: fix spelling mistake
Date: Mon, 25 Apr 2016 01:24:07 +0100
Message-ID: <1461543878-3639-11-git-send-email-eric@engestrom.ch>
References: <1461543878-3639-1-git-send-email-eric@engestrom.ch>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:34291 "EHLO
	mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752159AbcDYA11 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 24 Apr 2016 20:27:27 -0400
In-Reply-To: <1461543878-3639-1-git-send-email-eric@engestrom.ch>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Eric Engestrom <eric@engestrom.ch>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Hyungwon Hwang <human.hwang@samsung.com>, Chanho Park <chanho61.park@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Signed-off-by: Eric Engestrom <eric@engestrom.ch>
---
 Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt b/Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt
index 22756b3..a782659 100644
--- a/Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt
+++ b/Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt
@@ -41,7 +41,7 @@ Video interfaces:
   endpoint node connected from mic node (reg = 0):
     - remote-endpoint: specifies the endpoint in mic node. This node is required
 		       for Exynos5433 mipi dsi. So mic can access to panel node
-		       thoughout this dsi node.
+		       throughout this dsi node.
   endpoint node connected to panel node (reg = 1):
     - remote-endpoint: specifies the endpoint in panel node. This node is
 		       required in all kinds of exynos mipi dsi to represent
-- 
2.8.0
