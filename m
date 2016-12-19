From: Robie Basak <robie@justgohome.co.uk>
Subject: [PATCH] ARM: exynos_defconfig: enable IP multicast
Date: Mon, 19 Dec 2016 00:56:37 +0000
Message-ID: <20161219005637.GI4624@mal.justgohome.co.uk>
References: <20161218131912.GG4624@mal.justgohome.co.uk>
 <20161218164945.GA3662@kozik-lap>
 <20161219005224.GH4624@mal.justgohome.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from a-painless.mh.aa.net.uk ([81.187.30.51]:33055 "EHLO
        a-painless.mh.aa.net.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750933AbcLSA4p (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 18 Dec 2016 19:56:45 -0500
Content-Disposition: inline
In-Reply-To: <20161219005224.GH4624@mal.justgohome.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Kukjin Kim <kgene@kernel.org>, linux-samsung-soc@vger.kernel.org, Nikolay Borisov <kernel@kyup.com>

Prior to Nikolay's commit dcd87999d, libnss-mdns (eg. to resolve
"foo.local" on the LAN using mDNS) worked without CONFIG_IP_MULTICAST
defined, but dcd87999d caused it to stop working without having
CONFIG_IP_MULTICAST defined explicitly.

Since exynos_defconfig did not previously define CONFIG_IP_MULTICAST,
mDNS used to work for users building with just exynos_defconfig, but
stopped working from dcd87999d.

Define CONFIG_IP_MULTICAST explicitly in exynos_defconfig as it appears
essential anyway.

Signed-off-by: Robie Basak <robie@justgohome.co.uk>
---
 arch/arm/configs/exynos_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
index 79c415c..12b8f69 100644
--- a/arch/arm/configs/exynos_defconfig
+++ b/arch/arm/configs/exynos_defconfig
@@ -43,6 +43,7 @@ CONFIG_PACKET=y
 CONFIG_UNIX=y
 CONFIG_NET_KEY=y
 CONFIG_INET=y
+CONFIG_IP_MULTICAST=y
 CONFIG_IP_PNP=y
 CONFIG_IP_PNP_DHCP=y
 CONFIG_IP_PNP_BOOTP=y
-- 
2.7.4
