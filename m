Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6983D14A4F9
	for <linux-samsung-soc@vger.kernel.org>; Mon, 19 Aug 2024 05:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724045074; cv=none; b=d9GK27lvpIxWVitu9OrP8QTiP5bEWc/IbI3UwAwZFFBOLQAMmzAVjP/x6eZLXyIOINLgfTMnRaA64i11aAqD+6ZAUjZafybEbxnotYHSbydygVnP/eTpYTUb+oY/5h2Ew17S23hlAB4MT9HPxrQSogZ4WfXagUHp294YlKbHeao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724045074; c=relaxed/simple;
	bh=wwGZCnchOs3sPYGiDpLG67suhQck7nNvlAzgyLrMI/o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 References; b=E/GGdsu1Xp/TkPU6C7CQocTPd6gwnHuo7CNPJIfBWGWLvKyqvuDdPfjhHBjBqmBJz2FJ0/c6EaZ7Nn7x9k5A5LN64R1+WSDUZ7u4GR7imQgjlN6cFx8eUtcM6FyYwQCFYkniLPCB9+jUDe459In6drErGs1y2ygwj5fptQQUEE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=KMon7q5J; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="KMon7q5J"
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20240819052423epoutp011472a991cf5bca6f60453bb9caa660f8~tCdnbUESP2425824258epoutp01z
	for <linux-samsung-soc@vger.kernel.org>; Mon, 19 Aug 2024 05:24:23 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20240819052423epoutp011472a991cf5bca6f60453bb9caa660f8~tCdnbUESP2425824258epoutp01z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1724045063;
	bh=KA1J1W5EM2rDAvrtR6B6O2Vvkz55kPAivdgIzw3eMOE=;
	h=From:To:Cc:Subject:Date:References:From;
	b=KMon7q5JhDnUkosNnYV00znwUea6n6BXM9aZVfF6oCpL7QWn79BjPTUzp8tyIanjD
	 uzA1z4/luLl5j7WV9wTRcQxx0NmIdl2Dc409J2agX09+MkB0uiM8FLZl8m3Z6t2thb
	 CzmtTD0TYURZnlpDTLI/7hEse+ph9Js2DL/9YVcQ=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTP id
	20240819052423epcas2p267cf9dee54998967dadad4a0a4e540c9~tCdnCW18q0480304803epcas2p2B;
	Mon, 19 Aug 2024 05:24:23 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.36.68]) by
	epsnrtp1.localdomain (Postfix) with ESMTP id 4WnLck67XBz4x9Q1; Mon, 19 Aug
	2024 05:24:22 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
	epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
	7C.68.10431.607D2C66; Mon, 19 Aug 2024 14:24:22 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
	20240819052422epcas2p27acdb1fd7154984cfebe54506bcaac65~tCdmLK7vc1050110501epcas2p2E;
	Mon, 19 Aug 2024 05:24:22 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20240819052422epsmtrp2356e7e9a7fc7ffc857997b755a8ee42e~tCdmKYxX11493014930epsmtrp24;
	Mon, 19 Aug 2024 05:24:22 +0000 (GMT)
X-AuditID: b6c32a45-ffffa700000028bf-7c-66c2d7066cc4
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	44.EE.08456.607D2C66; Mon, 19 Aug 2024 14:24:22 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.60]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20240819052422epsmtip1c1b91c28b87e493af41712376b69f6f9~tCdl8Su7k1811018110epsmtip10;
	Mon, 19 Aug 2024 05:24:22 +0000 (GMT)
From: Sunyeal Hong <sunyeal.hong@samsung.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki
	<s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar
	<alim.akhtar@samsung.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Sunyeal Hong <sunyeal.hong@samsung.com>
