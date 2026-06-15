Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05BAD3939BF
	for <linux-samsung-soc@vger.kernel.org>; Mon, 15 Jun 2026 08:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781512463; cv=none; b=qYOaSgy8d4TwKe3Z7ee/+VmpK2mILrK4GpzBYgbg1aAmcPkswKjINSNcFYRj995QkSE8Q0ikbdSjJZe8GleC/O1Aiayegt/Ji6VaZp3iBBcOXyUZGzip/IR/E9AZt8ZAzngIehw1HHbMFTNWIBL8sVSeMMElutBBcObuekhVudQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781512463; c=relaxed/simple;
	bh=B85cMPOr49iZ1u4+mhMX5r28Vr9uQa+N5lyLQI6PLjU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 References; b=DQbfkZtgCMt9qCm4ICcJG7rN+WButCfkov5cQiULjdioA7TBVDd9KG73lW/3JiNpVdIz/gNYofydOod31rQAEC85Z70wK7THwLzpibEL4ovk0/9EQ4+vFxbzv+dvJVnidlMir/QvRq98I3s8JN3WrehOQgMeSCh87H+18Y2qQWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=XqJoLJhD; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="XqJoLJhD"
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20260615083412epoutp023306949f9db0605e1bdbbe3c0fb499d5~5NCMEL4Rc1918719187epoutp029
	for <linux-samsung-soc@vger.kernel.org>; Mon, 15 Jun 2026 08:34:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20260615083412epoutp023306949f9db0605e1bdbbe3c0fb499d5~5NCMEL4Rc1918719187epoutp029
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1781512452;
	bh=KhuMmUqphIgaaYpgdXDk7UgsJLLox2AR9vG8/O3XcIo=;
	h=From:To:Cc:Subject:Date:References:From;
	b=XqJoLJhDknqHNRQoxcO4cBtnqVX0xue4seMl7LGkXlPCuJp1bX6D00CZjvZRik4Ei
	 KJOOWRof5OVoAYspgPycdwJ93TE0SdZZQqoJXQbfF6mRVK5RNhtCEAPJfXgcvEJxjl
	 nwkwXeRE5nMto5ODNUeLTP1Lp9Xerxr0nY+9YD8g=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20260615083411epcas5p134cd104d32ea19b3d8fdc1c46732225c~5NCLeco3l2849128491epcas5p1W;
	Mon, 15 Jun 2026 08:34:11 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.86]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4gf3Lp731sz6B9m7; Mon, 15 Jun
	2026 08:34:10 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20260615083410epcas5p162d288f0bb2431bdd3653011d7a72688~5NCKJndSz1417414174epcas5p18;
	Mon, 15 Jun 2026 08:34:10 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260615083408epsmtip17cc8b873406b8d5dd19aaedf37ea0d44~5NCIjrR770235602356epsmtip1c;
	Mon, 15 Jun 2026 08:34:08 +0000 (GMT)
From: Alim Akhtar <alim.akhtar@samsung.com>
To: krzk@kernel.org, peter.griffin@linaro.org, robh@kernel.org,
	conor+dt@kernel.org, linusw@kernel.org
Cc: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
	hajun.sung@samsung.com, Alim Akhtar <alim.akhtar@samsung.com>
Subject: [PATCH v2 0/5] Add minimal Exynos8855 SoC support
Date: Mon, 15 Jun 2026 14:22:47 +0530
Message-Id: <20260615085252.1964423-1-alim.akhtar@samsung.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260615083410epcas5p162d288f0bb2431bdd3653011d7a72688
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260615083410epcas5p162d288f0bb2431bdd3653011d7a72688
References: <CGME20260615083410epcas5p162d288f0bb2431bdd3653011d7a72688@epcas5p1.samsung.com>

This series adds initial support for the Exynos8855 SoC and also
initial SMDK board support. 

Exynos8855 is octa-core CPUs, a combination of Cortex-A720 and Cortex-A520,
arranged in 3 clusters. And other peripheral for mobile application.

This initial support consists of CPUs, pinctrl and related nodes
needed for initial kernel boot.

With these patches, kernel can boot using initramfs till file system mounts.

More platform support will be added in near future, clock driver to go next.

Chanegs since v1:
* Fixed some of the review comments by Sashiko [1]
* Dropped serial node, will be added once clock support is available
* Dropped wkup interrupt for CMGP block, will be added later

Link of v1:
https://lore.kernel.org/linux-samsung-soc/20260612163020.411761-1-alim.akhtar@samsung.com/

[1] https://sashiko.dev/#/patchset/20260612163020.411761-1-alim.akhtar@samsung.com?part=4

Alim Akhtar (5):
  dt-binding: ARM: samsung: Add Samsung Exynos8855
  dt-binding: pinctrl: samsung: Add exynos8855-pinctrl compatible
  pinctrl: samsung: Add Exynos8855 pinctrl configuration
  arm64: dts: exynos: add initial support for Samsung Exynos8855 smdk
  MAINTAINERS: Add entry for Samsung Exynos8855 SoC

 .../bindings/arm/samsung/samsung-boards.yaml  |   6 +
 .../bindings/pinctrl/samsung,pinctrl.yaml     |   1 +
 MAINTAINERS                                   |   7 +
 arch/arm64/boot/dts/exynos/Makefile           |   1 +
 .../boot/dts/exynos/exynos8855-pinctrl.dtsi   | 581 ++++++++++++++++++
 .../arm64/boot/dts/exynos/exynos8855-smdk.dts |  32 +
 arch/arm64/boot/dts/exynos/exynos8855.dtsi    | 199 ++++++
 .../pinctrl/samsung/pinctrl-exynos-arm64.c    | 123 ++++
 drivers/pinctrl/samsung/pinctrl-samsung.c     |   2 +
 drivers/pinctrl/samsung/pinctrl-samsung.h     |   1 +
 10 files changed, 953 insertions(+)
 create mode 100644 arch/arm64/boot/dts/exynos/exynos8855-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/exynos/exynos8855-smdk.dts
 create mode 100644 arch/arm64/boot/dts/exynos/exynos8855.dtsi


base-commit: b99ae45861eccff1e1d8c7b05a13650be805d437
-- 
2.34.1

