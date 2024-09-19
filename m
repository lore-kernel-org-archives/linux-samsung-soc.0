Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E62C48F6B
	for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Sep 2024 01:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726794577; cv=none; b=bPnqQ58AyMke0gBoZHwTV0HYfmaj0kT4KLveYaIeX2oHsSdPI9NtkwSretnSGtj1RXDPoT9buUP+c33OXHY8y8xVZT6ArUWDNapmmhjCev/94y3U60yIPhWj0cI/d/HenaBY+f2BKBt04PWzN0IfqG93gjC42zlJYsuka7/UIk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726794577; c=relaxed/simple;
	bh=nnPQA1TNM+RltKD2pQrG01zPT9OXUDBu7rskPBIpMxg=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:References; b=iaWixEVSGEh+goARbSQWL2yuev5GEtOC6ojIiP+WYw10tQwvLXHrKDFlzV10Kn+xQdPIfUrkEN+uDKRvFcGXyKm0qlJKv0nFFro7qG/jD+0t3Cg4EVNYp8rhwuAe2T5WzRhCJXddU1E7nXaiYqNzmZybpFKp7gWXd2e9byvmEIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=Ptjc7yWj; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Ptjc7yWj"
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20240920010931epoutp011c5a36f6f2c73694460f23b36d2bb046~2zoOd6Pu63195631956epoutp01o
	for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Sep 2024 01:09:31 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20240920010931epoutp011c5a36f6f2c73694460f23b36d2bb046~2zoOd6Pu63195631956epoutp01o
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1726794571;
	bh=vJ6d2crePsjwSE+nLTL32vmvyRkr1dlnHUKC/c4G4PU=;
	h=From:To:Cc:Subject:Date:References:From;
	b=Ptjc7yWj4wMYYnx9Con7KX4qeXHBLXO4t6ab8cuddt2KYiSvjEEpquuPZXSnCikti
	 YS7ndWsnQoroQe+MQ5jFs6ajMpu4ifBPHx5KUfbdsFA3fm99H0M6tV+rqunmoMBk+S
	 xB5jU+nZbK6ydy/XPiSuD5n9KpW5a6He5mgsucbA=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTP id
	20240920010931epcas5p268ee6b4192c5eaa8ba2ca0d2dabcad96~2zoNyWVpy2863728637epcas5p2D;
	Fri, 20 Sep 2024 01:09:31 +0000 (GMT)
Received: from epsmgec5p1new.samsung.com (unknown [182.195.38.181]) by
	epsnrtp1.localdomain (Postfix) with ESMTP id 4X8vRs48kpz4x9Pr; Fri, 20 Sep
	2024 01:09:29 +0000 (GMT)
Received: from epcas5p2.samsung.com ( [182.195.41.40]) by
	epsmgec5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	14.BA.08855.94BCCE66; Fri, 20 Sep 2024 10:09:29 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20240919124112epcas5p1527a15ea137d853dee5625902769580e~2pa2-imHw3129031290epcas5p14;
	Thu, 19 Sep 2024 12:41:12 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20240919124112epsmtrp1776aaeeb2e136b4fa5c8cf8f5d6b728f~2pa2_Ecnj2997129971epsmtrp1R;
	Thu, 19 Sep 2024 12:41:12 +0000 (GMT)
X-AuditID: b6c32a44-15fb870000002297-38-66eccb499210
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	E7.61.19367.8EB1CE66; Thu, 19 Sep 2024 21:41:12 +0900 (KST)
Received: from cheetah.sa.corp.samsungelectronics.net (unknown
	[107.109.115.53]) by epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20240919124110epsmtip215d9c22f47441d8ece44df0eb8635c1b~2pa1T2but2903029030epsmtip2-;
	Thu, 19 Sep 2024 12:41:10 +0000 (GMT)
From: Inbaraj E <inbaraj.e@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	alim.akhtar@samsung.com, mturquette@baylibre.com, sboyd@kernel.org,
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: pankaj.dubey@samsung.com, gost.dev@samsung.com, Inbaraj E
	<inbaraj.e@samsung.com>