Subject: [PATCH v6 0/4] initial clock support for exynosauto v920 SoC
Date: Mon, 19 Aug 2024 14:24:11 +0900
Message-ID: <20240819052416.2258976-1-sunyeal.hong@samsung.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrIJsWRmVeSWpSXmKPExsWy7bCmuS7b9UNpBq0z9CwezNvGZrFm7zkm
	i+tfnrNazD9yjtXi/PkN7BabHl9jtfjYc4/V4vKuOWwWM87vY7K4eMrV4v+eHewWh9+0s1r8
	u7aRxaJp2XomBz6P9zda2T02repk89i8pN6jb8sqRo/Pm+QCWKOybTJSE1NSixRS85LzUzLz
	0m2VvIPjneNNzQwMdQ0tLcyVFPISc1NtlVx8AnTdMnOA7lRSKEvMKQUKBSQWFyvp29kU5ZeW
	pCpk5BeX2CqlFqTkFJgX6BUn5haX5qXr5aWWWBkaGBiZAhUmZGes+v+VpeAyX8XSmXPZGhh3
	cncxcnJICJhIfP/+kbWLkYtDSGAHo8TlA6uZIJxPjBKnOpdCZb4xSrRf3wyU4QBrOfncDCK+
	l1Hi05+/LBDOR0aJnSvnsYEUsQnoSvz55wASFxHYwySx5fwSsLHMAmcZJe7OWcAOslxYwFXi
	wqNrYDaLgKrEm2WnWEFsXgF7ibPb5rFDHCgvcXHNczaIuKDEyZlPWEBsZqB489bZzCBDJQQ6
	OSRWfXrKAtHgIrHkwiwmCFtY4tXxLVCDpCQ+v9vLBmHnS0y+/pYJormBUeLav25miIS9xKIz
	P9lBXmAW0JRYv0sf4mVliSO3oPbySXQc/ssOEeaV6GgTgmhUk/h05TLUEBmJYyeeQdkeEpOe
	NoG9JSQQK7Fz9X/GCYzys5B8MwvJN7MQ9i5gZF7FKJZaUJybnlpsVGAIj9Xk/NxNjOC0quW6
	g3Hy2w96hxiZOBgPMUpwMCuJ8Ha/PJgmxJuSWFmVWpQfX1Sak1p8iNEUGL4TmaVEk/OBiT2v
	JN7QxNLAxMzM0NzI1MBcSZz3XuvcFCGB9MSS1OzU1ILUIpg+Jg5OqQam/sbgbTdOHeL571N9
	0Va1u6IpobJn8SqWEP03D/Zs7ZlcyPnW3c0iI6u6eXW/2+6scFO+z2d9l0755+M446T23kfz
	0o+8zHOW/eY9lTv5lOyyNx4+UxfnSz7+tSA6TC/3XFLd5sOsPw7Vtu0/I6DeOue/VrLMXD/7
	V5PvFIV5RXYIC899+uJj6MGo83+iO49Omz89+d/vHOaygLQKYzXO5JM6DyJmPrZIYf+rtFXu
	XLpQjRbn9j9WXqL+H/Y9UPh2+Nn8Y6u0lTv+zL3+j/neqU/f+p5PZPRitbu94a5p9Mzbu0PE
	El7PPLbEQrqZ6eWDqa/+XrwZoS/zQ4pd+Nn3Gxrf9TRiWzz/uKT/8V95TImlOCPRUIu5qDgR
	AIgx6Qo0BAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrPLMWRmVeSWpSXmKPExsWy7bCSnC7b9UNpBkcauSwezNvGZrFm7zkm
	i+tfnrNazD9yjtXi/PkN7BabHl9jtfjYc4/V4vKuOWwWM87vY7K4eMrV4v+eHewWh9+0s1r8
	u7aRxaJp2XomBz6P9zda2T02repk89i8pN6jb8sqRo/Pm+QCWKO4bFJSczLLUov07RK4Mlb9
	/8pScJmvYunMuWwNjDu5uxg5OCQETCROPjfrYuTiEBLYzShx/tlepi5GTqC4jMTGhv/sELaw
	xP2WI6wgtpDAe0aJdzMdQHrZBHQl/vxzAOkVETjEJDHx81MWEIdZ4DKjxLG7k5lBGoQFXCUu
	PLoGNohFQFXizbJTYIN4Bewlzm6bB7VAXuLimudsEHFBiZMzn7CA2MxA8eats5knMPLNQpKa
	hSS1gJFpFaNkakFxbnpusWGBUV5quV5xYm5xaV66XnJ+7iZGcJhrae1g3LPqg94hRiYOxkOM
	EhzMSiK83S8PpgnxpiRWVqUW5ccXleakFh9ilOZgURLn/fa6N0VIID2xJDU7NbUgtQgmy8TB
	KdXAtL4pruTf/LK4+gmLldmmcO9X+cEye/0zNja1QwHWSr0K/lPenPq7IPnamakRN37/v2fL
	PmWD/Qrmb6WOH+Z8djpzQvUtw6V5m4INjH6fef18lU1X/NtKie8TG7zmr2Sr1Z4cFTpv5fJw
	JW65ZR90VqSklf71tK2edurO6oJFz22jv2kU6Zk71K7aah/P/PbV2fLU9zPT1hwx111x2//x
	rp+vf/96u/4YB48T08emvys6d23QVL/pWz4nfta7/PP83/qL2J9Xp/5Z0umzff7z2a3ldmsL
	Hk+tmn6CX+P0ZNFTes6HfjXZVoamGXiKzP/4e2HJD32W/48e793lkvqkwcppx2sdvVqmECkF
	Zj9F5ulKLMUZiYZazEXFiQCwo39l4gIAAA==
