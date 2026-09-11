Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011046.outbound.protection.outlook.com [52.101.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE7CF43F4B5;
	Fri, 11 Sep 2026 11:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789124957; cv=fail; b=nRHuoeaR1MifwUdU+YSJgl2AA+TgRU75xrNjimNuVdsl+/aDXoAx1NASH+XHCucemBD1t7bzjyrujpVxXbD6yikymwS7xMCyk6cO0oxhFRI5ynfSza814HMLZOiu0YbLbPlrY+nMGK7zD/o0o2kbQT2yttShS/KJdVzIP60wtX0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789124957; c=relaxed/simple;
	bh=GrxnbKiSeWYod9palJtSHXPuyMVhqeA8g52RWkaZyHY=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gubl2BWnFA/ioSQ3JqyqBLTP0R1vjgFIBTjSX/8xewNvSwrfpQY3BpNLFJFVn8g3XlotmDhv7aNwkBNl3Onx69+eNun+vSzapI1ZdyzVR8668YRqoqRxQNi6Gi3JugrKZQqqJXISvrRp9yi4VaN7ZBXoFq+v2uGrS4+W7eS3AIw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=eLVrNe3Z; arc=fail smtp.client-ip=52.101.65.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="eLVrNe3Z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PpSH9gMmniiLfMrBkmvoiAdPjlV2aplHN6Z3qqgpyFDhu05tBLnUuFA3pApCxJiucq4eqSAqEUP7iuVNJHtDPsNrbNiWoYqiybrBquE54MwVhnIeZmDWBqUEJb68dLNbxFNm34s+mad0o9sMRUjqzEF05PfXeoZcNvBtKhWaZsiaNcAB89eZUb8tXswJp4xiMg+PPXbuYyXWDB7fpN8fHLoE5rdXIhuNAfp+hAoNC7kxA97uBUAxi3cD1P1Fji/UUGaktjrUzYWtOO4ZY8jNgKtIJxO0mtJSiOsDjURsx3surdPKR+5N+X3kBBbCxkdiAR63Y+yltmU8oJALPJGB2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y5oc3tv087zkgUmMijoPhVa50M2i+jY4rSWrvQv9Ca8=;
 b=C+yB9pqPb9k11TY2IJ8WCTAdlEMSYHc+3WzNnt/S/Pc6aHsUuExZb6vJn3Z2JGr7ccyBl4K5YdgP1IJgznnrNvpS31ClVuUwQeyvtJHbJ35gFnxAWXcIgnmgMRqGpjpCFIYiA7kK7OLHeQEM0fMkCGiLKHQF3P8JhuBUYHaNaksmvR/u2UC+DrIoI9VDyJ6lYr4GVq3KSJeK1MJLXcecO2estkTNM9U4YW9hJC9LDti6HCFhSyAVSWQik9Ksv3DkyMUta5FSdIV+IX4lt3CtWd1X3Pja8MobWZnBAEK2S+cxLBad1Qk6TdNNZGdBnyLzpiY9rGGKIecnKT7KIm69eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=gmail.com smtp.mailfrom=axis.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=axis.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y5oc3tv087zkgUmMijoPhVa50M2i+jY4rSWrvQv9Ca8=;
 b=eLVrNe3Z0TsE3xoF7tZzvhgSqcFOMSge2Kb6fAjrQR/SP+/1rgZQSZqjbDpiP4k4MRqcp+RurtBm95LXj3M6+8+okYrt0Yer2OMjRMC1lYR+6D3l7fdqBAEqDz2tJIcUB+H84TolAvXmcwLQhsOkerP8yx74GkAA/RNm1FxUs2k=
Received: from CPBP307CA0018.DNKP307.PROD.OUTLOOK.COM (2603:10a6:380:2::15) by
 PA1PR02MB11982.eurprd02.prod.outlook.com (2603:10a6:102:567::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 11:09:07 +0000
Received: from CPH1EPF0000051E.eurprd04.prod.outlook.com
 (2603:10a6:380:2:cafe::24) by CPBP307CA0018.outlook.office365.com
 (2603:10a6:380:2::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.15 via Frontend Transport; Fri,
 11 Sep 2026 11:09:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 CPH1EPF0000051E.mail.protection.outlook.com (10.167.241.233) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Fri, 11 Sep 2026 11:09:07 +0000
Received: from se-mail10w.axis.com (10.20.40.10) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Fri, 11 Sep
 2026 13:09:06 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Fri, 11 Sep 2026 13:09:06 +0200
Received: from pc55637-2337.se.axis.com (pc55637-2337.se.axis.com [10.88.4.11])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 54BC422BC;
	Fri, 11 Sep 2026 13:09:06 +0200 (CEST)
Received: by pc55637-2337.se.axis.com (Postfix, from userid 363)
	id 5290E6035BE2; Fri, 11 Sep 2026 13:09:06 +0200 (CEST)
Date: Fri, 11 Sep 2026 13:09:06 +0200
From: Jesper Nilsson <jesper.nilsson@axis.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
CC: Jesper Nilsson <jesper.nilsson@axis.com>, Lars Persson
	<lars.persson@axis.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Peter Griffin
	<peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>, Tudor Ambarus
	<tudor.ambarus@linaro.org>, Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-arm-kernel@axis.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 02/10] arm64: dts: exynos: axis: Re-order properties to
 match coding style
Message-ID: <aqPhUo5Ird-Ru1TQ@axis.com>
References: <20260911-b4-dts-samsung-cleanup-strict-continued-v1-0-9aa55051c42b@oss.qualcomm.com>
 <20260911-b4-dts-samsung-cleanup-strict-continued-v1-2-9aa55051c42b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260911-b4-dts-samsung-cleanup-strict-continued-v1-2-9aa55051c42b@oss.qualcomm.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CPH1EPF0000051E:EE_|PA1PR02MB11982:EE_
X-MS-Office365-Filtering-Correlation-Id: 47a0a6c7-95f1-4edf-27e1-08df0ff51932
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|82310400026|7416014|376014|36860700016|11063799006|4143699003|10067099003|56012099006|18002099003|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	N/NopKbur3I2I8HAXiSac0jZeqNG/33JhvlBZDoz4z0su/LFvy8aUVVKfLw8LKyoXi563KxmwnI5K5ZAAcFlry7b3D8pFpkG3dsUQSryquzWH02ifE1MkskBrlxLeaRGzaHbzrl+cpQRyuRm8vLNBvnbjLV0i/KDAnGGL8K9w5Vli5YNc0qCdoV+3f7dK+gY8EDL9hi+8Vuhqbj4id7EEGsTffRiLwwTLIgMuGXzC3+/1o/Kl7cb2EM1/15t1ImESJNQv32w9JaET+J9OwNSoJnXKnSy9+W7EGDzfFO7Bg51sOIp1ukN87nWNaE7PZoF11z0FAwO2lHSOpe4MKNFVNtOM+Vu+K5CezWKKfOlEuVPIy07iQaHazOlNPtN0U8xKn4rYDBIPgTml7cyEBMxr/KaHHXjI443S+TnMd2dmKTIr3CRSHdhQeCUs6WhpsgnpY0FzjsfPplyHiEyosOx5KQEQomLX7/BAN1Rdzc8sUEIGECiu3V3eh5WAPXKRnww3gXfJ0ZGSuCCzC9Y/dfdXWhMRFZyqc7MMyfK0euawROTeZkfnuhlhTXIpmjJk4D3PpBRpFM9DMpr+wBBbweT1jMwuMLkbfyowoGSOetrnacYFz/PeG8zRqpydUVY/70JVWCwfRDt3YFLtntsew80C7ZKm+EIdRYm84fRVMSwSdAQlQOsUV1lWDo77cZkOpfzUFAfH/LFlUsIjnlYafvCHg==
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(82310400026)(7416014)(376014)(36860700016)(11063799006)(4143699003)(10067099003)(56012099006)(18002099003)(22082099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	DZf3TWJZcCpiJ0FUar4Xq90Ozu8J525ioJ0fIeM4+GyTr55PgknISYgXgAJy26k72ahAGdkJpvwX5MwKGeIpqQm1IG9Q8rpLS0glkQxFTT77fkq1h+B6dibxV43655Q1RAt6GZ5VgxmDpUfdug2tXUcFD4sAx19YpsGN7gfXiEYygVwl3Rr1GMKk0RWBhX0e4tHjxge37huwUqsBmhDJenaw/3/lDNdyrMKIeqpyqmatUSMh9v2MDP5M4p3CGngdDGnrzy06P3W95bPDjXJbuY1yECrTJrEOuL0D3q01GmXiB5jSl0Yt9SWtcEHpVSZMWBetfBfyeMO7obgObRNoGnb7OacTArh7kJgxERr3BooTYlOCdG36QwhJeEVlfrbdXicbxbwPb2zEexjrvAldIm5FdsPoRo2NvySYVS7RO+V+nqe+HzS0ZgWllMZ3u+oK
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 11:09:07.3853
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 47a0a6c7-95f1-4edf-27e1-08df0ff51932
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CPH1EPF0000051E.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR02MB11982

On Fri, Sep 11, 2026 at 12:19:10PM +0200, Krzysztof Kozlowski wrote
> [Some people who received this message don't often get email from krzysztof.kozlowski@oss.qualcomm.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> Re-order a few properties to match coding style, as pointed out by
> dt-check-style, e.g.:
> 
>   artpec8.dtsi:69: [property-order] property 'local-timer-stop' out of canonical order (should sort before 'arm,psci-suspend-param')
>   artpec8.dtsi:232: [property-order] property 'pinctrl-names' must be placed after 'pinctrl-0'
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Acked-by: Jesper Nilsson <jesper.nilsson@axis.com>

/^JN - Jesper Nilsson
-- 
               Jesper Nilsson -- jesper.nilsson@axis.com
