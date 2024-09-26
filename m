Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 770EA1534E6
	for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Sep 2024 15:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727364832; cv=none; b=JNlNRro5+bLg+bxeJJ2hbyl8bOMdOqkImUwFCW8l37ZQZLLacpVEoQsARbk0AnCsCe8fmvwQ9zDkgGmZ4uPA9cZ49YiY9lqWlMqLQVyzaClF5iv4n3srg3OXf2eWyF9SJuKsHLGfRBLCEMFYSvTdjdlInLg3xWtSCv8fJ5QMENk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727364832; c=relaxed/simple;
	bh=ZtF6UL+x069rV5ugm/nqWd2+rOGQz9a7xXTF0qrkLOk=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:References; b=pdu4NyPQz/dqLsYD52Vum34qZXBW9QgqtflmSdkiRd4Z8lt7bGL9rJJtXETUwqMvKm0MPLxQ3+NX81qOcJ7OPMvQV9InDTyPbqNowK/rKcQJPZPz9G1+EmdneHjwrIv2LzcEOephs48WKKLP1OyDy9kKKUA2PQtjun7hQy2XEY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=s+96qNYn; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="s+96qNYn"
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20240926153348epoutp0233d477cd315f0ce7cddb0159e6972460~41SjiaB8W0939609396epoutp02T
	for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Sep 2024 15:33:48 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20240926153348epoutp0233d477cd315f0ce7cddb0159e6972460~41SjiaB8W0939609396epoutp02T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1727364828;
	bh=B5RN7nIUXWx7fCEs2X1BsqDlw3Yvvx9tGTNP/d7fgdY=;
	h=From:To:Cc:Subject:Date:References:From;
	b=s+96qNYn6P5d/3Mq8Ws5kfxigB6UTnS/BMWT9x8aksw0i0siZkXDdZL3MUEpfn2St
	 T37bMpeypXu118q7KmxxE+29CnWN9giOjMqqaa2Q52fwxNeNBGCYOpkNdNZR1m1rr+
	 5nB7YHL0nQp8AW01QrtT113CF4/pSGIxFTnfjaTQ=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTP id
	20240926153348epcas5p269f9da3ac35a03e6380df3e7ea80d748~41Si-nr8I2092320923epcas5p2G;
	Thu, 26 Sep 2024 15:33:48 +0000 (GMT)
Received: from epsmgec5p1new.samsung.com (unknown [182.195.38.174]) by
	epsnrtp4.localdomain (Postfix) with ESMTP id 4XDyLL6T8Gz4x9Pq; Thu, 26 Sep
	2024 15:33:46 +0000 (GMT)
Received: from epcas5p4.samsung.com ( [182.195.41.42]) by
	epsmgec5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	BB.89.08855.ADE75F66; Fri, 27 Sep 2024 00:33:46 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20240926145332epcas5p2aa65366565950cf3d4f25b6c064a5fbe~40vZkuWPa1832418324epcas5p2i;
	Thu, 26 Sep 2024 14:53:32 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20240926145332epsmtrp279b509c1c2aea9349b1409a8c57d3413~40vZjw_rP1250512505epsmtrp2f;
	Thu, 26 Sep 2024 14:53:32 +0000 (GMT)
X-AuditID: b6c32a44-15fb870000002297-43-66f57eda9133
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	EB.7A.08964.C6575F66; Thu, 26 Sep 2024 23:53:32 +0900 (KST)
Received: from cheetah.sa.corp.samsungelectronics.net (unknown
	[107.109.115.53]) by epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20240926145330epsmtip1169a8132703876836c0c04ab6152bbe7~40vXbFw3N2316723167epsmtip1C;
	Thu, 26 Sep 2024 14:53:30 +0000 (GMT)
From: Varada Pavani <v.pavani@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	alim.akhtar@samsung.com, mturquette@baylibre.com, sboyd@kernel.org,
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: aswani.reddy@samsung.com, pankaj.dubey@samsung.com,
	gost.dev@samsung.com, Varada Pavani <v.pavani@samsung.com>
