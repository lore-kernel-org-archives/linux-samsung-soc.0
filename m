From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v5 1/9] PM / Domains: Add a note about power domain subdomains
Date: Mon, 02 Feb 2015 14:20:20 +0100
Message-ID: <1422883228-10690-2-git-send-email-m.szyprowski@samsung.com>
References: <1422883228-10690-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:47871 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753471AbbBBNUp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 2 Feb 2015 08:20:45 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NJ500FH0BX6IC30@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 02 Feb 2015 13:24:42 +0000 (GMT)
In-reply-to: <1422883228-10690-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, Marek Szyprowski <m.szyprowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, Tobias Jakobi <Liquid.Acid@gmx.net>, Daniel Drake <drake@endlessm.com>, Andrzej Hajda <a.hajda@samsung.com>, Inki Dae <inki.dae@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, jy0922.shim@samsung.com, kyungmin.park@samsung.com

This patch adds a note on defining subdomains to generic PM domain
binding documentation to let power domain providers use common approach
for defining power domain hierarchy.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 .../devicetree/bindings/power/power_domain.txt     | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/power_domain.txt b/Documentation/devicetree/bindings/power/power_domain.txt
index 98c16672ab5f..0f8ed3710c66 100644
--- a/Documentation/devicetree/bindings/power/power_domain.txt
+++ b/Documentation/devicetree/bindings/power/power_domain.txt
@@ -19,6 +19,16 @@ Required properties:
    providing multiple PM domains (e.g. power controllers), but can be any value
    as specified by device tree binding documentation of particular provider.
 
+Optional properties:
+ - power-domains : A phandle and PM domain specifier as defined by bindings of
+                   the power controller specified by phandle.
+   Some power domains might be powered from another power domain (or have
+   other hardware specific dependencies). For representing such dependency
+   a standard PM domain consumer binding is used. When provided, all domains
+   created by the given provider should be subdomains of the domain
+   specified by this binding. More details about power domain specifier are
+   available in the next section.
+
 Example:
 
 	power: power-controller@12340000 {
@@ -30,6 +40,25 @@ Example:
 The node above defines a power controller that is a PM domain provider and
 expects one cell as its phandle argument.
 
+Example 2:
+
+	parent: power-controller@12340000 {
+		compatible = "foo,power-controller";
+		reg = <0x12340000 0x1000>;
+		#power-domain-cells = <1>;
+	};
+
+	child: power-controller@12340000 {
+		compatible = "foo,power-controller";
+		reg = <0x12341000 0x1000>;
+		power-domains = <&parent 0>;
+		#power-domain-cells = <1>;
+	};
+
+The nodes above define two power controllers: 'parent' and 'child'.
+Domains created by the 'child' power controller are subdomains of '0' power
+domain provided by the 'parent' power controller.
+
 ==PM domain consumers==
 
 Required properties:
-- 
1.9.2
