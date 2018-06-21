From: =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
Subject: [PATCH 5/7] dt-bindings: samsung: Document bindings for Samsung aries boards
Date: Thu, 21 Jun 2018 21:09:57 +0200
Message-ID: <1529608199-5583-6-git-send-email-pawel.mikolaj.chmiel@gmail.com>
References: <1529608199-5583-1-git-send-email-pawel.mikolaj.chmiel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1529608199-5583-1-git-send-email-pawel.mikolaj.chmiel@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: kgene@kernel.org, krzk@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, xc-racer2@live.ca, pawel.mikolaj.chmiel@gmail.com
List-Id: linux-samsung-soc@vger.kernel.org

Signed-off-by: Paweł Chmiel <pawel.mikolaj.chmiel@gmail.com>
---
 Documentation/devicetree/bindings/arm/samsung/samsung-boards.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.txt b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.txt
index 14510b215480..edce6602de50 100644
--- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.txt
+++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.txt
@@ -2,6 +2,8 @@
 
 Required root node properties:
     - compatible = should be one or more of the following.
+	- "samsung,aries"	- for S5PV210-based Samsung Aries board.
+	- "samsung,galaxys"	- for S5PV210-based Samsung Galaxy S (i9000)  board.
 	- "samsung,artik5"	- for Exynos3250-based Samsung ARTIK5 module.
 	- "samsung,artik5-eval" - for Exynos3250-based Samsung ARTIK5 eval board.
 	- "samsung,monk"	- for Exynos3250-based Samsung Simband board.
-- 
2.7.4
