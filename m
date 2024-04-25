Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554156D1B0
	for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Apr 2024 07:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714031801; cv=none; b=uF5eWNSlZ3wp0tGeXY3N1v3cAGhR/NqJaSjmB2VR9sTPMMv2icT0xNS8iEUNjB2liHVPQbH9OrDOxN8CapILS2YVKQBAWQ6Jlhm7Z/R5/4UasP4G1T6y/CtxgHGdqdMsARIWQjN9fZolIsyCHqHEEUybO48O9s6FiuUkSqkep+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714031801; c=relaxed/simple;
	bh=/MNBKYgbdHVSHrVyIvxdF7TW8KFDv/F/yK6c8Z+8KD0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 References; b=u/QuK8jc1q1CF2xXxBTdBwWeA+kEgtbQG01AnYgThI/yWoNQTR7aRKfQlokqvEz9hAUDm9Dd/1nzxdqxKy/Os/XNh/NstU5yn+dIFmmfehhBqPMPsQwx2L5Uvxf/0xJx+DWNwQ9mRT3cIu51l35AzeWe9UBCtPE7SWqxTuxo4mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=VXHhnsNI; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="VXHhnsNI"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20240425075635euoutp0196c0e9bcbd6d2338f0ab29108b5c686d~JdtYl1v7f2024720247euoutp01H
	for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Apr 2024 07:56:35 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20240425075635euoutp0196c0e9bcbd6d2338f0ab29108b5c686d~JdtYl1v7f2024720247euoutp01H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1714031795;
	bh=IORyVXtHeFQ58OwStWCgque/3B73pN4jAG+/asraCic=;
	h=From:To:Cc:Subject:Date:References:From;
	b=VXHhnsNIskciNAzi2LxzuAEFUBcEzYOXVW7HdJFcKJH03ig+sttj5Zu7Ou4FdEnli
	 s+7GlRuyVT8nQGSxwimXfAD3/AaMBnMMd6R4lVVOTfd/ADMeHiYp4At7CZds9NF5Hn
	 yMv4BQzXo2HapuamMWPZ8c7+DqpiIyEyFV7fVb6s=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTP id
	20240425075634eucas1p1cf6fbf73c5518a3f1de1743a3342fd20~JdtYOU5bR0357703577eucas1p1J;
	Thu, 25 Apr 2024 07:56:34 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
	eusmges2new.samsung.com (EUCPMTA) with SMTP id 1F.D2.09875.2BC0A266; Thu, 25
	Apr 2024 08:56:34 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20240425075634eucas1p17bef12cf8ccafb6971f352d955e14fae~JdtXlLDFQ0144801448eucas1p1n;
	Thu, 25 Apr 2024 07:56:34 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
	eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20240425075634eusmtrp2a248061711fa1d2dd88a62442725cbf3~JdtXjEcD51885518855eusmtrp2O;
	Thu, 25 Apr 2024 07:56:34 +0000 (GMT)
