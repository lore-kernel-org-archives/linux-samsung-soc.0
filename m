Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B20D262A3
	for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Jul 2024 22:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721687628; cv=none; b=edM7Mg/QZ+x6VflyGRUJ+qxxfN3MlQR7EvK0HRZ6YvmrUn3TRjCRThd3QO6elc57w8yhlaNIc/MY3XHHhp43jBTf1HOvONgL2K0UaCTn6rEE7kstoggCeja3LtdQwMtKGyjKaReb4Tb+Y+j5uW2ZvI45lVWqOM7n6BBWuUSx4f4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721687628; c=relaxed/simple;
	bh=w0VgkSPLlbiNdxGQX8DMltCbu3IVIJYLRNahh35imJs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 References; b=gHBSjmvEI/ykz09BZbAZiPb1UCawF7VWtUbczbCGKqPvw40RaiYxO/6smfEBCXUoPmNknzVZCND86Won2OxZ/LS6q3Gp+pqi6OQMflWdG5osEh11UGrmxPtEWgqOC4X58/DTkS8uupB7iQBQVm+GfZ7v3tZ8DSwKXTGbflXzM1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=ieiWLlh5; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="ieiWLlh5"
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20240722223342epoutp039ac2aac79c1854b4f7c875d6aeb6a862~kqcVIPcba1142611426epoutp034
	for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Jul 2024 22:33:42 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20240722223342epoutp039ac2aac79c1854b4f7c875d6aeb6a862~kqcVIPcba1142611426epoutp034
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1721687622;
	bh=mNr0Er/o07CtydA31xKfi8pSq/IiHVsC8YOsNcCDQwU=;
	h=From:To:Cc:Subject:Date:References:From;
	b=ieiWLlh5q8H+mHwYwwaLk2o14ofr/Nn3BOARVzL7Nrc8Z++DU9DlWu/tG+qbd1pi2
	 gU824Dpl4zOCSdEm5cD8ZoSA1+DqgkBKbZj27ass6lT+xLJ4v/Z06wedAc8jWNYM7n
	 aDBBsOoGzSB8cWjC34POsVEEEurA4KnwJ/O1AaLE=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTP id
	20240722223341epcas2p3b36ea97b6158cf02d26bf6373734cce5~kqcUn3-mx0258902589epcas2p3H;
	Mon, 22 Jul 2024 22:33:41 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.36.100]) by
	epsnrtp4.localdomain (Postfix) with ESMTP id 4WSZnK32Zpz4x9Pv; Mon, 22 Jul
	2024 22:33:41 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
	epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
	3B.82.10016.54EDE966; Tue, 23 Jul 2024 07:33:41 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20240722223340epcas2p380657369f0b57c9e21f05f250066a711~kqcToo2TC0259002590epcas2p3C;
	Mon, 22 Jul 2024 22:33:40 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20240722223340epsmtrp26a0a7097cca6c48fe3fe1c1edbaa4895~kqcTn5MiI3065730657epsmtrp2K;
	Mon, 22 Jul 2024 22:33:40 +0000 (GMT)
X-AuditID: b6c32a48-505b770000002720-5f-669ede45cabf
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	73.78.19367.44EDE966; Tue, 23 Jul 2024 07:33:40 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.60]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20240722223340epsmtip13f300feb4219bc49bf94e49747ebb3d2~kqcTcL-e72557425574epsmtip1W;
	Mon, 22 Jul 2024 22:33:40 +0000 (GMT)
From: Sunyeal Hong <sunyeal.hong@samsung.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki
	<s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar
	<alim.akhtar@samsung.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Sunyeal Hong <sunyeal.hong@samsung.com>
