Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013018.outbound.protection.outlook.com [52.101.72.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B5DA26E70B;
	Tue,  5 Aug 2025 09:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754386428; cv=fail; b=sgyRbrygOHkL0umWEC85FviwL9Mwnt7Mg20yH7V+2X3MhCTACwjjA/FjjWci2FHWfY7UuIeAVCyvcSQsP2cy+UMMvY/RWBWeZpZmzT9Fvtxhxa+1c4PGY377uas6dzRmyIW/7nkFMWfYWXPcxzqBBzOLzXQ32fwLEr+5Z5Ig5m8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754386428; c=relaxed/simple;
	bh=Hp4gun261P/CK3tOjAczYWyVX8LZ/OBqMZOAsFyKdOw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=TGyK+MHNzjbu2QPqR5bgQBwsBOUjSVDg/dtxc66lAZrAGoq8wFnY4E+hNU2VKYKsiP0lt0oUmkFFxIyoe7VVOAl/VVl3jbbqSToAWG5VDwDy6D5czI/Jbfb1bPOfx3XUdq790tC1i8i6soB6Z8UfhnI25w6ZuCLrw6w82CQUXgc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=SLuNOKYK; arc=fail smtp.client-ip=52.101.72.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="SLuNOKYK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oVTrqm6gav1g6hjS/bsXfylDA9nYBSujqj3LxYuMK79S44uAQR2SHVYOLLz8Ru0xdsgYAWa8SEZ1VlrN1QaTAUAJ/tydyw8toIPZBZoVycDu3T4/pxSvQ89b+9zNli2y4Vy8qlzzPhoUr/HoRzsGUxbNVXSitPLZilmOGMIYd4L2b16FrEmTmR7baFyqbNrNf5qOxLsgBlG4tm1mAcDP/oW7GtphQfCbHKXwzZQA/kL/4L+UGG68AMRzErCTQpTe2YRDgwOVzUJI/UB/mjAXIICWMR0lD4Em1luFDPUhmFKF/uU5tyxgiSSiCgFd3EGXTP57tmJourZMfT4k1kDr5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XSdyPORcOcEQ4J3OnKiTKjN8U+AEHy1K3NzmFwwhEL0=;
 b=CRptoBsCLTGkHC+bJX51xJBFPeLiRBcfNOKnt+3bsre7Abp1rmjJcvSkG2a9qh5aLQC5+2o3lCwQ4t0ogqUgkXtqVXE5c3psQ4wKE5D/EZiwpjnh91mnpsIwzEZ7EklChRT1pcMjyWo2IQ9Lko169+i3LUToTr0xBvMVRI02xmLg/xXhDpzCXvJRogmRdesYNGm/ymiimZ56VqXslmJMYNYmb+duBK5M5GAkYPM5WlNqEuL5ZyGzYLoQ8hiJGMTmIMbNWV6RwN6iS4Sh25dv3fg9JYe686xeL9lvbdTp3wyoEwjx9+PdnlXb9QmmTXYq7cA1pDb1HQLq90GsEoxlRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XSdyPORcOcEQ4J3OnKiTKjN8U+AEHy1K3NzmFwwhEL0=;
 b=SLuNOKYK2vSPlbKnmoPd12bdwh7jcHQ7QadrvWC0Ynqasp2pPIUDSNn6d5DrOXXCqRVA3IC64Pk3ls21hTDsgif/pdo9e1TSue2p+VyQ7UZWWkhZ4RaFhu8JX//2YiDtDKjTB70Tprrdx561FQfUHah6e0ChYHm7JwtEuGKew2U=
Received: from CWLP123CA0001.GBRP123.PROD.OUTLOOK.COM (2603:10a6:401:56::13)
 by GV1PR02MB8260.eurprd02.prod.outlook.com (2603:10a6:150:63::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Tue, 5 Aug
 2025 09:33:43 +0000
Received: from AM3PEPF0000A790.eurprd04.prod.outlook.com
 (2603:10a6:401:56:cafe::28) by CWLP123CA0001.outlook.office365.com
 (2603:10a6:401:56::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.21 via Frontend Transport; Tue,
 5 Aug 2025 09:33:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AM3PEPF0000A790.mail.protection.outlook.com (10.167.16.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9009.8 via Frontend Transport; Tue, 5 Aug 2025 09:33:42 +0000
Received: from pc52311-2249 (10.4.0.13) by se-mail01w.axis.com (10.20.40.7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Tue, 5 Aug
 2025 11:33:35 +0200
From: Waqar Hameed <waqar.hameed@axis.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
CC: <kernel@axis.com>, <linux-phy@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v2] phy: exynos5-usbdrd: Remove error print for
 devm_add_action_or_reset()
User-Agent: a.out
Date: Tue, 5 Aug 2025 11:33:35 +0200
Message-ID: <pnd34a6m7tc.a.out@axis.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: se-mail02w.axis.com (10.20.40.8) To se-mail01w.axis.com
 (10.20.40.7)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A790:EE_|GV1PR02MB8260:EE_
X-MS-Office365-Filtering-Correlation-Id: e7fe37cf-c51c-4c0d-cc47-08ddd4032b0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Ko80Gj1OvHB2UutXT4EkNI37WT+8cudgDTMRMl2sjqL3Is9oq1RB1YNeSUoO?=
 =?us-ascii?Q?zNV23DHMFbx0uzorPm77PjdVGLbn7g2o5H0bbuol9p2g7Itk9BTVWb4qW95A?=
 =?us-ascii?Q?tW4sRRu9+iRQctx2/Jj/mDDJzbV827xWu+devxL8PD9AgOKC8f8lR1LyFacW?=
 =?us-ascii?Q?1gEyuAKw1dyOHtFahV6fDP5jsA3ppo6QHW1YcaSJgas1OGyDIqJjy0IOMoHU?=
 =?us-ascii?Q?sq3KQdI24pU+TqZyb0A+6r55utQIG4UywGS46SFn4CIwbw/L1ky/0kzoAFWW?=
 =?us-ascii?Q?u44+cRmmNeOZBv/CDeiCMj0tyx/A/EoL0lU26PU060wGNAAshlY57tldsNIk?=
 =?us-ascii?Q?jHTrZ77YeZ8eaRQPPKAG9GNE3bk7RhSnHVu3xxyK28VuLeCBtXO/GuOYaAPP?=
 =?us-ascii?Q?KO/JSaudEJztOTp6MgCrT9581artRr9cNYZRuzkjzhA592+rnchYVPMuQagp?=
 =?us-ascii?Q?S7VNiGb/V+gPXu7DSL+GYIiUDzBq72Heg/KgaVq4ayJCpOBunOetDzPl06uC?=
 =?us-ascii?Q?eCt/Pmc6uydiPCWBF3qq8jRCmNjp/u3G8XR/ArEV/xuXF24mZtnnOqa1Z0Yw?=
 =?us-ascii?Q?Q22hDZT3snk7+ZGuToOy50/2y8GURO/t03HHIlkk4y5v3Le8PvSdJLgxaDri?=
 =?us-ascii?Q?G62YblMFivqBrhV1xoxNSclE+DnJ8m7ozE6kniA4CT34FjwlsjN5WE8TRlda?=
 =?us-ascii?Q?mHtmIl6imXKdeL9qg0hcvneOyBMe4uuYUS6ZZ2xENfVt23fH6BHiw+RDynYl?=
 =?us-ascii?Q?q773Iebv4MIJnQMzotZUv2T4d/y2P22rLUUx9++NC6a5xddcmgAnnzZAQrDL?=
 =?us-ascii?Q?yN4giA7X/OgEQYPU3i2JWv6Ex1mEy7ZGwdQnNMDcR4trIjhfeciPArsY0rYs?=
 =?us-ascii?Q?Ypi4EHmFjFM1D5BFjx3mupasXypsQfm4Y5ZoU+BoxlSoSsOm+56rNlvdOo9N?=
 =?us-ascii?Q?ux5Es0zyBeSzfYX9P19EQU3fvkoJS5n56rIUVeVr0Ssei5lX5phD8Fw8KmHE?=
 =?us-ascii?Q?0wv6inrTjLLvq5Bd8hcfmIB8bENaGXRp8/d4AuNPp35vOb4jhYRZBU7o6ewU?=
 =?us-ascii?Q?kGFp4gPOTQOFT6LXQtkLZ1mFQTv6YiIduTqNGOx3sGjRjTzgzJ5Yxmjg8kZl?=
 =?us-ascii?Q?ACaeAQPkTsh+SrmPoK0HJYwyf18OuAwwgzIvOuSgFKGofyhMSoXQKOqK0AvP?=
 =?us-ascii?Q?ahxrMSXTKpLEc9vkRf0C3m82QwQwsxk4xO0EflvxWi5TUN1L3mF89GgCn2Tb?=
 =?us-ascii?Q?qyH/y01+J+8lpPyj6xemcefhHmFUYhXsv9yx5bXaN+SoyFlL4oGd4wJ88EXS?=
 =?us-ascii?Q?nXobKabEbrq3EW4u5mztZq2m1rQ97QcKmdpTVteGXiNeojdKFq6p7WhQ6FvS?=
 =?us-ascii?Q?K5DqfafIFzQLpIYInNOORJbFw2kaLj9WUcYjQL4LlTJOjqpNBgiZzWaO+zLb?=
 =?us-ascii?Q?oeHORXCqOSDGs82JhGyJ1BbpFri89c+XDLw9SJI+twI5nNZptkaQVhEYl+t/?=
 =?us-ascii?Q?6p72hQIbcpQgKi8Gad3EoDfwK1oixtQerdV0?=
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 09:33:42.8238
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7fe37cf-c51c-4c0d-cc47-08ddd4032b0b
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR02MB8260

When `devm_add_action_or_reset()` fails, it is due to a failed memory
allocation and will thus return `-ENOMEM`. `dev_err_probe()` doesn't do
anything when error is `-ENOMEM`. Therefore, remove the useless call to
`dev_err_probe()` when `devm_add_action_or_reset()` fails, and just
return the value instead.

Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
---
Changes in v2:

* Split the patch to one seperate patch for each sub-system.

Link to v1: https://lore.kernel.org/all/pnd7c0s6ji2.fsf@axis.com/

 drivers/phy/samsung/phy-exynos5-usbdrd.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
index 917a76d584f0..28ba11e42823 100644
--- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
+++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
@@ -1859,8 +1859,7 @@ static int exynos5_usbdrd_setup_notifiers(struct exynos5_usbdrd_phy *phy_drd)
 					       exynos5_usbdrd_orien_switch_unregister,
 					       phy_drd);
 		if (ret)
-			return dev_err_probe(phy_drd->dev, ret,
-					     "Failed to register TypeC orientation devm action\n");
+			return ret;
 	}
 
 	return 0;

base-commit: 260f6f4fda93c8485c8037865c941b42b9cba5d2
-- 
2.39.5

