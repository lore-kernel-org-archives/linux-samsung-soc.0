Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AAE6156F23
	for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Sep 2024 15:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727364836; cv=none; b=bcurmZmuze3S+Nda3AH+CYfl7BZmq02z+B5skPqnfOVqdlsgmdBdIG2WzulQVArqKpnE4D1c7H32h0CZesXjdNGciKlrlB2824BpxkekRHGO4QgEA/9ef9E1at9kb+P0c5mW9IQ5QB6pcNrOM53azCeDuKGSTJd7qiLr5epF6cQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727364836; c=relaxed/simple;
	bh=hIXx/G/GYGYp9HNTcAn6KHdmDG2Sd1l8zOwIx6QTl8w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:Content-Type:
	 References; b=XNxMDYQhLZrVUqWI6PLsIk/WgLbzXvNR24XwMT7EokjFA/pWSshiaRL2kJpABd+fEjjpVWseNaCBUZQpqosYMZOOiJ0IxU/HFj0ERbuM+FirE14TMActjE+/MdS8x4BCqLjBgJAy8V51PeDXcQwAGV4tE2mqoOLWpXTcKPDb3TI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=KVvCAEOe; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="KVvCAEOe"
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20240926153344epoutp04dac9e59b1b86dad673dedf77232b87a0~41SfsBV6l3268832688epoutp04Y
	for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Sep 2024 15:33:44 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20240926153344epoutp04dac9e59b1b86dad673dedf77232b87a0~41SfsBV6l3268832688epoutp04Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1727364824;
	bh=d31Mtwq5yNK9ndtwNmrXAu6TDNGKeghuKld9r7d8fFs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KVvCAEOeDZReuQL0VM+RCDCQo5F3pEsMv6i8+Bnz0+c/i2JzdjxDAjcHffapVaKCe
	 TkEDWE+H90cznm92M3bo4C1ycE9A8kfbpEkJGT7Zm3VAD8aD18sgWFhXLvbDFpdqmN
	 bPUEndoB3OaWL7nPvt0a7HoK8oih5gV7NySf1B+c=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTP id
	20240926153343epcas5p30c0bfda42228871e940fafd4ed6a056b~41SfF5Adc2908829088epcas5p3g;
	Thu, 26 Sep 2024 15:33:43 +0000 (GMT)
Received: from epsmges5p1new.samsung.com (unknown [182.195.38.175]) by
	epsnrtp3.localdomain (Postfix) with ESMTP id 4XDyLG0zPPz4x9Pr; Thu, 26 Sep
	2024 15:33:42 +0000 (GMT)
Received: from epcas5p2.samsung.com ( [182.195.41.40]) by
	epsmges5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	4D.26.09640.5DE75F66; Fri, 27 Sep 2024 00:33:41 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20240926145336epcas5p123c980bfd70e9ec84509fd041b339707~40vdOcQy90224302243epcas5p13;
	Thu, 26 Sep 2024 14:53:36 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20240926145336epsmtrp2b2f85394fa0397e84b6faf7b8a70c180~40vdMj0A51250612506epsmtrp2e;
	Thu, 26 Sep 2024 14:53:36 +0000 (GMT)
X-AuditID: b6c32a49-aabb8700000025a8-1f-66f57ed5740a
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	FC.7A.08964.07575F66; Thu, 26 Sep 2024 23:53:36 +0900 (KST)
Received: from cheetah.sa.corp.samsungelectronics.net (unknown
	[107.109.115.53]) by epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20240926145334epsmtip1e27262236e3a75125d99f7c68c04c713~40vbMkkHk2310023100epsmtip1O;
	Thu, 26 Sep 2024 14:53:34 +0000 (GMT)
From: Varada Pavani <v.pavani@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	alim.akhtar@samsung.com, mturquette@baylibre.com, sboyd@kernel.org,
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: aswani.reddy@samsung.com, pankaj.dubey@samsung.com,
	gost.dev@samsung.com, Varada Pavani <v.pavani@samsung.com>
Subject: [PATCH 1/2] clk: samsung: Fix block comment style warnings reported
 by checkpatch
