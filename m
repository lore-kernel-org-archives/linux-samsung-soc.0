Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E008171E55
	for <linux-samsung-soc@vger.kernel.org>; Tue, 17 Sep 2024 10:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726569220; cv=none; b=TVR3kdfad4jtdJYuXYLbAZZUJnYAENdNqG9zI09NMBh8C5p5k11cF8HmUamAw5lh/xQJQ19iaIrO2POS7B5nGJbD2hmJsvI8fUMoRk7xT/mIvCrDTaWlyzdfFWmqYfeXKmZo1R+g76BcadS4Lc7wJIQlCT4B3xalLknGM2HzgQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726569220; c=relaxed/simple;
	bh=wFmEbMkEzlPbuPfC3c+tamOfbSHUUHjpQhPX+5Sufk4=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:References; b=jznnZZEWH0eZEGy5hoZraBwQMJr001RKQGdqGQKahJHBxIy7ENKNizNR1ewzTC7spRzlmr5N+jZjE28oC7SkLK6fgpHmQwj1wEd/D3TL0Shc45DGp6ipYP+WDqng6GpIIt8xMdyJj5cHR2J/SXkYuVfALEG70ukWlU7M5lSawVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=LAijLutj; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="LAijLutj"
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20240917103336epoutp041ae96ddfd06e286241e23ab3d85b84a8~2AY3wCRe92857128571epoutp04h
	for <linux-samsung-soc@vger.kernel.org>; Tue, 17 Sep 2024 10:33:36 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20240917103336epoutp041ae96ddfd06e286241e23ab3d85b84a8~2AY3wCRe92857128571epoutp04h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1726569216;
	bh=Z8XYZZkTSZ22gWjKptOQjy8umR+ZxclxkelN6v3Qikw=;
	h=From:To:Cc:Subject:Date:References:From;
	b=LAijLutjLXKR8DViUUoLkZ9vv/wAv2GvnpFo9LSsC7yM/4D0xwYWtw5hE1PQR+o98
	 P9DPovB8ruPzXzsof0LkJSWstKm6hNwyjHE1+6ZKOgeZIhedqaYA7KZAjp2dlKOjZy
	 1tijW4qqp2Q0+dAIy5lr4GOVc3ZY2axxtf0j88So=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTP id
	20240917103335epcas5p2cf85f5a01fc6bf3f89680578a5eeb20e~2AY3NwuEy0999909999epcas5p2K;
	Tue, 17 Sep 2024 10:33:35 +0000 (GMT)
Received: from epsmges5p3new.samsung.com (unknown [182.195.38.174]) by
	epsnrtp4.localdomain (Postfix) with ESMTP id 4X7J6648ggz4x9Q1; Tue, 17 Sep
	2024 10:33:34 +0000 (GMT)
Received: from epcas5p4.samsung.com ( [182.195.41.42]) by
	epsmges5p3new.samsung.com (Symantec Messaging Gateway) with SMTP id
	4A.62.09642.EFA59E66; Tue, 17 Sep 2024 19:33:34 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20240917094449epcas5p37c2593fe8f181d6b19a9a1b290488186~1-uSGk5B40143801438epcas5p3f;
	Tue, 17 Sep 2024 09:44:49 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20240917094449epsmtrp1bb162bc53ff618ec8adf7de9ef6a63a5~1-uSFyhsc2430324303epsmtrp1C;
	Tue, 17 Sep 2024 09:44:49 +0000 (GMT)
X-AuditID: b6c32a4b-613ff700000025aa-8c-66e95afe8497
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	FD.DE.08456.19F49E66; Tue, 17 Sep 2024 18:44:49 +0900 (KST)
Received: from cheetah.sa.corp.samsungelectronics.net (unknown
	[107.109.115.53]) by epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20240917094447epsmtip154016eeee7cee221e30b04bc64588fbc~1-uQCUFtP2146621466epsmtip1S;
	Tue, 17 Sep 2024 09:44:47 +0000 (GMT)
From: Inbaraj E <inbaraj.e@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	alim.akhtar@samsung.com, mturquette@baylibre.com, sboyd@kernel.org,
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org
Cc: pankaj.dubey@samsung.com, gost.dev@samsung.com, Inbaraj E
	<inbaraj.e@samsung.com>
