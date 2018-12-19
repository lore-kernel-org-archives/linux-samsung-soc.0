From: =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
Subject: [PATCH 2/3] dt-bindings: gpu: samsung-rotator: Document s5pv210 support
Date: Wed, 19 Dec 2018 16:57:03 +0100
Message-ID: <20181219155704.15264-3-pawel.mikolaj.chmiel@gmail.com>
References: <20181219155704.15264-1-pawel.mikolaj.chmiel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181219155704.15264-1-pawel.mikolaj.chmiel@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: inki.dae@samsung.com, krzk@kernel.org, airlied@linux.ie
Cc: jy0922.shim@samsung.com, sw0312.kim@samsung.com, kyungmin.park@samsung.com, kgene@kernel.org, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
List-Id: linux-samsung-soc@vger.kernel.org

This commit documents new compatible for s5pv210 soc,
which will be also supported by this driver.

Signed-off-by: Paweł Chmiel <pawel.mikolaj.chmiel@gmail.com>
---
 Documentation/devicetree/bindings/gpu/samsung-rotator.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/gpu/samsung-rotator.txt b/Documentation/devicetree/bindings/gpu/samsung-rotator.txt
index 82cd1ed0be93..78658dec6941 100644
--- a/Documentation/devicetree/bindings/gpu/samsung-rotator.txt
+++ b/Documentation/devicetree/bindings/gpu/samsung-rotator.txt
@@ -5,6 +5,7 @@ Required properties:
 	(a) "samsung,exynos4210-rotator" for Rotator IP in Exynos4210
 	(b) "samsung,exynos4212-rotator" for Rotator IP in Exynos4212/4412
 	(c) "samsung,exynos5250-rotator" for Rotator IP in Exynos5250
+	(d) "samsung,s5pv210-rotator" for Rotator IP in S5PV210
 
   - reg : Physical base address of the IP registers and length of memory
 	  mapped region.
-- 
2.17.1