Subject: [PATCH v2] clk: samsung: fsd: Mark PLL_CAM_CSI as critical
Date: Thu, 19 Sep 2024 18:09:54 +0530
Message-Id: <20240919123954.33000-1-inbaraj.e@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrGKsWRmVeSWpSXmKPExsWy7bCmhq7n6TdpBn9eSFk8mLeNzeL6l+es
	FjcP7GSyuPtnEpvF+fMb2C0+9txjtbi8aw6bxYzz+5gsLp5ytVi09Qu7xeE37awW/65tZHHg
	8Xh/o5XdY9OqTjaPvi2rGD0+b5ILYInKtslITUxJLVJIzUvOT8nMS7dV8g6Od443NTMw1DW0
	tDBXUshLzE21VXLxCdB1y8wBukxJoSwxpxQoFJBYXKykb2dTlF9akqqQkV9cYquUWpCSU2BS
	oFecmFtcmpeul5daYmVoYGBkClSYkJ3xb94vloIVPBWPWp6zNTBu5+pi5OSQEDCRePl2H3sX
	IxeHkMBuRok5nw9DOZ8YJV68XscIUgXm/O0RhOlY276NGaJoJ6PEurv/oDpamSRezVnHBlLF
	JqAusaH7OxtIQkTgBdCoZR2sIAlmgXCJc9MvgtnCAs4Srx4+YwexWQRUJY5Nfwlm8wpYSbye
	9oQFYp28xOoNB8DWSQgcYpdo2HeVESLhItG1qQ+qSFji1fEt7BC2lMTL/jYo20di/5xfUPUZ
	Ese2L2eFsO0lDlyZA9TLAXSQpsT6XfoQYVmJqafWMUHcySfR+/sJE0ScV2LHPBhbWWLmkfts
	ELakxM7LO8HGSAh4SOz5VAsJrViJ83tWMk5glJ2FsGABI+MqRsnUguLc9NRk0wLDvNRyeEQl
	5+duYgQnOC2XHYw35v/TO8TIxMF4iFGCg1lJhFf8w8s0Id6UxMqq1KL8+KLSnNTiQ4ymwCCb
	yCwlmpwPTLF5JfGGJpYGJmZmZiaWxmaGSuK8r1vnpggJpCeWpGanphakFsH0MXFwSjUwZbbx
	BKY+lumY+kr33M96g0meX5qeXqieM/l2nZj+1X0tpSdnWfW++qJqVFDfIdFSUyxinOxT6cTk
	lf5R2eVe6zkjm8f9f3QPxcg9UJjOW/Ik4aqadlXimYv8yzeI8EvU1RydWPZRSWw1i6uq2e15
	ceEl9yYvPdYcLBBip3T2/6FN3M0pV6Oq9kvuOr92udTML6c3Kh/UtGr6tfXv3hZDQQbNbf2b
	itnNlQRfCu2u4voUkWxZ8n6trodO0QbnhfJn53c4d99Y8E70+ORpLLw3jcte6kWEvunaHP7r
	Rknsm13O/ZEnHtsqmJsXJ/80btexNWit8d10Y1Vp5e9Nc9Ke77T1enL+YzazxYu8RgUlluKM
	REMt5qLiRACBXLhI+QMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupnluLIzCtJLcpLzFFi42LZdlhJXveF9Js0gyfXtSwezNvGZnH9y3NW
	i5sHdjJZ3P0zic3i/PkN7BYfe+6xWlzeNYfNYsb5fUwWF0+5Wiza+oXd4vCbdlaLf9c2sjjw
	eLy/0crusWlVJ5tH35ZVjB6fN8kFsERx2aSk5mSWpRbp2yVwZfyb94ulYAVPxaOW52wNjNu5
	uhg5OSQETCTWtm9j7mLk4hAS2M4oMf/DayaIhKTE7N/T2SFsYYmV/56zQxQ1M0k0tPxkBUmw
	CahLbOj+zgaSEBH4xCjx7esfsA5mgUiJH+1bwWxhAWeJVw+fgdksAqoSx6a/BLN5BawkXk97
	wgKxQV5i9YYDzBMYeRYwMqxiFE0tKM5Nz00uMNQrTswtLs1L10vOz93ECA4zraAdjMvW/9U7
	xMjEwXiIUYKDWUmEV/zDyzQh3pTEyqrUovz4otKc1OJDjNIcLErivMo5nSlCAumJJanZqakF
	qUUwWSYOTqkGppiMJfXnNWf/b8mf6sjKcS7xk3V46S97j+zXz9TO/Lb1bufqWyAofkegXdNB
	+uvizxm+cZueuQVv9Ti64/SyOTd8U4tkublLNDuCt7i9ENm/VuS9VuxZx4mpM7gnrEi9+Onv
	NZsVaVO/rEqweP3rLa/A3W2xeb8FzA7I7T3IqMdxV2dnQ/Kn5M4Udd9fcUUnXF/HyZ/9vKS5
	QcJfWM5KMMTwfMjEG2o3ebUkv5+X6old9Kcouc+MUWnria7Tk8OquX6/ZlDiturNYloVlil9
	XsVoCvvZx6vOOvk7ZyScvWKmrzd7/sXTk1eItx6rWePL83+/acu+ustxfRyKl6vCw8xd1y/W
	mzmLs/YAk+R+JZbijERDLeai4kQARVzhJKICAAA=
