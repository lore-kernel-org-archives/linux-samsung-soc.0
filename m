Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD382620C6
	for <linux-samsung-soc@vger.kernel.org>; Mon, 28 Apr 2025 11:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745839814; cv=none; b=XYrtBA/rlUMQmaO/c+slPF1wxSdO3e/6q0t5wIe99o9GrSNfj+tTQ6o9akXvUo/sz3KJLvH9uydZfYtN5fQYf5Xco7Mu4MgRfwtv7DNxWrZKbDC3SVuUX9cGq1Plq+cbwGclZKMkfwZtq3yStr8qU8IVJeB+/gdP2aUpn/2s6/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745839814; c=relaxed/simple;
	bh=fwld4zkOzPn17td9PUrYMQ1ZtsLZ+Qvv0Fddj7pLU+I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 References; b=WPg6YyqfrtcmBJ4PlSiXjZMiiX5jnmy+RB0ZBfgbn7zJPR2U83oI/2ueg/SuyRt3rG7R4N3fgMjS79Un8odDv2BuSLmfgDMIj1UKuPWz7a9L5uIV6GPdChx5Oxti1xCW6wIyLQDdahlea7T+9lMmgzF7dTmjNIGxtRvgelhVXeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=OFdW8aC1; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="OFdW8aC1"
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250428113010epoutp02df76a2100a957599c63498b6a5779aff~6eA64hvFM2408224082epoutp02b
	for <linux-samsung-soc@vger.kernel.org>; Mon, 28 Apr 2025 11:30:10 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250428113010epoutp02df76a2100a957599c63498b6a5779aff~6eA64hvFM2408224082epoutp02b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1745839810;
	bh=ZQy/46a1r4WAvJCApFWSuqNU0UpVfcMsny2biIWuzIE=;
	h=From:To:Cc:Subject:Date:References:From;
	b=OFdW8aC1+zv0YZ0OsW6E0VMV3Yl7wSORCpL/RC+6+jYEVPAWwHdurf5XYBfSmEGSN
	 l1b4qH0jRPa1p8wIysBhd1XiYtwvLFfCmGUX+al6fEXs53sX4eJFBzr3id8ACFs+dS
	 YLa6BpaWr/qBAl5vavOiXO76sAlkvCZuvM+LLbSs=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPS id
	20250428113009epcas2p2f7a8cb332fc766d0a47a30fa93c12268~6eA6Ntvek0100801008epcas2p2N;
	Mon, 28 Apr 2025 11:30:09 +0000 (GMT)
Received: from epcas2p2.samsung.com (unknown [182.195.36.92]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4ZmLpT0y8pz3hhT7; Mon, 28 Apr
	2025 11:30:09 +0000 (GMT)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20250428113008epcas2p327275651c8869ee5a113eda2f2ec1d30~6eA5Q6Qmo2967129671epcas2p3F;
	Mon, 28 Apr 2025 11:30:08 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250428113008epsmtrp125683d16bb59170d7f0ca1f815620940~6eA5PPu1n2934329343epsmtrp1S;
	Mon, 28 Apr 2025 11:30:08 +0000 (GMT)
X-AuditID: b6c32a29-566fe7000000223e-4c-680f66c05646
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	6D.81.08766.0C66F086; Mon, 28 Apr 2025 20:30:08 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.60]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250428113008epsmtip2cb6934ace77da911c6152dedc507572a~6eA4-N9DR1092810928epsmtip2R;
	Mon, 28 Apr 2025 11:30:08 +0000 (GMT)
From: Shin Son <shin.son@samsung.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki
	<s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar
	<alim.akhtar@samsung.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Sunyeal Hong <sunyeal.hong@samsung.com>
Cc: Shin Son <shin.son@samsung.com>, linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] Fix CPUCL0 add CPUCL1/2 clock support for exynosauto
 v920 SoC
Date: Mon, 28 Apr 2025 20:28:54 +0900
Message-ID: <20250428112858.82434-1-shin.son@samsung.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrMLMWRmVeSWpSXmKPExsWy7bCSvO6BNP4Mg1nThC0ezNvGZrFm7zkm
	i+tfnrNazD9yjtXi/PkN7BabHl9jtfjYc4/V4vKuOWwWM87vY7K4eMrV4v+eHewWh9+0s1r8
	u7aRxWLy8bWsFk3L1jM58Hu8v9HK7rFpVSebx+Yl9R59W1YxenzeJBfAGsVlk5Kak1mWWqRv
	l8CVsXrRBcaCnWwVr34/Y25gnMfaxcjJISFgIvHj93PGLkYuDiGB3YwS626vYIdISEgcnjGB
	EcIWlrjfcgSsQUjgPaPEifllXYwcHGwCqhKbfsuD9IoIvGWSWP7/ABNIDbPAaUaJnWdkQGxh
	gVCJf7vesIHYLED1rbv/gs3hFbCUOLDgECPIHAkBeYn+DgmIsKDEyZlPWCDGyEs0b53NPIGR
	bxaS1CwkqQWMTKsYJVMLinPTc4sNCwzzUsv1ihNzi0vz0vWS83M3MYLDXUtzB+P2VR/0DjEy
	cTAeYpTgYFYS4a0y4M8Q4k1JrKxKLcqPLyrNSS0+xCjNwaIkziv+ojdFSCA9sSQ1OzW1ILUI
	JsvEwSnVwBQ1c9eN5POvXd8vOtfXrLpCqnAp14mv9uockzzn7FefupYxW2zO6gs2m84942vM
	+jqjveP1sQW1nu2T/sgtElu2fdKmusI5/UV+a6I+2fXMm7XEYBvLLfFfwYJNfZO5Fk94r5om
	nrSdZbf9lG2TftVeuCujMuWtsAt3wm+JKxxRjA+8qnednz8pOFDR9kTOBsULST4tH21DfSZP
	fFLg5topfpfbK1PbI7CJgeW+wO+JchFTp8nY/3haInf23EST1Xd143m4WpTPPWS/WlbPI3Pp
	e/xrBXve2N13315rbp23b75tYJfdO7aI+exfvma4xYlI8b18qlCvYLr4V0FR/nNN9SMnQ9nU
	pct/rLLJdVBiKc5INNRiLipOBACoSUGg5gIAAA==
X-CMS-MailID: 20250428113008epcas2p327275651c8869ee5a113eda2f2ec1d30
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250428113008epcas2p327275651c8869ee5a113eda2f2ec1d30
References: <CGME20250428113008epcas2p327275651c8869ee5a113eda2f2ec1d30@epcas2p3.samsung.com>

This patchset fixes the incorrect CLKS_NR_CPUCL0 definition and
adds the CMU_CPUCL1 and CMU_CPUCL2 block to support exynosauto v920 SoC.

Changes in v2:
- Separate the fix into its own patch
- Remove the extra blank line

Shin Son (4):
  dt-bindings: clock: exynosautov920: add cpucl1/2 clock definitions
  clk: samsung: exynosautov920: add cpucl1/2 clock support
  clk: samsung: exynosautov920: Fix incorrect CLKS_NR_CPUCL0 definition
  arm64: dts: exynosautov920: add cpucl1/2 clock DT nodes

 .../clock/samsung,exynosautov920-clock.yaml   |  44 ++++
 .../arm64/boot/dts/exynos/exynosautov920.dtsi |  26 +++
 drivers/clk/samsung/clk-exynosautov920.c      | 208 +++++++++++++++++-
 .../clock/samsung,exynosautov920.h            |  32 +++
 4 files changed, 309 insertions(+), 1 deletion(-)

-- 
2.49.0

