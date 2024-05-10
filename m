Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEBC57F464
	for <linux-samsung-soc@vger.kernel.org>; Fri, 10 May 2024 07:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715324826; cv=none; b=Dr5q7wQxz9tybS9w119pG3OlPTVeV9Ld10Ur5rHh9sZVc1uh49inLqYS4vo5I3VA4ypCNjbIXgZy5251JfWoC2Z58+TJAkaNIlmBRQjgjD6zBmLhZwybXNc8gZJFcO6DSwIeDmfR/yQ0+LzDohSX4QubgTfKOHbOnCsmQm2t73s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715324826; c=relaxed/simple;
	bh=Zpf5INKjjYukVz8DFvQHW5RI3khhh5ez19lfJSwnlno=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 References; b=edFQETfzvKRBRTfdpereHuaul6FsttennV65+MkxsxOD5CR0nlLiu3XGHV10Z/4s3SSJML6I2F0EA/BPz8rtK4yHQ4kr49ps7YN3OIhlq6FhsF24U+yK2bC92qcrSGsE8bRPW6ELN5EKI9xG5kF3+UxbeZBoUXjlBH6UBQeGJ00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=VOP9xweU; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="VOP9xweU"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20240510070701euoutp0296c95b76ebc68f19db50d6adbaaaec58~ODtZc6XEj0049400494euoutp02S
	for <linux-samsung-soc@vger.kernel.org>; Fri, 10 May 2024 07:07:01 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20240510070701euoutp0296c95b76ebc68f19db50d6adbaaaec58~ODtZc6XEj0049400494euoutp02S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1715324821;
	bh=t+PIfFfAc5pe3zy981eBoXzF/9A+OKFYmnFUbGNUeVI=;
	h=From:To:Cc:Subject:Date:References:From;
	b=VOP9xweUee4qMLc8Uc12tk6T1IKUSbZGtuJymR+UJ5xRweV2RBexh8MZEWUy2ifh7
	 hIEiOR2cXsIYGAQqN5KXbUxHsig/8BBx3ETvo1o1bxUcZdcUYmSofgqMCjXJtzC971
	 6iORRHb+5ktu5J71HIn/EC2bEcTkclInjFTO1K5w=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTP id
	20240510070701eucas1p2ddc55ce2a208c66be256d89a2977332d~ODtY0xl7-1394813948eucas1p2q;
	Fri, 10 May 2024 07:07:01 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
	eusmges3new.samsung.com (EUCPMTA) with SMTP id 04.D4.09620.597CD366; Fri, 10
	May 2024 08:07:01 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20240510070700eucas1p10ed1c978c78366b412770fdae6d4f384~ODtYasfIy0179901799eucas1p1g;
	Fri, 10 May 2024 07:07:00 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
	eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20240510070700eusmtrp2c63f09c715f6b9c1f234b20a8e8ae51b~ODtYaCXQb0925609256eusmtrp21;
	Fri, 10 May 2024 07:07:00 +0000 (GMT)
X-AuditID: cbfec7f5-d31ff70000002594-06-663dc7954fd2
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
	eusmgms1.samsung.com (EUCPMTA) with SMTP id DE.67.08810.497CD366; Fri, 10
	May 2024 08:07:00 +0100 (BST)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20240510070659eusmtip1f2b55a52fce4729afab679c8d7c2f9f8~ODtXkPf-V0225802258eusmtip16;
	Fri, 10 May 2024 07:06:59 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Krzysztof Kozlowski
	<krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi
	<cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, Michael
	Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob
	Herring <robh@kernel.org>, David Lechner <david@lechnology.com>, Bjorn
	Andersson <andersson@kernel.org>, Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>, William McVicker <willmcvicker@google.com>
Subject: [PATCH v3] clk: samsung: exynos-clkout: Remove misleading
 of_match_table/MODULE_DEVICE_TABLE