Subject: [PATCH v4 0/4] initial clock support for exynosauto v920 SoC
Date: Tue, 23 Jul 2024 07:33:29 +0900
Message-ID: <20240722223333.1137947-1-sunyeal.hong@samsung.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrIJsWRmVeSWpSXmKPExsWy7bCmma7rvXlpBgd2CVs8mLeNzWLN3nNM
	Fte/PGe1mH/kHKvF+fMb2C02Pb7GavGx5x6rxeVdc9gsZpzfx2Rx8ZSrxf89O9gtDr9pZ7X4
	d20ji0XTsvVMDnwe72+0sntsWtXJ5rF5Sb1H35ZVjB6fN8kFsEZl22SkJqakFimk5iXnp2Tm
	pdsqeQfHO8ebmhkY6hpaWpgrKeQl5qbaKrn4BOi6ZeYA3amkUJaYUwoUCkgsLlbSt7Mpyi8t
	SVXIyC8usVVKLUjJKTAv0CtOzC0uzUvXy0stsTI0MDAyBSpMyM5o3XCfuWAGb8Wvr5fYGhhX
	cHUxcnJICJhIdE3bydTFyMUhJLCDUWLJ7+/MEM4nRon3Lx6xwjln335hh2nZv+MTVMtORolt
	P25BVX1klNi44gBQFQcHm4CuxJ9/DiBxEYE9TBJbzi8B62AWOMsocXfOArBRwgKuEnvWbgCz
	WQRUJTqm72ADsXkF7CVuPT7CBrFOXuLimudQcUGJkzOfsIDYzEDx5q2zmSFqGjkklq6ohbBd
	JKZ1rWaEsIUlXh3fAnW2lMTnd3uhZuZLTL7+FuwgCYEGRolr/7qhBtlLLDrzE+wDZgFNifW7
	9EFMCQFliSO3oNbySXQc/ssOEeaV6GgTgmhUk/h05TLUEBmJYyeeQdkeEpMu72cFsYUEYiXW
	7D7DPIFRfhaSZ2YheWYWwt4FjMyrGMVSC4pz01OLjQpM4LGanJ+7iRGcVrU8djDOfvtB7xAj
	EwfjIUYJDmYlEd4nr+amCfGmJFZWpRblxxeV5qQWH2I0BQbvRGYp0eR8YGLPK4k3NLE0MDEz
	MzQ3MjUwVxLnvdc6N0VIID2xJDU7NbUgtQimj4mDU6qBiXm53ztmMeOZ6Uuq+Ke3xlqeX/Sc
	+d+6R0urk6NYNfo4/l8pZ1VZzL3Ez3/HJr9HbGqeRVtr83kO+l/4EH/TP6/o21qFSJGUTrPf
	ddN4+X9cmVHrwxp9L/p7lsON2g+b82LFfZZEnZt8M2Rhp2vy6YRnrBdCzznk3Al4n3MqZenu
	L8emBLU8zbxYOfeseL77iXOtcteFm+8Ivz3/fBbbofOy+hf3LfG+42xwdLnLga3Mhw2E77z9
	vVVNy2NReMOTG1z8r/86Vtx11J/j3tlg+tzvuWXI9j8SMXncndlPzwSZvhNoecmz4Erp3lSN
	2CUNivbW1++Lha2RXPnwwJ4kW8ecLEe9d1Pjf094dL+8XomlOCPRUIu5qDgRAFztmzM0BAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrLLMWRmVeSWpSXmKPExsWy7bCSnK7LvXlpBldbNCwezNvGZrFm7zkm
	i+tfnrNazD9yjtXi/PkN7BabHl9jtfjYc4/V4vKuOWwWM87vY7K4eMrV4v+eHewWh9+0s1r8
	u7aRxaJp2XomBz6P9zda2T02repk89i8pN6jb8sqRo/Pm+QCWKO4bFJSczLLUov07RK4Mlo3
	3GcumMFb8evrJbYGxhVcXYycHBICJhL7d3xi6mLk4hAS2M4o8W/LTBaIhIzExob/7BC2sMT9
	liOsEEXvGSWOPnnJ2MXIwcEmoCvx558DSFxE4BCTxMTPT1lAHGaBy4wSx+5OZgbpFhZwldiz
	dgPYJBYBVYmO6TvYQGxeAXuJW4+PsEFskJe4uOY5VFxQ4uTMJ2BXMAPFm7fOZp7AyDcLSWoW
	ktQCRqZVjKKpBcW56bnJBYZ6xYm5xaV56XrJ+bmbGMEhrhW0g3HZ+r96hxiZOBgPMUpwMCuJ
	8D55NTdNiDclsbIqtSg/vqg0J7X4EKM0B4uSOK9yTmeKkEB6YklqdmpqQWoRTJaJg1Oqgcno
	hfvtKknpO887D027OjPomPqVGfN+HdVQSd+5YOdFp7Kzr/QUvBQiz+64dKbsrO2kPzXrcw4d
	kJ3yp29x7Y8zdkVmMhJrnj+wSGffyMkU+Sz8V/XBBMFrpVMlyx5nSQh+2PllhTLv0swVW+rm
	tJ9g+Jz29PKRxUvS5rjHuiRer0m3kZuwfl/NziWme1R3LA9Qn915pNxtuvyHwIWzvQ+zfD/d
	1uSzp+TE/o8b0s/y5vfsfiJx8YIhC2/80itrH/6eM/OWEuuzTZ9/P1z571m7xsfcKd1pH2a3
	aN1YrbZV0vdJ/1qXiVcjUlo/vtsYHrNr/Z6yANns6wJG8nq/xFj/cp7bvdD9vLieW2/O6oaH
	K5VYijMSDbWYi4oTAYVlCi3gAgAA
X-CMS-MailID: 20240722223340epcas2p380657369f0b57c9e21f05f250066a711
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240722223340epcas2p380657369f0b57c9e21f05f250066a711
References: <CGME20240722223340epcas2p380657369f0b57c9e21f05f250066a711@epcas2p3.samsung.com>

This patchset adds initial clock driver support for Exynos Auto v920 SoC.
This driver uses HW Auto Clock gating. So all gate clocks did not register.

Below CMU blocks are supported in this patchset and remains will be
implemented later.

- CMU_TOP
- CMU_PERIC0

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

 .../clock/samsung,exynosautov920-clock.yaml   |  115 ++
 .../arm64/boot/dts/exynos/exynosautov920.dtsi |   40 +-
 drivers/clk/samsung/Makefile                  |    1 +
 drivers/clk/samsung/clk-exynosautov920.c      | 1173 +++++++++++++++++
 drivers/clk/samsung/clk-pll.c                 |   44 +
 drivers/clk/samsung/clk-pll.h                 |    1 +
 .../clock/samsung,exynosautov920.h            |  191 +++
 7 files changed, 1552 insertions(+), 13 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock.yaml
 create mode 100644 drivers/clk/samsung/clk-exynosautov920.c
 create mode 100644 include/dt-bindings/clock/samsung,exynosautov920.h

-- 
2.45.2

