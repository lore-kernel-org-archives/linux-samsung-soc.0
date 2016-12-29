From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH] ARM: s3c2410_defconfig: Fix invalid values for NF_CT_PROTO_*
Date: Thu, 29 Dec 2016 14:41:05 +0200
Message-ID: <20161229124105.8391-1-krzk@kernel.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:46022 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752474AbcL2MlW (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 29 Dec 2016 07:41:22 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

NF_CT_PROTO_DCCP/SCTP/UDPLITE were switched from tristate to boolean so
defconfig needs to be adjusted to silence warnings:
	warning: symbol value 'm' invalid for NF_CT_PROTO_DCCP
	warning: symbol value 'm' invalid for NF_CT_PROTO_SCTP
	warning: symbol value 'm' invalid for NF_CT_PROTO_UDPLITE

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/configs/s3c2410_defconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/configs/s3c2410_defconfig b/arch/arm/configs/s3c2410_defconfig
index 4364040ed696..1e6c48dd7b11 100644
--- a/arch/arm/configs/s3c2410_defconfig
+++ b/arch/arm/configs/s3c2410_defconfig
@@ -86,9 +86,9 @@ CONFIG_IPV6_TUNNEL=m
 CONFIG_NETFILTER=y
 CONFIG_NF_CONNTRACK=m
 CONFIG_NF_CONNTRACK_EVENTS=y
-CONFIG_NF_CT_PROTO_DCCP=m
-CONFIG_NF_CT_PROTO_SCTP=m
-CONFIG_NF_CT_PROTO_UDPLITE=m
+CONFIG_NF_CT_PROTO_DCCP=y
+CONFIG_NF_CT_PROTO_SCTP=y
+CONFIG_NF_CT_PROTO_UDPLITE=y
 CONFIG_NF_CONNTRACK_AMANDA=m
 CONFIG_NF_CONNTRACK_FTP=m
 CONFIG_NF_CONNTRACK_H323=m
-- 
2.9.3