Subject: [PATCH 0/2] clk: samsung: Fix errors and warnings reported by
Date: Thu, 26 Sep 2024 20:21:30 +0530
Message-Id: <20240926145132.1763-1-v.pavani@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrMKsWRmVeSWpSXmKPExsWy7bCmlu6tuq9pBifmGVs8mLeNzeLQ5q3s
	Fte/PGe1uHlgJ5PF+fMb2C02Pb7GavGx5x6rxeVdc9gsZpzfx2Rx8ZSrxaKtX9gtDr9pZ7X4
	d20ji8WG3lfsDnwe72+0sntsWtXJ5rF5Sb1H35ZVjB6fN8kFsEZl22SkJqakFimk5iXnp2Tm
	pdsqeQfHO8ebmhkY6hpaWpgrKeQl5qbaKrn4BOi6ZeYA3amkUJaYUwoUCkgsLlbSt7Mpyi8t
	SVXIyC8usVVKLUjJKTAp0CtOzC0uzUvXy0stsTI0MDAyBSpMyM6Y3LmTsaCfvWLD1y3sDYxn
	WbsYOTkkBEwk3i/6zwJiCwnsZpRYM12li5ELyP7EKHHm3B5WCOcbo8StzY/ZYTrOnOhgh0js
	ZZToO/iQEaK9lUni18MSEJtNQEti9dTlYN0iAn1MEndPTGACSTALlEj8//QabLewgJvEmQs/
	wXazCKhK/LvdAlbDK2AhMeXUZmaIbfISqzccYAYZJCFwj13i87+ZUIe7SCx99ZoJwhaWeHV8
	C9R5UhKf3+1l62LkALKTJdo/cUOEcyQu7V4FVW4vceDKHBaQEmYBTYn1u/QhwrISU0+tgzqT
	T6L39xOocl6JHfNgbCWJnTsmQNkSEk9Xr2GDsD0k3n04yw4Jh1iJnjPvmCcwys5C2LCAkXEV
	o2RqQXFuemqyaYFhXmo5PJ6S83M3MYJTn5bLDsYb8//pHWJk4mA8xCjBwawkwjvp5sc0Id6U
	xMqq1KL8+KLSnNTiQ4ymwCCbyCwlmpwPTL55JfGGJpYGJmZmZiaWxmaGSuK8r1vnpggJpCeW
	pGanphakFsH0MXFwSjUwGbDa7Au/MbU2IzRVcs7kX4nStU5uJ0XMV15mzry5UEyW5aeS6fXf
	CVISYvs7mXdJPXnbt+f81WJbrZcqPpMvn6ndOPPr1Xvq73ZkG8dcXLnqyOTUQ5M2/GmdUbNZ
	wNXAutBDYIbw+7JKl96AZYYrAy/I/XfP942O4tmv6XWgW+XsN+GFynbyxSyb/pmac2ZGqSwx
	i837sT2d/2t3xulz1k1m6cJfLYwMMy0lbMwfAPXlzIrm+PWprvRz1rzls+5fXv232UZjq8X7
	f1s/aNipZRo2zOjtdVs8VyuSsf2sW4/tm69PZl2MkuR688/jcf2kJLnuWLvar651Ueo93X8f
	fBR+/y7LUMf6hbzobSWW4oxEQy3mouJEAK1xC+UGBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrALMWRmVeSWpSXmKPExsWy7bCSnG5O6dc0g8ttahYP5m1jszi0eSu7
	xfUvz1ktbh7YyWRx/vwGdotNj6+xWnzsucdqcXnXHDaLGef3MVlcPOVqsWjrF3aLw2/aWS3+
	XdvIYrGh9xW7A5/H+xut7B6bVnWyeWxeUu/Rt2UVo8fnTXIBrFFcNimpOZllqUX6dglcGZM7
	dzIW9LNXbPi6hb2B8SxrFyMnh4SAicSZEx3sXYxcHEICuxklDvzsZYdISEjs/NbKDGELS6z8
	9xyqqJlJ4s7PPrAEm4CWxOqpy1lBEiICs5gk5i75wNLFyMHBLFAhMee/MUiNsICbxJkLP1lA
	bBYBVYl/t1uYQGxeAQuJKac2Qy2Ql1i94QDzBEaeBYwMqxglUwuKc9Nziw0LDPNSy/WKE3OL
	S/PS9ZLzczcxggNRS3MH4/ZVH/QOMTJxMB5ilOBgVhLhnXTzY5oQb0piZVVqUX58UWlOavEh
	RmkOFiVxXvEXvSlCAumJJanZqakFqUUwWSYOTqkGJsY7+2sX/Gp4a7xpo6nVFIsnyXf7Xtbv
	0Vh2s2zNmf+r5zv1+en/iwrg5OY/u8w5TczBYPPEBVnnTTqNI3psJ+0UaW8NUZdUZtkhvFDm
	s/S1LbcWay0IFRFube8zblt5kPlWjPYk7kBdVx/VTh6rF3clz4uYdNSWpt1NbXJ5u/TD/fh9
	lzPXz1Zb/0awhjf+4DIe8/Dydcffz3DjF3l9/N2jY97Kt87wKeziL/hvfWZZ2RyPD2dT4mr0
	n5RviDugK3CJO+Znad3qt0XvPwb6Gz5PCLzT2MC+runm+u3+r0UmvWG1kzcrMknhqbhnlJi/
	x4zlubb07yN/VH+vuKrs2LnCfO0hJgPTzefb1PSWKbEUZyQaajEXFScCAM5FS+qzAgAA
X-CMS-MailID: 20240926145332epcas5p2aa65366565950cf3d4f25b6c064a5fbe
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240926145332epcas5p2aa65366565950cf3d4f25b6c064a5fbe
References: <CGME20240926145332epcas5p2aa65366565950cf3d4f25b6c064a5fbe@epcas5p2.samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>

This patch series fixes clock driver errors and warnings generated from
checkpatch.

Varada Pavani (2):
  clk: samsung: Fix block comment style warnings reported by checkpatch
  clk: samsung: Fix errors reported by checkpatch

 drivers/clk/samsung/clk-exynos-audss.c   | 2 +-
 drivers/clk/samsung/clk-exynos3250.c     | 2 +-
 drivers/clk/samsung/clk-exynos4.c        | 2 +-
 drivers/clk/samsung/clk-exynos4412-isp.c | 2 +-
 drivers/clk/samsung/clk-exynos5250.c     | 2 +-
 drivers/clk/samsung/clk-exynos5260.c     | 4 ++--
 drivers/clk/samsung/clk-exynos5410.c     | 2 +-
 drivers/clk/samsung/clk-exynos5420.c     | 6 +++---
 drivers/clk/samsung/clk-exynos7.c        | 2 +-
 drivers/clk/samsung/clk-s3c64xx.c        | 2 +-
 drivers/clk/samsung/clk-s5pv210-audss.c  | 2 +-
 drivers/clk/samsung/clk.c                | 2 +-
 12 files changed, 15 insertions(+), 15 deletions(-)

-- 
2.17.1

