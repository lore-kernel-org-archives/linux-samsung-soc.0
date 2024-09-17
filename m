Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63997165EE3
	for <linux-samsung-soc@vger.kernel.org>; Tue, 17 Sep 2024 10:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726569212; cv=none; b=LQBDPs5lHoSbaia+g3aYlgNnYFuxkfckMoqlFCxI5WZ0lrYB2Xg5euxY/BYGjXmmwdxZuJ90vkExlz28brEJ20rUQ7kPB0lLg44iTSkv3eOmFzDkFFWApxS6RvW5CsbSva3iIuDw+yH7bTaI9cRLKhrcWbGRg3gjbpT+AHmhCO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726569212; c=relaxed/simple;
	bh=GXHmv3xE4dKtJvrMtkT3tLwCpZBr3MGDCIZtW82P684=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:References; b=YxEZAfT0XZC+GG0QnjNlJ6RJsoB87n6ALIM9A57AysidsiNoOA+OFR1P9wtlRuU7waPP//1KAFegfmtzRqPxxsRW07ZgbkABe/T8Ual7DERkoQIRAtwU00KhIJNGb+SurFoID5UOh/4kgT5JBISTzGXk+yPgaAbWuogCNdmUe0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=Ei0v93IU; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Ei0v93IU"
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20240917103328epoutp027e837d76062f6649f5f485da069b4c4b~2AYwRYLZO2019520195epoutp02m
	for <linux-samsung-soc@vger.kernel.org>; Tue, 17 Sep 2024 10:33:28 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20240917103328epoutp027e837d76062f6649f5f485da069b4c4b~2AYwRYLZO2019520195epoutp02m
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1726569208;
	bh=t9pNkSuC4u/Jt0z8TVovLGh2ODPwcLGaLQu4B08KWzE=;
	h=From:To:Cc:Subject:Date:References:From;
	b=Ei0v93IUn/tRPoe0W2noye+zu8qmM8qUggffyMjuo56MM80t0hqVf6n9DjH39zyWO
	 XMIpZYfLT1rhvymupvGqc2YxWl4oOf9EU3n6wLsa6/NFGiKFfw1ZizQg2dJuC5iTgg
	 tiogIWQ94hsLjrPX1C3aw5Cl0e9cDyGGrePMMXro=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTP id
	20240917103327epcas5p4ae1828ec38b03d1bf870260a7ee611eb~2AYv04sba0820308203epcas5p4Z;
	Tue, 17 Sep 2024 10:33:27 +0000 (GMT)
Received: from epsmges5p2new.samsung.com (unknown [182.195.38.178]) by
	epsnrtp3.localdomain (Postfix) with ESMTP id 4X7J5y0gCBz4x9Pp; Tue, 17 Sep
	2024 10:33:26 +0000 (GMT)
Received: from epcas5p1.samsung.com ( [182.195.41.39]) by
	epsmges5p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	7D.BF.09743.5FA59E66; Tue, 17 Sep 2024 19:33:26 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20240917101102epcas5p3b17d2774cb74fd4cf61ea52fde85c300~2AFKoBRft1994019940epcas5p3m;
	Tue, 17 Sep 2024 10:11:02 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20240917101102epsmtrp20e1086b90a1682a6be30a020922f129e~2AFKnD9Ef1153611536epsmtrp2B;
	Tue, 17 Sep 2024 10:11:02 +0000 (GMT)
X-AuditID: b6c32a4a-3b1fa7000000260f-3d-66e95af57223
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	7A.90.08964.5B559E66; Tue, 17 Sep 2024 19:11:01 +0900 (KST)
Received: from cheetah.sa.corp.samsungelectronics.net (unknown
	[107.109.115.53]) by epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20240917101059epsmtip27876f395701c6dfecd4b26eab13e47c5~2AFIk5IHT1640416404epsmtip2D;
	Tue, 17 Sep 2024 10:10:59 +0000 (GMT)
