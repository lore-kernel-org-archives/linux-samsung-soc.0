Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78EA022A1E5
	for <linux-samsung-soc@vger.kernel.org>; Wed, 14 May 2025 16:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747239017; cv=none; b=TBEHw6Otgi2jAlsosAIbR/sllafuWROP4chNKrfexrqFnB1XGYvjmF89Z6a+frFy8yqbDQ78JKic4uR5TU9m9hKiO3U3RIhZ2NnnuwvEK5V+s0aukoHiUQHdI4wnLuPPksSexqwmqklcoMrDOxTI7XNtzoyry2AjqvFJfo1POhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747239017; c=relaxed/simple;
	bh=+m+Ws1hVUDn95+efEJJAat5SuzKxMIXHCFMzpXQ1LC8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=EoDAzKd0gb0KvGhD3FYBOoZwSc8yZsbWCqXXFK7yNjOfPGuHqMwQQTMv4pha1zhjnq7vNxnFKXV+YNgEzqgPOOom3RxQ1Anzt0hVF57V7sMy17qxwrzuPJ44b/q/Fq3eFHzlOSta/tEVbSRTTIPkU3uzUdokXX3cqNT/bM7AeIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=cCWUmzSI; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="cCWUmzSI"
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250514161012epoutp01cda882fba383e182a1fd3dbdcb56ad53~-cJ-thv9b1538515385epoutp01S
	for <linux-samsung-soc@vger.kernel.org>; Wed, 14 May 2025 16:10:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250514161012epoutp01cda882fba383e182a1fd3dbdcb56ad53~-cJ-thv9b1538515385epoutp01S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1747239012;
	bh=21Z8hzEVWJ04VpTjQEJcND13ywzNHRDWhqyQdMqHOxQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cCWUmzSImml8DiJBbF7PRt2U8YTyYSgKkQWNnfluCMpWXbH95Gnqb37k8AY+owWHZ
	 OG1l67QdoCP3JcwN8ERYj/YbDg60Tz7BByu10qd1RcWaOp2sQ/v7yc6VhsAcppYvTs
	 6DVmP9RiGXKxPCepnQY+nkyWQJzNLygVFWtkp+X4=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250514161011epcas5p2158bf3817d9cbaa8c0b2bccc843a23e9~-cJ-Dxtqw3255432554epcas5p2E;
	Wed, 14 May 2025 16:10:11 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.174]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4ZyJGB4g0xz2SSKX; Wed, 14 May
	2025 16:10:10 +0000 (GMT)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250514135757epcas5p1aab0db4b4910b689f76ad00661f2a8e9~-aWhrpWc50678006780epcas5p1_;
	Wed, 14 May 2025 13:57:57 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250514135757epsmtrp1a1dc0e4541e07c3fdf57b665c492725a~-aWhqyoWD0052600526epsmtrp1i;
	Wed, 14 May 2025 13:57:57 +0000 (GMT)
X-AuditID: b6c32a29-55afd7000000223e-b2-6824a1659b32
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	19.2D.08766.561A4286; Wed, 14 May 2025 22:57:57 +0900 (KST)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250514135755epsmtip2402140e03afcb2fa688801985af7b03e~-aWfYM9t80096800968epsmtip2u;
	Wed, 14 May 2025 13:57:55 +0000 (GMT)
From: Pritam Manohar Sutar <pritam.sutar@samsung.com>
To: pritam.sutar@samsung.com, gregkh@linuxfoundation.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, alim.akhtar@samsung.com,
	Thinh.Nguyen@synopsys.com
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org, rosa.pila@samsung.com, dev.tailor@samsung.com,
	faraz.ata@samsung.com, muhammed.ali@samsung.com, selvarasu.g@samsung.com
