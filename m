Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793346817;
	b=Q9q9+BSngkhXoSz+2igRxrdus0jlgBwDTL0Fw9kvSVACe4/mCG9xZaVF0JGG1aAKj2WC
	 hS/lqKyJrkJEwdud95DL/LUdYE9UAm7yInTEoEo7VfKP0GtfLzFNWO3kfsVQ28ea8cI5t
	 lDQahd8gdAIP/M7sQzngCthO+TYrfhLvZopkdLqqEckA4c29VgKPFrulEjiTgahutI7Yr
	 hCEJy49bZlC0glSyd4z6rO7Fgyo3CCpLX9SEOyE4D6eb/7PxfS9Ka1XudRVytoi/E2Qzl
	 MowLWK8frQ47syBWudWIBBQKzA1VQQgkJFsLAyOmWCSh55pOW0ortH6n/a/mUyEoHEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793346817;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-CMS-MailID:X-Msg-Generator:Content-Type:
	 X-RootMTR:X-EPHeader:X-CMS-RootMailID:References;
	bh=zWdTOaLSFbgjXbA4YqXHKurOnWycAqU6MfmvJJox40k=;
	b=u985UNvnP2glhmh8vtdqXFr9R1UgrqgLEweYm6PEY2YQrMkowfXvcI/DT5kqL5s2woPU
	 OKZfHlrAy+lonZldfVfGDamghhx97x/uIacPX/jV7Irdc1cYr3pjfGl7N7SGDJmoco2St
	 +HAXc5TMdS1rJ1aFkhCaeMFTqcBMJ3+GsIMcsINYd/gvHCzezi9SprhB1z2ypOV2kv1Sv
	 wc8hT1f8ggo3d0jEyhZ3BTmU7Ih58BnsKgkKHQuSSpEcRXBs42r8YIwlDU4z3npWhNS3L
	 FW8tysTEIe0ypt+PJfVBTqpbDzxUAsMJqcgHYrGj4S48ycyPTxRncmCRoslhr2EP1wA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=oHUz8VNT;
	arc=none smtp.remote-ip=210.118.77.11
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44093606A31E
	for <linux-samsung-soc@vger.kernel.org>; Fri, 30 Oct 2026 07:53:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44093606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=oHUz8VNT
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20261030075333euoutp01e0980cdb430f8fce5436bdaf45da0bb2~jP2zF38620215602156euoutp01n
	for <linux-samsung-soc@vger.kernel.org>; Fri, 30 Oct 2026 07:53:33 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20261030075333euoutp01e0980cdb430f8fce5436bdaf45da0bb2~jP2zF38620215602156euoutp01n
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793346813;
	bh=zWdTOaLSFbgjXbA4YqXHKurOnWycAqU6MfmvJJox40k=;
	h=From:To:Cc:Subject:Date:References:From;
	b=oHUz8VNT6qVte98OCe2vlbCzYcrkBpiGxyuZJA718vyh9uiKHPmEPPDWrPBaVC9CN
	 Y6kMmNjYr0och6CpH5uo/OKIlvjP5aaoVtTqDLdppXiJzohHt8q28MnTRxfh+EAAB2
	 jUXihL3N6AQlUkyFqRYDg+EnM9rz0PuYrh0kWf0U=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20261030075332eucas1p16331988bd7df20db9538066a613a42f2~jP2ytTOMr3249332493eucas1p1d;
	Fri, 30 Oct 2026 07:53:32 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261030075332eusmtip2166041f016f1c2f6009dab75eb4bb9b4~jP2yIhYnT3096130961eusmtip27;
	Fri, 30 Oct 2026 07:53:31 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Krzysztof Kozlowski
	<krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi
	<cw00.choi@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, Alim
	Akhtar <alim.akhtar@samsung.com>, Stephen Boyd <sboyd@kernel.org>, Brian
	Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>,
	Henrik Grimler <henrik@grimler.se>
Subject: [PATCH v3 0/3] clk: samsung: fix probe-ordering races in
 exynos5-subcmu
Date: Fri, 30 Oct 2026 08:53:13 +0100
Message-ID: <20261030075325.517182-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20261030075332eucas1p16331988bd7df20db9538066a613a42f2
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261030075332eucas1p16331988bd7df20db9538066a613a42f2
X-EPHeader: CA
X-CMS-RootMailID: 20261030075332eucas1p16331988bd7df20db9538066a613a42f2
References: <CGME20261030075332eucas1p16331988bd7df20db9538066a613a42f2@eucas1p1.samsung.com>

This series fixes a group of related issues around power-domain
availability and probe ordering on Exynos5 platforms (observed on
Exynos5800, e.g. Odroid XU3/XU4), which can leave clock muxes stuck on
the oscillator instead of their intended PLL parent.

The issue was analyzed and patches were prepared with LLM assistance.
The whole patchset was tested on the real Odroid XU3, XU4 and Chromebook
Peach-Pit and Peach-Pi boards.

Best regards
Marek Szyprowski, PhD
Samsung R&D Institute Poland


Changelog:

v3:
- instead of removing more __init annotations, simply fail driver probe after
  the init sections have been freed; this should not happen anyway

v2: https://lore.kernel.org/all/20261029125118.3191455-1-m.szyprowski@samsung.com/
- added exynos-audss-clk driver fix, as the exynos5-subcmu change exposed
  an issue in it
- removed __init annotations in exynos5-subcmu to make the driver deferred
  probe safe
- grouped all patches into one patchset

v1:
https://lore.kernel.org/all/20261015115008.600082-1-m.szyprowski@samsung.com/
https://lore.kernel.org/all/20261013111840.3645724-1-m.szyprowski@samsung.com/


Patch summary:

Marek Szyprowski (3):
  clk: samsung: exynos-audss: Propagate -EPROBE_DEFER from input clocks
  clk: samsung: exynos5-subcmu: Use pm_runtime_get_sync() during probe
  clk: samsung: exynos5-subcmu: Defer probe until power domains are
    available

 drivers/clk/samsung/clk-exynos-audss.c   | 33 +++++++++++++++++-------
 drivers/clk/samsung/clk-exynos5-subcmu.c | 27 ++++++++++++++++---
 2 files changed, 47 insertions(+), 13 deletions(-)

-- 
2.43.0