Date: Fri, 10 May 2024 09:06:53 +0200
Message-Id: <20240510070653.537089-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrMKsWRmVeSWpSXmKPExsWy7djPc7pTj9umGcz9ym3xYN42NottHTYW
	1788Z7VY1CBmMfH8TzaL8+c3sFtsenyN1eJjzz1Wixnn9zFZrD1yl93i4ilXi/97drBbHH7T
	zmrx79pGFotVn/4zOvB7vL/Ryu6xYFOpx6ZVnWwen/pPsnrcubaHzWPzknqPvi2rGD0+b5IL
	4IjisklJzcksSy3St0vgymj4uYCl4KFARePWG6wNjD18XYycHBICJhInf01kBbGFBFYwStw9
	HtDFyAVkf2GUOPfjHiOE85lRYuWx88wwHX2XJ7FAJJYzSqxeeI8VrqXr/HywWWwChhJdb7vY
	QGwRgQyJm3f3s4MUMQt8ZpaYdPk9I0hCWCBdYtLV9WANLAKqEpdPfwEay8HBK2AncWebH8Q2
	eYn9B8+CbeYVEJQ4OfMJC4jNDBRv3jqbGWSmhMAbDokZ2w8yQjS4SJw/tQDKFpZ4dXwLO4Qt
	I/F/53wmiIZ2RokFv+9DORMYJRqe34LqsJa4c+4XG8gVzAKaEut36UOEHSU2vpnCDBKWEOCT
	uPFWEOIIPolJ26ZDhXklOtqEIKrVJGYdXwe39uCFS1AlHhIdR4MgQR0r0X99A/sERoVZSD6b
	heSzWQgnLGBkXsUonlpanJueWmycl1quV5yYW1yal66XnJ+7iRGYzk7/O/51B+OKVx/1DjEy
	cTAeYpTgYFYS4a2qsU4T4k1JrKxKLcqPLyrNSS0+xCjNwaIkzquaIp8qJJCeWJKanZpakFoE
	k2Xi4JRqYHL24LS8+1n31+ltjdpX489/nh25I3PRrNN7bGqVvx97b3rkyItWA6/Nb+fv0/qz
	39LhdL3Fxdt+k4SsZSelK//7cnemQ9pj7yj2eK8Tp6Ofa90W/1PZ47Hk0fTO5a1Fq9PW8WSd
	/5aQWzQt7+OXxtCf37TFJ0W4Sx183dd6V+r70d1uAdvitx8TmdQW72m8qnjtelGev/0/Vc0e
	OpT9zMt7u2jB0oiDq/Y4bC+VOXHj/c2KfawlzI6tudL1+6WLrnw5mmr8Ns733d7TW53f7Fm6
	wm1e31M3/S6rrh/eD013hfyPZe+UvCY0aWZQX57mrAs6Vp/Y1/K+latd1yBh1djGHpTUsFZh
	49uKwoi2wD4lluKMREMt5qLiRAAwYut81gMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprJIsWRmVeSWpSXmKPExsVy+t/xu7pTjtumGVz/qG7xYN42NottHTYW
	1788Z7VY1CBmMfH8TzaL8+c3sFtsenyN1eJjzz1Wixnn9zFZrD1yl93i4ilXi/97drBbHH7T
	zmrx79pGFotVn/4zOvB7vL/Ryu6xYFOpx6ZVnWwen/pPsnrcubaHzWPzknqPvi2rGD0+b5IL
	4IjSsynKLy1JVcjILy6xVYo2tDDSM7S00DMysdQzNDaPtTIyVdK3s0lJzcksSy3St0vQy2j4
	uYCl4KFARePWG6wNjD18XYycHBICJhJ9lyexdDFycQgJLGWUaDu+ih0iISNxcloDK4QtLPHn
	WhcbiC0k8IlR4uIPQxCbTcBQoustRFxEIEti3oQ7TCCDmAX+Mkss/9IElhAWSJXofDqbBcRm
	EVCVuHz6C5DNwcErYCdxZ5sfxHx5if0HzzKD2LwCghInZz4BK2cGijdvnc08gZFvFpLULCSp
	BYxMqxhFUkuLc9Nziw31ihNzi0vz0vWS83M3MQLjaNuxn5t3MM579VHvECMTB+MhRgkOZiUR
	3qoa6zQh3pTEyqrUovz4otKc1OJDjKZA501klhJNzgdGcl5JvKGZgamhiZmlgamlmbGSOK9n
	QUeikEB6YklqdmpqQWoRTB8TB6dUAxNrVLnb+olP/ohJTufumuUr4TmjlefL7z0W77zcDzex
	JzWe+Z4QU666WengmRbOT0mXDxe+FenaOr3qWnbrpu3aKmqpQvH3EhQdl21f6rBq9/5W5hmL
	TuYuFEuc/25VQ7r07dCej8dOmZ3NCtgZm304sPhH28TiF0FN1xb3ikw/En04Uyx6trbTzMM8
	09OkOYJDHVv2f54jwvTVcsmHLk2u7Y+tBbZ9dUn6/mXNJVal37GFE77NCPdfJ9K3XmzzpPUp
	C15cm3i353KJzFqG8184zqi8f3bgw9toVs7j55geTE447NzxYPfbRul7vjYH/iTdWMA+Meln
	ns/JW3lbBKTmnOU7uGOP/PY3O7Or9z43V2Ipzkg01GIuKk4EAPL6Ek4sAwAA
