Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F0C6A34;
	Wed, 12 Jun 2024 00:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718153641; cv=none; b=UW6Ilhjy56zLpVrK3futZ88u58wN8Qj5Uj/i9rWgqLH1KMeHS8FP3YRU1hOi7PNZ2HP7JlNEojIx4Xvmf7fIXKUETNGQj276mk64KSscUJl9uKuSaYG4kj5uJayNy0Hot/A2MfyChIq53DEARpV7RDz8jCliUGffYRNiP88J3bQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718153641; c=relaxed/simple;
	bh=By79iXyK1cNDQ1LlQ7PpPfKUDHbs/qNt+W5UFDjbIIo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=XF2e/+YqUW3rbmZw2Qtk9BHewOzRBH89AdLtxwwMEU2vEa2yAJpHQfcHbna+/WveACkpsLo/XvYd7G/Atk5rCB3hwm0ss0vKMWye1egT2+ZlNNcRjyBCq86Y0Evb2Z7NbbIpV5+SNOCiq/fO4DdAR40DMq/V+NYuHGlYqZdDHLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=F3O1OWmU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="F3O1OWmU"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45BE7TYH020164;
	Wed, 12 Jun 2024 00:53:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=I4hK0GM/MaxiKa4OugezJq
	lYW9u1eCemgEirddzSAug=; b=F3O1OWmUKbW5wCYuzbM6zS4N5UsKHZHw2/ACFB
	2tLfIOm5vGSKReJcC8tplkw90Uir+VvpRq0tE5bW2M6/svX6rVlPHQtvpEou4xmp
	A2mClLMdPDFejklvPuHXnr0AHLGFvtzL41jcqXmFS7uVj2W93qJVBpYjwLI9gmzY
	IrObgBw2rSSgaAJ4vuAWEASN6xd6om0uMGTXCmGO7g9trisojjg1E2Y8LmcR54SS
	vsJXMckUsMZKb7sWlmy7bLugadmXVfJgN5Hr4x4FVCNKuZM+xj67LNtiwWSKGL2K
	MyGE1DkdkjwZEey/6v0Vma8P4+Es7PqX1/Lgx5ZkrzRAfMvg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ymfp7fhy9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 00:53:39 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45C0rcdE014714
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 00:53:38 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 11 Jun
 2024 17:53:38 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Tue, 11 Jun 2024 17:53:37 -0700
Subject: [PATCH] usb: host: add missing MODULE_DESCRIPTION() macros
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240611-md-drivers-usb-host-v1-1-e2071a696ef8@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAJDxaGYC/x3MTQqDMBBA4avIrDuQaC2lVyld5GdiBmosMyqCe
 HdTl9/ivR2UhEnh1ewgtLLyVCrsrYGQXRkIOVZDa9q7eViLY8QovJIoLuoxTzqj6cMzpOj7rkt
 Qy59Q4u26vj/V3imhF1dC/r++XJYNR6czCRzHCZnXUu6EAAAA
To: Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        "Alim
 Akhtar" <alim.akhtar@samsung.com>,
        Mathias Nyman <mathias.nyman@intel.com>
CC: <linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-samsung-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>,
        Jeff Johnson <quic_jjohnson@quicinc.com>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: MFZVtXqK-NgDOqr-NBPUHYTWgHVkCzEJ
X-Proofpoint-ORIG-GUID: MFZVtXqK-NgDOqr-NBPUHYTWgHVkCzEJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-11_13,2024-06-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=806 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 priorityscore=1501 clxscore=1011 bulkscore=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406120003

With ARCH=x86, make allmodconfig && make W=1 C=1 reports:
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/host/ohci-exynos.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/host/xhci-pci-renesas.o

Add the missing invocations of the MODULE_DESCRIPTION() macro.

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/usb/host/ohci-exynos.c      | 1 +
 drivers/usb/host/xhci-pci-renesas.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/usb/host/ohci-exynos.c b/drivers/usb/host/ohci-exynos.c
index 3c4d68fd5c33..bfa2eba4e3a7 100644
--- a/drivers/usb/host/ohci-exynos.c
+++ b/drivers/usb/host/ohci-exynos.c
@@ -293,4 +293,5 @@ module_exit(ohci_exynos_cleanup);
 
 MODULE_ALIAS("platform:exynos-ohci");
 MODULE_AUTHOR("Jingoo Han <jg1.han@samsung.com>");
+MODULE_DESCRIPTION("OHCI support for Samsung S5P/Exynos SoC Series");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/usb/host/xhci-pci-renesas.c b/drivers/usb/host/xhci-pci-renesas.c
index 93f8b355bc70..247cc7c2ce70 100644
--- a/drivers/usb/host/xhci-pci-renesas.c
+++ b/drivers/usb/host/xhci-pci-renesas.c
@@ -627,4 +627,5 @@ int renesas_xhci_check_request_fw(struct pci_dev *pdev,
 }
 EXPORT_SYMBOL_GPL(renesas_xhci_check_request_fw);
 
+MODULE_DESCRIPTION("Support for Renesas xHCI controller with firmware");
 MODULE_LICENSE("GPL v2");

---
base-commit: 83a7eefedc9b56fe7bfeff13b6c7356688ffa670
change-id: 20240611-md-drivers-usb-host-05c8cfdb533f

