Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E2A8286B
	for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Apr 2024 09:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714036487; cv=none; b=S4KPNzIMuTZt57onexWBAudzK0ZQR2dmCuh6RDsopF3qA6nJ7dnWFhVZjcscuObFyPL8u4Ifn9RUlx78OrRXgZFsJOxckJVe0hA+BZLN+fMWMiwSkn1DFxCdq/H86Uct3jGzze3q9SAf3GGVT0r1xyYwmkqQmm+aioEvGQ+8630=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714036487; c=relaxed/simple;
	bh=w8DmHjhmixBD1MpqJQErAi/dPYdicM+U4z9paPA/yKY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 References; b=h8TMrEx4YF3BA4HneM1zDsjdU9eDpXerXsUMsAS6KAzyluDri2JaUNA81AWzZszul9TEN/8x5RkNmJdfajA5mvWwQQEEMMuHha1kxn0DgWejzPVYAtqzlVFjzEa8k4zec4+NxYJlXYlXrtpCdGyewrCW1Strjg/sYBE/ZyL8ySo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=t6lQ1RBJ; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="t6lQ1RBJ"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20240425091438euoutp02bbb85843a878e121f723cc0e479e054a~Jexij9mDN1103811038euoutp02h
	for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Apr 2024 09:14:38 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20240425091438euoutp02bbb85843a878e121f723cc0e479e054a~Jexij9mDN1103811038euoutp02h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1714036478;
	bh=dSWT3UoAS4/Wua/vPCBjIpcZyy6kk8OB5F6XDkzxgSs=;
	h=From:To:Cc:Subject:Date:References:From;
	b=t6lQ1RBJwKRbtBhYmc0j91u7IRrwYYXVpl1ygA5LMImBZVOjVv2ozIWKawqRu/3LP
	 PxVVrPDa8YGBZISbryHTvMfszeR5J4Ksp+1E1twblUjRgdNu/ryNqIwizW4JXMabrv
	 xy2H1ssi2IxGPqVKu/ShxU4ojIHal3bzVhcg6uXY=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTP id
	20240425091435eucas1p122dd19cfa3f70aae62e49b90a0edc750~JexfNkPJ82719127191eucas1p15;
	Thu, 25 Apr 2024 09:14:35 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
	eusmges2new.samsung.com (EUCPMTA) with SMTP id AC.65.09875.BFE1A266; Thu, 25
	Apr 2024 10:14:35 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20240425091434eucas1p11ec105de15d448c0fb14812705e4eac7~Jexe1sYPD1615316153eucas1p1k;
	Thu, 25 Apr 2024 09:14:34 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
	eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20240425091434eusmtrp279db1e4891851ee4e5bea0cc6e9748f1~Jexe0ytJP3026630266eusmtrp2Q;
	Thu, 25 Apr 2024 09:14:34 +0000 (GMT)
X-AuditID: cbfec7f4-131ff70000002693-83-662a1efb097d
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
	eusmgms1.samsung.com (EUCPMTA) with SMTP id 23.7C.08810.AFE1A266; Thu, 25
	Apr 2024 10:14:34 +0100 (BST)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20240425091434eusmtip2607a76f557028c26b41ceeb94f5a7b06~JexeFkxdx1286512865eusmtip2J;
	Thu, 25 Apr 2024 09:14:34 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Krzysztof Kozlowski
	<krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi
	<cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, Michael
	Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob
	Herring <robh@kernel.org>, David Lechner <david@lechnology.com>, Bjorn
	Andersson <andersson@kernel.org>, Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>
Subject: [PATCH] clk: samsung: exynos-clkout: Remove misleading
 of_match_table/MODULE_DEVICE_TABLE
