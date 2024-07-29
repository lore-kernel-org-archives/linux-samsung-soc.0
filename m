Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 786C681749
	for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Jul 2024 04:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722227470; cv=none; b=aCTXqYQOfw78HXcj+FeA+Yb/HYVpD0RvkVQdlBR1YMwuzkjuH8dAPef6Ct08mz+AZVcZjGmqGeoSkiEbCnF6lssYTqu8WwIeHfYx/0ekijvclsanNWe5r0OYm4H6399hLzWOY7gwjNP7cUIozlqzM+ADNnIkjqJYDVVtcIXW8ZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722227470; c=relaxed/simple;
	bh=5iOnzIDvsNQ/Dvh3PXhiCWoGQSoPdiNympJQrl9DVmo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 References; b=FxTzsslQPD4Ymmn325A79Xof3oBGX06eyMh/OhWCjb1aFT0QMZnrqX3/inAAa2paZpPGlRPN3s0/SQkGoz2pv5SDSmLk+rYdBU/Xos9+xqt6UNhPk+tomKyYBxzNGgwckhzAXdgRpszEOMHwQ/cfIWzHIF08H3iNAROzA1MYYvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=gx96x3in; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="gx96x3in"
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20240729043105epoutp03387a527bb0de261a20f7eeb81ee0d7f3~mlMFtR0iP2902229022epoutp033
	for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Jul 2024 04:31:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20240729043105epoutp03387a527bb0de261a20f7eeb81ee0d7f3~mlMFtR0iP2902229022epoutp033
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1722227466;
	bh=n6Y07PNXMRBVPQdUZr3e1RRN01iaJ3ENYaioBvgYdIk=;
	h=From:To:Cc:Subject:Date:References:From;
	b=gx96x3inqDReElWvdm8oAQ+0OxmKcllRltCdoQCfwznU4SE0LTEU3PHErQkU8KoWg
	 HRBex6hUg8UZEoLsDfZQo2q2Iubn8jqTtFAXgxjmyjCZqA1QJsTcbDuQTH7eWONPS+
	 00Q5xyG9HQE9DU+EqenkFimAx0hl8gvf5DQ9wS7k=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
	epcas1p1.samsung.com (KnoxPortal) with ESMTP id
	20240729043105epcas1p193d5a4fd72dc68c0e72ec1c14813890e~mlME9EMcR2876828768epcas1p1W;
	Mon, 29 Jul 2024 04:31:05 +0000 (GMT)
Received: from epsmgec1p1.samsung.com (unknown [182.195.36.136]) by
	epsnrtp3.localdomain (Postfix) with ESMTP id 4WXQQw2B2Vz4x9Pr; Mon, 29 Jul
	2024 04:31:04 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
	epsmgec1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
	B6.D2.08992.70B17A66; Mon, 29 Jul 2024 13:31:03 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
	20240729043102epcas1p4952d0437ef733036b8fdbe28b0ef21ca~mlMCVwsdE2709827098epcas1p4P;
	Mon, 29 Jul 2024 04:31:02 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20240729043102epsmtrp19cf45eb89730859ee07b25df88811b02~mlMCUnmOZ0723007230epsmtrp1R;
	Mon, 29 Jul 2024 04:31:02 +0000 (GMT)
