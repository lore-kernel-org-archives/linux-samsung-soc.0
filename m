Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A5018E349
	for <linux-samsung-soc@vger.kernel.org>; Thu, 12 Sep 2024 10:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726137548; cv=none; b=RHxIpgAAToPjrOFk7wSDHCrwGBXp/XB+c2Tk9AKTuat7qdAWPDUY9rTRVB95PbnaYHoESx41ne5aZmLyNk/5og2fx+A2A14lpnUST0ktQMT61gddY61DNFDAPJZL/kZe6wJpzPcv4U8yYEuRIOQo3nmF5MAlS2D0WDJAreVKdgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726137548; c=relaxed/simple;
	bh=KL60dx9fshGB5LmggBDPVvqxNFJ38m0h1l/J+r6RXgI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 References; b=JNS0WncStrRttiUpR2VGzGKSRkdfsnVX0ZCwdWdquey8F4WokviO3IzUezT35VTFt394UcLHiVCQgabCBwLEd40w+wGgGnG0jjimDETU4+gI363YdaUAhmQqpswCtT35oB7Nr1ileOyRa8/SiaVIW+w0XN96KRkx0LiRw7nacRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=bxtPHlzg; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="bxtPHlzg"
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20240912103904epoutp037c0d59e4eff669a77795412ef08f506b~0ePOOec4k0411204112epoutp037
	for <linux-samsung-soc@vger.kernel.org>; Thu, 12 Sep 2024 10:39:04 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20240912103904epoutp037c0d59e4eff669a77795412ef08f506b~0ePOOec4k0411204112epoutp037
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1726137544;
	bh=sMHeG2TD6GRnHAxku6ZaajzzNHNByF1tvmQw41lD6vc=;
	h=From:To:Cc:Subject:Date:References:From;
	b=bxtPHlzgmQW+yYfZseWxkVk8LHO/zcXusUzIbBrrT6Ru8nMroQ6GuuiXbUokOnAYh
	 LWyfJ1HP5SjRqbO3Ptn/y4FWWG5YSz0dhgk/YKkieITMdkNyPjH/a0B2Hw7scq9vYx
	 4Z1cFFbUEG0SqPYOTFAsxoKen4QM22wnFS86iVK4=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTP id
	20240912103903epcas2p477995dd6377bdc76d28f962f01617b95~0ePNhGIZc0547505475epcas2p4Q;
	Thu, 12 Sep 2024 10:39:03 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.36.69]) by
	epsnrtp4.localdomain (Postfix) with ESMTP id 4X4DSl3h9tz4x9Pw; Thu, 12 Sep
	2024 10:39:03 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
	epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
	83.2D.10012.7C4C2E66; Thu, 12 Sep 2024 19:39:03 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20240912103903epcas2p3ff3df48eb8b19d27053b2c2fe40ea1c5~0ePMt54nX2496324963epcas2p3x;
	Thu, 12 Sep 2024 10:39:03 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20240912103903epsmtrp205e0626175eba11cf0da69ec76c02e44~0ePMswBPW1077810778epsmtrp2X;
	Thu, 12 Sep 2024 10:39:03 +0000 (GMT)
X-AuditID: b6c32a47-c43ff7000000271c-a5-66e2c4c7c0ab
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	2C.81.07567.6C4C2E66; Thu, 12 Sep 2024 19:39:02 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.60]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20240912103902epsmtip1fcb7844cb17f8ded5353b0818d4557f1~0ePMd1oWb3132831328epsmtip12;
	Thu, 12 Sep 2024 10:39:02 +0000 (GMT)
From: Sunyeal Hong <sunyeal.hong@samsung.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi
	<cw00.choi@samsung.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, Sunyeal Hong <sunyeal.hong@samsung.com>