Subject: [PATCH 2/2] usb: dwc3-exynos: add support for ExynosAutov920
Date: Wed, 14 May 2025 19:37:41 +0530
Message-Id: <20250514140741.415981-3-pritam.sutar@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250514140741.415981-1-pritam.sutar@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrDLMWRmVeSWpSXmKPExsWy7bCSvG7qQpUMg2Ub5S0ezNvGZrFm7zkm
	i3s7lrFbzD9yjtXi2o2F7BbNi9ezWbycdY/NYtPja6wWl3fNYbOYcX4fk8WiZa3MFudfdLFa
	PLu3gs3i/54d7BZffj5gtjiy/COTxaoFB9gdBD02repk89g/dw27x+Yl9R59W1YxemzZ/5nR
	4/MmuQC2KC6blNSczLLUIn27BK6Mc5u+MBUs4azYvPMNWwPjRfYuRk4OCQETiTN7DrF0MXJx
	CAnsZpR4c+8fC0RCRuLRtI2sELawxMp/z9khit4ySjQtfsDYxcjBwSZgKjFxTwJIXERgE6PE
	kRUnmUEamAVWM0mcnpoBYgsLuErcPjUfbBCLgKrErOsnwRbwCthJfH95lw1igbzE/oNnwXo5
	Bewltr+azQIyXwio5shSfYhyQYmTM5+wQIyXl2jeOpt5AqPALCSpWUhSCxiZVjFKphYU56bn
	FhsWGOallusVJ+YWl+al6yXn525iBEeQluYOxu2rPugdYmTiYDzEKMHBrCTCez1LOUOINyWx
	siq1KD++qDQntfgQozQHi5I4r/iL3hQhgfTEktTs1NSC1CKYLBMHp1QDU8Huve9qn0iertdW
	ec3+P3nSKu3nM99MO2016YyItfyxjV8U1hz4z26oXmVjqHdydub0kpWGDw49FDKcPD/eYFKv
	4Abuaq9tUS4tXxpV6jzClczz8/9c7LjCWPpfcQdb+h5Z++YzL0TWFqdVODUHVv3lzvntd0Rs
	uoLm/9izR2UKWaqLUlcfyJTzY9qR/bFHleOfi1Ru3tu6Ew82aDzUdpftqF1qN2m/w5Nqkc0a
	O35u3Nv5NbtAyXl2yxKPmtPdpVpdIVwWM/16BcpmbVliIGfKX5gfIL9HOCEx73z/wtt7H7yS
	zH229/2v1WLcvA/6bjksdBGdsItnizQ3+5tzbRci035n7X06//dHxWMBSizFGYmGWsxFxYkA
	6qFTzQ8DAAA=
X-CMS-MailID: 20250514135757epcas5p1aab0db4b4910b689f76ad00661f2a8e9
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250514135757epcas5p1aab0db4b4910b689f76ad00661f2a8e9
References: <20250514140741.415981-1-pritam.sutar@samsung.com>
	<CGME20250514135757epcas5p1aab0db4b4910b689f76ad00661f2a8e9@epcas5p1.samsung.com>

This SoC has a DWC3 compatible controllers. It needs "ref" and
"susp_clk" for it's operation.

Add required changes in exynos dwc3 glue layer to support this SoC.

Signed-off-by: Pritam Manohar Sutar <pritam.sutar@samsung.com>
---
 drivers/usb/dwc3/dwc3-exynos.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-exynos.c b/drivers/usb/dwc3/dwc3-exynos.c
index 20abc6a4e824..a8f97d2b31ae 100644
--- a/drivers/usb/dwc3/dwc3-exynos.c
+++ b/drivers/usb/dwc3/dwc3-exynos.c
@@ -187,6 +187,12 @@ static const struct dwc3_exynos_driverdata gs101_drvdata = {
 	.suspend_clk_idx = 1,
 };
 
+static const struct dwc3_exynos_driverdata exynosautov920_drvdata = {
+	.clk_names = { "ref", "susp_clk"},
+	.num_clks = 2,
+	.suspend_clk_idx = 1,
+};
+
 static const struct of_device_id exynos_dwc3_match[] = {
 	{
 		.compatible = "samsung,exynos2200-dwusb3",
@@ -209,6 +215,9 @@ static const struct of_device_id exynos_dwc3_match[] = {
 	}, {
 		.compatible = "google,gs101-dwusb3",
 		.data = &gs101_drvdata,
+	}, {
+		.compatible = "samsung,exynosautov920-dwusb3",
+		.data = &exynosautov920_drvdata,
 	}, {
 	}
 };
-- 
2.34.1

