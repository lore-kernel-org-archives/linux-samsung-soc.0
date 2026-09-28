Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011038.outbound.protection.outlook.com [52.101.65.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2605C4F85CC;
	Mon, 28 Sep 2026 22:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790635113; cv=fail; b=KBDmeO11E0JF7T+DVoc7mT4f/5tMob/GVWUlIhn3v6VgjbXN+Fy0Imfl8irYPOJOr9Wy2DRGerCNQd0xINQvcPLuCJOV6U3MA/eCzxIse/wV7eAq8a38ac5HeN98yBAObBe6P29p7WesXSFt19kzhdALp3LkfkRQ31HYIlSdXks=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790635113; c=relaxed/simple;
	bh=4iKUdiLhqC9UmYoXg1vOIv+iPM4V84Rc4HkRO4EcpY4=;
	h=From:To:CC:Subject:In-Reply-To:References:Message-ID:Date:
	 MIME-Version:Content-Type; b=TgF326tE2PYw5buLNBRKHwZvmjnRNJyjRgN8VKbbF17tD8Iwl8Q4HbM+LRP5NBYu7vcCp9KczvmjU/Pa93AX040ME/fFivbte3wHnvrNuLLJUmzkxoaHGFsuDA1w2tLMXBJGihcLe8KeSTEy2jMU3cgipRw6+TaMv88h4Q6YuE4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=YRLaWgIt; arc=fail smtp.client-ip=52.101.65.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="YRLaWgIt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aTWMHjfS+8G7Su0aeDTK5v534eT+VtLSNMDpXR+HmFnvvXnetvOv3DgnPm2POCzbHnwzZZmP5p8oeAOJavKaoNtH892bwTiv8Kl6BtpsU9k36QiEQPMWl+kl96DPcxLyscAUIkNIFjmzlhlV/5hFBVFvA95/dKWk5mGUmyZS8TmtPE7f0cbZQ1PcacAt9GE54NO/RaOywgMW9hD6lMg0KAzcqnJzzlblXyGa3xLue7DFJf14Cs0Z9LSt4RGa9F7fWiL9A81cQX7uQvEK1zNqpCygQX20jXO3s4BOFo1U/hS6E+ow6bG6z/e+fhXBxY1quOHb7TRE1QqFuVUZS/ynCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NMe1MX6Rl/SdJJ6T4GriaJvF7I25wUHOrxBNxR56WsM=;
 b=VXTE2/9b5eJqlUfhWN4Tflk3TTVdxG17LbpYmNXTe1OAAF2BrPIvIjgTEpxamRiaOcJDwla3fnugfCGtyvk9Tn8BWrKGfPJH35AhwPceFsbAPDtHuI+h68Aa4+9v1sr7LGyP29rGoCq8hl82EAbavXaMS+QcKzTZN0xUGSjZip5lARPGhJqVeNi3z+v7KZlSeoRVnO5eJTPc6w068GFaOE9IKKeIUstpVjO0f7HyuUbDKWhfB5Asf+VKULUs+hU2pQbMSb1DAxEB7E/BvqQ1j+R4176KuLCo0rbm/E9T4faXlUxrKYRSUe+vg8qWTgkPzn9X6lamrMyfe2Kod3EZDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NMe1MX6Rl/SdJJ6T4GriaJvF7I25wUHOrxBNxR56WsM=;
 b=YRLaWgIt+02C0NfUCmOfvSbiJ4GJF03sv455aYqggtH+NZFLGVNoJnki71/HfG8iOHtKTx7++TpzSI7xubi/47ch7rbf8nz3Z77IrGweO41XTK+tqo6OKA+1fXgtI8x97Znyqu9Wpz8N6hL12g/jhYfVvJLAp6EmhUsYoLaDQI8=
Received: from DB9PR06CA0026.eurprd06.prod.outlook.com (2603:10a6:10:1db::31)
 by DB5PR02MB10288.eurprd02.prod.outlook.com (2603:10a6:10:4a8::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 22:38:24 +0000
Received: from MAD0EPF000008AE.eurprd04.prod.outlook.com
 (2603:10a6:10:1db:cafe::2d) by DB9PR06CA0026.outlook.office365.com
 (2603:10a6:10:1db::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.24 via Frontend Transport; Mon,
 28 Sep 2026 22:38:24 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 195.60.68.100) smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 MAD0EPF000008AE.mail.protection.outlook.com (10.167.241.187) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 22:38:24 +0000
Received: from pc67007-2609 (10.4.0.13) by se-mail10w.axis.com (10.20.40.10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Tue, 29 Sep
 2026 00:38:18 +0200
From: Waqar Hameed <waqar.hameed@axis.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
CC: <kernel@axis.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 06/16] arm64: dts: exynos7885: Align end of node definition
 brace
In-Reply-To: <cover.1790629313.git.waqar.hameed@axis.com>
References: <cover.1790629313.git.waqar.hameed@axis.com>
User-Agent: a.out
Message-ID: <043442918a9816ac64e6cc8713840f7a772c870c.1790629313.git.waqar.hameed@axis.com>
Date: Tue, 29 Sep 2026 00:38:18 +0200
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
X-MS-TrafficTypeDiagnostic: MAD0EPF000008AE:EE_|DB5PR02MB10288:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f74a39d-a838-4ff5-91bb-08df1db13500
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|23010399003|376014|36860700016|30052699003|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	OxfBmEe1iiuavKpNTkWLWsG6ViNpIRjs44oeW2ZQMyoIq3ooJZVD83rlt114gwGEcM7VoOMKV2c8+MewW9k/IBS3vxahziJO6vWAON0gpCgIn1M6GRu30M2MKSsi5oFKZKXzcxt4KxTEr9ooK9g/1gMzKgnSRh1pwWQFLlS55du+q5A7bw7h6NsbD7IyZC3ZBcgUC/bO5irS/NbQ+O4VIrhrgHlqfJEWdra6oyQGSZwqbkW2IFWrLbrW4sT/JfLDbees7w46oYQNTAC7BlKpk4Xj5qP9Pfys/v8uBduVS4vCixXtiIdEp3BL+ACEBjgw/dTSNBQH8azVthxYecWmoV1boqEbg+VAxtLWK+M4v+Hkh2Jx7v/vW+Q8I7i7RoDX+W16zlxnRf+rMT1OLscNKpBLEX84GPJE9Gl2Ayjgf8XZ/hHk4u2fhTFOfRrCE0W7NpoF0d7D5xObUrC+EplllLxdeA/hP3M3EbuNthzGSwHVrcGlDIGDvgDJNqoSqRMyWs6Vqomll+F5XkuGUlV7PnYXngnnxt9AqKbLwVFI2W0nrh7qLvnAUQfc2nJU3pJpltDCAORhFRRQ2C8CkIFv8WAnBjQdjIRIEK9ir78vYxst4JqYjBIDho9DXji0Nkass4f5hcOA+T1ibQ3If9iGFg4r80amDc3NliMkajwBCb7Jb17hJiG5qypi+MJ4BT96GkbeJb7vPgyusmaXuP+QHQ==
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(23010399003)(376014)(36860700016)(30052699003)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ADi6JwOmRbDljuXg/VJcPEiQGnwGNA1nJ0i/E9LQJz4sGjKlBZrLXYzOBtkHuEM9mVdwNvK8P/Q/zRDOaa3lKzDm8xVxKFi6UtvzMNAAgGXucCSueKXC3e46BZedoGnJtmdZQO28GWceU2/mexSbkljE1tnUrXWssUL7VRy0a22UnHXg2Ff35oEULKkyuYZAzT54XxiV2+KdcTnO/H+7FHn/VR8SY5yXcjkrPaOQicXYXAbfoCB9JLfd35h/4W+zzE99yvPoboQY+onNwlMLczNjUxErrRXi0Gurl/uIjtE/pIkYRHomYYAsC7XOxkf8wB7GZO8cXzsebopHurdXgKlbzYWH/cNk7edwvMMauw5QIpC0fBqWktTZgDyuAQAzUKJeLNtJGq6rj9CqxSz+o/Dj/CnaR2zkfSX7qcXW7WarVueS9DKnFgOiOuuNP86q
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 22:38:24.4478
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f74a39d-a838-4ff5-91bb-08df1db13500
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MAD0EPF000008AE.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR02MB10288

End of node definition should be indented with a tab only. Found/fixed
with dtfmt (Devicetree Source formatter).

Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
---
 arch/arm64/boot/dts/exynos/exynos7885-pinctrl.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos7885-pinctrl.dtsi b/arch/arm64/boot/dts/exynos/exynos7885-pinctrl.dtsi
index f4c89cbbafe70..76fb239e4322b 100644
--- a/arch/arm64/boot/dts/exynos/exynos7885-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos7885-pinctrl.dtsi
@@ -809,7 +809,7 @@ uart5_bus_single: uart5-bus-single-pins {
 		samsung,pins = "gpp8-1", "gpp8-0", "gpp7-1", "gpp7-0";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
 		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
-	  };
+	};
 
 	/* USI2 UART_HSI2C1 */
 	uart5_bus_dual: uart5-bus-dual-pins {
-- 
2.43.0

