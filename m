From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v4 1/9] PM / Domains: Add a note about power domain subdomains
Date: Tue, 20 Jan 2015 13:16:51 +0100
Message-ID: <1421756219-21037-2-git-send-email-m.szyprowski@samsung.com>
References: <1421756219-21037-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:40504 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753045AbbATMRI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 Jan 2015 07:17:08 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NIH00EZT6B9BL60@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 20 Jan 2015 12:21:09 +0000 (GMT)
In-reply-to: <1421756219-21037-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, Marek Szyprowski <m.szyprowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, Tobias Jakobi <Liquid.Acid@gmx.net>, Daniel Drake <drake@endlessm.com>, Andrzej Hajda <a.hajda@samsung.com>, Inki Dae <inki.dae@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, jy0922.shim@samsung.com, kyungmin.park@samsung.com, Pankaj Dubey <pankaj.dubey@samsung.com>, Amit Daniel Kachhap <amit.daniel@samsung.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Ulf Hansson <ulf.hansson@linaro.org>

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
