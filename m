From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH v2 09/10] dt-bindings: video: exynos5433-decon: add bindings
 for DECON-TV
Date: Mon, 26 Oct 2015 12:59:56 +0100
Message-ID: <1445860796-23045-1-git-send-email-a.hajda@samsung.com>
References: <CAJKOXPfXrEwu1egSnLxwYofu_scskkPRKOjOCskObPFn9yVcJw@mail.gmail.com>
Return-path: <linux-clk-owner@vger.kernel.org>
In-reply-to: <CAJKOXPfXrEwu1egSnLxwYofu_scskkPRKOjOCskObPFn9yVcJw@mail.gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Hyungwon Hwang <human.hwang@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

DECON-TV(Display and Enhancement Controller for TV) is a variation
of DECON IP. Its main purpose is to produce video stream for HDMI IP.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
Hi Krzysztof,

I have decided to skip cleanup part as it would require more work,
not related to this patchset.

Regards
Andrzej

 Documentation/devicetree/bindings/video/exynos5433-decon.txt | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/video/exynos5433-decon.txt b/Documentation/devicetree/bindings/video/exynos5433-decon.txt
index 3dff78b..c9fd7b3 100644
--- a/Documentation/devicetree/bindings/video/exynos5433-decon.txt
+++ b/Documentation/devicetree/bindings/video/exynos5433-decon.txt
@@ -5,7 +5,8 @@ Exynos series of SoCs which transfers the image data from a video memory
 buffer to an external LCD interface.
 
 Required properties:
-- compatible: value should be "samsung,exynos5433-decon";
+- compatible: value should be one of:
+	"samsung,exynos5433-decon", "samsung,exynos5433-decon-tv";
 - reg: physical base address and length of the DECON registers set.
 - interrupts: should contain a list of all DECON IP block interrupts in the
 	      order: VSYNC, LCD_SYSTEM. The interrupt specifier format
-- 
1.9.1

