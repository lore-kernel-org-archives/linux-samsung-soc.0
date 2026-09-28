Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013052.outbound.protection.outlook.com [52.101.72.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A975013C7;
	Mon, 28 Sep 2026 22:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790635118; cv=fail; b=czMLprk4Ljlwqqae/0XIAIsMjX6ftrVRLhYce61EM5pXXqkbtuLAp/lvdp/GlTZh1qiTLUaLvhEPI8H0FsG4iDF451Q9iwi97I1HS8Z9OenwejQnabrI87KJ2IXJ0nc6R+04z2jbBm28AaX0BCM4OHp2CRb23kV3tjR5yOIRtDQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790635118; c=relaxed/simple;
	bh=aCf1QjXv+ec0kTs4fckiXU3thrdrUNbwVSHgu1TZ+14=;
	h=From:To:CC:Subject:In-Reply-To:References:Message-ID:Date:
	 MIME-Version:Content-Type; b=ZK4eltUKvrDOY33BBgRtwNNjU8XtuBoCzCsHs+KGMnQEllyZpjwt/icfKZQh/UOekzMV1R+6LKTTrsVUzq5NmucM89jJsSlQ+QpEHgC/xD2Edn89wC3nKKDmp6AUg+LMkDXwD2ySmvDGg4bWS8PMMXTO9ibffC23pOHiB+sJj50=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=UE8dZ03l; arc=fail smtp.client-ip=52.101.72.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="UE8dZ03l"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A5LyyXmML6hB/tPIfIo45bB2mou4+j14VPxMzgcFXUVl7YXbLjbLDMZcWm+Ljo3PL7iRpYV+2jkO1YdsLVQho5NIu+bgkeM3WWyIOx337P7rZmcqw19UX2bLBjTn3Pwkg+Bciu2M1YM82QYNrO65qgQbLTB78E/lCsYVuJgRRCzVf8cJsyQRZWmZW7+r2zqMTEZOb15NEk+VvwFvyMdgmzTBrU0y0L35y+crIh9bApXxuq2N2BawaFncfBiW2Q7GRg0ZjwuOB5X1IWFXChTQYutTuLj1wxgiEbpMRlbT0b0Nx2Lk16V33mVmsV/kzR12jMAS6X81Yzs6zosQuNWDcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fpGyM7JxTuwngdr0XvYQlCMPs99lXk9dDA2T6OWufd0=;
 b=xmh72Qcu8LsOI5zku98AZJ3Ajo6fG1380ppbbD9VFijGj/nhgEaHBNlcza1rj7YClWmp9DvNg7IMfz0V2LgGwLQdNdZ8YDIi/mrjiFTJgJJwZQkmBcgN5GBIuAar9iBywc9wiPinweWPZmkw/4YHQJJESd/QNhVIhHme8s5pGC6q/Wi92PyNo6Eb2Wj2r++djI1bNYz+ZIO45hioqwB4S90DCG2RY3gSmjqEtQBXbzSPEBvS9cR0NrssQkluUTrVN4XDC7lAe0oCs2i+MlqVtMbzSAKtqdc//nCUww4kQjHtG3YZyB/WRzhv4+7thbdd4CBHsrZNg7xHxBWR/30CvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fpGyM7JxTuwngdr0XvYQlCMPs99lXk9dDA2T6OWufd0=;
 b=UE8dZ03l+20JSEo53CTqZqoIThIyE9KhiGO+moiPSIIteT6fCkcLIHsQorVI/A6Se5CqCtk545/E+KsxsYa1i6wul5JSJlKaYF5n20EGwqmkjvwMe5U1iFUTO9HFF15hjiDsHMMfpW6u6hyAdDLshASOkNu82Uh+wxnAIz29VZU=
Received: from DU2PR04CA0336.eurprd04.prod.outlook.com (2603:10a6:10:2b4::15)
 by AS8PR02MB6967.eurprd02.prod.outlook.com (2603:10a6:20b:2b5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 22:38:32 +0000
Received: from MAD0EPF000008AD.eurprd04.prod.outlook.com
 (2603:10a6:10:2b4:cafe::2d) by DU2PR04CA0336.outlook.office365.com
 (2603:10a6:10:2b4::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.23 via Frontend Transport; Mon,
 28 Sep 2026 22:38:32 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 195.60.68.100) smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 MAD0EPF000008AD.mail.protection.outlook.com (10.167.241.186) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 22:38:32 +0000
Received: from pc67007-2609 (10.4.0.13) by se-mail10w.axis.com (10.20.40.10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Tue, 29 Sep
 2026 00:38:22 +0200
From: Waqar Hameed <waqar.hameed@axis.com>
To: Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>
CC: <kernel@axis.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 11/16] arm64: dts: exynos8855: Use tabs for indentation
In-Reply-To: <cover.1790629313.git.waqar.hameed@axis.com>
References: <cover.1790629313.git.waqar.hameed@axis.com>
User-Agent: a.out
Message-ID: <ec5d162096fb399846349442adccec4459cfdf3f.1790629313.git.waqar.hameed@axis.com>
Date: Tue, 29 Sep 2026 00:38:22 +0200
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
X-MS-TrafficTypeDiagnostic: MAD0EPF000008AD:EE_|AS8PR02MB6967:EE_
X-MS-Office365-Filtering-Correlation-Id: c3588592-a901-41c4-f225-08df1db139b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|30052699003|376014|82310400026|1800799024|36860700016|23010399003|11063799006|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	IbruI9K5fnkhvKEo5D0GiwNlEw1fQ23CPMQOYIxRde3pVa6DEOTDVLMMNEVZ2SC9Ux2NyEdurKiSKe78S33HN4orL8BG5H8tdSjBu/jz0VPPNe/V8h+Dpg/oU5INBImjBdVqm+uXxv0kI7I8BaGQ8lXrN+ETsg4qlcY49VA3lFXok7B1LMJHjMBj5Aa1iamfvUX4LX2mrFsOI3qLkVIxo8mtKeSsxp9v4hT3ypiAjGQioB6uKCR8gc2cWuxUNNf6TtO4qHZ1CFMwtn0qwg6hEDbh6L+qTlKwUUBcRxON21VVRzkpMFtpNOZLNeIvr/cZMpABLniqf7++LulMYvTjzeN2uyjvf3NpQQjkYpA0xBjOkpH3ogIS3UdSyqG5P5Wq62jAir6nltWj1Qsk/cGIDiVhRBV7inrDNEIh76SJNQb+lv4gBNEA6MVvbczH+MctJqPo+pPaivtwELnzA2kESFucbm2T3MN0auwQR0FgxAutzDPKQXtmiAVrvSMwhxk3rxnOS7Ot751aNK5NtKfohA3R9N5yMSQIoqHCFsbv1JHrS5wROcFTv8ByU3ywe5hkHuyCcj+YCRceD/hP56DHdblRitduLgpBPIdsHS6xcYUBUPH+9PZ2VSHrc3o69q7vKvcl9KLNXwfvAEEy3uZG6nXzdJPsVGL5dR3KvL7t6wCWG/eteG8u87ZAm5sdm3IPoNTd3ROqu7WCXOMxk2kcNg==
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(30052699003)(376014)(82310400026)(1800799024)(36860700016)(23010399003)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/hR2ge8SuixkGUU7k+tspb4RuLkgTGVZ9iEODy3PpKf010K8yKc97xcEYIHes6i6O1FF/qBvijs2wyDsR90BqbqwJwcpj9dEZIy05R2hGDf0UG0HCCkqJ4JujzwMq3lGSPl0Z8hOuc7zrCxIWb5kyCTdERgl+nrHByrzi5NveCYbrQcw5ygcdEM10fx5PSMJAuwxhf4Ccvt7xmJoJXpfA7AtELh33gFNW2JjXdtbJOL7c1fFHfB+7zs4bh8UEL6z6UrpIDLJpSh8gdwhB6iL6W/wBlayrzccZyF3wbkTAQ98S3d7BEdlF4TtPo7U3JhlB4shZzGzKK+cJkLjmvjx0pE9/c6qQIO/p0mMiGG227Fm4TkjAGxm2/GOVtBLJnFvlXzJVuZxuzWrW34/wrwKJnXxWxTenaNt/8c2kOE0438aQBEw/lX8YvUvWIIwB3I4
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 22:38:32.2820
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c3588592-a901-41c4-f225-08df1db139b0
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MAD0EPF000008AD.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB6967

Tabs should be used instead of whitespace for indentation. Found/fixed
with dtfmt (Devicetree Source formatter).

Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
---
 arch/arm64/boot/dts/exynos/exynos8855.dtsi         |  8 ++++----
 arch/arm64/boot/dts/exynos/exynos8895-pinctrl.dtsi | 10 +++++-----
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos8855.dtsi b/arch/arm64/boot/dts/exynos/exynos8855.dtsi
index 0333b80eba845..e43d26d716552 100644
--- a/arch/arm64/boot/dts/exynos/exynos8855.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos8855.dtsi
@@ -199,10 +199,10 @@ timer {
 		compatible = "arm,armv8-timer";
 		/* Hypervisor Virtual Timer interrupt is not wired to GIC */
 		interrupts =
-		     <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
-		     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
-		     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
-		     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
+			<GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
+			<GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
+			<GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
+			<GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/exynos/exynos8895-pinctrl.dtsi b/arch/arm64/boot/dts/exynos/exynos8895-pinctrl.dtsi
index 16903ce63a32d..4510b39c5e401 100644
--- a/arch/arm64/boot/dts/exynos/exynos8895-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos8895-pinctrl.dtsi
@@ -111,11 +111,11 @@ uart1_bus: uart1-bus-pins {
 	};
 
 	wlan_host_wake: wlan-host-wake-pins {
-		  samsung,pins = "gpa0-7";
-		  samsung,pin-function = <EXYNOS_PIN_FUNC_EINT>;
-		  samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
-		  samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
-		  samsung,pin-pud-pdn = <EXYNOS_PIN_PULL_DOWN>;
+		samsung,pins = "gpa0-7";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_EINT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
+		samsung,pin-pud-pdn = <EXYNOS_PIN_PULL_DOWN>;
 	};
 };
 
-- 
2.43.0

