Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011013.outbound.protection.outlook.com [52.101.62.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E27440622;
	Wed, 19 Aug 2026 18:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787163743; cv=fail; b=qEyBINCxV/tT3qX2TgbYDlfU7rw8Z1AVLd2p8PzlY5PljAdiq/QgVxdSaB2Atgd9By3xEVTgODa+3tuElnCu1EqxK+cWSQhMElRhcrvhaHBFgED8Wx82hjsKezbUKJemp/lb4oXK89qQbg+FloBtaYkLqYSIp1fxsoNUzgOBcrw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787163743; c=relaxed/simple;
	bh=UjCL45Gi2Rmon0r9pk+xEg80bnYvHBFqee87O3FkRD0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=lxAVXW+IpVnJQ9TVKpRpi97xcWJ0xyv+E3+a0G+yYVonAQ1n8wTNRb97gWIaTjEpfAfKKle1VMZj5tESMlZYZ3Y6BkEzGH70Eumw/fnl/4jru9uPZNG4EFUF44/Ye1RFOT5pREUJwFd0RFJ6l79XFzg8scYLPYIRB0FedBX6e7A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=QXESd0aR; arc=fail smtp.client-ip=52.101.62.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="QXESd0aR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y30HINbHyp1S5Khkf/G0XQzlM9b6sVKzJucAVeMGoXrMCV8t9brF/d+M6w7FcCOxc7Ts9pCc3wCy+5nfDDXHzMtvT7DrOeFVMVXazjN3D3CoEd7clAjvKPkjA0HPRzn07emTsiRB5AbGga7slYTm6+anH4CJ12s4rT1YNkpVwgD4/98X5NyxrTnhRMjSNDA6/iBjnn1BGlulJW+g+JiLTiFpvOh4WwFiHJKIiIXxeKKiOwhkRmJwr7BViqAVZKsUISKGSRxr9bnbkSakMnvjOrNC5wVH+a3bWSRUKdOG/LZoJH1Kwgj2+mDOpFXanA1xTOPfQtUuZkFpTH0QjwEPSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gL9PCTY2V0AWLqCmZxD1PoHBFgxCd6gN1A4jZt569ds=;
 b=xIl9cwBGGvdVne+1nOKgXq+RvZSSFlzO8eFaPuNffP9N79qcxyMU0nAudBBhEUn3fJaSfxfBxEAmKoJq+19wGx5n2ETM3c3BqXGSg28adiF7RGN4KGHGuFT91VgsUrpoNeaxVFZfItRcZEYUrSrRhacs7RzAyHNTk1YWzmh25gY9GPXKB5hyL1AaHc7D/nqK+y6x2zjtH5nJ4UFvK1wPGNmR6xXE/JFgoI/7bFsOtiyTGrz2NVnXYbZef3RBtZqXDoCJmio5EzTPI68/ZoOC3T0Qle//Vz1uIBSkqgRtm+l6Pep7fJDrE4WYKznkcYudWpgr4TqAFZ67aXZ+k4r/3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gL9PCTY2V0AWLqCmZxD1PoHBFgxCd6gN1A4jZt569ds=;
 b=QXESd0aRapYKDsKjOO9coxQdoggPMUUjiflB0uw44SS6DCFnA56RqxowlM/PErnZMlued+g2loO2fW+MZLU2hy/eCm/pRrXQr372HY2sRN1f8fAC2ITnrvg6/ZoVEPMA42S0oa292cgsUlryfEGWINTAQj6MoiSi3Yl1pjdiT0E=
Received: from DS7PR03CA0084.namprd03.prod.outlook.com (2603:10b6:5:3bb::29)
 by CH1PPFF5B95D789.namprd12.prod.outlook.com (2603:10b6:61f:fc00::62a) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 18:22:14 +0000
Received: from DS3PEPF0000C381.namprd04.prod.outlook.com
 (2603:10b6:5:3bb:cafe::6) by DS7PR03CA0084.outlook.office365.com
 (2603:10b6:5:3bb::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.8 via Frontend Transport; Wed, 19
 Aug 2026 18:22:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS3PEPF0000C381.mail.protection.outlook.com (10.167.23.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Wed, 19 Aug 2026 18:22:13 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 19 Aug
 2026 13:22:13 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 19 Aug
 2026 13:22:12 -0500
Received: from xhdradheys41.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Wed, 19 Aug 2026 13:22:10 -0500
From: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
To: <peter.griffin@linaro.org>, <andre.draszik@linaro.org>,
	<tudor.ambarus@linaro.org>, <Thinh.Nguyen@synopsys.com>,
	<gregkh@linuxfoundation.org>
CC: <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-usb@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Radhey Shyam Pandey
	<radhey.shyam.pandey@amd.com>
Subject: [PATCH] usb: dwc3: google: Initialise probe properties with DWC3_DEFAULT_PROPERTIES
Date: Wed, 19 Aug 2026 23:51:58 +0530
Message-ID: <20260819182158.1351869-1-radhey.shyam.pandey@amd.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C381:EE_|CH1PPFF5B95D789:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c928f6e-991f-495d-b6d4-08defe1ecace
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|376014|82310400026|1800799024|10067099003|11063799006|56012099006|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	hOPNj9vbvEluQuXnG+icNCPCsULtstUSa5UqcuFCpnrdnZ7+IH+eNumFsx0QX4BSQ7PivrjxeWMcNndCHz3Y9m/ZxiW1SVEsDd8zKj6DdWB30iy1FxUFgV97mEe5f+qyg8bUBpSaNaq4Q9VahhNTluBxqz5ib1Cy0tJHnhCe6Ij7Oek69yiU1n1LYtIDmhNC3tWFUnYnS1aucqr1l6xC36nvnz5/jtmb8d8qHqiBWb4kBeJDwKeRHPeWbDrsz3gpA4qjkh3cV7byvjWgpnIuYJGwAw8kKORvQjASezgqAqZ4YKcKh178uOlrRRreeBm6TLCNHw8DB04QIoJvdy6ecBpeWJ89FFCaQ7qcPM0lFbte1GLon3X69xDWO2+VHzmtiZeEGseCGJHU+TnmQcskzA0Nj32T+c9tegPTrwTxSEVzTAzLNvosfn+wCDb6QMsyVJKj6lw6KU8NRVZ8GM/GGW46SOV9ZLpUfkicJIz/c9Q6UVznti0aw0DpPVeVreH9Vmrv9oQymDN00sR4jan2Fl/a9iHWrcRJ2A73sEwlCTQJoG/bjfIuT6da15pyHl2tlJ/64AS9NDRcH7IZrb6T5SEkyDHBOac4vppLUjwNS6aa3DTC2BDX13xPrBR8ZgDU8XL56V7onjPxiU6qry8WYcPJqKWCNfMVfbZzkbklrpZdhTKZB1hOka4fX4zPr6f+8Rzle35aY16yia+2AWXp0g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(82310400026)(1800799024)(10067099003)(11063799006)(56012099006)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	FZq3qWN7nHbpjifKxhEsMWTTyaMelRXiocQlQm5cpPGjx6w/XPVe2tDdpSB8MubvHByXDo+VoC5P9IQS4pXfcJ4ESbVv+f0QlcbLW1cUY/ssQehWYxscvGCWTs45cyb+sb9JI2CwoCznKiM3SWeTn4XI/V+HyziOpO5TSi2w0vXxS1R1BnAUBSLpiMNw+kXHuozWioJRWT/d40epW/XMCHnzFHwmaKJcgSGQnFYUP13adeyq8obersxG7nG3m9BG4oFLWlI37uMy42m0432jRLyP/PLqBa1/rFZQkyqJxNchywzFJYS9kD9GNpuRM1vvyITu4wpzTsPkoyz8v/2OFNjfj4ZSFx3cf4CD7oncC56u3lxL+8D416KcI/nBrGC/rl0Rb1qFUXsLC1l4qZoCVEyHj+zNPbVMS8Is90k+cemdbuKGsz5IjG0CsazCYi1U
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 18:22:13.7452
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c928f6e-991f-495d-b6d4-08defe1ecace
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF0000C381.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPFF5B95D789

dwc3_google_probe() zero initialises struct dwc3_probe_data and never
assigns its properties member. The unspecified state of gsbuscfg0_reqinfo
is encoded as DWC3_GSBUSCFG0_REQINFO_UNSPECIFIED (0xffffffff), not as
zero, so dwc3_get_software_properties() reads the zeroed field as a value
the glue explicitly requested:

	if (properties->gsbuscfg0_reqinfo !=
	    DWC3_GSBUSCFG0_REQINFO_UNSPECIFIED) {
		dwc->gsbuscfg0_reqinfo = properties->gsbuscfg0_reqinfo;
		return;
	}

Two things follow. dwc3_config_soc_bus() programs GSBUSCFG0.REQINFO with
zero on hardware that never asked for it, and the early return skips the
walk over the parent devices, so a swnode or device tree supplied
snps,gsbuscfg0-reqinfo would be ignored.

Assign DWC3_DEFAULT_PROPERTIES so the unset fields carry their unspecified
sentinels and the controller is left alone.

Fixes: 8995a37371bf ("usb: dwc3: Add Google Tensor SoC DWC3 glue driver")
Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
---
 drivers/usb/dwc3/dwc3-google.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/dwc3/dwc3-google.c b/drivers/usb/dwc3/dwc3-google.c
index 60ee4cc99b28..a01ca23cb6a8 100644
--- a/drivers/usb/dwc3/dwc3-google.c
+++ b/drivers/usb/dwc3/dwc3-google.c
@@ -442,6 +442,7 @@ static int dwc3_google_probe(struct platform_device *pdev)
 	probe_data.dwc = &google->dwc;
 	probe_data.res = res;
 	probe_data.ignore_clocks_and_resets = true;
+	probe_data.properties = DWC3_DEFAULT_PROPERTIES;
 	ret = dwc3_core_probe(&probe_data);
 	if (ret)  {
 		ret = dev_err_probe(dev, ret, "failed to register DWC3 Core\n");

base-commit: 6a746cd265aed59107ebdaa9ce039bb832922969
-- 
2.43.0

