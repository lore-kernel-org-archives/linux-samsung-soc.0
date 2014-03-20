From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH] ARM: dts: exynos4210-universal: add fimd polarization settings
Date: Thu, 20 Mar 2014 14:26:50 +0100
Message-ID: <1395322010-1248-1-git-send-email-a.hajda@samsung.com>
References: <CAAQKjZOh-qFEn3ex7YwCRDwOjpV=s-8JGj68Yx7qOpS+oy2-ww@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <CAAQKjZOh-qFEn3ex7YwCRDwOjpV=s-8JGj68Yx7qOpS+oy2-ww@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Inki Dae <inki.dae@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Denis Carikli <denis@eukrea.com>, DRI mailing list <dri-devel@lists.freedesktop.org>, Andrzej Hajda <a.hajda@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

The patch adds polarization flags to fimd node.
It fixes parallel display support.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
Hi Inki,

Since polarization patches were not merged, polarization
settings should be provided to fimd via properties.
This patch fixes it.

Regards
Andrzej
---
 arch/arm/boot/dts/exynos4210-universal_c210.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4210-universal_c210.dts b/arch/arm/boot/dts/exynos4210-universal_c210.dts
index 21ca0b978..477208d 100644
--- a/arch/arm/boot/dts/exynos4210-universal_c210.dts
+++ b/arch/arm/boot/dts/exynos4210-universal_c210.dts
@@ -351,6 +351,8 @@
 		pinctrl-0 = <&lcd_clk>, <&lcd_data24>;
 		pinctrl-names = "default";
 		status = "okay";
+		samsung,invert-vden;
+		samsung,invert-vclk;
 		display-timings {
 			timing {
 				clock-frequency = <23492370>;
-- 
1.8.3.2
