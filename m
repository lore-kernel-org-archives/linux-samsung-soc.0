From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [PATCH 1/2] ARM: dts: s5p: Remove skeleton.dtsi inclusion for S5PV210
Date: Thu,  8 Sep 2016 11:26:00 -0400
Message-ID: <1473348361-15784-2-git-send-email-javier@osg.samsung.com>
References: <1473348361-15784-1-git-send-email-javier@osg.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com ([52.27.115.49]:48865
        "EHLO s-opensource.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S966373AbcIHP0X (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 8 Sep 2016 11:26:23 -0400
In-Reply-To: <1473348361-15784-1-git-send-email-javier@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Javier Martinez Canillas <javier@osg.samsung.com>, devicetree@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, Russell King <linux@armlinux.org.uk>, linux-samsung-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org

The skeleton.dtsi file was removed in ARM64 for different reasons as
explained in commit ("3ebee5a2e141 arm64: dts: kill skeleton.dtsi").

These also applies to ARM and it will also allow to get rid of the
following DTC warnings in the future:

"Node /memory has a reg or ranges property, but no unit name"

Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
---

 arch/arm/boot/dts/s5pv210.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/s5pv210.dtsi b/arch/arm/boot/dts/s5pv210.dtsi
index ffc36bd24d2f..a853918be43f 100644
--- a/arch/arm/boot/dts/s5pv210.dtsi
+++ b/arch/arm/boot/dts/s5pv210.dtsi
@@ -19,11 +19,13 @@
  * published by the Free Software Foundation.
 */
 
-#include "skeleton.dtsi"
 #include <dt-bindings/clock/s5pv210.h>
 #include <dt-bindings/clock/s5pv210-audss.h>
 
 / {
+	#address-cells = <1>;
+	#size-cells = <1>;
+
 	aliases {
 		csis0 = &csis0;
 		fimc0 = &fimc0;
-- 
2.7.4