Subject: [PATCH 0/3] add clocks support for exynosauto v920 SoC
Date: Thu, 12 Sep 2024 19:38:53 +0900
Message-ID: <20240912103856.3330631-1-sunyeal.hong@samsung.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrAJsWRmVeSWpSXmKPExsWy7bCmue7xI4/SDDpXi1s8mLeNzWLN3nNM
	Fte/PGe1mH/kHKvFy1n32Cw2Pb7GavGx5x6rxeVdc9gsZpzfx2Rx8ZSrxf89O9gtDr9pZ7X4
	d20ji0XTsvVMDnwe72+0sntsWtXJ5rF5Sb1H35ZVjB6fN8kFsEZl22SkJqakFimk5iXnp2Tm
	pdsqeQfHO8ebmhkY6hpaWpgrKeQl5qbaKrn4BOi6ZeYA3amkUJaYUwoUCkgsLlbSt7Mpyi8t
	SVXIyC8usVVKLUjJKTAv0CtOzC0uzUvXy0stsTI0MDAyBSpMyM7ombiMveAdS8XS/lOMDYyv
	mLsYOTgkBEwkmp8rdjFycggJ7GCUOHYrsouRC8j+xChx/u98dgjnG6PE3WUrWECqQBqm/H4L
	ldjLKLF2fQMThPORUeLEj4lMIGPZBHQl/vxzAImLCOxnkri1YCYriMMscJZRYtXhPWCjhAXs
	Ja7132MFsVkEVCVOtd0Gi/MCxY+d/wy1Tl7i+uOjTBBxQYmTM5+AxZmB4s1bZzODDJUQaOSQ
	mHtjJxNEg4vE/N2foJqFJV4d38IOYUtJfH63lw3CzpeYfP0tE0RzA6PEtX/dzBAJe4lFZ36y
	g7zALKApsX6XPiSQlCWO3ILayyfRcfgvO0SYV6KjTQiiUU3i05XLUENkJI6deAZle0j0LVjE
	DgnfWIkl05ayT2CUn4Xkm1lIvpmFsHcBI/MqRrHUguLc9NRiowJjeKQm5+duYgQnVS33HYwz
	3n7QO8TIxMF4iFGCg1lJhHcS26M0Id6UxMqq1KL8+KLSnNTiQ4ymwPCdyCwlmpwPTOt5JfGG
	JpYGJmZmhuZGpgbmSuK891rnpggJpCeWpGanphakFsH0MXFwSjUwzV81lSNnm29lfvfJ1x1/
	RGxmVfhXx/vP/HzZ/bpPstSNCEvrVQtTVmmHTKsxtvCo+8H2Z4WQYcra88t39l0sFfrEsVg3
	c39HPOf5KSui2fbMU7v8W3nX3tD487wr5v95dcHI9GllfPkkacOgbr1EswmvtWySIpKXqS1N
	mWF/Y3a2/Ssnufx/spUbbv27vDZnDif/w6tK/ue99yQqFlyMVHnMcfq0mpZzg2ZqZpNmnJ6p
	3uyJNyt/XtSLybCdfW76v5nLl967Eaxh82Q+/8l57aZNP1ckHc0vMU8s6lRs2z1r7oyf9xsD
	T09+wKdpo5D9QvP5Sz+nyOcvp0sqf60Qn/70anCZxKudaqsuqW/8qsRSnJFoqMVcVJwIAMLj
	D58zBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrALMWRmVeSWpSXmKPExsWy7bCSnO6xI4/SDL53Wlo8mLeNzWLN3nNM
	Fte/PGe1mH/kHKvFy1n32Cw2Pb7GavGx5x6rxeVdc9gsZpzfx2Rx8ZSrxf89O9gtDr9pZ7X4
	d20ji0XTsvVMDnwe72+0sntsWtXJ5rF5Sb1H35ZVjB6fN8kFsEZx2aSk5mSWpRbp2yVwZfRM
	XMZe8I6lYmn/KcYGxlfMXYycHBICJhJTfr9lB7GFBHYzSvQ8NYSIy0hsbPjPDmELS9xvOcLa
	xcgFVPOeUeL3tR9sXYwcHGwCuhJ//jmAxEUEjjJJbFrwjBnEYRa4zChxdhdEt7CAvcS1/nus
	IDaLgKrEqbbbLCA2L1D82PnPLBAb5CWuPz7KBBEXlDg58wlYnBko3rx1NvMERr5ZSFKzkKQW
	MDKtYpRMLSjOTc9NNiwwzEst1ytOzC0uzUvXS87P3cQIDnQtjR2M9+b/0zvEyMTBeIhRgoNZ
	SYR3EtujNCHelMTKqtSi/Pii0pzU4kOM0hwsSuK8hjNmpwgJpCeWpGanphakFsFkmTg4pRqY
	IhfH9X+apD3VNPGxEu8z7wCL66ds+q9NkP+8kXHagaSYP/vNVvW3qIqKpE51v3mZRf3L9x/v
	mHSeddS+fG2cZew4h+Hay4in/tXN+4s+14WGP7XOP3Ja0fX58h3x9gwMbzt4uNmj+j9HCEke
	dp8uqhBz7pbmittyt3g31C7g26YW8NVN5cHcV6GHA8Udfvz9Vbn1URs3f9+LDouJqbM3Rn8R
	6QhZ1rf+tKfVubkXetaEHdjysuPBj6zkmv4fKlvan/ZfKZS34VrEmlw878x0y5AeUY3Id+Hv
	66a/n+50+pNhbP/mb+6hibF/deqfuZyOacvkYPervtcw4bmeoX7OLH/xbNkp7MsmT7R/eYBb
	iaU4I9FQi7moOBEAAwT3D+MCAAA=
X-CMS-MailID: 20240912103903epcas2p3ff3df48eb8b19d27053b2c2fe40ea1c5
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240912103903epcas2p3ff3df48eb8b19d27053b2c2fe40ea1c5
References: <CGME20240912103903epcas2p3ff3df48eb8b19d27053b2c2fe40ea1c5@epcas2p3.samsung.com>

This patchset adds the CMU block below to support exynosauto v920 SoC.
- CMU_PERIC1
- CMU_MISC
- CMU_HSI0/1

Sunyeal Hong (3):
  dt-bindings: clock: exynosautov920: add peric1, misc and hsi0/1 clock
    definitions
  clk: samsung: exynosautov920: add peric1, misc and hsi0/1 clock
    support
  arm64: dts: exynosautov920: add peric1, misc and hsi0/1 clock DT nodes

 .../arm64/boot/dts/exynos/exynosautov920.dtsi |  50 +++
 drivers/clk/samsung/clk-exynosautov920.c      | 290 ++++++++++++++++++
 .../clock/samsung,exynosautov920.h            |  47 +++
 3 files changed, 387 insertions(+)

-- 
2.46.0