X-AuditID: cbfec7f4-131ff70000002693-23-662a0cb2b8ea
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
	eusmgms1.samsung.com (EUCPMTA) with SMTP id 15.4D.08810.2BC0A266; Thu, 25
	Apr 2024 08:56:34 +0100 (BST)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20240425075633eusmtip20b8d3830509fd671be1a07384d5363db~JdtWysBbI0079400794eusmtip2C;
	Thu, 25 Apr 2024 07:56:33 +0000 (GMT)
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
Subject: [PATCH] clk: samsung: Revert "clk: Use device_get_match_data()"
Date: Thu, 25 Apr 2024 09:56:28 +0200
Message-Id: <20240425075628.838497-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrJKsWRmVeSWpSXmKPExsWy7djP87qbeLTSDE5fNbZ4MG8bm8W2DhuL
	61+es1osahCzmHj+J5vF+fMb2C02Pb7GavGx5x6rxYzz+5gs1h65y25x8ZSrxf89O9gtDr9p
	Z7X4d20jiwOfx/sbrewem1Z1snl86j/J6nHn2h42j81L6j36tqxi9Pi8SS6APYrLJiU1J7Ms
	tUjfLoEro2f3BbaCP4IVr45dY21g7OHvYuTkkBAwkXj2fiJLFyMXh5DACkaJkzdaoZwvjBI/
	dr5hhHA+M0rc+riRrYuRA6xlwkIRkG4hgeWMErP3ecA1bDk4nxEkwSZgKNH1tosNxBYRyJC4
	eXc/O0gRs8BxZomTu28ygQwSFvCQ+LEuEaSGRUBV4tPs+2C9vAJ2EhN+n2OHOE9eYv/Bs8wQ
	cUGJkzOfsIDYzEDx5q2zmUFmSgg84JDouLSBDaLBReLf+fesELawxKvjW6AGyUj83zmfCaKh
	nVFiwe/7UM4ERomG57cYIaqsJe6c+wX2JrOApsT6XfoQYUeJRx1f2CG+55O48VYQ4gg+iUnb
	pjNDhHklOtqEIKrVJGYdXwe39uCFS1AlHhI7VtlBwi1W4taSq+wTGBVmIflsFpLPZiGcsICR
	eRWjeGppcW56arFRXmq5XnFibnFpXrpecn7uJkZg6jr97/iXHYzLX33UO8TIxMF4iFGCg1lJ
	hPfmR400Id6UxMqq1KL8+KLSnNTiQ4zSHCxK4ryqKfKpQgLpiSWp2ampBalFMFkmDk6pBiZr
	R8dUy4c7H6j+COyauPL2xqYT7M0dptwsT52Csm+mHHq2VTNxySfHJ1eZi9bObpTq2rWom/fz
	582SMqbXtvJdVkr8tojtYaCeSKaG/q8Zz1Vv1M95rFa+tNV1Vdoer9gDEhNP8G69t/JvVcFn
	/c16H7kdqyS/lSqK5PVHHs0zzdswe8KBb1IBvFPPz+YUWl/L9fj7ewHxOXNlzioUbjPz8OF7
	t1RV4uCkxYrmoSzLfh8SXpLya23A6l3XM2ayeM20eNK/6cTPCVXMF04tvsQ87dx9g/MeXKXz
	JJx/9NgHMggevR2Rcf/1dZXdzRUlBp849UxO59mZyxzRFL3MpdY/hZO59rPgobSMvxVC5cuU
	WIozEg21mIuKEwF0tiLmzAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprAIsWRmVeSWpSXmKPExsVy+t/xe7qbeLTSDC595bB4MG8bm8W2DhuL
	61+es1osahCzmHj+J5vF+fMb2C02Pb7GavGx5x6rxYzz+5gs1h65y25x8ZSrxf89O9gtDr9p
	Z7X4d20jiwOfx/sbrewem1Z1snl86j/J6nHn2h42j81L6j36tqxi9Pi8SS6APUrPpii/tCRV
	ISO/uMRWKdrQwkjP0NJCz8jEUs/Q2DzWyshUSd/OJiU1J7MstUjfLkEvo2f3BbaCP4IVr45d
	Y21g7OHvYuTgkBAwkZiwUKSLkYtDSGApo8T5pg9sXYycQHEZiZPTGlghbGGJP9e62CCKPjFK
	PF3fwg6SYBMwlOh62wXWICKQJTFvwh0mkCJmgfPMEjcatjOCbBAW8JD4sS4RpIZFQFXi0+z7
	jCA2r4CdxITf59ghFshL7D94lhkiLihxcuYTFhCbGSjevHU28wRGvllIUrOQpBYwMq1iFEkt
	Lc5Nzy021CtOzC0uzUvXS87P3cQIjJptx35u3sE479VHvUOMTByMhxglOJiVRHhvftRIE+JN
	SaysSi3Kjy8qzUktPsRoCnTfRGYp0eR8YNzmlcQbmhmYGpqYWRqYWpoZK4nzehZ0JAoJpCeW
	pGanphakFsH0MXFwSjUwHdaQc+9c0Xl11pRGpiT98xMUvv7g47g/cbHcQuN1kgFa5RdM6v8c
	2xUrM0Ul8iq3zrH76e9fM2pu1N6v4HKn6YI/R+7L5jUOskv17i1W+ar6LX1p0GqJTFF7xoXz
	jqZOXsV0rNVw3nHbsgaGQy95DMvX3arw6d4psy5RdMMW7uuP2vea85bpOKeVzv6x+P2NJSIy
	yiGyFmEMzULsKfdCZqofUJ9kq7a33ud7G/ekazFHnrzdFLi244Ft4eKvhre2Hdi9JPmu/oZr
	ixSqXkYGepj9OP5Mftft/kcyrDsEJbY2ix7T2l9umaDRXBOl2POgnGX5PV7nwjeK+8KW/Wmy
	0y6Pe2CUcOqFystdE8K2KbEUZyQaajEXFScCAPGXurYjAwAA