Date: Thu, 26 Sep 2024 20:21:31 +0530
Message-Id: <20240926145132.1763-2-v.pavani@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240926145132.1763-1-v.pavani@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrDKsWRmVeSWpSXmKPExsWy7bCmhu61uq9pBvM1LR7M28ZmcWjzVnaL
	61+es1rcPLCTyeL8+Q3sFpseX2O1+Nhzj9Xi8q45bBYzzu9jsrh4ytVi0dYv7BaH37SzWvy7
	tpHFYkPvK3YHPo/3N1rZPTat6mTz2Lyk3qNvyypGj8+b5AJYo7JtMlITU1KLFFLzkvNTMvPS
	bZW8g+Od403NDAx1DS0tzJUU8hJzU22VXHwCdN0yc4DOVFIoS8wpBQoFJBYXK+nb2RTll5ak
	KmTkF5fYKqUWpOQUmBToFSfmFpfmpevlpZZYGRoYGJkCFSZkZ/Q2/GUpWKFesaFRuoFxmWIX
	IweHhICJRGePehcjF4eQwG5GietXT7J0MXICOZ8YJR5OsIdIfGOU2DlxChNIAqTh0pxVbBCJ
	vYwScydMhnJamSSW7jgP1s4moCWxeupyVpCEiEAfk8TdExPA2pkFSiT+f3rNCmILC8RITN36
	EsxmEVCV2LnuNRuIzStgIfH+fS87xDp5idUbDjCD2JwClhIf9xxmgYj/ZZfYtyUb4gcXiWUf
	RSDCwhKvjm+BapWS+PxuLxtESbJE+yduiHCOxKXdq6CesZc4cGUOC0gJs4CmxPpd+hBhWYmp
	p9ZBHcwn0fv7CVQ5r8SOeTC2ksTOHROgbAmJp6vXsEHYHhLnFy2DBkkPo8TCa/MYJzDKzUJY
	sYCRcRWjZGpBcW56arFpgWFeajk8xpLzczcxgpOhlucOxrsPPugdYmTiYDzEKMHBrCTCO+nm
	xzQh3pTEyqrUovz4otKc1OJDjKbA0JvILCWanA9Mx3kl8YYmlgYmZmZmJpbGZoZK4ryvW+em
	CAmkJ5akZqemFqQWwfQxcXBKNTBVvlcz8VHb8s+SJe4jc7/N0qlCnneflx9bpbqdc9vFf1/3
	Pr5px7pnl46gqX80+6fDe2QOmgicirAsizC4UbPpzoPjx59oZ8S8v77L3JEnTIq/670Gb9WC
	Rs3P6zPkr3aeq5nAcMXmZouQ3bm/D1q8pJufcOt3Wry95rrs0+sDxn6/RAIkj8peKkm41nIy
	WbngpYXvvqSDNe2Ppp13+RG3WGCXrava/dRrXSY2MU0f4xd4aZ3KYtMp093mdaqZu5P3lrLH
	79upf2O0d21/ci34YSVbeGH2/sQa0ZTI2lIh6c1NOdOvnH6/dtWd/uw3zDuTivJ3fL6xJ+XA
	7bMqwruOR66N06v6tJKhfF/2RxYlluKMREMt5qLiRABCE7mTDwQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrKLMWRmVeSWpSXmKPExsWy7bCSnG5B6dc0g86LKhYP5m1jszi0eSu7
	xfUvz1ktbh7YyWRx/vwGdotNj6+xWnzsucdqcXnXHDaLGef3MVlcPOVqsWjrF3aLw2/aWS3+
	XdvIYrGh9xW7A5/H+xut7B6bVnWyeWxeUu/Rt2UVo8fnTXIBrFFcNimpOZllqUX6dglcGb0N
	f1kKVqhXbGiUbmBcptjFyMkhIWAicWnOKjYQW0hgN6PEwpNmEHEJiZ3fWpkhbGGJlf+es3cx
	cgHVNDNJfLrwlhEkwSagJbF66nJWkISIwCwmiblLPrB0MXJwMAtUSMz5bwxSIywQJfH96GIm
	EJtFQFVi57rXYMt4BSwk3r/vZYdYIC+xesMBsGWcApYSH/ccBhsjBFRzZSb7BEa+BYwMqxgl
	UwuKc9Nziw0LDPNSy/WKE3OLS/PS9ZLzczcxgkNWS3MH4/ZVH/QOMTJxMB5ilOBgVhLhnXTz
	Y5oQb0piZVVqUX58UWlOavEhRmkOFiVxXvEXvSlCAumJJanZqakFqUUwWSYOTqkGJt97Jx5d
	jeqfKM4s8UDRgmPvv8POfJk3PSrZjk4WXxFZubYk98nWqlkPfNiFPNUyhDcV6i1RXbj2dcQ5
	0+shNRtd5k74VsXdULf+ZUWF1VLV6ZvMP7vdV1J8vfZ0g98Mw0+f8g5mK52fal4hcU2Tdcaj
	/D3XU7M4uzapvcm5vtWKa9dvk8kTj5wL0q578lCt7s/VU37uS2T8Xq4KEW4KipncectHZTrj
	Mc3j1/xdGWXfTZ7gIHwpgulUYMRp7q+3fi317tCSW6N2Y4bB579B9cyvTneVfT1m6M2uHXrM
	3pm3vd7+xO069yMLe2rKQu/eOBn1qMpBauL80LD/V48vnzOrb8tR/a1/DqsV73WyM1ViKc5I
	NNRiLipOBABSorPsyAIAAA==