From: Inbaraj E <inbaraj.e@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	alim.akhtar@samsung.com, mturquette@baylibre.com, sboyd@kernel.org,
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: pankaj.dubey@samsung.com, gost.dev@samsung.com, Inbaraj E
	<inbaraj.e@samsung.com>
Subject: [PATCH] clk: samsung: fsd: Mark PLL_CAM_CSI as critical
Date: Tue, 17 Sep 2024 15:40:16 +0530
Message-Id: <20240917101016.23238-1-inbaraj.e@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrOKsWRmVeSWpSXmKPExsWy7bCmuu63qJdpBhfuMVo8mLeNzeL6l+es
	FjcP7GSyuPtnEpvF+fMb2C0+9txjtbi8aw6bxYzz+5gsLp5ytVi09Qu7xeE37awW/65tZHHg
	8Xh/o5XdY9OqTjaPvi2rGD0+b5ILYInKtslITUxJLVJIzUvOT8nMS7dV8g6Od443NTMw1DW0
	tDBXUshLzE21VXLxCdB1y8wBukxJoSwxpxQoFJBYXKykb2dTlF9akqqQkV9cYquUWpCSU2BS
	oFecmFtcmpeul5daYmVoYGBkClSYkJ3x7e8O9oILXBVL+p+wNDB2cXYxcnJICJhIPO+azNrF
	yMUhJLCbUWLOjgtMEM4nRoktr7+wQTjfGCWWLfwB5HCAtbz+nAYR38sosbv7DwuE08ok8X7W
	WiaQuWwC6hIbur+DdYsIvGCUeLGsgxUkwSwQLnFu+kUwW1jAQeJDyyNmEJtFQFXi/4FrYM28
	AlYS708sZYY4UF5i9YYDzCCDJATOsUu8m9jMCpFwkeiY/RmqSFji1fEt7BC2lMTnd3vZIGwf
	if1zfjFC2BkSx7Yvh+q1lzhwZQ4LyDvMApoS63fpQ4RlJaaeWscEcSefRO/vJ0wQcV6JHfNg
	bGWJmUfuQ42XlNh5eScLhO0h0b5tJ9g5QgKxEpN2TWCZwCg7C2HDAkbGVYySqQXFuempxaYF
	Rnmp5fCYSs7P3cQITnFaXjsYHz74oHeIkYmD8RCjBAezkgiv7e+naUK8KYmVValF+fFFpTmp
	xYcYTYFhNpFZSjQ5H5hk80riDU0sDUzMzMxMLI3NDJXEeV+3zk0REkhPLEnNTk0tSC2C6WPi
	4JRqYBJ7ssnz+/xbKrMmMew0e8+u41a78VWdjuySjBfBJ86nF5Vb6homlU3yE1Nd9upCt+vG
	2xqC2+VbCj0i/VvPGTmVzC977PGy6a/zSmX9yVUGvhbVBQzrllY4OHx9tMuVf+Hjc2LnN8ZZ
	Ckd3yy741Lzpha7T7lffRds1mbjXnZl/30Uud2om89S9zdp3f5txiv3bkOdkt9fL8OnVgwkJ
	Gq88hAU2dK86om3+dKK4YYH/igz5Hff3703iZP/396cjc2mEM3fIhvjZNwxedLmyxmsvvKkb
	y/FVYNWlpPUbap48zPTRyzVd8eX4z30Pc66XTleadDKE7XSY/Grbnc1zZ17iDdq4p+HwqtPv
	j/F4fFViKc5INNRiLipOBAD9Vdgx+gMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprELMWRmVeSWpSXmKPExsWy7bCSvO7W0JdpBve+aFk8mLeNzeL6l+es
	FjcP7GSyuPtnEpvF+fMb2C0+9txjtbi8aw6bxYzz+5gsLp5ytVi09Qu7xeE37awW/65tZHHg
	8Xh/o5XdY9OqTjaPvi2rGD0+b5ILYInisklJzcksSy3St0vgyvj2dwd7wQWuiiX9T1gaGLs4
	uxg5OCQETCRef07rYuTiEBLYzSjx+0grYxcjJ1BcUmL27+nsELawxMp/z9khipqZJO59Ws8K
	kmATUJfY0P2dDSQhIvCJUeLb1z9gHcwCkRI/2reC2cICDhIfWh4xg9gsAqoS/w9cYwKxeQWs
	JN6fWMoMsUFeYvWGA8wTGHkWMDKsYpRMLSjOTc8tNiwwzEst1ytOzC0uzUvXS87P3cQIDjYt
	zR2M21d90DvEyMTBeIhRgoNZSYTX9vfTNCHelMTKqtSi/Pii0pzU4kOM0hwsSuK84i96U4QE
	0hNLUrNTUwtSi2CyTBycUg1MzOu73pi+v/G8epoCz8RtxdxfH5xTsVFz2x39Zs9W9YWlz3u5
	edOWXpy144ZbUcdi1YnLTmuHLXmwaKuSu0lI6dFv5xndrl6o3CNgzyL7s27WqW/BsYa9xnqf
	VbINpy3/8bKnPHNJWsIHhrezFRj9+iWZZKPjwxId+9/tr+hMPC1ktsxAc1m369Tfz65b2EzM
	lX/A9+HWHbVNl+tUnlfFH5x7O29v2y8lli22B51/ff9c4D3X9r5sRlaA1fmoKoG+HS3iPZ6S
	gt9TDvGV9rfbcatcPX169vevG5p/87BN+zA9OXNVqtTbPvv0spZnPwSfO5/17Y688ez8vEvX
	+g3LPWNCjuhFez5hEm3IurlHiaU4I9FQi7moOBEAFKqb2aUCAAA=
