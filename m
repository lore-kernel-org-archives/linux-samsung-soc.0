Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB6287DA6F
	for <linux-samsung-soc@vger.kernel.org>; Mon, 30 Sep 2024 12:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727698738; cv=none; b=nSB4UDEa60fCXE6KjPWfALI+DANMa/Edu0h9XGb7ReUehJkqE8g0z5H3CmK899Y1TfNaFcRAuRkFk9tiLTNPMPWo7vvZjz7k9HNwL5w7ad1gYbK6VJtlQonApYKfuVwA/7wGljbesX0b2lmD6HDx0An0gwGhb3vHv04JftJ3HCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727698738; c=relaxed/simple;
	bh=q0erioaXg88v53Q4OKmZcUhEkvzMwWV/s8tsNmoC9fU=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:References; b=qMSuryAdYNUDml4rdbS1pPROfgUul8N7HY5BIl68iAz8PuNaKcgxuhdI4kHtzqTIPT2XA3yRK1zbRtg78saCD1BxJhaqwnjKjIJB4g/DFyH6pXcFnodYPeYYwVuxxExPTN/H8BoZE7XvWLkBy3KGN+fA+zFMOyKvoNet9Z7KH2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=rBzLsPEb; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="rBzLsPEb"
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20240930121850epoutp01251d613e200d3c0f5294fcc752c7d567~6BNeFhOjX1253612536epoutp01J
	for <linux-samsung-soc@vger.kernel.org>; Mon, 30 Sep 2024 12:18:50 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20240930121850epoutp01251d613e200d3c0f5294fcc752c7d567~6BNeFhOjX1253612536epoutp01J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1727698730;
	bh=R0AaCgttQPZ19ZWT/7WHWzx8+T3Toxh3xV02Ynep2lo=;
	h=From:To:Cc:Subject:Date:References:From;
	b=rBzLsPEb5RsCCExuHYXWWDmEjEDRN/BztDEijzpMcLdLBrenM9565REk5a12yOSvA
	 qP6xa6Dd203ld0HbdgLP/wDoQ9pUXCX4ElId0wQ9GPY1ha5FxwRhwZuF2JeZoSlhYH
	 sOy7ZsiVf0EXNEfWBG87phZp5uQitsr03V4fjPE8=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTP id
	20240930121850epcas5p3c90a8f038b80cf20dd2f8764260e3dbd~6BNdlW7570223602236epcas5p35;
	Mon, 30 Sep 2024 12:18:50 +0000 (GMT)
Received: from epsmgec5p1new.samsung.com (unknown [182.195.38.180]) by
	epsnrtp4.localdomain (Postfix) with ESMTP id 4XHKqX3TQdz4x9Pv; Mon, 30 Sep
	2024 12:18:48 +0000 (GMT)
Received: from epcas5p2.samsung.com ( [182.195.41.40]) by
	epsmgec5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	4C.5F.08574.8279AF66; Mon, 30 Sep 2024 21:18:48 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20240930112127epcas5p2622025d70a7db472b636a97b0fbd7cf2~6AbW_-3d11300313003epcas5p2Q;
	Mon, 30 Sep 2024 11:21:27 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20240930112127epsmtrp244c127c05fa64c16009c4e7e663323f2~6AbW_U2Zk0864508645epsmtrp2Y;
	Mon, 30 Sep 2024 11:21:27 +0000 (GMT)
X-AuditID: b6c32a44-6dbff7000000217e-4e-66fa97284227
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	79.F7.18937.7B98AF66; Mon, 30 Sep 2024 20:21:27 +0900 (KST)
Received: from cheetah.sa.corp.samsungelectronics.net (unknown
	[107.109.115.53]) by epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20240930112125epsmtip2d92704f7e7d124dabecbf6191b2dff32~6AbVE7Ink3089230892epsmtip2a;
	Mon, 30 Sep 2024 11:21:24 +0000 (GMT)
From: Varada Pavani <v.pavani@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	alim.akhtar@samsung.com, mturquette@baylibre.com, sboyd@kernel.org,
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: aswani.reddy@samsung.com, pankaj.dubey@samsung.com,
	gost.dev@samsung.com, Varada Pavani <v.pavani@samsung.com>
