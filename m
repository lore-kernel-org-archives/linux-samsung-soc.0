Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91EFE132139
	for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Sep 2024 15:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727364829; cv=none; b=tjBa55DYyKRg3LhvRkdoEkpG+PPkIDKFfT8jQdUlKx7cbpWoB4mqOxr1cNgk4p4pkplwk0E8Hb+MNpONUlRXzvI3p/bcj2ltDkQSu1m6VlhXtx56D3KmAO5yJcK+4AaFdtDN7MkUFkarusurXUcmLenQdZXJDmAlDeIzaqYAL9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727364829; c=relaxed/simple;
	bh=hN35YSf4R2SJmePgsAvn9okBZVEwJK3uK7VJFhLy2Hc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:Content-Type:
	 References; b=RzvD2TXQTqgubBAtLecYOxhpbU0RPBw2cjRHIN3wPk7ecKRlX6K+FO3kvqVFpiQ4+VMEYYpc/syS3LVcGiy/LH2TA4R4TP2+P0X9eWLpUZmNCx0RCuZUKd0sUWulrgpQh/6CEJ3s720g7tEDZhkU3gfBx7fidEJ4pHwSLlH71Zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=R/9RXGQD; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="R/9RXGQD"
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20240926153338epoutp017df9df9cd51f04b1febd90e03b57a021~41SaYATxu1265212652epoutp01R
	for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Sep 2024 15:33:38 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20240926153338epoutp017df9df9cd51f04b1febd90e03b57a021~41SaYATxu1265212652epoutp01R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1727364818;
	bh=BOInwyPdvLbTIKemYHKGl7y4OewiBwzg9VJOEJ8GllE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=R/9RXGQD86X93sVqXVp5Iq05PPnmdiZio9Fh4/XuwSWMJ2YG1fVQ1d79eQr/eAY6C
	 u/Di4Bl5IZXPwVeC1nHQt3O/qSoLHTu8Jo5oJHLTBKvmz57B4gJWh1rESKtrJMk39L
	 NQuFbZrC2JTo3cGA2yteisPxZ2ewcK5XL7ejYclI=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTP id
	20240926153338epcas5p3982113c39422019439536bd364181743~41SZvtRW82829728297epcas5p3A;
	Thu, 26 Sep 2024 15:33:38 +0000 (GMT)
Received: from epsmges5p1new.samsung.com (unknown [182.195.38.179]) by
	epsnrtp2.localdomain (Postfix) with ESMTP id 4XDyL86dTpz4x9Pt; Thu, 26 Sep
	2024 15:33:36 +0000 (GMT)
Received: from epcas5p1.samsung.com ( [182.195.41.39]) by
	epsmges5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	3C.26.09640.0DE75F66; Fri, 27 Sep 2024 00:33:36 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20240926145343epcas5p2bef73ed8d3e36e95c05bd8d96a2e5de8~40vjVY68g1832418324epcas5p2s;
	Thu, 26 Sep 2024 14:53:43 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20240926145343epsmtrp16cd22e28c2e71b3b1cd1a85fa76aea47~40vjUoknR0809608096epsmtrp1V;
	Thu, 26 Sep 2024 14:53:43 +0000 (GMT)
X-AuditID: b6c32a49-a57ff700000025a8-18-66f57ed0b936
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	F2.FA.08456.77575F66; Thu, 26 Sep 2024 23:53:43 +0900 (KST)
Received: from cheetah.sa.corp.samsungelectronics.net (unknown
	[107.109.115.53]) by epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20240926145341epsmtip1865da3ecb351ec43e4815776a1b1e1ec~40vhZstqk2105721057epsmtip1g;
	Thu, 26 Sep 2024 14:53:41 +0000 (GMT)
From: Varada Pavani <v.pavani@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	alim.akhtar@samsung.com, mturquette@baylibre.com, sboyd@kernel.org,
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: aswani.reddy@samsung.com, pankaj.dubey@samsung.com,
	gost.dev@samsung.com, Varada Pavani <v.pavani@samsung.com>