X-CMS-MailID: 20240917101102epcas5p3b17d2774cb74fd4cf61ea52fde85c300
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240917101102epcas5p3b17d2774cb74fd4cf61ea52fde85c300
References: <CGME20240917101102epcas5p3b17d2774cb74fd4cf61ea52fde85c300@epcas5p3.samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>

PLL_CAM_CSI is the parent clock for the ACLK and PCLK in the CMU_CAM_CSI
block. When we gate ACLK or PCLK, the clock framework will subsequently
disables the parent clocks(PLL_CAM_CSI). Disabling PLL_CAM_CSI is causing
sytem level halt.

It was observed on FSD SoC, when we gate the ACLK and PCLK during CSI stop
streaming through pm_runtime_put system is getting halted. So marking
PLL_CAM_CSI as critical to prevent disabling.

Signed-off-by: Inbaraj E <inbaraj.e@samsung.com>
---
 drivers/clk/samsung/clk-fsd.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/samsung/clk-fsd.c b/drivers/clk/samsung/clk-fsd.c
index 6f984cfcd33c..b1764aab9429 100644
--- a/drivers/clk/samsung/clk-fsd.c
+++ b/drivers/clk/samsung/clk-fsd.c
@@ -1637,8 +1637,9 @@ static const struct samsung_pll_rate_table pll_cam_csi_rate_table[] __initconst
 };
 
 static const struct samsung_pll_clock cam_csi_pll_clks[] __initconst = {
-	PLL(pll_142xx, 0, "fout_pll_cam_csi", "fin_pll",
-	    PLL_LOCKTIME_PLL_CAM_CSI, PLL_CON0_PLL_CAM_CSI, pll_cam_csi_rate_table),
+	__PLL(pll_142xx, 0, "fout_pll_cam_csi", "fin_pll",
+		CLK_GET_RATE_NOCACHE | CLK_IS_CRITICAL, PLL_LOCKTIME_PLL_CAM_CSI,
+		PLL_CON0_PLL_CAM_CSI, pll_cam_csi_rate_table),
 };
 
 PNAME(mout_cam_csi_pll_p) = { "fin_pll", "fout_pll_cam_csi" };
-- 
2.17.1

