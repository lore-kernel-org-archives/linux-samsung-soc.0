Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7CE928C5AA
	for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Nov 2025 08:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762762895; cv=none; b=kFu2LEb7uYYtRJOOglNsb1yjVMK5OqIKMtcAenZjoz/1uEiSpxxJ4mZjghzZIY+QFwg+mrZKGfNjLwDtyX31PajX30VpNx94OWaLa3YAnLJ5+ShToCUywAUWCvjo3ThGTvdKNecd/ryn4kdMx/xSFYUvlNi99L5eEcwM632SL0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762762895; c=relaxed/simple;
	bh=7Ea0YuyHYA9dTEYfiVo9lMrPqog+AiRIJf/Le+wgMC0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 References; b=e0qgoFynU+EAazbBpIjrnVNZWVstKgutFmdedK3yRXIfytEu91z9XNlvmFhcdgPUM+FwE4AAgTT4IfZfg49CeMGS52x9C4y6u5n3E+yR+GAFcgA89lcpiim6J8XF0/P1xHG1p/DApIS3fmcgfdiDX2hhyXyxmDKnL7t2GKAY42A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=bldIkpJ6; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="bldIkpJ6"
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20251110082130epoutp019c445c22a692d26b54d201a1c4f8ffec~2l4Jf8VTD1273712737epoutp01S
	for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Nov 2025 08:21:30 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20251110082130epoutp019c445c22a692d26b54d201a1c4f8ffec~2l4Jf8VTD1273712737epoutp01S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1762762890;
	bh=10lvkyEAKP3U4zoh+mMw8rbWMt16ibE7XkVa0SZC6/I=;
	h=From:To:Cc:Subject:Date:References:From;
	b=bldIkpJ6+qRJUrDUzv06nUDHuRYjtXoeCr2W69/ZSaiVTeE2TNeNLFQpjddMCBMgX
	 lLVAl3hl/mvmHkUBlNS1TuQh8dV6S/CRDqnJA3G/cHKSw6vf39H3yrWQOLuNBaLqB1
	 uPrvCKzGM64LHztZweO0EN3LHaGvPWuSAxjzFeNs=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPS id
	20251110082130epcas2p28e5f68bb84a8944300f540eca41f1e0c~2l4JLK48K3268132681epcas2p2H;
	Mon, 10 Nov 2025 08:21:30 +0000 (GMT)
Received: from epcas2p1.samsung.com (unknown [182.195.38.202]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4d4jLK4SRcz6B9mB; Mon, 10 Nov
	2025 08:21:29 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20251110082128epcas2p410405ffa61706c79f0bc2abe56393ba7~2l4H9ahxm0886908869epcas2p4T;
	Mon, 10 Nov 2025 08:21:28 +0000 (GMT)
Received: from perf.dsn.sec.samsung.com (unknown [10.229.95.91]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20251110082128epsmtip1d5acd47ade98a92fbb68ff55f5ed5e94~2l4H5puxx1760617606epsmtip1t;
	Mon, 10 Nov 2025 08:21:28 +0000 (GMT)
From: Youngmin Nam <youngmin.nam@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, alim.akhtar@samsung.com,
	linus.walleij@linaro.org, peter.griffin@linaro.org,
	semen.protsenko@linaro.org
Cc: ryu.real@samsung.com, d7271.choe@samsung.com,
	linux-samsung-soc@vger.kernel.org, Youngmin Nam <youngmin.nam@samsung.com>
Subject: [RFT PATCH v1 0/5] pinctrl: samsung: exynos9 cleanups and fixes
Date: Mon, 10 Nov 2025 17:26:44 +0900
Message-Id: <20251110082649.3109858-1-youngmin.nam@samsung.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20251110082128epcas2p410405ffa61706c79f0bc2abe56393ba7
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251110082128epcas2p410405ffa61706c79f0bc2abe56393ba7
References: <CGME20251110082128epcas2p410405ffa61706c79f0bc2abe56393ba7@epcas2p4.samsung.com>

This series tidies Exynos9-style pinctrl.
Unify macros, fix a few TRM mismatches, and clarify naming.

Several SoCs carried near-duplicate pin bank macro families, making tables
verbose and hard to share when only the bank type (alive/off) differs.

GS101 had its own helpers even though the newer EXYNOS9_* helpers cover the
same semantics, including per-bank filter control (FLTCON) offsets.

Some pin-bank tables didn’t match the SoC TRMs (bank type, EINT class, or
bank names), and FLTCON wasn’t always at a contiguous offset from EINT.

This series does
- Consolidate on EXYNOS9_* pin-bank macros. Pass bank_type explicitly.
- Fix table errors on Exynos2200/7885/8890/8895 per TRM.
- Add explicit per-bank FLTCON offsets and update affected tables.
- Drop GS101-specific macros in favor of EXYNOS9_*.
- Rename gs101_pinctrl_{suspend,resume} -> exynos9_pinctrl_{suspend,resume}.

I tested on Exynos850 through boot and verified the pin values as follows:

$:/sys/kernel/debug/pinctrl/139b0000.pinctrl-samsung-pinctrl# cat pins
registered pins: 42
pin 0 (gpg0-0) 0:gpg0  CON(0x0) DAT(0x0) PUD(0x1) DRV(0x2) CON_PDN(0x2) PUD_PDN(0x1)
pin 1 (gpg0-1) 1:gpg0  CON(0x0) DAT(0x0) PUD(0x1) DRV(0x2) CON_PDN(0x2) PUD_PDN(0x1)
...

Additional testing on the affected Exynos9-era platforms would be appreciated.

Youngmin Nam (5):
  pinctrl: samsung: Consolidate pin-bank macros under EXYNOS9_* and pass
    bank_type explicitly
  pinctrl: samsung: fix incorrect pin-bank entries on
    Exynos2200/7885/8890/8895
  pinctrl: samsung: add per-bank FLTCON offset to EXYNOS9_PIN_BANK_* and
    fix tables
  pinctrl: samsung: exynos: fold GS101 pin-bank macros into EXYNOS9_*
  pinctrl: samsung: rename gs101_pinctrl_* to exynos9_pinctrl_*

 .../pinctrl/samsung/pinctrl-exynos-arm64.c    | 1069 ++++++++---------
 drivers/pinctrl/samsung/pinctrl-exynos.c      |    4 +-
 drivers/pinctrl/samsung/pinctrl-exynos.h      |   93 +-
 drivers/pinctrl/samsung/pinctrl-samsung.h     |    4 +-
 4 files changed, 560 insertions(+), 610 deletions(-)

-- 
2.39.2

