Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011004.outbound.protection.outlook.com [52.101.65.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62AA0443C35;
	Fri, 11 Sep 2026 11:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789124939; cv=fail; b=UuSumkcwr62gll9COoSjmpToPMQFHqHmYmf83NqJT65yJkuRNXPIBJKzWqIht34528Me8uiFIempWXMK/RbRY3tdwPCokm4dVYM5It+goTm5tSVvGSm0MNIKRVNdmgVbrmhAeuW+k8V0ZcvYDYOupdFACYUMm/7gMZA5aR8JoZU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789124939; c=relaxed/simple;
	bh=0X3cMXSXxi9/5T5h13Ww6y4zLNd0oa4RiWjxoq13vRY=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W48b4M1KZ0em4+IcNyNsCkNGteAsh2z6tQ+W4at6c688Oc30U7vKPBu3Abh6f/3soV5vWGNezUW4gyubFAHTYvpWzMstJLyy2+AU/lKT6KXjqh4ps3wn2c9V2UEeBevVg5ddWhorvyVrgUS6WvI69xNUf2K6Aq7Z8XRQgN+/ye4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=ZRB6H18r; arc=fail smtp.client-ip=52.101.65.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="ZRB6H18r"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JamXcjPy3YVQAFjSYQEJMtB9cerb5MiTcnvAKzF6kXC1r32tEx0W4u/0QVQeZpy90MHeSM54eKb9wEPH+u5Y5zOVODtEJIWdaoagOUmIsTdAqlVBLzy+nDB/iR3C8lyNf+pc7cBCCIhwBCg1vPItN2rqlHmmNIPIGhjeGzeEk1ubQeCYAg09BrrCBd2HQH/AU6ahUHp/zRTiCCghBe033NJImLHwz/9m7CVVwfo0kKqhpiOcg9dsuaD6WjbU8tpsgBYkcfZWbS4Nyn7lLWarMwqZETJkxBF9CF2BJnfey/BcgNg6MwBBT3MttvAqUeLYVDlIfJvzen+/N/igYA8VfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XHlqhmhNrq9DNzqgJZi7+ra1nKEyni5di9SdXMxCCtg=;
 b=GN9iY+YxAGh6I0ckY/4c0ZgRDyUhYRnbGCiyIGBxDskqN4lKPxUWTiRU125eYsW4tkAmlSn+AMEB1wW0Fmn2CZgeQk5DrIBGuCv3CMVS2eozpaz8lwG+5L7RHab/sBn851rO2rMgkI6P3r4nridO+pfP+rM16ZR51L4CUA3WWAf+qUqtRMQccFRXDbFY8QWJV+4lZBoC6m6SOgdHW5Cu08M0sSjKq62oK/sHC3Pl2dfX2PIshtbRxs2AD7+VhbhIFU5BH3uD33LIIt2d1IZo7dB0AW92982rhGeaRC4hzn0RfnCUo6JAiWXkUlNabIprXDPhgHOj/PcU33pVI5alUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=gmail.com smtp.mailfrom=axis.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=axis.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XHlqhmhNrq9DNzqgJZi7+ra1nKEyni5di9SdXMxCCtg=;
 b=ZRB6H18rDIIZKGTOnS+2HIHIxBmpD6sCgQrJLlyMetO1Iyg9Wx4nBVVenahqaSmsOPuryw7pO1TZGZ0h1W7JOWYdfIhtGgdXEPBTK3m0ToqUFVFYKAv+VgNYO72rMefLACqvRDg/vtopJiXZWhxWwwCCAK7bPgiKT/DF89/eraM=
Received: from AM7PR04CA0008.eurprd04.prod.outlook.com (2603:10a6:20b:110::18)
 by DU0PR02MB9968.eurprd02.prod.outlook.com (2603:10a6:10:444::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 11:08:50 +0000
Received: from AMS1EPF00000097.eurprd02.prod.outlook.com
 (2603:10a6:20b:110:cafe::65) by AM7PR04CA0008.outlook.office365.com
 (2603:10a6:20b:110::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.15 via Frontend Transport; Fri,
 11 Sep 2026 11:08:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AMS1EPF00000097.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Fri, 11 Sep 2026 11:08:50 +0000
Received: from se-mail11w.axis.com (10.20.40.11) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Fri, 11 Sep
 2026 13:08:49 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Fri, 11 Sep 2026 13:08:49 +0200
Received: from pc55637-2337.se.axis.com (pc55637-2337.se.axis.com [10.88.4.11])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id AAFB51FEF;
	Fri, 11 Sep 2026 13:08:49 +0200 (CEST)
Received: by pc55637-2337.se.axis.com (Postfix, from userid 363)
	id A0C3A6035BE2; Fri, 11 Sep 2026 13:08:49 +0200 (CEST)
Date: Fri, 11 Sep 2026 13:08:49 +0200
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
Subject: Re: [PATCH 01/10] arm64: dts: exynos: axis: Re-order nodes to match
 coding style
Message-ID: <aqPhQYPpJYjhcZjR@axis.com>
References: <20260911-b4-dts-samsung-cleanup-strict-continued-v1-0-9aa55051c42b@oss.qualcomm.com>
 <20260911-b4-dts-samsung-cleanup-strict-continued-v1-1-9aa55051c42b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260911-b4-dts-samsung-cleanup-strict-continued-v1-1-9aa55051c42b@oss.qualcomm.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000097:EE_|DU0PR02MB9968:EE_
X-MS-Office365-Filtering-Correlation-Id: ec223c33-1a4d-4008-de4a-08df0ff50f14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|7416014|1800799024|82310400026|23010399003|10067099003|11063799006|56012099006|4143699003|18002099003|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	HnEQTaQXdtk5Br8GRSlqcdI0B90tn9643rvrMfI3DNdpHESx+tg+cbiYEuaIa1kKP/sc3UwenJDitA5gQ+BvQiGy8sDQHaj+6y9uQoqUT+Hf7yltE0eAkFmy3zYla2p2x0FSg5oN0ZoeZuf3NQJXJU6589IkuVNokvVoYHbTqxAQtJzaDsQ4WIzH9/N7BMh8euNTV1P58DqlAXUshgI1QdO8mgDV3H0NrjgbVZ/20oroK1lm0ObcTsDlg5wCn76rodMqfnQOPnbeUjvMnzAyV7s62MPgjU3l92sP+Go+oDq1KxhQ2P4rqNmKNMoOk8+cDaF8acdOvyVuJfO1On4FpW8KL/XnyuMkiIHBCgKuoosnHikb8Cb0X9a/lW8+XSqFgKKduUjZpf6fmHE8TFJ4vG9aazuQgisBmwZKqK8Ar3kdQD83Pgb+DHRG9UoF2m0T5wHjSq+jEhiiXx+eJ65JQZQ8VSe0YTAZd5rg5gVddIj5Fk/FlKzN8u2JqPEaDGOEfsPBpmZnFZYSkPgI6frF9hC7x28q+y2E8j/2q6QS+vWF69wWH/x97pudtmgXN4C+U8yYDihNivySCge2RmqU8Zh9BjWvh4jmKOhDVhh1kS/v77pX5r/h9O9dNARtzkATo3c+ti9WvbQp6m0eqMj6n7vz+XHwLpb9jybHlSBuQ4GrZ8KtHji0fm+4K/yUQFkQAhT6IT8I5ZnKiq2Yn7kxXA==
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(7416014)(1800799024)(82310400026)(23010399003)(10067099003)(11063799006)(56012099006)(4143699003)(18002099003)(22082099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	hs11RLlU+B5SKEphD7QLuhqvd+0s5lkuUMIuaoMOtJ5/OVZ8TFgVmClnWOCoHPmT1Q9X1ImurHYJntWI0hozDQYhy8I/15IXkz0Dnk7a7sK99aQ+vOwiGd0+nx4nrNJN8hSCF2YYzjnuwrPH8QsfC7ibivVe79XYoX0uunpwOZnGiQ+TL2/B7ytS7QqKUhiwThT96Ym+PsZ/GE4bxPZfdmJcaA8YYvlX4m1IjLXf7rEwp1OcF7N0EfJlqR19yj8icosCir1F6hRGDAVxqqO1rAUSelOweIPEpF6BSpjBzCen5iRbBhHk5RvPDR0hxwQy9/1/cLGRqWaljKymoeAmGmBg8RbQYDBF3dr231qGXyLYSO6j0TuVDOJug4dkr5TsrR//4BSJV+ZBtaCwS5NL7GM9NSAHxWtk5sddprNoNw1qEVmoY+TdaLjZKdkFg1zz
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 11:08:50.3957
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ec223c33-1a4d-4008-de4a-08df0ff50f14
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000097.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR02MB9968

On Fri, Sep 11, 2026 at 12:19:09PM +0200, Krzysztof Kozlowski wrote
> [You don't often get email from krzysztof.kozlowski@oss.qualcomm.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> Re-order top-level nodes to match coding style - ordering by the name,
> as pointed out by dt-check-style, e.g.:
> 
>   artpec8.dtsi:77: [child-name-order] child node 'clock-finpll' out of name order
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Acked-by: Jesper Nilsson <jesper.nilsson@axis.com>

/^JN - Jesper Nilsson
-- 
               Jesper Nilsson -- jesper.nilsson@axis.com
