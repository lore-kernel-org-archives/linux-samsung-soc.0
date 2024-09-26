Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C3081531EF
	for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Sep 2024 15:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727364850; cv=none; b=NSVKLP7Vvs2cbRl7qsWoP/23QRmiCd+6wHxuBDLJ/EKpKktQi7wjFDvngwr0AGPDIM/YdngC4fn0okLhAujeQbBnMJRtanUw8UYmimEdyeX+HAtViuUKZS3uwCa8YZRbzPj2co6+I5DKmcLMta+Db4gbwxix3CeqVZRjfnRt/oE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727364850; c=relaxed/simple;
	bh=Z2erKCz0U8c+h5Ktpp0aggL95u0PsF6aQ4wW3yJQjm4=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:References; b=QJie8GUr+hqzI5vAo84Uird6vrXtmg+0IGG0EY9luO65R+fxxM1NUjta11zJYQVpa2wb2CwGaWtF/3fNHS3O3FED+r9w2bMTYghb9cZB529UvUV+Vz7KVJAVm+p7p6A2yE6Nq2zoLSGeLIUOML+GrBrCuzR4lH7XFM89hY7zI44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=SN/0oRu0; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="SN/0oRu0"
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20240926153406epoutp013d8e072ec6558c51d718233be34d9916~41S0UrtrY1265212652epoutp01e
	for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Sep 2024 15:34:06 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20240926153406epoutp013d8e072ec6558c51d718233be34d9916~41S0UrtrY1265212652epoutp01e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1727364846;
	bh=6g2/Yv8LRZHcuTNohjSQe7MhKxKk+4pTuQkyJGh4qCM=;
	h=From:To:Cc:Subject:Date:References:From;
	b=SN/0oRu0/U6owg7gN0jW3K/R+I1PYRmz7wXdr+UvTRn3VMhyHRop9cDo3zEPqexpJ
	 4f1iJKUxj7UHpiqhp95gvq18V8M/ExY276DRN/zoM7y5WrofiAhpaEVftp6hNpQvDa
	 WM3MXScDE3pCqZl4NZLFoQ0v98+KqXdpbay1pCNQ=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTP id
	20240926153405epcas5p2c0d726c61580ef8c0c4dab10130c217e~41SzQ3Uzq2335223352epcas5p26;
	Thu, 26 Sep 2024 15:34:05 +0000 (GMT)
Received: from epsmgec5p1-new.samsung.com (unknown [182.195.38.178]) by
	epsnrtp4.localdomain (Postfix) with ESMTP id 4XDyLh00zRz4x9Pv; Thu, 26 Sep
	2024 15:34:04 +0000 (GMT)
Received: from epcas5p4.samsung.com ( [182.195.41.42]) by
	epsmgec5p1-new.samsung.com (Symantec Messaging Gateway) with SMTP id
	CC.7E.19863.BEE75F66; Fri, 27 Sep 2024 00:34:03 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20240926144716epcas5p330d6374d8b647f45e056143f237a55aa~40p7WW3H02295422954epcas5p3k;
	Thu, 26 Sep 2024 14:47:16 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20240926144716epsmtrp243a68a1bb8e182cab9e2dfe37218e4dc~40p7VgqkL0901909019epsmtrp2-;
	Thu, 26 Sep 2024 14:47:16 +0000 (GMT)
X-AuditID: b6c32a50-c73ff70000004d97-8a-66f57eeb0a6b
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	B3.CB.07567.4F375F66; Thu, 26 Sep 2024 23:47:16 +0900 (KST)
Received: from cheetah.sa.corp.samsungelectronics.net (unknown
	[107.109.115.53]) by epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20240926144714epsmtip13c94ef8817afabe4713b1576fd8b400d~40p5Pb70D1886218862epsmtip1i;
	Thu, 26 Sep 2024 14:47:14 +0000 (GMT)