X-CMS-MailID: 20240919124112epcas5p1527a15ea137d853dee5625902769580e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240919124112epcas5p1527a15ea137d853dee5625902769580e
References: <CGME20240919124112epcas5p1527a15ea137d853dee5625902769580e@epcas5p1.samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>

PLL_CAM_CSI is the parent clock for the ACLK and PCLK in the CMU_CAM_CSI
block. When we gate ACLK or PCLK, the clock framework will subsequently
disables the parent clocks(PLL_CAM_CSI). Disabling PLL_CAM_CSI is causing
system level halt.

It was observed on FSD SoC, when we gate the ACLK and PCLK during CSI stop
streaming through pm_runtime_put system is getting halted. So marking
PLL_CAM_CSI as critical to prevent disabling.

Fixes: b826c3e4de1a ("clk: samsung: fsd: Add cam_csi block clock information")
Signed-off-by: Inbaraj E <inbaraj.e@samsung.com>
---
 drivers/clk/samsung/clk-fsd.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/samsung/clk-fsd.c b/drivers/clk/samsung/clk-fsd.c
index 6f984cfcd33c..d62981e4b1d6 100644
--- a/drivers/clk/samsung/clk-fsd.c
+++ b/drivers/clk/samsung/clk-fsd.c
@@ -1637,8 +1637,13 @@ static const struct samsung_pll_rate_table pll_cam_csi_rate_table[] __initconst
 };
 
 static const struct samsung_pll_clock cam_csi_pll_clks[] __initconst = {
-	PLL(pll_142xx, 0, "fout_pll_cam_csi", "fin_pll",
-	    PLL_LOCKTIME_PLL_CAM_CSI, PLL_CON0_PLL_CAM_CSI, pll_cam_csi_rate_table),
+	/*
+	 * PLL_CAM_CSI will never be turned off because PLL_CAM_CSI is
+	 * supplying clock to CMU SFR of CAM_CSI block.
+	 */
+	__PLL(pll_142xx, 0, "fout_pll_cam_csi", "fin_pll",
+		CLK_GET_RATE_NOCACHE | CLK_IS_CRITICAL, PLL_LOCKTIME_PLL_CAM_CSI,
+		PLL_CON0_PLL_CAM_CSI, pll_cam_csi_rate_table),
 };
 
 PNAME(mout_cam_csi_pll_p) = { "fin_pll", "fout_pll_cam_csi" };
-- 
2.17.1

