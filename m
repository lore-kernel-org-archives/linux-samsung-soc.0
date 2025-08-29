Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A52D71EE7DD
	for <linux-samsung-soc@vger.kernel.org>; Fri, 29 Aug 2025 13:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756475824; cv=none; b=Vp5hWr34KaPJh2lBkVkTomRze20JnBNGthowFmguHXKX7LIQ8bmSL1m3c+T2hXCotYbLhL10AJC3rSVZf2FiI9Yro9IWh2YxODx+6zZAsWcCrNsXJpmOEBpNEavcoup1YKt1bzDcL8Sz7Z6rtDNUML0AVokQcRjC7NsICFTovwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756475824; c=relaxed/simple;
	bh=Ef1NuRo2w2WdhPk8MN+4gOvRdA3R3v+pDc3iILF8sqM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 References; b=dIZ7VdCnSVg2gkRgtTyedfZVpzTbwVSbuYKLCIZq0WqdWQTsNQrvMYi+8oCoXTZUNc5eska4j3hT6opNw/jXey2bUHeOrNPPZyZKTwJM2JYCYNNsJkL+ulClF9i7PldH1G7kIQLbRWnrl1+cUVfLyAFiUQSfRt0zyEjNiMxp9RI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=XhQnqRZ2; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="XhQnqRZ2"
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250829135700epoutp0189395446d8d752998efe1275bcb00f47~gQXPg8xL40185101851epoutp01J
	for <linux-samsung-soc@vger.kernel.org>; Fri, 29 Aug 2025 13:57:00 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250829135700epoutp0189395446d8d752998efe1275bcb00f47~gQXPg8xL40185101851epoutp01J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756475820;
	bh=P/PSg7LV+0qqtsWnBqc+ufwU9SbD3VXOH9HxTbYXVdA=;
	h=From:To:Cc:Subject:Date:References:From;
	b=XhQnqRZ20aj3IeB4CADNg0A9R9TWeCz4W+QlskSMqapwucLEj1+gQsR0VVBypvJHy
	 Ckk9k27vHy/5OyQZx5dgMViAR0lhnZCW6DVIUQianAjNZdlMgwz/YRNTEH30X/NCpX
	 FrYm5Tbm5vb20s8Xfis0S9A9Ifppae84x2nuKaoc=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250829135659epcas5p45f243a9e12d857393ecd714dc6c5d133~gQXOyXHGE1269312693epcas5p4C;
	Fri, 29 Aug 2025 13:56:59 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.94]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4cD0F66JMtz6B9m8; Fri, 29 Aug
	2025 13:56:58 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250829135658epcas5p24bb23c6fef2092aa7397faa10e0d9228~gQXNRLo_I3096430964epcas5p2d;
	Fri, 29 Aug 2025 13:56:58 +0000 (GMT)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250829135656epsmtip2c943b2ae8c7c97158101f6967f651497~gQXLjQJAl0722807228epsmtip2Z;
	Fri, 29 Aug 2025 13:56:56 +0000 (GMT)
From: Varada Pavani <v.pavani@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	alim.akhtar@samsung.com, mturquette@baylibre.com, sboyd@kernel.org,
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: aswani.reddy@samsung.com, gost.dev@samsung.com, Varada Pavani
	<v.pavani@samsung.com>
Subject: [PATCH 0/2] dt-bindings: watchdog: Add support for FSD SoC watchdog
Date: Fri, 29 Aug 2025 19:26:41 +0530
Message-ID: <20250829135643.105406-1-v.pavani@samsung.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250829135658epcas5p24bb23c6fef2092aa7397faa10e0d9228
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250829135658epcas5p24bb23c6fef2092aa7397faa10e0d9228
References: <CGME20250829135658epcas5p24bb23c6fef2092aa7397faa10e0d9228@epcas5p2.samsung.com>

The FSD SoC features 3 CPU clusters, each with its own Watchdog Timer (WDT) instance.
The DT-binding and device data is updated to reflect the cluster index and clock configurations as per the HW user manual.

Varada Pavani (2):
  dt-bindings: watchdog: Modify tesla fsd bindings
  arm64: dts: fsd: Fix Clock handle for WDT

 .../bindings/watchdog/samsung-wdt.yaml        |  9 ++++---
 arch/arm64/boot/dts/tesla/fsd.dtsi            | 24 ++++++++++++-------
 2 files changed, 19 insertions(+), 14 deletions(-)

-- 
2.49.0

