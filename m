Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0C972D1F4A
	for <linux-samsung-soc@vger.kernel.org>; Mon, 25 Aug 2025 12:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756123674; cv=none; b=dIkOYEIpYAT5ml7Pgwzy+w5RmcFxC1BoCd+ATbigMRv8LXh4vyNPzG0LqEatgAck46Usmp8P+F/IxjWNQCmQ7Sn9RGAuzuiJu1RukMaT+HXdT0UOKRDYZE1poAn350MrbAPtt5pIh4ZPHF+PQ4/Ih4Z6kDdmfAs/qg64EIGOFPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756123674; c=relaxed/simple;
	bh=m9oTjZ7C8dnATQroPNEjk8bOwR1sXKUbfmI6z8BGwFs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:Content-Type:
	 References; b=UUoYwqo5j22ChDc/zi+Ceblw5j1IQab54ZSjceeRtbvKyu7nVpMLWNVtCEDxkN1oc5mlbUbk+4dO7lRGIRpvqxLkQizaKl7M7fQK1AiskdwjXCMXbIe7gZMkwPY/CyTmsOUigiq+vWuQfHMmvgdiTqAIGHPaqjBoIRqGjukIE5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=r4cGUTpo; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="r4cGUTpo"
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250825120749epoutp046e008da3aa803093f348e958d542254d~fASw5xF2U0996709967epoutp04j
	for <linux-samsung-soc@vger.kernel.org>; Mon, 25 Aug 2025 12:07:49 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250825120749epoutp046e008da3aa803093f348e958d542254d~fASw5xF2U0996709967epoutp04j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756123669;
	bh=AnmAPrcDCYbR1J1LfBH1PHR8aqxWFYZaUH5QmVjWvUc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=r4cGUTpoApKczt3GjXArsmCp4QaqUun1y7MmKSl/EybKKfiE0ZD8ec3wIvDMagerK
	 8aZk7cuX+LkLBO5R37+TS0vXI9Dn+n3ObPBcOiiKeM44XemlQjxvOreQQxpRbiX4pC
	 lWhdJIKZcBTPSt17Yssp3hb0ApBLVtG7oRwjY/zs=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250825120747epcas5p483e7f344784066315a172cdcf464e69b~fASvrZITq1478414784epcas5p4u;
	Mon, 25 Aug 2025 12:07:47 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.94]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4c9V0y6HNgz6B9m6; Mon, 25 Aug
	2025 12:07:46 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20250825120746epcas5p42d5fdba608b004e1f2c1c45eda5cac5f~fASuCju4O1478414784epcas5p4t;
	Mon, 25 Aug 2025 12:07:46 +0000 (GMT)
Received: from Jaguar.samsungds.net (unknown [107.109.115.6]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250825120741epsmtip24d882255f849d5c4b7962bcc0ff37751~fASphoe9a0172101721epsmtip28;
	Mon, 25 Aug 2025 12:07:41 +0000 (GMT)
From: Ravi Patel <ravi.patel@samsung.com>
To: jesper.nilsson@axis.com, mturquette@baylibre.com, sboyd@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, krzk@kernel.org,
	s.nawrocki@samsung.com, cw00.choi@samsung.com, alim.akhtar@samsung.com,
	linus.walleij@linaro.org, tomasz.figa@gmail.com, catalin.marinas@arm.com,
	will@kernel.org, arnd@arndb.de
Cc: ksk4725@coasia.com, kenkim@coasia.com, pjsin865@coasia.com,
	gwk1013@coasia.com, hgkim05@coasia.com, mingyoungbo@coasia.com,
	smn1196@coasia.com, pankaj.dubey@samsung.com, shradha.t@samsung.com,
	ravi.patel@samsung.com, inbaraj.e@samsung.com, swathi.ks@samsung.com,
	hrishikesh.d@samsung.com, dj76.yang@samsung.com, hypmean.kim@samsung.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@axis.com,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org, soc@lists.linux.dev
Subject: [PATCH v3 10/10] arm64: defconfig: Enable Axis ARTPEC SoC
Date: Mon, 25 Aug 2025 17:14:36 +0530
Message-Id: <20250825114436.46882-11-ravi.patel@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250825114436.46882-1-ravi.patel@samsung.com>
X-CMS-MailID: 20250825120746epcas5p42d5fdba608b004e1f2c1c45eda5cac5f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250825120746epcas5p42d5fdba608b004e1f2c1c45eda5cac5f
References: <20250825114436.46882-1-ravi.patel@samsung.com>
	<CGME20250825120746epcas5p42d5fdba608b004e1f2c1c45eda5cac5f@epcas5p4.samsung.com>
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

