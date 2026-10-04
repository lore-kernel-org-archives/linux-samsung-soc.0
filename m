Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013013.outbound.protection.outlook.com [52.101.83.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0C124A8A12;
	Sun,  4 Oct 2026 20:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791145069; cv=fail; b=BWN75oyi59cEuFxAGGDiYze4BGKyVRIgHwT9fU3nx0jeUAFfQlNHO1g12NamKJfZlRhgaGR+0u73+PrXDNT6vMnRM2MTHdCambEfBbOXDvSqB0VKnFm5UAFottlW6/if8FtZ9n3IhDQfHMz8f4lGGawSP9Kbfth/5ajTJPEZLzU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791145069; c=relaxed/simple;
	bh=/eCgP/CKJv44KbVKstiLo7GDKMhs0J22Jc0phXktnjw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=o6GGjEGsKtDU41EJvIvFtarYnsCaM2HlTj7GNTNUoAFU6qW2VhAdwBLsGhCEEzb43n0TRMf/9zMPtZ3uP2yUQ4schF0l/6DLKiXdy5NQOec/BsdLjMwSPiM5TzeRwNqgvuNsEITJGc9a6KpcmVsNFBsCLjGIO2e8WMscGI+1iW8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=rN8vfR+z; arc=fail smtp.client-ip=52.101.83.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="rN8vfR+z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r3p+a71ZbupFSZOlKn92tD3wuUhOJ5QhwSNvXz/LsRb/6Ztk6qqlwNOjqf/PMOeGUiFZlMRh47Iq3tWsdASEdt1stoDqZh8FZj6bI5Yf9hvIA4+XX2OQ/ZZt11aTHJmY+eZ/Oa7yM9fAOGL+cXU/hCyYptkn2swD4k9pc2/YpzI4WxogVw/IesBCjznBQJSWSpb9x9nWzI9/Ly4BigpNnWVtr3GISOp4raLWFKc7s5mYCLZuXkWxkRSuN2moBh3QGa8jGJ5SihI4RRVlakiGBYnJnrv8pCYMPmdwi7rPr/BLHUaDsHIE5mi7k3LmbaI8TVUCXCuJzpDZSpCPT6KSWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xhWu4uw5o5wh7b2H29oc0pRbeM49NcyIRT4ZZJDKW44=;
 b=y3DDtsNCYydT/6B4dJEjr8BgM3nYo8qunUxnUGsgmueAIH2REVXB2/3sQVU5mxXB84PcDwl4oO6UuR8HOWsLl6UX5+nDfJcM/Xtc6wfDKly0oMTSf9FPT7dcLyKpMBZ/ZX9lq3XjmSroGXUQdCVvEwKnByAPASRxjNcOijCgKpKBdXUurkv6MadW6kKb+BkB+lNyf+4Az2a8hB9L0AdgMtTyhDkbdh5WPXv+j++RkdzRmzysBQ/wJrtXwnLCT0cqf8bLSCWGW46k2Ejg1jYH7sdZropfP4bJ1/5pMCzYMMFAcZHRh+ZZHt7k8BsDrKLPv1+4ZkiPlF2AgY68+bT59g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xhWu4uw5o5wh7b2H29oc0pRbeM49NcyIRT4ZZJDKW44=;
 b=rN8vfR+zVda6dbRivhwlqRvwI26CA6Y9vFnD/rJBmku0juWn/v+OPughYYOFd5t9ejg7s1cc4vgT2wPFNbFRLmekYBj1Ak7oKsFS7Ay5RAIZl/IIa9Qu75Tt8bJlF0plH68UsJvldZ8aSQQeqfJp8DxZF5koroiL3rq3NDB/Aa0=
Received: from DU7P194CA0007.EURP194.PROD.OUTLOOK.COM (2603:10a6:10:553::30)
 by PA1PR02MB11885.eurprd02.prod.outlook.com (2603:10a6:102:56c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Sun, 4 Oct
 2026 20:17:41 +0000
Received: from DU2PEPF00028D09.eurprd03.prod.outlook.com
 (2603:10a6:10:553:cafe::6e) by DU7P194CA0007.outlook.office365.com
 (2603:10a6:10:553::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Sun, 4
 Oct 2026 20:17:41 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 195.60.68.100) smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DU2PEPF00028D09.mail.protection.outlook.com (10.167.242.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Sun, 4 Oct 2026 20:17:41 +0000
Received: from se-mail11w.axis.com (10.20.40.11) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Sun, 4 Oct
 2026 22:17:41 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Sun, 4 Oct 2026 22:17:41 +0200
Received: from lap5cd525d1j1.sto.se.axis.com (unknown [10.224.134.145])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 1E0B94BBC;
	Sun,  4 Oct 2026 22:17:41 +0200 (CEST)
Received: by lap5cd525d1j1.sto.se.axis.com (Postfix, from userid 22105)
	id F0622803CDC4; Sun,  4 Oct 2026 22:17:10 +0200 (CEST)
From: Henrik Grimler <henrik.grimler@axis.com>
Date: Sun, 4 Oct 2026 22:16:01 +0200
Subject: [PATCH 04/17] ARM: dts: samsung: exynos4-cpu-thermal: fix
 indentation and sort
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261004-exynos-arm-cleanup-v1-4-45e435353c56@axis.com>
References: <20261004-exynos-arm-cleanup-v1-0-45e435353c56@axis.com>
In-Reply-To: <20261004-exynos-arm-cleanup-v1-0-45e435353c56@axis.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
CC: <devicetree@vger.kernel.org>, <waqar.hameed@axis.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Henrik Grimler <henrik.grimler@axis.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2863;
 i=henrik.grimler@axis.com; h=from:subject:message-id;
 bh=/eCgP/CKJv44KbVKstiLo7GDKMhs0J22Jc0phXktnjw=;
 b=owEBbQGS/pANAwAKAbAHbkkLcWFrAcsmYgBqwrQr5+WXD5NKwsDf+6/qc3Wc1cIU/ElaqPvvj
 fyZXDn8NWCJATMEAAEKAB0WIQQsfymul4kfZBmp4s2wB25JC3FhawUCasK0KwAKCRCwB25JC3Fh
 a4K2B/4vQU6t6OAlKS2JlRNyRE8sIn+LevZbKl0nxnJ+Yx9dj/dN491FvZrWpOaqVu6f1ut7oxv
 apfdOwRIc7yF7d8vddiZO4j3knpEqp6NdfzKnoeZdq1CeZVL7+4LkCnJNM+mNCqpiGOG6mZb/+D
 Rg11QGm7sOPJZX29+0SKm5lyH5QUGVwVntZ3iNn2Zwt8pzVYF5Fd48W3IQYJTwSAS2Ox9ZrhjKZ
 arS5Mo8rbqf2UDwq6Rh+WBiI+MphhXRl3rS9o4NbGYEHlCDbssW1Pq683xb4M7MbwLfPO3p2x+E
 /XoljArIfH0mWzlDKqXGsOTMNH84/ve3cwQ09Qks+JxMJJRM
X-Developer-Key: i=henrik.grimler@axis.com; a=openpgp;
 fpr=2C7F29AE97891F6419A9E2CDB0076E490B71616B
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D09:EE_|PA1PR02MB11885:EE_
X-MS-Office365-Filtering-Correlation-Id: 62571de4-ad42-4d5d-deff-08df22548b11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|23010399003|30052699003|36860700016|1800799024|18002099003|22082099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	+Ff8pdvg0A4C7NMn65XlLsOiF2D9GGKd/f0yiGqvLf4jtBicbWUm3cufg1KxDy/5yc0VHCFjCopX+FrFBUE44g/w53d6inI/bJTENknRRpOpFS6kQ5juIrCbT3k68ZGDajERGJeJ/2fnoFC32stGi/KZDz8TRQ5e0IoSwJK+W5l4n49lkLJUACaciKpWREPrj7gXM4n/dGn9Ug0YEPEy3l8Xe+F6bq8aglFDfGG0bK6icaZWYcNBxC0x8vSe1wqJ3+WrQNgo86KnkE91GHsHEulFB6n797+RoSvAaDkAENDwk8AmI3sU8cfhzZEnOXL6V0sm0LLJf6IX7i4xk6beO5hX58tToLfRxCzu8pgHEUpIbUDfDx66ez6MGU61/WxMvQ9BBZOBrTXbjAhewuC9PSEO3p/l/zRuf5eUjM/xV6VPILhsJ9ituTj6rSY5apDZe+detYYHz9WWmbeOXiPFui7KTQSGl3T+nTXs+YD1bqK8eXutozacO2rFYp9lCLdvKrhBQBgMu/y/bcA9l41fapN6OkcWOLD6T/BiJGTOceVO68KjIDSmA1UeT6fkKmBtuKOQvr3xbwbD3Ztk6y00P4MrnbEdNdDxpEJ8Uq++4qFljhtdc4ZS1A0Alpyo3QMlQsXabNal1T0BHoqnXCYt0MCHVBEKVLwsZF9MPMetP/D6pzvc4Eu81po8w0ZTwtsjV0IWQnM3pYF64ZORtdZTYg==
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(23010399003)(30052699003)(36860700016)(1800799024)(18002099003)(22082099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	VHaUEvUmo6Dhheqe1UAfQ/a8uEDrkx5SSBG8Ah3HxH7Ri5tjTYBqB1t0ycgiQSAZtE6K02eK7VVmbVtycr8yceDx4pnktglRiUmVn/7yTt7W9d0+UjGrJiTUxV28v77oFh5Pcl38d8IdYuMV/4Qg1BaQrjTf7YoAFHILjsR6u643XnhFZfw10w26yVBxuCgJ+41y0FaA9Nb1h88+bUN7CBY+d9ySLFoblX2reD9iBALYZkcjea1J52i9hMilJaXOXVxu6lkaTaniMACja+QxQmvlxS41rcknI+3XXur+gddWbTn1ahseidGOfz3eNQqI//H/xv6u43iKfWivBQ41sIAi4Xo+LCqe2CCNIbHuAzgubrPrL+yhwuV/YBZofI96bx1hFYbXsdS/5HbojZ5mHusAzJ7OsxRFwGvCeqv2RXsD3ChTHfwzN8caBbq0QJQu
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2026 20:17:41.5200
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 62571de4-ad42-4d5d-deff-08df22548b11
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D09.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR02MB11885

Add missing indentation level, sort child nodes alphabetically and add
newlines before every child. Fixed partially with the help of
dtfmt (Devicetree Source formatter).

Fixes warnings from dt-check-style in strict mode like:

  samsung/exynos4-cpu-thermal.dtsi:32: [required-blank-lines] child node must be preceded by a blank line
  samsung/exynos4-cpu-thermal.dtsi:38: [child-name-order] child node 'cooling-maps' out of name order

Signed-off-by: Henrik Grimler <henrik.grimler@axis.com>
---
 arch/arm/boot/dts/samsung/exynos4-cpu-thermal.dtsi | 72 ++++++++++++----------
 1 file changed, 39 insertions(+), 33 deletions(-)

diff --git a/arch/arm/boot/dts/samsung/exynos4-cpu-thermal.dtsi b/arch/arm/boot/dts/samsung/exynos4-cpu-thermal.dtsi
index 27a1a8952665..48bac2fe6172 100644
--- a/arch/arm/boot/dts/samsung/exynos4-cpu-thermal.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos4-cpu-thermal.dtsi
@@ -8,41 +8,47 @@
 #include <dt-bindings/thermal/thermal.h>
 
 / {
-thermal-zones {
-	cpu_thermal: cpu-thermal {
-		thermal-sensors = <&tmu>;
-		polling-delay-passive = <0>;
-		polling-delay = <0>;
-		trips {
-			cpu_alert0: cpu-alert-0 {
-				temperature = <70000>; /* millicelsius */
-				hysteresis = <10000>; /* millicelsius */
-				type = "active";
-			};
-			cpu_alert1: cpu-alert-1 {
-				temperature = <95000>; /* millicelsius */
-				hysteresis = <10000>; /* millicelsius */
-				type = "active";
-			};
-			cpu_alert2: cpu-alert-2 {
-				temperature = <110000>; /* millicelsius */
-				hysteresis = <10000>; /* millicelsius */
-				type = "active";
-			};
-			cpu_crit0: cpu-crit-0 {
-				temperature = <120000>; /* millicelsius */
-				hysteresis = <0>; /* millicelsius */
-				type = "critical";
-			};
-		};
-		cooling-maps {
-			map0 {
-				trip = <&cpu_alert0>;
+	thermal-zones {
+		cpu_thermal: cpu-thermal {
+			thermal-sensors = <&tmu>;
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu_alert0>;
+				};
+
+				map1 {
+					trip = <&cpu_alert1>;
+				};
 			};
-			map1 {
-				trip = <&cpu_alert1>;
+
+			trips {
+				cpu_alert0: cpu-alert-0 {
+					temperature = <70000>; /* millicelsius */
+					hysteresis = <10000>; /* millicelsius */
+					type = "active";
+				};
+
+				cpu_alert1: cpu-alert-1 {
+					temperature = <95000>; /* millicelsius */
+					hysteresis = <10000>; /* millicelsius */
+					type = "active";
+				};
+
+				cpu_alert2: cpu-alert-2 {
+					temperature = <110000>; /* millicelsius */
+					hysteresis = <10000>; /* millicelsius */
+					type = "active";
+				};
+
+				cpu_crit0: cpu-crit-0 {
+					temperature = <120000>; /* millicelsius */
+					hysteresis = <0>; /* millicelsius */
+					type = "critical";
+				};
 			};
 		};
 	};
 };
-};

-- 
2.43.0

