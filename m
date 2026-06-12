Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D05A1390CBA
	for <linux-samsung-soc@vger.kernel.org>; Fri, 12 Jun 2026 16:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781280715; cv=none; b=SXPINYn3dAmPi7hOwOK553u+U1+teBGN6msARXSVTZqhXxRkgGzoWiGSfkRXCivghTQLfNY52VAKuK2EAOscz1p98KCZKVpoWTVQdTGSpW22b6Eeleorw9y8t9JS64Wv1JqYPypJ7nLz0Acpc0GkM5uvkFurSKAlueMPNysbdwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781280715; c=relaxed/simple;
	bh=hqIZNEJ+ngwlZ761oj7BZgDyKDMxvbazfKsfFaHaPBQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=SUVeYd6nK9VSwiIk/C4fmbvfQshmNnUKb7zONhMBM7LluWCSw3dHNk03fxii4u6znxwZwsDqHh/MHLI+OknsuB+85+eAYiJ+AVKKkWsqwDdRsXYA1sh8jUkhXO49VCNoWyFM4rDnKZhg1pBIzXGWT5EwKhM2V167LLTufRMJ0s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=SsLYRTmM; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="SsLYRTmM"
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20260612161151epoutp04c6ea97c67265f709147bdd3a90b95521~4YV56NFQ_2799327993epoutp04M
	for <linux-samsung-soc@vger.kernel.org>; Fri, 12 Jun 2026 16:11:51 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20260612161151epoutp04c6ea97c67265f709147bdd3a90b95521~4YV56NFQ_2799327993epoutp04M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1781280711;
	bh=yaYCowk7JVZ5hc+4haO2BGnTeTwQ73DyggnqwLDb2as=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SsLYRTmMUTDiOWZonhICrLVWD4VceVyRQZuPWuhgv1ae+UdFgy8b8QLizPYnqImwN
	 mzZXbMP7w475RcRyc6qcEIJZ61bO1LQokwL3k6cJnAKgA5Hyps1YfbMq9oHWiUxDci
	 u9Pu/RtvM5yUDG85bfRjo2OwFonV72tRD8moROP0=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20260612161149epcas5p1f98f57d56cf872c97db48be3bd4f9fc1~4YV48nMGB1158811588epcas5p13;
	Fri, 12 Jun 2026 16:11:49 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.92]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4gcPfF2RnXz3hhT3; Fri, 12 Jun
	2026 16:11:49 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20260612161148epcas5p33904df90bd840d20a6db05622aaa28b8~4YV3Hzo0y1868818688epcas5p38;
	Fri, 12 Jun 2026 16:11:48 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260612161145epsmtip12f104651608bcf2fb1a3b7b036a8c368~4YV1DZASj0270302703epsmtip1l;
	Fri, 12 Jun 2026 16:11:45 +0000 (GMT)
From: Alim Akhtar <alim.akhtar@samsung.com>
To: krzk@kernel.org, peter.griffin@linaro.org, robh@kernel.org,
	conor+dt@kernel.org, linusw@kernel.org
Cc: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
	hajun.sung@samsung.com, Alim Akhtar <alim.akhtar@samsung.com>
Subject: [PATCH 5/5] MAINTAINERS: Add entry for Samsung Exynos8855 SoC
Date: Fri, 12 Jun 2026 22:00:20 +0530
Message-Id: <20260612163020.411761-6-alim.akhtar@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260612163020.411761-1-alim.akhtar@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260612161148epcas5p33904df90bd840d20a6db05622aaa28b8
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260612161148epcas5p33904df90bd840d20a6db05622aaa28b8
References: <20260612163020.411761-1-alim.akhtar@samsung.com>
	<CGME20260612161148epcas5p33904df90bd840d20a6db05622aaa28b8@epcas5p3.samsung.com>

Add maintainers entry for the Samsung Exynos8855 SoC based platforms

Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 49a10f0ceb07..fb9b24220258 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23914,6 +23914,13 @@ F:	arch/arm64/boot/dts/exynos/exynos850*
 F:	drivers/clk/samsung/clk-exynos850.c
 F:	include/dt-bindings/clock/exynos850.h
 
+SAMSUNG EXYNOS8855 SoC SUPPORT
+M:	Alim Akhtar <alim.akhtar@samsung.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+L:	linux-samsung-soc@vger.kernel.org
+S:	Maintained
+F:	arch/arm64/boot/dts/exynos/exynos8855*
+
 SAMSUNG EXYNOS ACPM MAILBOX PROTOCOL
 M:	Tudor Ambarus <tudor.ambarus@linaro.org>
 L:	linux-kernel@vger.kernel.org
-- 
2.34.1