Date: Thu, 25 Apr 2024 11:14:29 +0200
Message-Id: <20240425091429.948467-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFKsWRmVeSWpSXmKPExsWy7djPc7q/5bTSDOZuFbB4MG8bm8W2DhuL
	61+es1osahCzmHj+J5vF+fMb2C02Pb7GavGx5x6rxYzz+5gs1h65y25x8ZSrxf89O9gtDr9p
	Z7X4d20jiwOfx/sbrewem1Z1snl86j/J6nHn2h42j81L6j36tqxi9Pi8SS6APYrLJiU1J7Ms
	tUjfLoEr4/SdI6wFzzkrjp86zNjAuIiji5GDQ0LARKL1fFgXIxeHkMAKRolHh7cyQjhfGCVm
	Hepgg3A+M0q8f7KZFabjQKsuRHw5o8Sns3+BOjghOi6ftQax2QQMJbredrGB2CICGRI37+5n
	B2lgFjjOLHFy900mkISwQIrE1t57YDaLgKrE9y2bwBp4BewkbnybBDZUQkBeYv/Bs8wQcUGJ
	kzOfsIDYzEDx5q2zmUGGSgjc4ZDov76DBaLBReLR/s3MELawxKvjW9ghbBmJ/zvnM0E0tDNK
	LPh9H8qZwCjR8PwW1DpriTvnfrGB/MksoCmxfpc+RNhR4vV2kDdB3ueTuPFWEOIIPolJ26Yz
	Q4R5JTrahCCq1SRmHV8Ht/bghUtQ53hIvF93mRkSWLES3Y1P2CYwKsxC8tosJK/NQrhhASPz
	Kkbx1NLi3PTUYqO81HK94sTc4tK8dL3k/NxNjMDkdfrf8S87GJe/+qh3iJGJg/EQowQHs5II
	782PGmlCvCmJlVWpRfnxRaU5qcWHGKU5WJTEeVVT5FOFBNITS1KzU1MLUotgskwcnFINTJOE
	+NYEsfxYde1gwolLX9PkkpSOKj5fv+lvXk9asr3xDX39jf8OHb6qMeNsoMnP03258hMTHXzv
	ld59yZOk/0dtl8I7/dgz10/OvdGmteTZvoyI2B8aX/qe3722e9WFJzIb7QManAXitjYazN4X
	1HzpdMILfpH+eSsPuMw//+jKwvqWMjvppFUrfyZ+7zBZxjhjl57ZBykBs4ebLsq1vxFb0fVj
	Gj/j0be1GYu2lhectP/bJqwipGW5o7IiYerfo+seX+mzcFgcp8hrqeCxzkhh9it/w9lVFfub
	skWLq1RX7tSfe0PKb+OXe/JGxjucr7yK7loh8EN/87+vZfN/fShjZJC8Wpm2fU1MrME9xmtK
	LMUZiYZazEXFiQDr7lL/zQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprAIsWRmVeSWpSXmKPExsVy+t/xe7q/5LTSDGZfMLV4MG8bm8W2DhuL
	61+es1osahCzmHj+J5vF+fMb2C02Pb7GavGx5x6rxYzz+5gs1h65y25x8ZSrxf89O9gtDr9p
	Z7X4d20jiwOfx/sbrewem1Z1snl86j/J6nHn2h42j81L6j36tqxi9Pi8SS6APUrPpii/tCRV
	ISO/uMRWKdrQwkjP0NJCz8jEUs/Q2DzWyshUSd/OJiU1J7MstUjfLkEv4/SdI6wFzzkrjp86
	zNjAuIiji5GDQ0LAROJAq24XIxeHkMBSRok/K18xdzFyAsVlJE5Oa2CFsIUl/lzrYgOxhQQ+
	MUoc6HICsdkEDCW63kLERQSyJOZNuMMEMohZ4DyzxI2G7YwgCWGBJImvK76ygNgsAqoS37ds
	AmvgFbCTuPFtEiPEAnmJ/QfPMkPEBSVOznwCVs8MFG/eOpt5AiPfLCSpWUhSCxiZVjGKpJYW
	56bnFhvqFSfmFpfmpesl5+duYgRGzbZjPzfvYJz36qPeIUYmDsZDjBIczEoivDc/aqQJ8aYk
	VlalFuXHF5XmpBYfYjQFum8is5Rocj4wbvNK4g3NDEwNTcwsDUwtzYyVxHk9CzoShQTSE0tS
	s1NTC1KLYPqYODilGpgYW+K0lBYpq1ukvrrD8rJieaqSKbPcg6l8s3c2rd7UNrk9aTnHiUR7
	a+E/jJsZv4bY/jM76WTT3RSjLjxlE+vUpDBeSeU66/U1U3kfik4/F2QsVvFm8jvPzaHr+3ax
	mmW9DBJVPqf25n64ohifoHdE/OLqTXU3zN0YYySV1qlfD1sQt+50GHPwnC1MoZXyswt/ZtzY
	OikzO+dWuNCL60EXKrfsKEg6zCujvcArQnpzUOLmY2mHJt2fd6XB/fIf/4usV/9F303uiVsf
	3KO41PrvRtV9D7YufOP9dsniB36FlhneW+fcVou2DfK+r/XxTSDn/GmSt3xqOQXCFm54uqtJ
	YEK7oLZH/razjGLT5ZRYijMSDbWYi4oTAVKuuH8jAwAA
X-CMS-MailID: 20240425091434eucas1p11ec105de15d448c0fb14812705e4eac7
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20240425091434eucas1p11ec105de15d448c0fb14812705e4eac7
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20240425091434eucas1p11ec105de15d448c0fb14812705e4eac7
References: <CGME20240425091434eucas1p11ec105de15d448c0fb14812705e4eac7@eucas1p1.samsung.com>

Since commit 9484f2cb8332 ("clk: samsung: exynos-clkout: convert to
module driver") this driver is instantiated as MFD-cell (matched by
platform device name) not as a real platform device created by OF code.
Remove then of_match_table and related MODULE_DEVICE_TABLE to avoid
further confusion.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/clk/samsung/clk-exynos-clkout.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos-clkout.c b/drivers/clk/samsung/clk-exynos-clkout.c
index 503c6f5b20d5..0c7f4e2aa366 100644
--- a/drivers/clk/samsung/clk-exynos-clkout.c
+++ b/drivers/clk/samsung/clk-exynos-clkout.c
@@ -75,7 +75,6 @@ static const struct of_device_id exynos_clkout_ids[] = {
 		.data = &exynos_clkout_exynos5,
 	}, { }
 };
-MODULE_DEVICE_TABLE(of, exynos_clkout_ids);
 
 /*
  * Device will be instantiated as child of PMU device without its own
@@ -237,7 +236,6 @@ static SIMPLE_DEV_PM_OPS(exynos_clkout_pm_ops, exynos_clkout_suspend,
 static struct platform_driver exynos_clkout_driver = {
 	.driver = {
 		.name = "exynos-clkout",
-		.of_match_table = exynos_clkout_ids,
 		.pm = &exynos_clkout_pm_ops,
 	},
 	.probe = exynos_clkout_probe,
-- 
2.34.1