Subject: [PATCH 0/2] clk: samsung: Update PLL locktime and samsung function
Date: Mon, 30 Sep 2024 16:48:57 +0530
Message-Id: <20240930111859.22264-1-v.pavani@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrEKsWRmVeSWpSXmKPExsWy7bCmhq7G9F9pBpvahC0ezNvGZnFo81Z2
	i+tfnrNa3Dywk8ni/PkN7BabHl9jtfjYc4/V4vKuOWwWM87vY7K4eMrVYtHWL+wWh9+0s1r8
	u7aRxWJD7yt2Bz6P9zda2T02repk89i8pN6jb8sqRo/Pm+QCWKOybTJSE1NSixRS85LzUzLz
	0m2VvIPjneNNzQwMdQ0tLcyVFPISc1NtlVx8AnTdMnOA7lRSKEvMKQUKBSQWFyvp29kU5ZeW
	pCpk5BeX2CqlFqTkFJgU6BUn5haX5qXr5aWWWBkaGBiZAhUmZGd8u/CEtWAza8WcfXuZGxgP
	sHQxcnJICJhI9G95x9zFyMUhJLCbUWLWqbesEM4nRolXbxcwwTkt/TPYYVomTNrDApHYyShx
	9PhkNginlUli+ZfZYIPZBLQkVk9dDjZLRKCPSeLuiQlMIAlmgRKJ/59es4LYwgLeEtf3HwKy
	OThYBFQlVh3lBQnzClhKvJzVxwSxTV5i9YYDzBD2LXaJ63ssIWwXiYP7VkDVCEu8Or4F6jop
	ic/v9rKBjJQQSJZo/8QNEc6RuLR7FVS5vcSBK3NYQEqYBTQl1u/ShwjLSkw9tQ7qSD6J3t9P
	oMp5JXbMg7GVJHbumABlS0g8Xb2GDcL2kPjR3sAMMlJIIFZi4jGvCYyysxAWLGBkXMUomVpQ
	nJuemmxaYJiXWg6PpuT83E2M4MSn5bKD8cb8f3qHGJk4GA8xSnAwK4nw3jv0M02INyWxsiq1
	KD++qDQntfgQoykwvCYyS4km5wNTb15JvKGJpYGJmZmZiaWxmaGSOO/r1rkpQgLpiSWp2amp
	BalFMH1MHJxSDUwrGI6e2/7GhX3S8sdHGC47atQEWT7Qcjm+u+tQbgtXrZPYnHBV/dLKPQpc
	TJmWU/881PiTa+pRdP+fk0WXZ94kGzGNPbdluAI9Dq6aJej88Ri3yzxXk4Srz1QmBm6UlV57
	M+vCexfbNE6JEIGLVsUp7oFdsqueP9yc1dGxrevDxh+FHXL9Mvt9b9Rc/uy7d8ov7T0qCxWM
	p3aKRph5+Hlc0m83mK3jtY0181080wNt63VzMkVvnbr2dsO2j+d4n+afday4qzi7942419Hn
	Hl4K+ss0Uv3TjH/ujO74HtKhzlop3VsxwcCdxba+JHBTzKy/u2tuTrm35/gR5/yDzKUS+fvW
	/UgznJ6UWMaUpcRSnJFoqMVcVJwIAKTMhvgFBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprNLMWRmVeSWpSXmKPExsWy7bCSvO72zl9pBl+fMFs8mLeNzeLQ5q3s
	Fte/PGe1uHlgJ5PF+fMb2C02Pb7GavGx5x6rxeVdc9gsZpzfx2Rx8ZSrxaKtX9gtDr9pZ7X4
	d20ji8WG3lfsDnwe72+0sntsWtXJ5rF5Sb1H35ZVjB6fN8kFsEZx2aSk5mSWpRbp2yVwZXy7
	8IS1YDNrxZx9e5kbGA+wdDFyckgImEhMmLQHyObiEBLYzihx9/JORoiEhMTOb63MELawxMp/
	z9khipqZJDpvv2AFSbAJaEmsnrqcFSQhIjCLSWLukg9Aozg4mAUqJOb8NwapERbwlri+/xAr
	SJhFQFVi1VFekDCvgKXEy1l9TBDz5SVWbzjAPIGRZwEjwypG0dSC4tz03OQCQ73ixNzi0rx0
	veT83E2M4PDTCtrBuGz9X71DjEwcjIcYJTiYlUR47x36mSbEm5JYWZValB9fVJqTWnyIUZqD
	RUmcVzmnM0VIID2xJDU7NbUgtQgmy8TBKdXAZNG4zeBa/6eWG3FRK51bghha4pv+JV/itdj2
	LGFpa1fd0hzWKb3JUen8mZ+EHDs3Cs68Y5uo/tg9SU/07lxBgbgYX6bH62at9+O4rWn1rrPy
	8JJy/gNXHntWtj1aOclgRWbw49d99pk/lysm7ezkXfCc2zCp86frt8vNLNqZq16rbeRaxx22
	2kaCi3+37uqTBnIM54WCG7N2p/v/uR486yCjPs+sZKflE1Q7Tp9QvbFf5aOfxQOLH5HPiu1e
	OurOLZPWSZgWsCKz8KPw6xeBu3X+vVmdsei5l3P7r+lvjXhP7+nbp1vxnkdgrqGnNLdte2Zr
	2R6lm9ujW6/Ern/TrTVL27xyI5vNs3lcbT+UWIozEg21mIuKEwGhbs+prgIAAA==
X-CMS-MailID: 20240930112127epcas5p2622025d70a7db472b636a97b0fbd7cf2
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240930112127epcas5p2622025d70a7db472b636a97b0fbd7cf2
References: <CGME20240930112127epcas5p2622025d70a7db472b636a97b0fbd7cf2@epcas5p2.samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>

This patch series updates samsung clock driver with common samsung
CCF function and defines locktime value for PLL142XX controller.

Varada Pavani (2):
  clk: samsung: Use samsung CCF common function
	This patch is missed in this series https://patchwork.kernel.org/project/linux-clk/cover/20240926144513.71349-1-v.pavani@samsung.com/ hence posting again.
  clk: samsung: Fixes PLL locktime for PLL142XX used on FSD platfom
	Got review comment in this patch will address in next patch series.

 drivers/clk/samsung/clk-exynos4.c | 78 +++++++++++++++++--------------
 drivers/clk/samsung/clk-pll.c     |  7 ++-
 2 files changed, 50 insertions(+), 35 deletions(-)

-- 
2.17.1

