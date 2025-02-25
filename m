Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D5CF1C8600
	for <linux-samsung-soc@vger.kernel.org>; Tue, 25 Feb 2025 13:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740490129; cv=none; b=HIN8K/ZY/HLtRcFq1A/b2uj7j3+7cIRxQS+IEIfiY3VwoYEQOtUOuiTIat/Ji1Wuw6DJS/OU/PlFbim7xkTPj0c2qdRiqU8NlKD0NfmN4p8lxBoSIjuBlvaa+vUJVoARgg6BXxl/VRn96lXuXyh6l35nJ07G5ts795AMb4ntxX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740490129; c=relaxed/simple;
	bh=FEqXvop9DpkK2iXQUvUjk7iYDvxHdgSWsynJJOX5HAo=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:References; b=h8udUmKgV/3XiD0+CmTfPSmE3CKv39dQQDwtxAXCwttuAMjYOOEs7rHvCI3dzp9jCREE+Y8qlkUSs38Rcy0C2Qxva2OhE/mYBx5xOhGH5CCNMGiMqHLtSoenBWUBxPph96FCkOZblgGSiR8mZBIRt/CCJ1QrdZfpzbntEUCdCpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=MfTYNKfl; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="MfTYNKfl"
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250225132845epoutp02bd85957f94dd8ed14701504ead95c77e~ndowVfe4A3188631886epoutp02I
	for <linux-samsung-soc@vger.kernel.org>; Tue, 25 Feb 2025 13:28:45 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250225132845epoutp02bd85957f94dd8ed14701504ead95c77e~ndowVfe4A3188631886epoutp02I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1740490125;
	bh=GB97pYLpDQ6tgX78bR35TsDYzztt4s1z6GEmVMXWXBU=;
	h=From:To:Cc:Subject:Date:References:From;
	b=MfTYNKflLbLjOysIXmT9DqbVqi0EcMuvaIpbmZzVW4WVepw6ZwkPCRll+4HLNUcQE
	 YjVjLpKoIW/sm0RB73WzfTe+A8Tm+skFOm0iR7qNzeV0D6A6ZLGmw1zgBO/TNCDW9z
	 Q6AOPTFPRjvw48GqQoMvR4NO/8KwLQ6hCsBjCgZc=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTP id
	20250225132844epcas5p4cf1928f596fffee98c4c670392e31de7~ndov2Z6I12351523515epcas5p4G;
	Tue, 25 Feb 2025 13:28:44 +0000 (GMT)
Received: from epsmges5p2new.samsung.com (unknown [182.195.38.180]) by
	epsnrtp3.localdomain (Postfix) with ESMTP id 4Z2JMt6N5jz4x9Pr; Tue, 25 Feb
	2025 13:28:42 +0000 (GMT)
Received: from epcas5p2.samsung.com ( [182.195.41.40]) by
	epsmges5p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	75.45.19933.A85CDB76; Tue, 25 Feb 2025 22:28:42 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250225132431epcas5p148b0c62e36ea09c35473c8da7f312ece~ndlEdiUWI1609216092epcas5p1X;
	Tue, 25 Feb 2025 13:24:31 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250225132431epsmtrp2d29ed31d237e06b6201e8d2dbc618650~ndlEcs8fS1147511475epsmtrp2f;
	Tue, 25 Feb 2025 13:24:31 +0000 (GMT)
X-AuditID: b6c32a4a-b87c770000004ddd-5b-67bdc58a93eb
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	87.A2.23488.F84CDB76; Tue, 25 Feb 2025 22:24:31 +0900 (KST)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250225132427epsmtip29deb63f3da29d8b2328d554f4eeffab8~ndlAf9dbd1947719477epsmtip2c;
	Tue, 25 Feb 2025 13:24:27 +0000 (GMT)
From: Varada Pavani <v.pavani@samsung.com>
To: krzk@kernel.org, aswani.reddy@samsung.com, pankaj.dubey@samsung.com,
	s.nawrocki@samsung.com, cw00.choi@samsung.com, alim.akhtar@samsung.com,
	mturquette@baylibre.com, sboyd@kernel.org,
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: gost.dev@samsung.com, Varada Pavani <v.pavani@samsung.com>
Subject: [PATCH v2 0/2] clk: samsung: Update PLL locktime and samsung
 function