X-AuditID: b6c32a33-96dfa70000002320-d2-66a71b07d60c
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	C8.86.08456.50B17A66; Mon, 29 Jul 2024 13:31:01 +0900 (KST)
Received: from localhost.localdomain (unknown [10.113.111.204]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20240729043101epsmtip104e4077cc516581f322d82159a787379~mlMBbGU8t1887518875epsmtip1D;
	Mon, 29 Jul 2024 04:31:01 +0000 (GMT)
From: Kwanghoon Son <k.son@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	alim.akhtar@samsung.com, mturquette@baylibre.com, sboyd@kernel.org,
	robh@kernel.org, conor+dt@kernel.org, tomasz.figa@gmail.com
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Kwanghoon
	Son <k.son@samsung.com>
Subject: [PATCH 0/4] dpum clock support for Exynos Auto v9 SoC
Date: Mon, 29 Jul 2024 13:30:35 +0900
Message-Id: <20240729043039.134435-1-k.son@samsung.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprJJsWRmVeSWpSXmKPExsWy7bCmvi679PI0g1dbTS0ezNvGZrFm7zkm
	i+tfnrNazD9yjtWid81VJovz5zewW2x6fI3V4mPPPVaLGef3MVlcPOVq8X/PDnaLw2/aWS3+
	XdvIYrFq1x9GBz6P9zda2T12zrrL7rFpVSebx+Yl9R59W1YxenzeJBfAFpVtk5GamJJapJCa
	l5yfkpmXbqvkHRzvHG9qZmCoa2hpYa6kkJeYm2qr5OIToOuWmQN0rJJCWWJOKVAoILG4WEnf
	zqYov7QkVSEjv7jEVim1ICWnwLRArzgxt7g0L10vL7XEytDAwMgUqDAhO+P67JvsBTdYK55t
	bmFuYLzB0sXIySEhYCLxemYDWxcjF4eQwA5GiXszbzFDOJ8YJV70/4bKfGOU2Dl1LiNMy+zO
	p6wQib2MEq2bL0M5Xxglzk96yQRSxSagLrGkbS07SEJE4DijxJkl3YwgDrPASkaJB6uegK0X
	FrCT6Nq5CSjBwcEioCrx9x8bSJhXwFzi2tQlYGEJAXmJxQ8kIMKCEidnQnQyA4Wbt84Gu1VC
	oJND4uKuTqiPXCSOHF3ADmELS7w6vgXKlpJ42d8GZWdLHP24lw3CLpG4PmsRK4RtLLF/6WQm
	kL3MApoS63fpQ+zik3j3tYcV4hxeiY42IZjLbnWWQzSKSpx5+hFqoIfEjlVLwWwhgViJOU0f
	mScwys1C8sAsJA/MQti1gJF5FaNYakFxbnpqsmGBITwik/NzNzGC06iW8Q7Gy/P/6R1iZOJg
	PMQowcGsJMIbf2VpmhBvSmJlVWpRfnxRaU5q8SFGU2CATmSWEk3OBybyvJJ4QxNLAxMzI2MT
	C0MzQyVx3jNXylKFBNITS1KzU1MLUotg+pg4OKUamNSc/cQXrPnMOHnxWb+aYPkbWy69q/29
	aAtbkH7Jh7K072r5+ifCli/VXGfn3FU29dserlwDI89o7Us33s+0kWNx29b9wbo22vdbxgnZ
	rw4PNA02SW380rn7opPC8bqjH9yPcWv0r9q0x+fnlJ0fN+yODyjPYC4M3nZK677yKrPkfSmr
	kk9Zpz/7tluKa2LbdeHFIgV7awyuCZ/69vmOLsedHBbFqbMuLDmf2MAs/uk4a+375RbTHXTs
	z/Q3GO/0zOxLSey039ohs3/Z3F9bPVuFgtJ15f8FrFsv2jx9855Q8/9pGat6+/bWJn25eDfV
	yWj2Kct1yy58n9Bgr+qrfVjxUI2cs0/2zSszHp++Ha7EUpyRaKjFXFScCACocNrsLAQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrCLMWRmVeSWpSXmKPExsWy7bCSnC6r9PI0g2Xz1S0ezNvGZrFm7zkm
	i+tfnrNazD9yjtWid81VJovz5zewW2x6fI3V4mPPPVaLGef3MVlcPOVq8X/PDnaLw2/aWS3+
	XdvIYrFq1x9GBz6P9zda2T12zrrL7rFpVSebx+Yl9R59W1YxenzeJBfAFsVlk5Kak1mWWqRv
	l8CVcX32TfaCG6wVzza3MDcw3mDpYuTkkBAwkZjd+ZS1i5GLQ0hgN6PE5i+7oBKiEh2XGxm7
	GDmAbGGJw4eLIWo+MUoc3faEEaSGTUBdYknbWnaQhIjAZUaJ/wsmMYI4zAJrGSWeTnnCDlIl
	LGAn0bVzE9gkFgFVib//2EDCvALmEtemLoFaIC+x+IEERFhQ4uTMJ2A3MAOFm7fOZp7AyDcL
	SWoWktQCRqZVjJKpBcW56bnFhgVGeanlesWJucWleel6yfm5mxjBAa+ltYNxz6oPeocYmTgY
	DzFKcDArifDGX1maJsSbklhZlVqUH19UmpNafIhRmoNFSZz32+veFCGB9MSS1OzU1ILUIpgs
	EwenVAPT+c9K12Z12s2t+9pgv0y6JvKr3sKf/e8ubcp91XmH89gDfrHlzfNyD6x1XHarRfPR
	FjdxiZVBhbb5HdfXTjmRwKi52atldn2dhJfJ/YoYjZIfTPOSL6wLd75/f9mHOZLbHt5f1XTO
	uof7akfN4pxjJ5bVHNrxz3KFTfrV+4F/Y78c4nzF6By9X8z06vVlu6/XnywSMLo4+S3vhiau
	k/Gi5i7OX2JY4i8Z9z3QiLLaZbVaPuTutsz8z5cYbly2MzjLriJ8i/uSd/yWJ1WWQbwxk1bs
	WWitZPjyVCvz9m/fE2tig5xuf8yIc3nx9tf1TV84ubsNzRmminukPt397W3sitRZne5x3rvC
	v166Mu2XuRJLcUaioRZzUXEiAHWLmobnAgAA
X-CMS-MailID: 20240729043102epcas1p4952d0437ef733036b8fdbe28b0ef21ca
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240729043102epcas1p4952d0437ef733036b8fdbe28b0ef21ca
References: <CGME20240729043102epcas1p4952d0437ef733036b8fdbe28b0ef21ca@epcas1p4.samsung.com>

DPUM (Display Processing Unit Main) is main dpu for Exynosautov9.

This patches enable clock for dpum, sysmmu(iommu).

Kwanghoon Son (4):
  dt-bindings: clk: exynosautov9: add dpum clock definitions
  dt-bindings: clock: exynosautov9: add schema for dpum
  arm64: dts: exynosautov9: add dpum clock DT nodes
  clk: samsung: exynosautov9: add dpum clock support

 .../clock/samsung,exynosautov9-clock.yaml     | 19 +++++
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi  | 11 +++
 drivers/clk/samsung/clk-exynosautov9.c        | 83 +++++++++++++++++++
 .../dt-bindings/clock/samsung,exynosautov9.h  | 11 +++
 4 files changed, 124 insertions(+)


base-commit: c33ffdb70cc6df4105160f991288e7d2567d7ffa
-- 
2.39.2

