Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010052.outbound.protection.outlook.com [52.101.69.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E6014D7962;
	Mon, 28 Sep 2026 22:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790635102; cv=fail; b=a0FdWKCyYW2DB/n9lc8yWmJsDGkcTjwG7EFsEOi/8s4gG7ck5hU2giIYuyLu6VcbeX+dhOfXnvMdc3zSukXH71X5DG5I/hacwCvoDbuw+SmRcb8HMKjSF171SGpixMWxe0HsR0GAe48vzVGtoAIyRHyygYLuni/kFdTY5k7/hNI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790635102; c=relaxed/simple;
	bh=CYAntpu8CbzWj+IUDAq7A/SwoJwG222mPt7h4SmgWkw=;
	h=From:To:CC:Subject:In-Reply-To:References:Message-ID:Date:
	 MIME-Version:Content-Type; b=AY7zyA8f3yvsv76aUiLDJg7nXkAQGWZZfJYN70x9ydP02sN7KYTlh9sBWB1RJv2Pnzu/RSGgLK4Timoi1qrbShQ0GF5YtVs5NZDKwo8G2rZv84KLAmUVd3lTRI9QgXQ57wdVTm7zB4G+LHptwFWdfnpQgfYE0R/SRUvzf8xTlyc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=KapGH6aM; arc=fail smtp.client-ip=52.101.69.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="KapGH6aM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZVbZVD2EdwvZi4g2IwDNoOMur+iIxSueZ14TYpPr3fBXdKnW0c5EQg1i9AFwGgrID7XDLTpeQJoi5BtyimfaQacB/k1SpeD+f7ox3QxrbP1LrxCnxE65xj+J1jnjbx6pXp5Oh8ugledNf5IT6ezrCNTmbs7hrl6ALNiWWuPLbjRVame7f7DfdUdRexfObKEz493ooDo8zl+2ve6PXrEGI48rl6qZT5tN3owj1eel3OPfSd8aaeB3DADKgE/ZPz9I8KbtP7aqUZTTzWmqOk28QgH1DEf03PtCKL8gCvhzRIsyw8UrfJaXRqTMRsTtlXV8u+bhkvrdoHiV2kc7ga/BtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tvP+VrT8FiK2ImMsziQsTYjbtXhaiXfN9G5oh0W7nAU=;
 b=ftLpYzdlDAuUc3RYg5+ZajvCei6KN92yKyZ+cYqdJEuMX7w1/h8u8Bg706HT3GeKeDsLmd6Tzj0WV5BOdVTCBxi4rGe0TJFJH366VVk3A31Cpsd13cHT5HkuY9BUOE//cgmOlZQkcYTJmmhhQLKR4QdroYw1lARJmPo51jwo0s3ciU5c19gfIeJ/uZ8L4z7C8Pj/6RbKuhPeHDstnh7p4c04V0fuL7z9wjO0krcYIRQ+Gx4mXg9OV3r8J6DpfLV/5epmV75VbvW57Rygn1iaHsRI8yUJYdbPy9oZO6f7vkAJszmH8N7rf2mDVzViUbNWRfHc9+hB4i+A0KKzDJz/Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tvP+VrT8FiK2ImMsziQsTYjbtXhaiXfN9G5oh0W7nAU=;
 b=KapGH6aMKiKDY/zjKvh4BecSIuSK/W+J6LbEbA9XewsrCKhZ33r1MLgMo0jz/1Vm+votyysjhku9nE4UgB5PlWBH2bw01vRKrVceO+jgsaKezc1axvq1aCAxJ+NwsqsHbdYyk3iiWQ5r8b7CSWdkwdP0Jk2E+dOjZwB46X2ID5Q=
Received: from DB9PR06CA0024.eurprd06.prod.outlook.com (2603:10a6:10:1db::29)
 by AS8PR02MB8945.eurprd02.prod.outlook.com (2603:10a6:20b:5c3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 22:38:16 +0000
Received: from MAD0EPF000008AE.eurprd04.prod.outlook.com
 (2603:10a6:10:1db:cafe::6a) by DB9PR06CA0024.outlook.office365.com
 (2603:10a6:10:1db::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.24 via Frontend Transport; Mon,
 28 Sep 2026 22:38:15 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 195.60.68.100) smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 MAD0EPF000008AE.mail.protection.outlook.com (10.167.241.187) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 22:38:15 +0000
Received: from pc67007-2609 (10.4.0.13) by se-mail10w.axis.com (10.20.40.10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Tue, 29 Sep
 2026 00:38:12 +0200
From: Waqar Hameed <waqar.hameed@axis.com>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, "Alim
 Akhtar" <alim.akhtar@samsung.com>
CC: <kernel@axis.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 01/16] arm64: dts: exynos2200: Remove empty line at end of
 node
In-Reply-To: <cover.1790629313.git.waqar.hameed@axis.com>
References: <cover.1790629313.git.waqar.hameed@axis.com>
User-Agent: a.out
Message-ID: <58f66e4612773be8c0391e3e963c72978aba58ae.1790629313.git.waqar.hameed@axis.com>
Date: Tue, 29 Sep 2026 00:38:12 +0200
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
X-MS-TrafficTypeDiagnostic: MAD0EPF000008AE:EE_|AS8PR02MB8945:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a88dfd8-d1a3-4811-bfb9-08df1db12fc1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|376014|7416014|1800799024|82310400026|30052699003|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	N4ZJ1M2HQIvwaL+XpJ86UcftsXX5Flfkoabyiqx8iTG/74GhjqafjjmIlWT/o7kG9q+Z2XhSHUM6aJHTVtdrvaqTjlk2SlHBi1dCaSHAucOM7SqobU7d2jBEtmKrtdqpY77m76eS32U7GLbfA3RFZ1oSniitSgNXfS3XAGeGyPe2bCy6odeMhZIjHduy+l9CTENqjLhWRwf/6XtoenxLOh0umnIoLsalVVaopwrIeI/QHPd7XuhYTN7CgfhzoZXzRF7B5AUVFFR52HBROBJWSHeDPB/fTt0ozvNDG6a13lrueYxXA1S0Xo6K8XVUEqVi73RSIAFWo9F+gxg0ULOUL6Tkt7wVh1jlPW2Pvg+EdyihrmWBem1eQo+BeKRg44a7Kn3Ln/heGc3roDwZduTQJ2kRH42lZiqK+MR/9aNFfov4aP/MM4suLuefeR6PXPogRpe2ZcT74lZLob5u86BD/4hb28u+SeWyqcs1spjPc6H7SgqNbAKVmlskBvSGP3OvKKA2gsm0tvYc2bfy+bthsF3W+eXybpj3Zy8GmMbXsa+qUQatCswb4WYeexUeSeLTNpx/Qla37b7muSqaZmbnxzXSogesyKOFSNfjpRoBt07aCnFU78P3FGwRmWsqEgdjqMnP8wRaZAWL4z387j9uvTkrBAhX9nhugaXmBR+wAAmeFGk64VU8zOxQgFhFzpOOaQNgKJQiOS6fy74PimGKHA==
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(7416014)(1800799024)(82310400026)(30052699003)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	x2zW5C0Lqj6pOtzO0ka2NjFAlshvbEKeyDTjDXGXygTN8+ROwAoYBeZqCCu8+XJBSEei7y0ba6m2rmrthlNdjNFxNqKGhRuRqGm0+/O7i6ziHd5GKaJX0rXUjrgjyXRqXTyMIIxe6UKMnkuknQ08EDFN2U4dJNSwEJbf0fLsjRr90PM0udKLYtbYtDGFqhR4AZu9O9wJvkHUs1gNr8QO6xCftKluvoWY/TD8j2DQ0wXZWfnJZFAPqx4+tsGur7im+ZSXoEHRQXHW3x1G5uroVdM8/QRm8l84rVSncqrQ3UvdLVdK1oMkvHIqZJXqZ59dvpOPJMzxkbAszwD/++3ZFtRjsvDFnEREE49gR44Vnfsgb9Z3aTHSH71Y2QpiU8jTm2aP/C7bRY203N739mEIUWzbx3XzW6pvlvLxyefmiHJvcA+fzv6oNo6esW3teleH
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 22:38:15.6592
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a88dfd8-d1a3-4811-bfb9-08df1db12fc1
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MAD0EPF000008AE.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB8945

There shouldn't be an empty line at end of node definition. Found/fixed
with dtfmt (Devicetree Source formatter).

Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
---
 arch/arm64/boot/dts/exynos/exynos2200-pinctrl.dtsi | 2 --
 arch/arm64/boot/dts/exynos/exynos2200.dtsi         | 1 -
 2 files changed, 3 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos2200-pinctrl.dtsi b/arch/arm64/boot/dts/exynos/exynos2200-pinctrl.dtsi
index 5877da7baf5c4..d5aede3af15f7 100644
--- a/arch/arm64/boot/dts/exynos/exynos2200-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos2200-pinctrl.dtsi
@@ -702,7 +702,6 @@ uart20_bus_dual: uart20-bus-dual-pins {
 		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
 		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
 	};
-
 };
 
 &pinctrl_hsi1 {
@@ -1171,7 +1170,6 @@ uart12_bus_dual: uart12-bus-dual-pins {
 		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
 		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
 	};
-
 };
 
 &pinctrl_peric2 {
diff --git a/arch/arm64/boot/dts/exynos/exynos2200.dtsi b/arch/arm64/boot/dts/exynos/exynos2200.dtsi
index b1c134f223245..3b853d66e19ce 100644
--- a/arch/arm64/boot/dts/exynos/exynos2200.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos2200.dtsi
@@ -712,7 +712,6 @@ hsi2c_21: i2c@10970000 {
 
 				status = "disabled";
 			};
-
 		};
 
 		cmu_hsi0: clock-controller@10a00000 {
-- 
2.43.0