X-CMS-MailID: 20240926145336epcas5p123c980bfd70e9ec84509fd041b339707
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240926145336epcas5p123c980bfd70e9ec84509fd041b339707
References: <20240926145132.1763-1-v.pavani@samsung.com>
	<CGME20240926145336epcas5p123c980bfd70e9ec84509fd041b339707@epcas5p1.samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>

Fix checkpatch giving warnings on driver files related to comment style.
WARNING: Block comments should align the * on each line which is

Signed-off-by: Varada Pavani <v.pavani@samsung.com>
---
 drivers/clk/samsung/clk-exynos-audss.c   | 2 +-
 drivers/clk/samsung/clk-exynos4.c        | 2 +-
 drivers/clk/samsung/clk-exynos4412-isp.c | 2 +-
 drivers/clk/samsung/clk-exynos5250.c     | 2 +-
 drivers/clk/samsung/clk-exynos5410.c     | 2 +-
 drivers/clk/samsung/clk-exynos5420.c     | 2 +-
 drivers/clk/samsung/clk-exynos7.c        | 2 +-
 drivers/clk/samsung/clk-s3c64xx.c        | 2 +-
 drivers/clk/samsung/clk-s5pv210-audss.c  | 2 +-
 drivers/clk/samsung/clk.c                | 2 +-
 10 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos-audss.c b/drivers/clk/samsung/clk-exynos-audss.c
index e44b172d7255..166ee7728307 100644
--- a/drivers/clk/samsung/clk-exynos-audss.c
+++ b/drivers/clk/samsung/clk-exynos-audss.c
@@ -4,7 +4,7 @@
  * Author: Padmavathi Venna <padma.v@samsung.com>
  *
  * Common Clock Framework support for Audio Subsystem Clock Controller.
-*/
+ */
 
 #include <linux/slab.h>
 #include <linux/io.h>
diff --git a/drivers/clk/samsung/clk-exynos4.c b/drivers/clk/samsung/clk-exynos4.c
index 31cb85330549..ca5036ba45b9 100644
--- a/drivers/clk/samsung/clk-exynos4.c
+++ b/drivers/clk/samsung/clk-exynos4.c
@@ -5,7 +5,7 @@
  * Author: Thomas Abraham <thomas.ab@samsung.com>
  *
  * Common Clock Framework support for all Exynos4 SoCs.
-*/
+ */
 
 #include <dt-bindings/clock/exynos4.h>
 #include <linux/slab.h>
diff --git a/drivers/clk/samsung/clk-exynos4412-isp.c b/drivers/clk/samsung/clk-exynos4412-isp.c
index a70c2b06a61a..29c5644f0593 100644
--- a/drivers/clk/samsung/clk-exynos4412-isp.c
+++ b/drivers/clk/samsung/clk-exynos4412-isp.c
@@ -4,7 +4,7 @@
  * Author: Marek Szyprowski <m.szyprowski@samsung.com>
  *
  * Common Clock Framework support for Exynos4412 ISP module.
