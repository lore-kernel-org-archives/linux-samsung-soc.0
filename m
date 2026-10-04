Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011002.outbound.protection.outlook.com [40.107.130.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D0744A8FE2;
	Sun,  4 Oct 2026 20:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791145043; cv=fail; b=dfKEG0yutw1kKIzAr6cU6TQ+XIu2GD+HAARxqvgugbhYCN6wlibj6DLMXw0rI9rIn02b44oIYLnStiKAQfjrdnBOzwz3kEyTPRmHZTAXKf4/wv3HSsd5e1Br0fRoV+kI2kYOLX11SBXW7WIKBE4AhtymM+ORl6t4D/J6h6VM9ME=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791145043; c=relaxed/simple;
	bh=lkXdmczR3oYAV6MdblMtFNi3ysZTgsLk60ulnUgeAUc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=ZB8EBb/75kFUbFg5p8w1SZIe7MlK+7Lk42f3pe6jFD/1N9Exhb74zt/Z/AIGm8LmS7jxHLUSCr+wOhxUPpUaLzVoZOAldR/nXBLDKU77gsef0YpI+z7lyef5NawXnculGUvEorYzGggex6jwBWBVHmhnE6fryIKMmUXccUmU0zg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=M3L0FBkK; arc=fail smtp.client-ip=40.107.130.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="M3L0FBkK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XlbfDdTa9xjFCO/vKBPC855OGS7JiwzOKtkUXlY4b6S9H/VIKqDPuVcSBkc6ZDRPtIyqRpmFsGhT7dIxIjIiGEhg4kY8ZaPWeVCR38IncP3fu3aFvTu1YoXilXf8mQ5QxQDr2a7zoe/3Tfk/BEdbGB8EYEmourU73xHPL4aBkK/g5y4wG554a8OopDo/Wl1Wi/r0TSJmNSHY/WNcsmZ1rpGm5meqpYa9qr1V6aCFhJpGOzOiwAskljf0xxd/tYcj8BOubT/TMZ1aBFKbWyEtq7aUutXNwfu/QxVlmaC2izUjBIZobz7CKH1GPZ4wPFwHp52kBKzDiEiOEL8G0uEF1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vPGAk8LVcGDdAMFFmf5X7xLi+wDp9fUI4rA5XeoVm3I=;
 b=BtcIvqtQhzkHsfXkJ1a+9bcK8eipJ+z4SvYyowJxT9YyOG7JsnPhubPyxpS41vD8WXxG52SLbbM+/WGAhnMDQy8DyKKlSe9N/2zdURCVconWPe0lh0nReFJ74HdJgn3pcxv/k+Gz/wpPtx0gtC1F6A+VdkUUm+LUuWxpY3SxbVB/WPVG/ck18PYMlmnwpcvOP9UTxzgxbcuzcnkJ7PHhyJ6Rq76jAU4Z+ieyeAGXRra42fu71G5TLl/XDu8BGY5fyxd5ign4hXj2qI0eKsXToOufflmnS95kt8kqkyYXNq5p+Ff8nJy2+H3TDzOaXwdI0aMIwfuwY4sSCx1xe7XcLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vPGAk8LVcGDdAMFFmf5X7xLi+wDp9fUI4rA5XeoVm3I=;
 b=M3L0FBkK07VgosiPqQuFSvr47HGEUklRSJ6yWUEFvuOVfa4LJpK4A8xody45YYVwTvD2JWhZgjZ6pZ3r+nqLu4Ea9bdLmjuXy4Cg2Wy8X52QNXGV0WFbOwtUmB33g9TgEC3qgpSYRAN2YML0WuCQ0pIg0DaEy+XSZgakjdLXH8I=
Received: from DUZPR01CA0305.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::26) by DU0PR02MB9347.eurprd02.prod.outlook.com
 (2603:10a6:10:416::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Sun, 4 Oct
 2026 20:17:15 +0000
Received: from DU2PEPF00028D0B.eurprd03.prod.outlook.com
 (2603:10a6:10:4b7:cafe::30) by DUZPR01CA0305.outlook.office365.com
 (2603:10a6:10:4b7::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Sun, 4
 Oct 2026 20:17:15 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 195.60.68.100) smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DU2PEPF00028D0B.mail.protection.outlook.com (10.167.242.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Sun, 4 Oct 2026 20:17:15 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.39; Sun, 4 Oct
 2026 22:17:11 +0200
Received: from se-mail11w.axis.com (10.20.40.11) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61; Sun, 4 Oct
 2026 22:17:11 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Sun, 4 Oct 2026 22:17:11 +0200
Received: from lap5cd525d1j1.sto.se.axis.com (unknown [10.224.134.145])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 3A0314CEE;
	Sun,  4 Oct 2026 22:17:11 +0200 (CEST)
Received: by lap5cd525d1j1.sto.se.axis.com (Postfix, from userid 22105)
	id 11DE8803CDCA; Sun,  4 Oct 2026 22:17:11 +0200 (CEST)
From: Henrik Grimler <henrik.grimler@axis.com>
Date: Sun, 4 Oct 2026 22:16:07 +0200
Subject: [PATCH 10/17] ARM: dts: samsung: exynos4210-pinctrl: align all
 continued lines
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261004-exynos-arm-cleanup-v1-10-45e435353c56@axis.com>
References: <20261004-exynos-arm-cleanup-v1-0-45e435353c56@axis.com>
In-Reply-To: <20261004-exynos-arm-cleanup-v1-0-45e435353c56@axis.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
CC: <devicetree@vger.kernel.org>, <waqar.hameed@axis.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Henrik Grimler <henrik.grimler@axis.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5509;
 i=henrik.grimler@axis.com; h=from:subject:message-id;
 bh=lkXdmczR3oYAV6MdblMtFNi3ysZTgsLk60ulnUgeAUc=;
 b=owEBbQGS/pANAwAKAbAHbkkLcWFrAcsmYgBqwrQ3gh4sglJr6ROaISdqnBZntkxoacUrdJ59g
 0yC/N45SOmJATMEAAEKAB0WIQQsfymul4kfZBmp4s2wB25JC3FhawUCasK0NwAKCRCwB25JC3Fh
 a0/vB/9wOgT3UelZIcoe9eA6EsGgZT+opc7pIGl5XA/6Ic2Yks2NtdjlbArjXxbcldz3SHz3vkO
 AW380JuJIZIV1k/RyVvGAmtzxV6M+vTDjj1Sy4ZJlYmM+1Ls/sy2AnFG5UxFODjOOrGjAYkw/FP
 3ilgsjiNPVTnBoxF7c26p8f97TQcc46bCdib+iiTVZ8CZR973OZ/Sx9Jk/2h7YFHujOo7oEOw9u
 cS08RFqdpozOiZ6/Eh7uxyS7d6/GeHhJZvYC6K4oHCSz6ZpKNCmNr94JI5yUxvNBKSRPrYhCUrN
 BSmwShI962KK78Fww5XNyKS6T00OKYHxCbVL6qgP1O7EIMuS
X-Developer-Key: i=henrik.grimler@axis.com; a=openpgp;
 fpr=2C7F29AE97891F6419A9E2CDB0076E490B71616B
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D0B:EE_|DU0PR02MB9347:EE_
X-MS-Office365-Filtering-Correlation-Id: cf8b5fae-ee17-4c66-dfc8-08df22547baa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|36860700016|1800799024|30052699003|376014|22082099003|18002099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	6eed8iQ1MynDuSuBF6e6NmaV17DNKcCrURn7HtmwIota+xe9GwyzZaRr1qFRX3m7uRekU7RFEXMjtfRKikvZ5WSYIi6I9TjlaG/JAacCKWTnyXs9xiIjkMVF3BFg5yk1UoUgxk5YCdV0KPTq9y41yO91doXSmesNflufD6DORuxh1RoYUVvKXl3+JLTEgy4XEpOz9ul/VEyx2qXjHQp4DBfX2Azr0tmz2IG6YH6JMZhDU6roC5LRfEZZz3IIQCUN4CGcqrJVQD4fkfHEp9tb4DN7yofvo5RR9VgE5Q/d1sFg7SFj5ZyoUhu+804bRfeByLrFKrVMVbchzmPmDV0c8fZIMRnvRFYcsdwrbUkX5o6VKrESEVu5NQFXW+O3w0sLpgLJhWZe9tVPxt21ZfDfvuGrWNrmaJsnD9rkH1Db/d1QrZUysY43NQWbT+bg4CXk/LBcHnq1Mspo/SDIURgeI7mh1vxuwycPtzcyH6IBqdoKBqQJg0lDCFZVcL48YarjMRADfi6Om8XlK0PLYGGat0O7TCXPwmseZRCXvsZQEUyfB0bRZ7ca0zTxmic5BFqpLRke0A6tR7CP4s28BL/saKxSJI7LNEWkbPM4aNMhrJmXEQm+qZBpxHfLZ5IZwV2B9KDQVErZbcboGis9BXCAXInhA/XTwIzMCsMZumpywsVhKmlazGZ6CbQ0Dw1b/qkoD9BAQrbxOCbskP+vu137Eg==
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(36860700016)(1800799024)(30052699003)(376014)(22082099003)(18002099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	N80TaJxtehGVN/u1GcPOR/7Rkq5V7in/G4tG7v9UsBAx3NGUOaGCwd62FFhFzaIr/R7SWKMs3eqEZPo1wQVaMrzeVGPyNS1TVhTEPKb7rfeSpE4XaUzN/U+ivNvjDkSrKweZf7DLOy6/yC8R2s3mvqCYwXmRHX1nydDZIjDzc8FU9Ul+xgWuR9q34Depfvp3VQSIsc4zKmGeN1RCbHEfA2DcnZpaZSdt2w9aFDk15+YbAyYO2lxByPKDh85N8ZsuFKtX35bA+3YMXleZZ1tWlkurWuMtvnR736StXZTWjrsj9q1hnYdE3NeUs7hpEkEoXXQidACEWlPHHwpL8qjFclqXQ0+NZV+VTZ6LR8WyJS017OyHs4rOhR4iAP2nFDfJ9iCJfHS6me+KhxlreUYEVhLrq0KkDCeNPYkTqSxzU4kHNkmM09x49WWzAbiBB+Jy
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2026 20:17:15.6786
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cf8b5fae-ee17-4c66-dfc8-08df22547baa
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D0B.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR02MB9347

A combination of tabs and spaces should be used to ensure elements are
aligned. Fix all properties where applicable.

Fixes warnings from dt-style-checker in strict mode, like:

  samsung/exynos4210-pinctrl.dtsi:252: [continuation-alignment] continuation should align to column 32 (to < or ")

Signed-off-by: Henrik Grimler <henrik.grimler@axis.com>
---
 arch/arm/boot/dts/samsung/exynos4210-pinctrl.dtsi | 42 +++++++++++------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/arch/arm/boot/dts/samsung/exynos4210-pinctrl.dtsi b/arch/arm/boot/dts/samsung/exynos4210-pinctrl.dtsi
index 70d268f9fcb1..01d30141d9bf 100644
--- a/arch/arm/boot/dts/samsung/exynos4210-pinctrl.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos4210-pinctrl.dtsi
@@ -249,7 +249,7 @@ i2c5_bus: i2c5-bus-pins {
 
 	i2s1_bus: i2s1-bus-pins {
 		samsung,pins = "gpc0-0", "gpc0-1", "gpc0-2", "gpc0-3",
-				"gpc0-4";
+			       "gpc0-4";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
 		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
 		samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
@@ -257,7 +257,7 @@ i2s1_bus: i2s1-bus-pins {
 
 	pcm1_bus: pcm1-bus-pins {
 		samsung,pins = "gpc0-0", "gpc0-1", "gpc0-2", "gpc0-3",
-				"gpc0-4";
+			       "gpc0-4";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
 		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
 		samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
@@ -265,7 +265,7 @@ pcm1_bus: pcm1-bus-pins {
 
 	ac97_bus: ac97-bus-pins {
 		samsung,pins = "gpc0-0", "gpc0-1", "gpc0-2", "gpc0-3",
-				"gpc0-4";
+			       "gpc0-4";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_4>;
 		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
 		samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
@@ -273,7 +273,7 @@ ac97_bus: ac97-bus-pins {
 
 	i2s2_bus: i2s2-bus-pins {
 		samsung,pins = "gpc1-0", "gpc1-1", "gpc1-2", "gpc1-3",
-				"gpc1-4";
+			       "gpc1-4";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
 		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
 		samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
@@ -281,7 +281,7 @@ i2s2_bus: i2s2-bus-pins {
 
 	pcm2_bus: pcm2-bus-pins {
 		samsung,pins = "gpc1-0", "gpc1-1", "gpc1-2", "gpc1-3",
-				"gpc1-4";
+			       "gpc1-4";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
 		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
 		samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
@@ -387,9 +387,9 @@ lcd_clk: lcd-clk-pins {
 
 	lcd_data16: lcd-data-width16-pins {
 		samsung,pins = "gpf0-7", "gpf1-0", "gpf1-1", "gpf1-2",
-				"gpf1-3", "gpf1-6", "gpf1-7", "gpf2-0",
-				"gpf2-1", "gpf2-2", "gpf2-3", "gpf2-7",
-				"gpf3-0", "gpf3-1", "gpf3-2", "gpf3-3";
+			       "gpf1-3", "gpf1-6", "gpf1-7", "gpf2-0",
+			       "gpf2-1", "gpf2-2", "gpf2-3", "gpf2-7",
+			       "gpf3-0", "gpf3-1", "gpf3-2", "gpf3-3";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
 		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
 		samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
@@ -397,10 +397,10 @@ lcd_data16: lcd-data-width16-pins {
 
 	lcd_data18: lcd-data-width18-pins {
 		samsung,pins = "gpf0-6", "gpf0-7", "gpf1-0", "gpf1-1",
-				"gpf1-2", "gpf1-3", "gpf1-6", "gpf1-7",
-				"gpf2-0", "gpf2-1", "gpf2-2", "gpf2-3",
-				"gpf2-6", "gpf2-7", "gpf3-0", "gpf3-1",
-				"gpf3-2", "gpf3-3";
+			       "gpf1-2", "gpf1-3", "gpf1-6", "gpf1-7",
+			       "gpf2-0", "gpf2-1", "gpf2-2", "gpf2-3",
+			       "gpf2-6", "gpf2-7", "gpf3-0", "gpf3-1",
+			       "gpf3-2", "gpf3-3";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
 		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
 		samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
@@ -408,11 +408,11 @@ lcd_data18: lcd-data-width18-pins {
 
 	lcd_data24: lcd-data-width24-pins {
 		samsung,pins = "gpf0-4", "gpf0-5", "gpf0-6", "gpf0-7",
-				"gpf1-0", "gpf1-1", "gpf1-2", "gpf1-3",
-				"gpf1-4", "gpf1-5", "gpf1-6", "gpf1-7",
-				"gpf2-0", "gpf2-1", "gpf2-2", "gpf2-3",
-				"gpf2-4", "gpf2-5", "gpf2-6", "gpf2-7",
-				"gpf3-0", "gpf3-1", "gpf3-2", "gpf3-3";
+			       "gpf1-0", "gpf1-1", "gpf1-2", "gpf1-3",
+			       "gpf1-4", "gpf1-5", "gpf1-6", "gpf1-7",
+			       "gpf2-0", "gpf2-1", "gpf2-2", "gpf2-3",
+			       "gpf2-4", "gpf2-5", "gpf2-6", "gpf2-7",
+			       "gpf3-0", "gpf3-1", "gpf3-2", "gpf3-3";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
 		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
 		samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
@@ -810,8 +810,8 @@ eint31: ext-int31-pins {
 
 	cam_port_a_io: cam-port-a-io-pins {
 		samsung,pins = "gpj0-0", "gpj0-1", "gpj0-2", "gpj0-3",
-				"gpj0-4", "gpj0-5", "gpj0-6", "gpj0-7",
-				"gpj1-0", "gpj1-1", "gpj1-2", "gpj1-4";
+			       "gpj0-4", "gpj0-5", "gpj0-6", "gpj0-7",
+			       "gpj1-0", "gpj1-1", "gpj1-2", "gpj1-4";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
 		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
 		samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
@@ -847,7 +847,7 @@ gpz: gpz-gpio-bank {
 
 	i2s0_bus: i2s0-bus-pins {
 		samsung,pins = "gpz-0", "gpz-1", "gpz-2", "gpz-3",
-				"gpz-4", "gpz-5", "gpz-6";
+			       "gpz-4", "gpz-5", "gpz-6";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
 		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
 		samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
@@ -855,7 +855,7 @@ i2s0_bus: i2s0-bus-pins {
 
 	pcm0_bus: pcm0-bus-pins {
 		samsung,pins = "gpz-0", "gpz-1", "gpz-2", "gpz-3",
-				"gpz-4";
+			       "gpz-4";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
 		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
 		samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;

-- 
2.43.0