X-CMS-MailID: 20240425075634eucas1p17bef12cf8ccafb6971f352d955e14fae
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20240425075634eucas1p17bef12cf8ccafb6971f352d955e14fae
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20240425075634eucas1p17bef12cf8ccafb6971f352d955e14fae
References: <CGME20240425075634eucas1p17bef12cf8ccafb6971f352d955e14fae@eucas1p1.samsung.com>

device_get_match_data() function should not be used on the device other
than the one matched to the given driver, because it always returns the
match_data of the matched driver. In case of exynos-clkout driver, the
original code matches the OF IDs on the PARENT device, so replacing it
with of_device_get_match_data() broke the driver.

This has been already pointed once in commit 2bc5febd05ab ("clk: samsung:
Revert "clk: samsung: exynos-clkout: Use of_device_get_match_data()"").
To avoid further confusion, add a comment about this special case, which
requires direct of_match_device() call to pass custom IDs array.

This partially reverts commit 409c39ec92a35e3708f5b5798c78eae78512cd71.

Fixes: 409c39ec92a3 ("clk: Use device_get_match_data()")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/clk/samsung/clk-exynos-clkout.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos-clkout.c b/drivers/clk/samsung/clk-exynos-clkout.c
index 3484e6cc80ad..503c6f5b20d5 100644
--- a/drivers/clk/samsung/clk-exynos-clkout.c
+++ b/drivers/clk/samsung/clk-exynos-clkout.c
@@ -13,9 +13,9 @@
 #include <linux/io.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
+#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/pm.h>
-#include <linux/property.h>
 
 #define EXYNOS_CLKOUT_NR_CLKS		1
 #define EXYNOS_CLKOUT_PARENTS		32
@@ -84,17 +84,24 @@ MODULE_DEVICE_TABLE(of, exynos_clkout_ids);
 static int exynos_clkout_match_parent_dev(struct device *dev, u32 *mux_mask)
 {
 	const struct exynos_clkout_variant *variant;
+	const struct of_device_id *match;
 
 	if (!dev->parent) {
 		dev_err(dev, "not instantiated from MFD\n");
 		return -EINVAL;
 	}
 
-	variant = device_get_match_data(dev->parent);
-	if (!variant) {
+	/*
+	 * 'exynos_clkout_ids' arrays is not the ids array matched by
+	 * the dev->parent driver, so of_device_get_match_data() or
+	 * device_get_match_data() cannot be used here.
+	 */
+	match = of_match_device(exynos_clkout_ids, dev->parent);
+	if (!match) {
 		dev_err(dev, "cannot match parent device\n");
 		return -EINVAL;
 	}
+	variant = match->data;
 
 	*mux_mask = variant->mux_mask;
 
-- 
2.34.1