Subject: [PATCH 2/2] clk: samsung: Fix errors reported by checkpatch
Date: Thu, 26 Sep 2024 20:21:32 +0530
Message-Id: <20240926145132.1763-3-v.pavani@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240926145132.1763-1-v.pavani@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpik+LIzCtJLcpLzFFi42LZdlhTXfdC3dc0g7arehYP5m1jszi0eSu7
	xfUvz1ktbh7YyWRx/vwGdotNj6+xWnzsucdqcXnXHDaLGef3MVlcPOVqsWjrF3aLw2/aWS3+
	XdvIYrGh9xW7A5/H+xut7B6bVnWyeWxeUu/Rt2UVo8fnTXIBrFHZNhmpiSmpRQqpecn5KZl5
	6bZK3sHxzvGmZgaGuoaWFuZKCnmJuam2Si4+AbpumTlAdyoplCXmlAKFAhKLi5X07WyK8ktL
	UhUy8otLbJVSC1JyCkwK9IoTc4tL89L18lJLrAwNDIxMgQoTsjOaz21kKpgrUbFg5wW2BsYZ
	ol2MnBwSAiYSEz7NYO9i5OIQEtjNKLHn6BEo5xOjxI23z5khnG+MEr9fnGGDadl6+DZU1V5G
	iQOne6CqWpkkls/azQpSxSagJbF66nJWkISIQB+TxN0TE5hAEswCJRL/P70GKxIWcJHYv+Mh
	O4jNIqAq8XHKU7AaXgELiakz3jBBrJOXWL3hADOIzSlgKfFxz2EWkKESAo0cEue/bmWHKHKR
	OL/tIQuELSzx6vgWqLiUxMv+NiCbA8hOlmj/xA0RzpG4tHsV1Hx7iQNX5rCAlDALaEqs36UP
	EZaVmHpqHdTJfBK9v59AlfNK7JgHYytJ7NwxAcqWkHi6eg00hDwkjk68BQ2UHkaJz6umMU9g
	lJuFsGIBI+MqRsnUguLc9NRi0wLDvNRyeLQl5+duYgQnRi3PHYx3H3zQO8TIxMF4iFGCg1lJ
	hHfSzY9pQrwpiZVVqUX58UWlOanFhxhNgeE3kVlKNDkfmJrzSuINTSwNTMzMzEwsjc0MlcR5
	X7fOTRESSE8sSc1OTS1ILYLpY+LglGpgUjzzgGXpP3OdX05FuWe+8Ku0fHD8OiX/l82n7pDK
	k0nai2fI7d7S/nrC1htKO/Q9y/t2tX2f2K9XnhlWcWM2X9t249VLewrkn6+3WP+x5j7XKbXM
	1WdCjvPc9Vtrddxvn/aOJ5Nz6z49WlNX2Hy4Y2P0oqvrD/Q+Nfu/KHAdZ+yPs/nfvCMEjny7
	ZeP8tfbSt99/WNMEuH6mlF6Z9znwZmv/2fim0xHzPn6TTBbs7lllrFPy4xjz/uKwrNal6q+Y
	DsRkBXXenymYxFd/rcPpX9Q/z9jle6xiz22xEOHTuiRzWJMlLTFd3GmZ/LIHwj9mCm++9knv
	6EyZhr4JD3Tq5c/tlPuy9fTRnAcb3h08fV+JpTgj0VCLuag4EQAz7pS8FQQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrOLMWRmVeSWpSXmKPExsWy7bCSnG556dc0g+vPOC0ezNvGZnFo81Z2
	i+tfnrNa3Dywk8ni/PkN7BabHl9jtfjYc4/V4vKuOWwWM87vY7K4eMrVYtHWL+wWh9+0s1r8
	u7aRxWJD7yt2Bz6P9zda2T02repk89i8pN6jb8sqRo/Pm+QCWKO4bFJSczLLUov07RK4MprP
	bWQqmCtRsWDnBbYGxhmiXYycHBICJhJbD99m72Lk4hAS2M0oceX3NlaIhITEzm+tzBC2sMTK
	f8+hipqZJBbd2MIIkmAT0JJYPXU5K0hCRGAWk8TcJR9Yuhg5OJgFKiTm/DcGqREWcJHYv+Mh
	O4jNIqAq8XHKUyYQm1fAQmLqjDdMEAvkJVZvOAC2jFPAUuLjnsNgY4SAaq7MZJ/AyLeAkWEV
	o2RqQXFuem6xYYFRXmq5XnFibnFpXrpecn7uJkZw2Gpp7WDcs+qD3iFGJg7GQ4wSHMxKIryT
	bn5ME+JNSaysSi3Kjy8qzUktPsQozcGiJM777XVvipBAemJJanZqakFqEUyWiYNTqoHpiOTv
	j7bGx5M5N3iqOPBOzbmafXeH/Kqk+oo5kTqSC+VubPU5ZXXGNSHm/9zzD94dvZDUcvzpxz0H
	q87fVJ3C+n/Z61XJpofecXxrqtt+pSvk0gSZhw2id90kCma9PBav/2cb87TXpQ8dHrB8S7sT
	3X0rhMvm05zPxSLMwVkhBbE/FkxLc2irnnpV4eJ6LcMXm96vuLh/9VN1JtPZ8awR8YIXr9ya
	KHjgvcQ1ppwy5w1Bmo0VG67FaLysXfeh6OOmOXM7PjyUehv+Pbkv68jie5v6Yu7lNTG6TIhd
	IqJ2IPuuVKUuZ77Z684vrZ2fJmzpDn0/L89TOfyX5fauV1v8U+ZPPO1u1PnxzfR029+T/iqx
	FGckGmoxFxUnAgDG0QlDygIAAA==
X-CMS-MailID: 20240926145343epcas5p2bef73ed8d3e36e95c05bd8d96a2e5de8
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240926145343epcas5p2bef73ed8d3e36e95c05bd8d96a2e5de8
References: <20240926145132.1763-1-v.pavani@samsung.com>
	<CGME20240926145343epcas5p2bef73ed8d3e36e95c05bd8d96a2e5de8@epcas5p2.samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>