Date: Tue, 25 Feb 2025 18:49:16 +0530
Message-Id: <20250225131918.50925-1-v.pavani@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrEKsWRmVeSWpSXmKPExsWy7bCmhm7X0b3pBue/G1k8mLeNzeLQ5q3s
	Fte/PGe1uHlgJ5PF+fMb2C02Pb7GavGx5x6rxeVdc9gsZpzfx2Rx8ZSrxaKtX9gtDr9pZ7X4
	d20ji8WG3lfsDnwe72+0sntsWtXJ5rF5Sb1H35ZVjB6fN8kFsEZl22SkJqakFimk5iXnp2Tm
	pdsqeQfHO8ebmhkY6hpaWpgrKeQl5qbaKrn4BOi6ZeYA3amkUJaYUwoUCkgsLlbSt7Mpyi8t
	SVXIyC8usVVKLUjJKTAp0CtOzC0uzUvXy0stsTI0MDAyBSpMyM44u/stY8F89op9648yNzD2
	s3UxcnJICJhIrJ36kr2LkYtDSGA3o8SblV1MEM4nRonnf/6zQDjfGCUWrL7ODtNycNc7qJa9
	jBJ31p6Fcr4wSmzbtBJsMJuAlsTqqctZQWwRgSNMEn9OpILYzAJ2EuunzmXuYuTgEBYIkLj0
	Wx4kzCKgKrF05hawBbwClhINF7dA3ScvsXrDAWaQ+RICt9glVu5axgSRcJHYv24HM4QtLPHq
	+Bao66QkPr/bywYyX0IgWaL9EzdEOEfi0u5VUK32EgeuzGEBKWEW0JRYv0sfIiwrMfXUOiaI
	K/kken8/gSrnldgxD8ZWkti5YwKULSHxdPUaqDM9JDr/bwfbKiQQK3H3ufQERtlZCAsWMDKu
	YpRMLSjOTU8tNi0wyksth0dTcn7uJkZw4tPy2sH48MEHvUOMTByMhxglOJiVRHg5M/ekC/Gm
	JFZWpRblxxeV5qQWH2I0BYbYRGYp0eR8YOrNK4k3NLE0MDEzMzOxNDYzVBLnbd7Zki4kkJ5Y
	kpqdmlqQWgTTx8TBKdXA1Lm3VUPJicNz93b1vFum/L2ZG++0BTHem9+ksfGowYrlkb2ThLz2
	3XU9Ofd1a8JLl4NXZycYTWEukZ1Uuyrs5KEX0aZJDNriW29cX6Aj13ZcNitichSHhPQKw+Ui
	yybcOCEQcMx1xVL5KLbkUJUfz2Y8e3TN7c8XlWXJj91efyt6ftD6Ym4FVwPbsXOnTdp+Fery
	hZ1KOTMhLT1lu3Co2pna/KVVCX2MP1531TJvrG/i6y0W2WU+Z+bNzQuWTd33uMXn2e+Cq7Wr
	bO6xp6++K8iyb5V7m9O9+xKuIdFVRWpPQjYlRrC9tnRPnRWivOhOauBkcUWmHVZsyzlutj/N
	azHlyeI5KiHm279VPUdJiaU4I9FQi7moOBEAaoAFDQUEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrILMWRmVeSWpSXmKPExsWy7bCSvG7/kb3pBjPuq1g8mLeNzeLQ5q3s
	Fte/PGe1uHlgJ5PF+fMb2C02Pb7GavGx5x6rxeVdc9gsZpzfx2Rx8ZSrxaKtX9gtDr9pZ7X4
	d20ji8WG3lfsDnwe72+0sntsWtXJ5rF5Sb1H35ZVjB6fN8kFsEZx2aSk5mSWpRbp2yVwZZzd
	/ZaxYD57xb71R5kbGPvZuhg5OSQETCQO7nrH3sXIxSEksJtRYvL/NewQCQmJnd9amSFsYYmV
	/55DFX1ilLh7eQpYgk1AS2L11OWsIAkRgUtMEgeOPAHrZhZwkLh49gkLiC0s4Cdx78g7VhCb
	RUBVYunMLWA1vAKWEg0Xt0CdIS+xesMB5gmMPAsYGVYxSqYWFOem5yYbFhjmpZbrFSfmFpfm
	pesl5+duYgSHopbGDsZ335r0DzEycTAeYpTgYFYS4eXM3JMuxJuSWFmVWpQfX1Sak1p8iFGa
	g0VJnHelYUS6kEB6YklqdmpqQWoRTJaJg1OqgcnHvFG5lOf+rAfF2/a3M7A3ZBmrJd8wzd4X
	urdLUfFsbZ5D9oGLii+lZhR8c963RqYlpFrlR4xvhY7GHu+Ct8cN+OwmCi4T2Z83N1L9c7hp
	vFoI2xv5OSeuXvKVDhFuTM8y228+aZl6uXKUa7iZPUMk28WjTHq9q6XfxkY4ZlW8YOtvN+HV
	9KuWV3p9ePFT6+9GGyXKklzPLXMwWHBgmdiy/Jxkk7e5+isOnTZ3mfN7XZPsD5WWXcKLs5+E
	aFU3zry1luHzLoFre1VLeWZLVh4yC7W44qm48pbA8ZwZniy7VY5OjgxfG7d+mQtH/ru/M9cm
	xW07fuBk/bcpU4Onna0+FXHIsME4abu41NKZSizFGYmGWsxFxYkA8XO+UrQCAAA=
X-CMS-MailID: 20250225132431epcas5p148b0c62e36ea09c35473c8da7f312ece
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250225132431epcas5p148b0c62e36ea09c35473c8da7f312ece
References: <CGME20250225132431epcas5p148b0c62e36ea09c35473c8da7f312ece@epcas5p1.samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>

This patch series updates samsung clock driver with common samsung
CCF function and defines locktime value for PLL142XX controller.

Changes since v1:
1. Addressed review comment by Krzysztof. Removed fixes tag and updated commit
message. Below is the link for v1.
https://patchwork.kernel.org/project/linux-clk/patch/20240926144513.71349-3-v.pavani@samsung.com/

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