Subject: [PATCH 0/2] clk: samsung: remove number of clocks from bindings
Date: Tue, 17 Sep 2024 15:13:53 +0530
Message-Id: <20240917094355.37887-1-inbaraj.e@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrOKsWRmVeSWpSXmKPExsWy7bCmlu6/qJdpBrMvyFg8mLeNzWLN3nNM
	Fte/PGe1mH/kHKvFzQM7mSzu/pnEZnH+/AZ2i48991gtLu+aw2Yx4/w+JouLp1wtFm39wm7x
	f88OdovDb9pZLf5d28jiwO/x/kYru8emVZ1sHn1bVjF6fN4kF8ASlW2TkZqYklqkkJqXnJ+S
	mZduq+QdHO8cb2pmYKhraGlhrqSQl5ibaqvk4hOg65aZA3SokkJZYk4pUCggsbhYSd/Opii/
	tCRVISO/uMRWKbUgJafApECvODG3uDQvXS8vtcTK0MDAyBSoMCE7Y8uip8wFm5krtj/cyd7A
	eJWpi5GTQ0LAROLLwr8sXYxcHEICuxklrj0/zAjhfGKU+NO0mRnC+cYosfTbeXaYlovbbkK1
	7GWUeH76NCuE08okMeXQFhaQKjYBdYkN3d/ZQBIiAmuYJFbPPsEKkmAWCJc4N/0imC0s4CHR
	83EZG4jNIqAqsfrRLbCreAWsJJY/2cQCsU5eYvWGA2B3SAjcY5fY9nUWI0TCRWLd+SusELaw
	xKvjW6Duk5J42d8GZftI7J/zC6o+Q+LY9uVQ9fYSB67MAVrAAXSQpsT6XfoQYVmJqafWMUHc
	ySfR+/sJNJR4JXbMg7GVJWYeuc8GYUtK7Ly8E+pOD4mNlzvAxgsJxEpcnXecbQKj7CyEDQsY
	GVcxSqYWFOempxabFhjnpZbDoyo5P3cTIzgFannvYHz04IPeIUYmDsZDjBIczEoivLa/n6YJ
	8aYkVlalFuXHF5XmpBYfYjQFhtlEZinR5HxgEs4riTc0sTQwMTMzM7E0NjNUEud93To3RUgg
	PbEkNTs1tSC1CKaPiYNTqoGpWU/vHm+88WeBO0u966Zyi61MXc22SnWfVnvs0o/9fzgcpbwq
	5VXWRz/4HayomHfOsW2b3c1TPyTVH103yyy8uWVD0v+SDxbrGhVsGAsYF0p2/ipyXLwh7dKc
	ojV/I34lxVzvPCW5uJup+8flYxeYDvzumGlWoHunf5vzK8dzF/dwlHNavEz0+/8qvHWflbCD
	/fFP6UdN9itvZGA8tuD4YdWZYSX3v7z4fcB01saZaXP+X+nYMPm2ZcbW1N1WV/UeX127qCdI
	LfMZa+svkfDd/5J9xXiUXzFEWYR4zTZuWjUnrScpedLNFc3Fv74umdKjMru9PfPm9r2801yn
	P16w91pjSNS55sgGLe12r0lWSizFGYmGWsxFxYkAlAW5SQoEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrELMWRmVeSWpSXmKPExsWy7bCSnO5E/5dpBsfOKVg8mLeNzWLN3nNM
	Fte/PGe1mH/kHKvFzQM7mSzu/pnEZnH+/AZ2i48991gtLu+aw2Yx4/w+JouLp1wtFm39wm7x
	f88OdovDb9pZLf5d28jiwO/x/kYru8emVZ1sHn1bVjF6fN4kF8ASxWWTkpqTWZZapG+XwJWx
	ZdFT5oLNzBXbH+5kb2C8ytTFyMkhIWAicXHbTZYuRi4OIYHdjBKfZ0yFSkhKzP49nR3CFpZY
	+e85O0RRM5PE0msdbCAJNgF1iQ3d39lAEiICu5gkpi/ezgiSYBaIlPjRvhWsW1jAQ6Ln4zKw
	BhYBVYnVj26BbeAVsJJY/mQTC8QGeYnVGw4wT2DkWcDIsIpRMrWgODc9t9iwwCgvtVyvODG3
	uDQvXS85P3cTIzgYtbR2MO5Z9UHvECMTB+MhRgkOZiURXtvfT9OEeFMSK6tSi/Lji0pzUosP
	MUpzsCiJ83573ZsiJJCeWJKanZpakFoEk2Xi4JRqYOo99LAnW1DwS07rxefZ65NdTGSvBzRp
	7VuStCF7Xc6UD6Vn8wWfHnC9d8+jYqO0/Zyee5V6jIuOWnMzmTQZrkp4p8S3JIYj/OCibrnH
	5cGz1wpyXl1y2iHoY+gR99P/nYIu9TKdm1HpPyEiP71dfYa+ZtxZxY11LyK4zr8MOF0rszsg
	gfN0ru6x2IREhffPVtonl39RK7uzbN79sxdjT3PUMsUde1Kqqeq6TFBd5plmzUH+2SuEK1+Z
	mKx+osKu+bKHWSGl5tHee/Nm35m97PXkK5Eleip3nj7s/M5W6bqkaXX3J4HlHHqLZqblWHzk
	fvm4yiLpQ3tmzQcz1UXKlg6zJr4wmvLplEqHn0eTjBJLcUaioRZzUXEiAMiCGxq1AgAA
X-CMS-MailID: 20240917094449epcas5p37c2593fe8f181d6b19a9a1b290488186
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240917094449epcas5p37c2593fe8f181d6b19a9a1b290488186
References: <CGME20240917094449epcas5p37c2593fe8f181d6b19a9a1b290488186@epcas5p3.samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>

This patch series moves number of clock from dt-binding to driver for FSD
SoC.

Inbaraj E (2):
  clk: samsung: fsd: do not define number of clocks in bindings
  dt-bindings: clock: samsung: remove define with number of clocks for
    FSD

 drivers/clk/samsung/clk-fsd.c       | 23 ++++++++++++++++-------
 include/dt-bindings/clock/fsd-clk.h |  7 -------
 2 files changed, 16 insertions(+), 14 deletions(-)

-- 
2.17.1