Fix checkpatch errors from clock drivers.
ERROR: space prohibited before that ','
ERROR: space required after that ','

Signed-off-by: Varada Pavani <v.pavani@samsung.com>
---
 drivers/clk/samsung/clk-exynos3250.c | 2 +-
 drivers/clk/samsung/clk-exynos5260.c | 4 ++--
 drivers/clk/samsung/clk-exynos5420.c | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos3250.c b/drivers/clk/samsung/clk-exynos3250.c
index cd4fec323a42..aec4d18c1f9e 100644
--- a/drivers/clk/samsung/clk-exynos3250.c
+++ b/drivers/clk/samsung/clk-exynos3250.c
@@ -260,7 +260,7 @@ static const struct samsung_mux_clock mux_clks[] __initconst = {
 
 	/* SRC_TOP0 */
 	MUX(CLK_MOUT_EBI, "mout_ebi", mout_ebi_p, SRC_TOP0, 28, 1),
-	MUX(CLK_MOUT_ACLK_200, "mout_aclk_200", group_div_mpll_pre_p,SRC_TOP0, 24, 1),
+	MUX(CLK_MOUT_ACLK_200, "mout_aclk_200", group_div_mpll_pre_p, SRC_TOP0, 24, 1),
 	MUX(CLK_MOUT_ACLK_160, "mout_aclk_160", group_div_mpll_pre_p, SRC_TOP0, 20, 1),
 	MUX(CLK_MOUT_ACLK_100, "mout_aclk_100", group_div_mpll_pre_p, SRC_TOP0, 16, 1),
 	MUX(CLK_MOUT_ACLK_266_1, "mout_aclk_266_1", mout_aclk_266_1_p, SRC_TOP0, 14, 1),
diff --git a/drivers/clk/samsung/clk-exynos5260.c b/drivers/clk/samsung/clk-exynos5260.c
index 16da6ef5ca0c..fd0520d204dc 100644
--- a/drivers/clk/samsung/clk-exynos5260.c
+++ b/drivers/clk/samsung/clk-exynos5260.c
@@ -1458,7 +1458,7 @@ static const struct samsung_fixed_rate_clock fixed_rate_clks[] __initconst = {
 	FRATE(PHYCLK_HDMI_LINK_O_TMDS_CLKHI, "phyclk_hdmi_link_o_tmds_clkhi",
 			NULL, 0, 125000000),
 	FRATE(PHYCLK_MIPI_DPHY_4L_M_TXBYTECLKHS,
-			"phyclk_mipi_dphy_4l_m_txbyte_clkhs" , NULL,
+			"phyclk_mipi_dphy_4l_m_txbyte_clkhs", NULL,
 			0, 187500000),
 	FRATE(PHYCLK_DPTX_PHY_O_REF_CLK_24M, "phyclk_dptx_phy_o_ref_clk_24m",
 			NULL, 0, 24000000),
@@ -1629,7 +1629,7 @@ static const struct samsung_mux_clock top_mux_clks[] __initconst = {
 			mout_isp1_media_400_p,
 			MUX_SEL_TOP_ISP10, 4, 1),
 	MUX(TOP_MOUT_ACLK_ISP1_400, "mout_aclk_isp1_400", mout_aclk_isp1_400_p,
-			MUX_SEL_TOP_ISP10, 8 , 1),
+			MUX_SEL_TOP_ISP10, 8, 1),
 	MUX(TOP_MOUT_ISP1_MEDIA_266, "mout_isp1_media_266",
 			mout_isp1_media_266_p,
 			MUX_SEL_TOP_ISP10, 16, 1),
diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
index a4864ea0d0d2..333c52fda17f 100644
--- a/drivers/clk/samsung/clk-exynos5420.c
+++ b/drivers/clk/samsung/clk-exynos5420.c
@@ -295,8 +295,8 @@ static const struct samsung_clk_reg_dump exynos5420_set_clksrc[] = {
 /* list of all parent clocks */
 PNAME(mout_mspll_cpu_p) = {"mout_sclk_cpll", "mout_sclk_dpll",
 				"mout_sclk_mpll", "mout_sclk_spll"};
-PNAME(mout_cpu_p) = {"mout_apll" , "mout_mspll_cpu"};
-PNAME(mout_kfc_p) = {"mout_kpll" , "mout_mspll_kfc"};
+PNAME(mout_cpu_p) = {"mout_apll", "mout_mspll_cpu"};
+PNAME(mout_kfc_p) = {"mout_kpll", "mout_mspll_kfc"};
 PNAME(mout_apll_p) = {"fin_pll", "fout_apll"};
 PNAME(mout_bpll_p) = {"fin_pll", "fout_bpll"};
 PNAME(mout_cpll_p) = {"fin_pll", "fout_cpll"};
-- 
2.17.1

