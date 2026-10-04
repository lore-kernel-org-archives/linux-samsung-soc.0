Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010053.outbound.protection.outlook.com [52.101.84.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D6933AB476;
	Sun,  4 Oct 2026 20:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791145037; cv=fail; b=MO4/Iuyh7cMlCVl1t4XTG6Njsa+G8nLD6v8lSyv/iPGDb97Njsq3yTL9tevYuoiiytC8VvZAtWZ280+M+gyZNUG4TS8FcT3rABXMt/aYC91cyrwHBp9IPpHqhe3Uh4JRfC8SXEfKnEpeM6KNYJGxTfu87F/Dfgk02zUZFCK0i2U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791145037; c=relaxed/simple;
	bh=SiV4089K/o8U+MyScWK1pAYIiCG4UzhZjMLd7/tt4jk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=amS6dsuqmG/4jPRVI/3h2ZOeyofkprLoEumGEZb3DPuzMefRsiC5ur6feygkOuMwIzIHPSt5Qa5YRMI6B2nXlfmRKxbV01TuTlU6sJNX+KcYjyjOwhMnIZ/kyqrK3yJydbydXdmUMW69Cw6/dk87iSOtA+E2pxrkB+hdb/vuKgI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=IQ8yxsj0; arc=fail smtp.client-ip=52.101.84.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="IQ8yxsj0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=us6awqAZe/CV693HZ9r18TG1X9BaCIJQIjXLhS8qU71yVEOWdr0p2aZ5t9ZOQSzCeI8/whzMiyOGPlegnInyMCrOY0ruAps6RLQFJLSs9Gyj2c5KGsqf1D3YezBiVlqfAy1JCqcaFsohfC4PEhs5mWvgowo3CSiV8xuYeRQqwCZBd+J06y3JFasUepOepUS7kPCAnTdvZdvmYu0GJN0BPJhWTxPckVGxAbNYEVE52zq1oKeWFTGazUeGUhfA/yW89jxRC+0xrh7csI2J/qBeGwiWZFjhiO7/f9esZV9aiojZzxRn2Kx75y8UNlwlmYq5xiSmZSIJZtPH+edcBZWw6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eq8RT1A1Ec4Z2xuxY41bHPQrCOKf5uATOmpYFmS3i6w=;
 b=iiNBvyHdZumqiexM5aI5dkrBGBkKTncffWTaN9Y2EoS8iCsqb4dHQxXae45YSU3N8GYhHWFSsQCY2B317r3CbI02uU19++sQRrrRgxTKAav0yrdX04MAsABuxPo/1GZozzJVTjZ/ATdtydWxSqlSx3JHpgPDSjxLmu+XCfYDXBf+D0NlEMNUbtTZ9Jlz55OWgbLox/Rc8vX/XC+OilnFdUiTBUprNew45Nr1ubjynLEAzYDzt+OnZ3KCMnruTHM7yDM8sEI6LJCjQ5bcLPTNORWnU0DoD6SXodbxsiNpkJlW2Bx5WxskWstmwE7z6MpEDydXmoxznWkzT/WyWvJW/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eq8RT1A1Ec4Z2xuxY41bHPQrCOKf5uATOmpYFmS3i6w=;
 b=IQ8yxsj0+zwivoG6rtYpwvLSYVyeOlkYYFSldeaz7IKoQFVKr/Va3cwyyUaH3bnUd2BwsTwRD5HekniD8IIkyRg2NofOPeCvuZkpleFgMnY/Dxxe58bTF/+z3PPow+y4uI6iR75WIrSV0K/ynFmVH6OZw/zf0Qjt/QSIdhlWUtk=
Received: from AS9PR04CA0150.eurprd04.prod.outlook.com (2603:10a6:20b:48a::23)
 by AMBPR02MB220226.eurprd02.prod.outlook.com (2603:10a6:20b:81c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Sun, 4 Oct
 2026 20:17:12 +0000
Received: from DB3PEPF0000885D.eurprd02.prod.outlook.com
 (2603:10a6:20b:48a:cafe::22) by AS9PR04CA0150.outlook.office365.com
 (2603:10a6:20b:48a::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Sun, 4
 Oct 2026 20:17:12 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 195.60.68.100) smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB3PEPF0000885D.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Sun, 4 Oct 2026 20:17:12 +0000
Received: from se-mail10w.axis.com (10.20.40.10) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Sun, 4 Oct
 2026 22:17:11 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Sun, 4 Oct 2026 22:17:11 +0200
Received: from lap5cd525d1j1.sto.se.axis.com (unknown [10.224.134.145])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 377024CE7;
	Sun,  4 Oct 2026 22:17:11 +0200 (CEST)
Received: by lap5cd525d1j1.sto.se.axis.com (Postfix, from userid 22105)
	id 0D8E6803CDC9; Sun,  4 Oct 2026 22:17:11 +0200 (CEST)
From: Henrik Grimler <henrik.grimler@axis.com>
Date: Sun, 4 Oct 2026 22:16:06 +0200
Subject: [PATCH 09/17] ARM: dts: samsung: exynos4210: align all multiline
 properties
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261004-exynos-arm-cleanup-v1-9-45e435353c56@axis.com>
References: <20261004-exynos-arm-cleanup-v1-0-45e435353c56@axis.com>
In-Reply-To: <20261004-exynos-arm-cleanup-v1-0-45e435353c56@axis.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
CC: <devicetree@vger.kernel.org>, <waqar.hameed@axis.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Henrik Grimler <henrik.grimler@axis.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1359;
 i=henrik.grimler@axis.com; h=from:subject:message-id;
 bh=SiV4089K/o8U+MyScWK1pAYIiCG4UzhZjMLd7/tt4jk=;
 b=owEBbQGS/pANAwAKAbAHbkkLcWFrAcsmYgBqwrQ13U4CX1+sLs/b8TNx6JNrMY0bsd3r/f2Ll
 bwTrM8JrkaJATMEAAEKAB0WIQQsfymul4kfZBmp4s2wB25JC3FhawUCasK0NQAKCRCwB25JC3Fh
 awf9B/9uCfWIQZicW24vTSRCR9ZISENhHcA+hmm6mOHf74+JuXDjpokY8utBDnNE63BMDLzoG7q
 SZFtcgxVgb4zaGW99vVOpXw63oto1KCCsXF+NWbpC6tuaivrDxl7mB7dD9qxVm9vA1e+uY/tQsu
 nGzy0AGSWps90vPCoRW45QpgliL4Agoxwjw3+PwZvDH2Po/J3/HRUr0i7CDdVed20KYvbUAng9M
 ioPkTqTyaxuiveLroyTGvWMx4cNqrEujIlVUQlcUGP8IWZvimlLg3HyicsEhLHbqzZg6gQC6GfO
 ExjrhKmycpjPNAUKIxy2uglEAyRUsVSVsfA6yMZpjiaPQCQ2
X-Developer-Key: i=henrik.grimler@axis.com; a=openpgp;
 fpr=2C7F29AE97891F6419A9E2CDB0076E490B71616B
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PEPF0000885D:EE_|AMBPR02MB220226:EE_
X-MS-Office365-Filtering-Correlation-Id: c37084e6-60d8-4bff-222b-08df225479d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|82310400026|1800799024|30052699003|376014|22082099003|18002099003|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	UY+AE9/zvsnP/CUTEsBbm+tJ10Hx6U7hbqzbZoAhm+pbLM5x3oWbXqgx8nj5JQfHEw45MDRO3crb81034bgsL3DRM6rBEKGwAG5nXk9VWMitnzfRTMid2TynS6oN0QZmswDLC7gQ8NqSNIIAQDZpll+HuqQIVXYPCPBdyuLHwCKYECmK/18yoFKtYUPIgiRxa0+NKfai5VNPEx/2TTzQ2XlFLa08Gqe7ClR9kTr5JIOMdBtt73kv1vZBhuUhD5oP9bMHsT6Ozh5ltDP3u/cAv9BUvPUhywEX/uF0SKp17Mw6+FdY7HOJLeyGeiW0urG8XLnXR5OI/BBvqwi566ipXrL8Zo/ha4zDhBQthEwPtRLMRo5SDf0mD4kcxjiQ8PBqVYDrA+9mJXwZKPsvrEE3vbtFS4EUdM8AR1LeToC63fFvryIF0/kwnlWilWpQtUGDoJYSMY6gGTroRhQ4pWPSHa5k5H00i6mu2Fb9rOBNR043DcmyCSXDD4cm+7DeLwDTdt5udazRGO9cJT5iPJhrpSzGlD6KxuLx3EDaB/Otj8v/FDCZ+QMJncVWvL7OjKtImfs1V+1Ft7akfIbuapdwQUKH4/S09Axg9tA2HkZUDG22n5l+ktyza0OcnPrMTH5qFusAmhclhk22u0RKSkm/Xx6bb2Tmdzs1YXFyjrW+S2XpC5/ZggxXFnvBt23Aq4WsPLbKMvnwnCMztpIe4gOShg==
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(82310400026)(1800799024)(30052699003)(376014)(22082099003)(18002099003)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	nYw1MMIHrtKh9yv7p/DWHlwXK+NNJNizaRK2/bAyzvBOYXzZb34PqsKqSxibT28yhcarbVbiElk4DVkTTYJFkQWefAbhHSA/B1WGEwdbiYZa1lcNRqhQIi14ThT3maUgWqduIUXEkjXk4mIvSsq7ql1tl5afYGnu/z+p1lNCWD4wKmIF+TuGBL8uOqQUYySdyG9Qa0gkkZZ2ys0c+fq2THtvaiDbAsY8JLYNLvYr5oRcpIx0QGOIhBUbIhidTVn48+ZX4guPATYybb/cKoRXHHqeTlowQ6hQoGVBjabLvKOm2WvdMRF1JKyiwUw5bdm5l5rbKbDk5PTuGGmFY4oyxda4zcOcOBvHkUhdQwO/mtUUjKgfTlThNiYC2Fb7rCcFNj2qqTla2yjWHV3NDqHN/CL7obyzGX9dK6D0P3ZOPQu+RJOOoDvofpXdEW6s6DTz
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2026 20:17:12.6042
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c37084e6-60d8-4bff-222b-08df225479d6
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB3PEPF0000885D.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR02MB220226

Properties that span multiple lines should be aligned with " or
<. Update the nodes where applicable.

Fixes warnings from dt-check-style when running in strict mode, like:

  samsung/exynos4210.dtsi:543: [continuation-alignment] continuation should align to column 18 (to < or ")
  samsung/exynos4210.dtsi:545: [continuation-alignment] continuation should align to column 23 (to < or ")

Signed-off-by: Henrik Grimler <henrik.grimler@axis.com>
---
 arch/arm/boot/dts/samsung/exynos4210.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/samsung/exynos4210.dtsi b/arch/arm/boot/dts/samsung/exynos4210.dtsi
index 4981bbb7cf31..acb84e34732f 100644
--- a/arch/arm/boot/dts/samsung/exynos4210.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos4210.dtsi
@@ -563,10 +563,10 @@ &pmu {
 
 &pmu_system_controller {
 	clocks = <&clock CLK_OUT_DMC>, <&clock CLK_OUT_TOP>,
-		<&clock CLK_OUT_LEFTBUS>, <&clock CLK_OUT_RIGHTBUS>,
-		<&clock CLK_OUT_CPU>, <&clock CLK_XXTI>, <&clock CLK_XUSBXTI>;
+		 <&clock CLK_OUT_LEFTBUS>, <&clock CLK_OUT_RIGHTBUS>,
+		 <&clock CLK_OUT_CPU>, <&clock CLK_XXTI>, <&clock CLK_XUSBXTI>;
 	clock-names = "clkout0", "clkout1", "clkout2", "clkout3",
-			"clkout4", "clkout8", "clkout9";
+		      "clkout4", "clkout8", "clkout9";
 	#clock-cells = <1>;
 };
 

-- 
2.43.0

