Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013015.outbound.protection.outlook.com [52.101.72.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A2949AA46;
	Mon, 28 Sep 2026 22:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790635107; cv=fail; b=Dc/9/5s3UDhAsTCDhcB720X4KeHjxwmc9fxjsaYKnUdP3P8QHBkABTqhSgMfZfE4GYplinYbMxBEyIVa7tqA1+hy++ytYE/wn3mBtH+ThwA+PXV3T8bO5PbVpTVS8F/Z7c+owL8XPw9OZ38WacWhDj08TwwWKzbPqLpKny5HhvE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790635107; c=relaxed/simple;
	bh=x6U9/DJ+HUTScptCLKND3Q+p9Ku+zp8V3+NNzqs1mHY=;
	h=From:To:CC:Subject:In-Reply-To:References:Message-ID:Date:
	 MIME-Version:Content-Type; b=p2ubQLvryXvVkc7pZbk6YcuDiZpc6fvjp5kZDD4JRNDR1Um1qZprfJYr8BJ9WjP8JV70Kau2sszAyaWuncv0CeK+pjZ93yuIK6p3JoBKquud/jvDYf0NGP5LmLh8/8qEmAJGuWHKgHEK5hIctp70u7r+Up1lvyE9vyjb5DdjA8s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=p+gIlW/0; arc=fail smtp.client-ip=52.101.72.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="p+gIlW/0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oeJ3ERYfp19OSDxRjonFHhbLJjYGX4ZHRS8piYzoTWs+4zqT1A7estSbm76xdRzUDNH5WEpd4XgIzwbf27WI4tEgdzsxltwZAN2Pm2/dWw/zcoPB3BJtiNdpijtWeApOUzINCLn9pTyvPgaMK0b0FoTHkVQ5tO5hgQaXE+EhhcTY+pjbqoF+8kzplLFhTrM0hgAXV5IWIMPvFpGJg71t01HtlgnKHNxhXsflBBH/lZSQe8amz0FuiIQBvla7+EF05/qwZVhG+vFQZTKD009R77y+rmyEgao/QT1tEXl2NFHnSxNPwxsNurfl0nt0C5vP2++KN3gdOcwkO3/lusgHrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KvZSEWy/8jNLUWtvHLPNDjjziAiWFbV47hOD+6BBj2U=;
 b=Julu9hvxzsxgRP/CVnHEMn8VaeUDzHYWKYzXVYvofcMLY27s+rurQ1BHL0E41ZKOEKnMlrLHgKXiNUhL/UdW6L4zd+xiSxqrccX+h+KIyxTHWaYzqc4ATiIN/0CRNGikPTSwk2c8b9eXD7v49SX8Wz/K20Ct/urTbFpcQhk3LWgy8H5hMXruNWoWvFTbMvnGBoIiJe4UIIDLci2hC/fgwOQFtVXSb3/uZ8P6cdzlNj3FPRZL1nLP0FmBhMEgnkizgdYHdoJ+j7OgP19XvZA0zARP8IXB7MRfqjHpSWWSwoDEtuBFnTb6MA37cymhTXdNWNEXj2tHpsaJZcte7oq+2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KvZSEWy/8jNLUWtvHLPNDjjziAiWFbV47hOD+6BBj2U=;
 b=p+gIlW/0vJ9oEiHMeZ0c/5ggA1G1XZw/86RW1Rv5B3lMwI0ppQD+y5Vha6Kutzq4X3vaC+pB3vWrqWlQeu6Fr0t7zfZ1BPWwSKMj+xs6CURvhTxJQTg4L3SMbCx1QOwjms6lM2CtCKUzToF/FJG2bJSJcvYjHw2l9gCDAcNI3wE=
Received: from DB9PR06CA0019.eurprd06.prod.outlook.com (2603:10a6:10:1db::24)
 by AS2PR02MB9905.eurprd02.prod.outlook.com (2603:10a6:20b:60a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 22:38:23 +0000
Received: from MAD0EPF000008AE.eurprd04.prod.outlook.com
 (2603:10a6:10:1db:cafe::94) by DB9PR06CA0019.outlook.office365.com
 (2603:10a6:10:1db::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.24 via Frontend Transport; Mon,
 28 Sep 2026 22:38:22 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 195.60.68.100) smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 MAD0EPF000008AE.mail.protection.outlook.com (10.167.241.187) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 22:38:22 +0000
Received: from pc67007-2609 (10.4.0.13) by se-mail10w.axis.com (10.20.40.10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Tue, 29 Sep
 2026 00:38:17 +0200
From: Waqar Hameed <waqar.hameed@axis.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
CC: <kernel@axis.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 05/16] arm64: dts: exynos7885: Fix format of line comment
In-Reply-To: <cover.1790629313.git.waqar.hameed@axis.com>
References: <cover.1790629313.git.waqar.hameed@axis.com>
User-Agent: a.out
Message-ID: <49a174e1bb4d9418dc320cea6f534983ea4251a3.1790629313.git.waqar.hameed@axis.com>
Date: Tue, 29 Sep 2026 00:38:16 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: se-mail11w.axis.com (10.20.40.11) To se-mail10w.axis.com
 (10.20.40.10)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAD0EPF000008AE:EE_|AS2PR02MB9905:EE_
X-MS-Office365-Filtering-Correlation-Id: ea9f0725-4da4-4697-f23d-08df1db133ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|30052699003|23010399003|376014|82310400026|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	c4oV85fI121w6T2HV54v/2q18547Fg7nmiVvc/h9S4Ys1cuDor+o36DqGckzo3UaWCJnMzR2smtsf2yM9BPpJT/uxv7k9Sx+DTZDheRCM6JEvgcPw/NBYtf8uP18Oyfs+lKu6Ui/yj3DbS9gsFUezQD9It7gjf7OjJJhjQbsNjKLd8JnZgfYJseZPCvy3W01dTnQPr3fZAQO+Adj2zGfGnh2GdfkWi3sri19A1MDyuenbkEOSubV2fNWVBRJmjBgxbCzVhy7JO6nyGBilJxFlN2edxgc9tzBoLe7UOGzuHbbd1v4ROL32PpNe3iTcgwZUZK3W9FV665dRRz42l7xv4cXnq9F5g/KY6UiN9RVX0YZfDP6ofQo6h5C2yhi1lki0YHcZ8OIxB1zjqNyhYqTOOrYmyecBMJR+axeTgbhXJh2A/DQIErDFA2I7yWbadcndb6+rEej9Wo3wVCk/yYwj0s0P/sEzeFO2eAuDHrDRn2vlzNT5UDZWiZFqQ7/1oSXacKy9zgUENnY1MWadPKh23Sxzb061A5KdV2UYUykV82XXGz2BuL97Ezcz8uNDVB06QrX7PWo+fRY6X2/nx3WdLfQ7vQqXbmwtNwcf8OY1yfphu8wrNybSjqPhD1jJMSAXDL67B9Ichwq89xFlFCKzDlgm0z6HKf30oI8WgWNA3XkSLg1ZYtEqp7C5wBw4+zk6GdnL7XGF2VaTjDO4dt6gw==
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(30052699003)(23010399003)(376014)(82310400026)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	2rFyFpLEbKAesgDkgQcI1zJpo3L61UGb3WuY02Z+c1Bm+uZs29U4jlqEFL4a8AJW1yZd8bQ0vurDwjdlQknyqHiF0JkzAWxCoNp9XuMsTmOsdH8Yj3DE6pFHq0B7sICAriOk8Wcki1oytpVnqlL5NN8mzaJtik5bylIoOkfo31rydUGeCYN7+HrF0tSd2ri2M0VJGsBJh6NVHfN9nyJQqR3v6mC2hFNH9zphtm+PzXeSA7u2VO0XUUuGWMFQkaUt8aE13GB7XaWPfvekHmKAF04cxck0qhktSIkU3dOtTSqgIrrc0OkkS+JZVBcLnlI+PLWCMkbXzkp3WnGtHFg/OfFGJV34azn6SNEJWhMibkxDZ4xHntw6+MGevzOcGAxFrOyqLUHGHJASlThM+OM2nDfgkI+FG6Htntz21JiwotZo1M52DzVGdL/wpD280fuW
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 22:38:22.6595
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea9f0725-4da4-4697-f23d-08df1db133ed
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MAD0EPF000008AE.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR02MB9905

There should be a space before ending comment delimiter. Found/fixed
with dtfmt (Devicetree Source formatter).

Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
---
 arch/arm64/boot/dts/exynos/exynos7885-pinctrl.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos7885-pinctrl.dtsi b/arch/arm64/boot/dts/exynos/exynos7885-pinctrl.dtsi
index 34bb121919556..f4c89cbbafe70 100644
--- a/arch/arm64/boot/dts/exynos/exynos7885-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos7885-pinctrl.dtsi
@@ -638,7 +638,7 @@ uart4_bus_single: uart4-bus-single-pins {
 		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
 	};
 
-	/* USI1 UART_HSI2C1*/
+	/* USI1 UART_HSI2C1 */
 	uart4_bus_dual: uart4-bus-dual-pins {
 		samsung,pins = "gpc2-5", "gpc2-4";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
-- 
2.43.0

