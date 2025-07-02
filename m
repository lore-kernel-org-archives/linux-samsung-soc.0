Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77DFC17736
	for <linux-samsung-soc@vger.kernel.org>; Wed,  2 Jul 2025 01:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751420017; cv=none; b=Ijcid86k03bug1CA+q8iZthwdTBeHELIvP8zqum8416y2P9A7ZRDMRCmvGXA8idEZE6fxLxDpqrSAwT19TBp7TzLsA+IQlqom+Aj1FUpotiupUePLXSubL3S2kKnVhqs+4g4spn2xtBEFPPuo/I85yDBvnqrjs7fK2fg+OhdeSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751420017; c=relaxed/simple;
	bh=AF7omRMZRLd5scwxtbkEuD3UqDHzNIQwcvhUKNY2VNc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 References; b=nS8MuMX6s3S0+dV5CrhStkcjKTltpB5c2beB2z3KAEUxuvcYn9ZQ7s9FTk2dP9qJ6QLt139sCCNYtPonZQRAMdtmrPkht7c9AxzuisXDgMhoPyuC66XmbxCB8KKUdu7eVx6R0PAJZHJa0X8mmrXvdzO5E/ptkTJ/Rxtwhxfod9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=PRfDgnPy; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="PRfDgnPy"
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250702013333epoutp028e85a22de30179109017f91760f3cca0~OSzkW-ktY1593815938epoutp029
	for <linux-samsung-soc@vger.kernel.org>; Wed,  2 Jul 2025 01:33:33 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250702013333epoutp028e85a22de30179109017f91760f3cca0~OSzkW-ktY1593815938epoutp029
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1751420013;
	bh=dAX8Jb9Bx+UN5wIdbfjnE5hKdAw3VOpDOA4U8IQYlBI=;
	h=From:To:Cc:Subject:Date:References:From;
	b=PRfDgnPyY4I9kSSdor01uODZ7ueKTFGvqgLtw7hJEFRYdrQAhINsIZbz7YIHn1FLh
	 wg5S49awn2ML+73blddTQNc8jDvrbkWO+h4SPwRVnm4h8URx4+il286thHv6vHnz9B
	 3nc9Ohjl9mH6rsmxFQbEQj6nkNFaC3O77zzfZ1Uw=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPS id
	20250702013333epcas2p4d73d892c396c3c464258c92b92a2432f~OSzkC46nl0722207222epcas2p4S;
	Wed,  2 Jul 2025 01:33:33 +0000 (GMT)
Received: from epcas2p2.samsung.com (unknown [182.195.36.91]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4bX2V44mcBz3hhTB; Wed,  2 Jul
	2025 01:33:32 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
	20250702013332epcas2p168d0293f0b7385b0cca88c649fe9c813~OSzi8Bsvt0051400514epcas2p18;
	Wed,  2 Jul 2025 01:33:32 +0000 (GMT)
Received: from asswp146.dsn.sec.samsung.com (unknown [10.229.19.146]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250702013332epsmtip26c988295d5b5383a3cbcc5159d45b2e9~OSzi2IFUf2822028220epsmtip2i;
	Wed,  2 Jul 2025 01:33:32 +0000 (GMT)
From: Sowon Na <sowon.na@samsung.com>
To: robh@kernel.org, krzk@kernel.org, conor+dt@kernel.org, vkoul@kernel.org,
	alim.akhtar@samsung.com, kishon@kernel.org
Cc: krzk+dt@kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	sowon.na@samsung.com
Subject: [PATCH 0/5] ufs-exynos support for ExynosAutov920
Date: Wed,  2 Jul 2025 10:33:06 +0900
Message-ID: <20250702013316.2837427-1-sowon.na@samsung.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250702013332epcas2p168d0293f0b7385b0cca88c649fe9c813
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250702013332epcas2p168d0293f0b7385b0cca88c649fe9c813
References: <CGME20250702013332epcas2p168d0293f0b7385b0cca88c649fe9c813@epcas2p1.samsung.com>

Hi,

This series adds support to the ufs-exynos driver for ExynosAutov920,
Samsung Automotive SoC series.
ExynosAutov920 has the UFSHCI 3.1 compliant UFS controller.

ExynosAutov920 has a different mask of UFS sharability from ExynosAutov9,
so this series provide flexible parameter for the mask.

With this series applied, UFS is functional. The Samsung KLUDG4UHYB is
tested for enumeration and I/O.

Sowon Na (5):
  phy: samsung-ufs: update calibration settings for EVT2
  dt-bindings: ufs: exynos: add ExynosAutov920 compatible string
  dt-bindings: soc: samsung: exynos-sysreg: add hsi2 for ExynosAutov920
  scsi: ufs: exynos: add support for ExynosAutov920 SoC
  arm64: dts: exynosautov920: enable support for ufs device

 .../soc/samsung/samsung,exynos-sysreg.yaml    |   1 +
 .../bindings/ufs/samsung,exynos-ufs.yaml      |   1 +
 .../boot/dts/exynos/exynosautov920-sadk.dts   |  17 +++
 .../arm64/boot/dts/exynos/exynosautov920.dtsi |  27 ++++
 drivers/phy/samsung/phy-exynosautov920-ufs.c  |  39 ++----
 drivers/phy/samsung/phy-samsung-ufs.h         |   1 -
 drivers/ufs/host/ufs-exynos.c                 | 130 ++++++++++++++++--
 7 files changed, 180 insertions(+), 36 deletions(-)

-- 
2.45.2