-*/
+ */
 
 #include <dt-bindings/clock/exynos4.h>
 #include <linux/slab.h>
diff --git a/drivers/clk/samsung/clk-exynos5250.c b/drivers/clk/samsung/clk-exynos5250.c
index e02e7c013f3d..47e9ac2275ee 100644
--- a/drivers/clk/samsung/clk-exynos5250.c
+++ b/drivers/clk/samsung/clk-exynos5250.c
@@ -5,7 +5,7 @@
  * Author: Thomas Abraham <thomas.ab@samsung.com>
  *
  * Common Clock Framework support for Exynos5250 SoC.
-*/
+ */
 
 #include <dt-bindings/clock/exynos5250.h>
 #include <linux/clk-provider.h>
diff --git a/drivers/clk/samsung/clk-exynos5410.c b/drivers/clk/samsung/clk-exynos5410.c
index 2654077211e7..99b1bb4539fd 100644
--- a/drivers/clk/samsung/clk-exynos5410.c
+++ b/drivers/clk/samsung/clk-exynos5410.c
@@ -4,7 +4,7 @@
  * Author: Tarek Dakhran <t.dakhran@samsung.com>
  *
  * Common Clock Framework support for Exynos5410 SoC.
-*/
+ */
 
 #include <dt-bindings/clock/exynos5410.h>
 
diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
index c630135c686b..a4864ea0d0d2 100644
--- a/drivers/clk/samsung/clk-exynos5420.c
+++ b/drivers/clk/samsung/clk-exynos5420.c
@@ -5,7 +5,7 @@
  *	    Chander Kashyap <k.chander@samsung.com>
  *
  * Common Clock Framework support for Exynos5420 SoC.
-*/
+ */
 
 #include <dt-bindings/clock/exynos5420.h>
 #include <linux/slab.h>
diff --git a/drivers/clk/samsung/clk-exynos7.c b/drivers/clk/samsung/clk-exynos7.c
index 4a5d2a914bd6..e6c938effa29 100644
--- a/drivers/clk/samsung/clk-exynos7.c
+++ b/drivers/clk/samsung/clk-exynos7.c
@@ -2,7 +2,7 @@
 /*
  * Copyright (c) 2014 Samsung Electronics Co., Ltd.
  * Author: Naveen Krishna Ch <naveenkrishna.ch@gmail.com>
-*/
+ */
 
 #include <linux/clk-provider.h>
 #include <linux/of.h>
diff --git a/drivers/clk/samsung/clk-s3c64xx.c b/drivers/clk/samsung/clk-s3c64xx.c
index d27a1f73f077..e2ec8fe32e39 100644
--- a/drivers/clk/samsung/clk-s3c64xx.c
+++ b/drivers/clk/samsung/clk-s3c64xx.c
@@ -3,7 +3,7 @@
  * Copyright (c) 2013 Tomasz Figa <tomasz.figa at gmail.com>
  *
  * Common Clock Framework support for all S3C64xx SoCs.
-*/
+ */
 
 #include <linux/slab.h>
 #include <linux/clk-provider.h>
diff --git a/drivers/clk/samsung/clk-s5pv210-audss.c b/drivers/clk/samsung/clk-s5pv210-audss.c
index b31c00ea331f..d19a3d9fd452 100644
--- a/drivers/clk/samsung/clk-s5pv210-audss.c
+++ b/drivers/clk/samsung/clk-s5pv210-audss.c
@@ -8,7 +8,7 @@
  * Author: Padmavathi Venna <padma.v@samsung.com>
  *
  * Driver for Audio Subsystem Clock Controller of S5PV210-compatible SoCs.
-*/
+ */
 
 #include <linux/io.h>
 #include <linux/clk.h>
diff --git a/drivers/clk/samsung/clk.c b/drivers/clk/samsung/clk.c
index afa5760ed3a1..283c523763e6 100644
--- a/drivers/clk/samsung/clk.c
+++ b/drivers/clk/samsung/clk.c
@@ -6,7 +6,7 @@
  *
  * This file includes utility functions to register clocks to common
  * clock framework for Samsung platforms.
-*/
+ */
 
 #include <linux/slab.h>
 #include <linux/clkdev.h>
-- 
2.17.1