X-CMS-MailID: 20240819052422epcas2p27acdb1fd7154984cfebe54506bcaac65
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240819052422epcas2p27acdb1fd7154984cfebe54506bcaac65
References: <CGME20240819052422epcas2p27acdb1fd7154984cfebe54506bcaac65@epcas2p2.samsung.com>

This patchset adds initial clock driver support for Exynos Auto v920 SoC.
This driver uses HW Auto Clock gating. So all gate clocks did not register.

Below CMU blocks are supported in this patchset and remains will be
implemented later.

- CMU_TOP
- CMU_PERIC0

Changes in v6:
 - Add peric1, mis and hsi0/1 in the bindings document

Changes in v5:
 - Change CMU_TOP odd numbering
 - Move the descriptions and names common clocks properties

Changes in v4:
 - Change PLL_531x fdiv type and mask bit
 - Change PLL_531x mdiv type

Changes in v3:
 - Change SoC name from Exynos Auto to ExynosAuto
 - Change the makefile order to the bottom of exynosautov9
 - Add PLL_531x formula for integer PLL

Changes in v2:
 - Fix typo from v209 to v920
 - Change USI clock to appropriate
 - Merge headers into binding patches
 - Change clock-name to the recommended name

Sunyeal Hong (4):
  dt-bindings: clock: add ExynosAuto v920 SoC CMU bindings
  arm64: dts: exynos: add initial CMU clock nodes in ExynosAuto v920
  clk: samsung: clk-pll: Add support for pll_531x
  clk: samsung: add top clock support for ExynosAuto v920 SoC

 .../clock/samsung,exynosautov920-clock.yaml   |  197 +++
 .../arm64/boot/dts/exynos/exynosautov920.dtsi |   40 +-
 drivers/clk/samsung/Makefile                  |    1 +
 drivers/clk/samsung/clk-exynosautov920.c      | 1173 +++++++++++++++++
 drivers/clk/samsung/clk-pll.c                 |   44 +
 drivers/clk/samsung/clk-pll.h                 |    1 +
 .../clock/samsung,exynosautov920.h            |  191 +++
 7 files changed, 1634 insertions(+), 13 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock.yaml
 create mode 100644 drivers/clk/samsung/clk-exynosautov920.c
 create mode 100644 include/dt-bindings/clock/samsung,exynosautov920.h

-- 
2.45.2

