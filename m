Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A127C3750CF
	for <linux-samsung-soc@vger.kernel.org>; Fri, 17 Apr 2026 11:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776427100; cv=none; b=eYu6Dxoax9u27TwWpI6+T6JG4LysIYjpE4+Nm45PXF3wE9sKeF1SV+ijJe2bSp68PTfOvKEk9/DVUSBtJ4TA5TY6i0aFzuSCYgMvZXftr7BUTKfvVlY3a4guGwQPfI814y9gMfAv1sWU7BeOXk755I/pemuYNRQiUuPePWS7eJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776427100; c=relaxed/simple;
	bh=AInRQBnQ/YZQeTI74gewBGmfDMTkKnIh/m+dn4GfF98=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 References; b=r3eb7b+tR+1pZZ7oEs9JBzwp6eYJL/MpDzXBZmjMasZRzYnBpDjYRPbjfl7dcuitA9yY0OrExkZwWA3T0kGjL4UnJjzoTya71WAzRqGwTsfaRMO5GZbvwlHDbZUUmKKTI+1DXjZLObepcUXDquddyEWlHfch0JT7VNCZRfjTyaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=ezjUUEt2; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="ezjUUEt2"
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20260417115816epoutp0270ef148202bdaebfd21621a4cd4f2c27~nIwgunZOx2137221372epoutp02W
	for <linux-samsung-soc@vger.kernel.org>; Fri, 17 Apr 2026 11:58:16 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20260417115816epoutp0270ef148202bdaebfd21621a4cd4f2c27~nIwgunZOx2137221372epoutp02W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1776427096;
	bh=iR31O3jFN8Z6FI7niZtsdXUfGMGP5z7RAKAyfUfD5rk=;
	h=From:To:Cc:Subject:Date:References:From;
	b=ezjUUEt2m1lOk0MuZjl3V4h4NUvidpa0yg768JwPJvEwqEw7O3uJfcv4Qy7GCyXoN
	 X6tdKAXAMILjz2Lpu3jx/jloPBVg2kbA8Lqj5o7JzIFHTfMmEz4FuYS2nvKTwKTJ++
	 Z8iuEQicJS2GVRfyRrBkGEuEbU6pg5hFwAC2SArQ=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20260417115815epcas5p37d35940fccf6778b79000a1e988e155c~nIwgQQozj2038220382epcas5p3U;
	Fri, 17 Apr 2026 11:58:15 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.90]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4fxtgV41d5z2SSKZ; Fri, 17 Apr
	2026 11:58:14 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20260417115813epcas5p40234b872c221ce28981b17e42ca48139~nIweg_REp1715017150epcas5p4X;
	Fri, 17 Apr 2026 11:58:13 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260417115809epsmtip220bab86acb93e11cdea6f4e8effbd76f~nIwa6WK8f0861308613epsmtip2S;
	Fri, 17 Apr 2026 11:58:09 +0000 (GMT)
From: Alim Akhtar <alim.akhtar@samsung.com>
To: avri.altman@wdc.com, bvanassche@acm.org, robh@kernel.org,
	martin.petersen@oracle.com, krzk+dt@kernel.org
Cc: sowon.na@samsung.com, peter.griffin@linaro.org,
	linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Alim Akhtar
	<alim.akhtar@samsung.com>
Subject: [PATCH v2 0/4] add ufs support for Exynosautov920 SoC
Date: Fri, 17 Apr 2026 17:44:48 +0530
Message-Id: <20260417121452.827054-1-alim.akhtar@samsung.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260417115813epcas5p40234b872c221ce28981b17e42ca48139
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260417115813epcas5p40234b872c221ce28981b17e42ca48139
References: <CGME20260417115813epcas5p40234b872c221ce28981b17e42ca48139@epcas5p4.samsung.com>

This series adds ufs driver support for ExynosAutov920,
ExynosAutov920 has the UFSHCI 3.1 compliant UFS controller.

ExynosAutov920 has a different mask of UFS sharability from ExynosAutov9,
so this series provide flexible parameter for the mask.

With this series applied, UFS is functional and basic I/O operations are 
known to be working.

Changes since v1:
* collected Acked-by on patch 2/4
	* This Acked-by from Krzysztof was long back, for now kept it 
* rebased on linux-next
* fixed few self review comments
* split dtsi patch into two, separated out syscon node patch

Link v1:
https://lore.kernel.org/linux-samsung-soc/20250702013316.2837427-1-sowon.na@samsung.com/

Alim Akhtar (1):
  arm64: dts: exynosautov920: Add syscon hsi2 node

Sowon Na (3):
  dt-bindings: ufs: exynos: add ExynosAutov920 compatible string
  scsi: ufs: exynos: add support for ExynosAutov920 SoC
  arm64: dts: exynosautov920: enable support for ufs controller

 .../bindings/ufs/samsung,exynos-ufs.yaml      |   1 +
 .../boot/dts/exynos/exynosautov920-sadk.dts   |   8 ++
 .../arm64/boot/dts/exynos/exynosautov920.dtsi |  27 +++++
 drivers/ufs/host/ufs-exynos.c                 | 110 ++++++++++++++++++
 4 files changed, 146 insertions(+)


base-commit: 452c3b1ea875276105ac90ba474f72b4cd9b77a2
-- 
2.34.1