X-CMS-MailID: 20240510070700eucas1p10ed1c978c78366b412770fdae6d4f384
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20240510070700eucas1p10ed1c978c78366b412770fdae6d4f384
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20240510070700eucas1p10ed1c978c78366b412770fdae6d4f384
References: <CGME20240510070700eucas1p10ed1c978c78366b412770fdae6d4f384@eucas1p1.samsung.com>

Since commit 9484f2cb8332 ("clk: samsung: exynos-clkout: convert to
module driver") this driver is instantiated as MFD-cell (matched by
platform device name) not as a real platform device created by OF code.
Remove then of_match_table and change related MODULE_DEVICE_TABLE to
simple MODULE_ALIAS to avoid further confusion.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
v3:
- Use '#define DRV_NAME' based alias. I see no point bloating the driver
with another platform device IDs array, as I don't expect this driver to
be used with any other platform device ID. Driver variants are already
selected based on the parent PMU device compatible.

v2:
- added MODULE_ALIAS
---
 drivers/clk/samsung/clk-exynos-clkout.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos-clkout.c b/drivers/clk/samsung/clk-exynos-clkout.c
index 503c6f5b20d5..89cf2000884f 100644
--- a/drivers/clk/samsung/clk-exynos-clkout.c
+++ b/drivers/clk/samsung/clk-exynos-clkout.c
@@ -17,6 +17,8 @@
 #include <linux/platform_device.h>
 #include <linux/pm.h>
 
+#define DRV_NAME			"exynos-clkout"
+
 #define EXYNOS_CLKOUT_NR_CLKS		1
 #define EXYNOS_CLKOUT_PARENTS		32
 
@@ -75,7 +77,6 @@ static const struct of_device_id exynos_clkout_ids[] = {
 		.data = &exynos_clkout_exynos5,
 	}, { }
 };
-MODULE_DEVICE_TABLE(of, exynos_clkout_ids);
 
 /*
  * Device will be instantiated as child of PMU device without its own
@@ -236,8 +237,7 @@ static SIMPLE_DEV_PM_OPS(exynos_clkout_pm_ops, exynos_clkout_suspend,
 
 static struct platform_driver exynos_clkout_driver = {
 	.driver = {
-		.name = "exynos-clkout",
-		.of_match_table = exynos_clkout_ids,
+		.name = DRV_NAME,
 		.pm = &exynos_clkout_pm_ops,
 	},
 	.probe = exynos_clkout_probe,
@@ -248,4 +248,5 @@ module_platform_driver(exynos_clkout_driver);
 MODULE_AUTHOR("Krzysztof Kozlowski <krzk@kernel.org>");
 MODULE_AUTHOR("Tomasz Figa <tomasz.figa@gmail.com>");
 MODULE_DESCRIPTION("Samsung Exynos clock output driver");
+MODULE_ALIAS("platform:" DRV_NAME);
 MODULE_LICENSE("GPL");
-- 
2.34.1

