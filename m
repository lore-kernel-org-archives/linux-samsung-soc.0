Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AC1C2566F7
	for <linux-samsung-soc@vger.kernel.org>; Mon,  1 Sep 2025 05:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756705390; cv=none; b=To3bMovZy5dgbSvsjgBSgPQ9TE0OcruePP1uxaBp56L4jM93cGe06TRuziLNScAb3SqR9pvfKgAwZ6K3MhiQukBMVS0do4TJRxvFKX66hGOsRbM0DOcKoAKN7fQUNqKe4+uQPr5DGU2J+Fx6xHihd7REMf5E6tn3yMDf1zRZ528=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756705390; c=relaxed/simple;
	bh=m9oTjZ7C8dnATQroPNEjk8bOwR1sXKUbfmI6z8BGwFs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:Content-Type:
	 References; b=l5DTs+whGpdRZhdk4kpwxlVtEPABkMbvOKYrrDwKxscwWheBYP9yzLp5qgDh1YnqXZnvfS43U4+lv1JiY8C6otPmh4zYvFnOHkStIiyiULkxz0dZt0P/WMS14MI+BIYAMque08G7IEJm1TwBJYO0SMK+LU+93nl6207Zwi3KtAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=II5Cequg; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="II5Cequg"
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250901054306epoutp027d51be395eefd2cdbdbeef0ef732ef74~hEj3hU_Wy2006620066epoutp02o
	for <linux-samsung-soc@vger.kernel.org>; Mon,  1 Sep 2025 05:43:06 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250901054306epoutp027d51be395eefd2cdbdbeef0ef732ef74~hEj3hU_Wy2006620066epoutp02o
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756705386;
	bh=AnmAPrcDCYbR1J1LfBH1PHR8aqxWFYZaUH5QmVjWvUc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=II5Cequgt6q9CtOhYCIb3N+bn9QdzOGomIY/0+Cb9GThx2JqCaKIri702R0rLA0nz
	 Hy1f2ZMTxeu2y74p0/j6RBwq3wSs4v61oHYvgyuca4K306G30wSgtfz9FL710NsrfD
	 H+QDmCj+AwTMIb2fU8dyKX6XVq/VxzyWeXZm7OQo=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20250901054305epcas5p3486a5537dd8999135776b1141f184bd5~hEj2klCpO1883718837epcas5p3u;
	Mon,  1 Sep 2025 05:43:05 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.92]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4cFd7r44bQz6B9m9; Mon,  1 Sep
	2025 05:43:04 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250901054303epcas5p3d8079b7806d995bfaf3004cbb4f95e41~hEj08CsBi1883718837epcas5p3o;
	Mon,  1 Sep 2025 05:43:03 +0000 (GMT)
Received: from Jaguar.samsungds.net (unknown [107.109.115.6]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250901054259epsmtip210578938dcab54c7343fe60c0383dde6~hEjww4qJX0605106051epsmtip2W;
	Mon,  1 Sep 2025 05:42:59 +0000 (GMT)
From: Ravi Patel <ravi.patel@samsung.com>
To: jesper.nilsson@axis.com, mturquette@baylibre.com, sboyd@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, krzk@kernel.org,
	s.nawrocki@samsung.com, cw00.choi@samsung.com, alim.akhtar@samsung.com,
	linus.walleij@linaro.org, tomasz.figa@gmail.com, catalin.marinas@arm.com,
	will@kernel.org, arnd@arndb.de
Cc: ksk4725@coasia.com, kenkim@coasia.com, pjsin865@coasia.com,
	gwk1013@coasia.com, hgkim05@coasia.com, mingyoungbo@coasia.com,
	smn1196@coasia.com, shradha.t@samsung.com, ravi.patel@samsung.com,
	inbaraj.e@samsung.com, swathi.ks@samsung.com, hrishikesh.d@samsung.com,
	dj76.yang@samsung.com, hypmean.kim@samsung.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@axis.com,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: [PATCH v4 6/6] arm64: defconfig: Enable Axis ARTPEC SoC
Date: Mon,  1 Sep 2025 10:49:26 +0530
Message-Id: <20250901051926.59970-7-ravi.patel@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250901051926.59970-1-ravi.patel@samsung.com>
X-CMS-MailID: 20250901054303epcas5p3d8079b7806d995bfaf3004cbb4f95e41
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250901054303epcas5p3d8079b7806d995bfaf3004cbb4f95e41
References: <20250901051926.59970-1-ravi.patel@samsung.com>
	<CGME20250901054303epcas5p3d8079b7806d995bfaf3004cbb4f95e41@epcas5p3.samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>

From: SungMin Park <smn1196@coasia.com>

Enable the Axis ARTPEC-8 SoC in arm64 defconfig.

Signed-off-by: SungMin Park <smn1196@coasia.com>
Signed-off-by: Ravi Patel <ravi.patel@samsung.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 58f87d09366c..6660d3ee6f99 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -38,6 +38,7 @@ CONFIG_ARCH_AIROHA=y
 CONFIG_ARCH_SUNXI=y
 CONFIG_ARCH_ALPINE=y
 CONFIG_ARCH_APPLE=y
+CONFIG_ARCH_ARTPEC=y
 CONFIG_ARCH_AXIADO=y
 CONFIG_ARCH_BCM=y
 CONFIG_ARCH_BCM2835=y
-- 
2.49.0