From: Varada Pavani <v.pavani@samsung.com>
To: krzk@kernel.org, aswani.reddy@samsung.com, pankaj.dubey@samsung.com,
	s.nawrocki@samsung.com, cw00.choi@samsung.com, alim.akhtar@samsung.com,
	mturquette@baylibre.com, sboyd@kernel.org,
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: gost.dev@samsung.com, Varada Pavani <v.pavani@samsung.com>
Subject: [PATCH 0/2] clk: samsung: Update PLL locktime and samsung function
Date: Thu, 26 Sep 2024 20:15:11 +0530
Message-Id: <20240926144513.71349-1-v.pavani@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrCKsWRmVeSWpSXmKPExsWy7bCmlu7ruq9pBk/aTC0ezNvGZnFo81Z2
	i+tfnrNa3Dywk8ni/PkN7BabHl9jtfjYc4/V4vKuOWwWM87vY7K4eMrVYtHWL+wWh9+0s1r8
	u7aRxWJD7yt2Bz6P9zda2T02repk89i8pN6jb8sqRo/Pm+QCWKOybTJSE1NSixRS85LzUzLz
	0m2VvIPjneNNzQwMdQ0tLcyVFPISc1NtlVx8AnTdMnOA7lRSKEvMKQUKBSQWFyvp29kU5ZeW
	pCpk5BeX2CqlFqTkFJgU6BUn5haX5qXr5aWWWBkaGBiZAhUmZGec79jKWHCBueL9hbOsDYw/
	mLoYOTkkBEwkzizax97FyMUhJLCHUWLbnw0sEM4nRomzN25AOd8YJW63rmfrYuQAa/m2WQEi
	vpdR4tySR6wQTiuTxKXDy1hA5rIJaEmsnrqcFcQWETjCJPHnRCqIzSxgJ7F+6lxmEFtYwFvi
	+v5DYDUsAqoSj7dsZAOxeQUsJX7+2scIcZ+8xOoNB5hBFkgIvGSX2PZjLztEwkXi7cVJUEXC
	Eq+Ob4GKS0l8frcX6tJkifZP3BDhHIlLu1dB/WwvceDKHBaQEmYBTYn1u/QhwrISU0+tY4I4
	k0+i9/cTqHJeiR3zYGwliZ07JkDZEhJPV69hg7A9JOa+bQOLCwnESlzY3c04gVF2FsKGBYyM
	qxilUguKc9NTk00LDHXzUsvhEZWcn7uJEZz8tAJ2MK7e8FfvECMTB+MhRgkOZiUR3kk3P6YJ
	8aYkVlalFuXHF5XmpBYfYjQFhtlEZinR5Hxg+s0riTc0sTQwMTMzM7E0NjNUEud93To3RUgg
	PbEkNTs1tSC1CKaPiYNTqoFp87xpxonBi28c+RmyUH6Z1K8s1v8hHufE1neYRZnrr+qMMbVX
	aGe9Hbxb4raI9p3fvzpK8o6un6AUcsE6R/uCgrzyjS9P9orw7D0W45wzf8LUW206xg8li0Vs
	fm5I3OLZ3R/Wev9aWs7NGerrw/Mqbd6+WJOs9j+NIXANn0ng/4Jq71lNmaJ+j5kUfLjVT/i3
	ZEZl7dSvC6s95JPH+fTVUk/X85fcrrY42i13KrnouzBH+ML+R85/K6LObzO6XMtr0li6/WN+
	Vcu7haZyu+c1rV+0WGadq0/35HUqceI72NnsDrhNq0r5U8XYJNt5k8O23PayTkD1p5ytqi3b
	Gee/lPn++OxdTf0JzfxCrkosxRmJhlrMRcWJAFgq0LIHBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrALMWRmVeSWpSXmKPExsWy7bCSnO6X4q9pBmd+KFs8mLeNzeLQ5q3s
	Fte/PGe1uHlgJ5PF+fMb2C02Pb7GavGx5x6rxeVdc9gsZpzfx2Rx8ZSrxaKtX9gtDr9pZ7X4
	d20ji8WG3lfsDnwe72+0sntsWtXJ5rF5Sb1H35ZVjB6fN8kFsEZx2aSk5mSWpRbp2yVwZZzv
	2MpYcIG54v2Fs6wNjD+Yuhg5OCQETCS+bVboYuTiEBLYzShx+eckti5GTqC4hMTOb63MELaw
	xMp/z9khipqZJO6f6GACSbAJaEmsnrqcFSQhInCJSeLAkSfsIAlmAQeJi2efsIDYwgLeEtf3
	H2IFsVkEVCUeb9kItoFXwFLi5699jBAb5CVWbzjAPIGRZwEjwypGydSC4tz03GTDAsO81HK9
	4sTc4tK8dL3k/NxNjOBA1NLYwXhv/j+9Q4xMHIyHGCU4mJVEeCfd/JgmxJuSWFmVWpQfX1Sa
	k1p8iFGag0VJnNdwxuwUIYH0xJLU7NTUgtQimCwTB6dUA9PcCOH8hbOOHLGocItzOCgk1Ft7
	NevB2RAVYR1rpUcpYY++GDvN+bv9lPpxFvE5v9hUdU/w5kWWKvDPuflxxdtZSv5q+6y452yp
	tnukyt9oxrIi8uYa+c4F/HWyyu9Mp+ROiXLJfdYm8Ek5JysjuuvsprDj2w271378/jFrY5o8
	R1vE3SmGGzhcDyY8O35XYHXXq1XOTcoa30uv8LaUHIs68WJfxTJjK6eT6X2T5hWvqDl6coPQ
	C5fCJSK1m+YyOZQ9f7SxZ+VxJ6njSzNcr3SbnWS/2mXixiYXd1Tu0uqLJboZhRmV/aysewt1
	1//vSLFuPhJz8ZfBOZlTi4+vF3l/fUn4n+ZbtWKPNA74LFNiKc5INNRiLipOBAAoAjo9swIA
	AA==
X-CMS-MailID: 20240926144716epcas5p330d6374d8b647f45e056143f237a55aa
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240926144716epcas5p330d6374d8b647f45e056143f237a55aa
References: <CGME20240926144716epcas5p330d6374d8b647f45e056143f237a55aa@epcas5p3.samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>

This patch series updates samsung clock driver with common samsung
CCF function and defines locktime value for PLL142XX controller.

Varada Pavani (2):
  clk: samsung: Use samsung CCF common function
  clk: samsung: Fixes PLL locktime for PLL142XX used on FSD platfom

 drivers/clk/samsung/clk-exynos4.c | 78 +++++++++++++++++--------------
 drivers/clk/samsung/clk-pll.c     |  7 ++-
 2 files changed, 50 insertions(+), 35 deletions(-)

-- 
2.17.1

