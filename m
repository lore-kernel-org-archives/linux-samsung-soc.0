Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD6A5321F27
	for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Nov 2025 08:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763369517; cv=none; b=ZEURYXQu/TUzp33qGbw+AXx3lAZwGad4rhZw1w8brA3/lscXOrLUDdABG5JnFom5dh3D5Z/lciusMnsi8Aba8j5x03lNjts6mCgOdkgdsOwX+HBohu19f7vdQobnEd8kSclQiFywVOy2RGcaDtXb/neEbOgkLTe01PHrMukxvmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763369517; c=relaxed/simple;
	bh=EuiU0uzsHX+9CO/LGpiG3YMXfi+IgosH9tPwyvVPdg0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=GuV4GQE0JXn4vr29JUodSQjMB2NyDMxrxF5/K1+UasHMf2aM4ZYtYQdHk2SBvmDdNg87Ts6VS9poF8VFOxDYoOGeQ/pn9AGzbexQr2NAgMTtpY6gxUc6FWVj6cLIVZTO/YYWcL5NNj8HnZiZENa8gPgkXLivezXcE+28+UTnETo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=hhZLtEDa; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="hhZLtEDa"
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20251117085153epoutp03f036f019eb198ce8870d783312a292a2~4vzrlRPuO0174201742epoutp03P
	for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Nov 2025 08:51:53 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20251117085153epoutp03f036f019eb198ce8870d783312a292a2~4vzrlRPuO0174201742epoutp03P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1763369513;
	bh=OfzFzVa+Wy5rbSJqdomqofX4xGrzoour6BEhawfdOUA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hhZLtEDacm/+WBfpBmfHZqP2q1FrHhGVtJ7IVQLiWpGqhzRMb+SJKeytuQbQ9GDJh
	 1UI8j26loRxe1AOzeYMzMvFxjqrNmpQ2gPA600SCXumyIv6WbVRvpVlD9/klH2nlAo
	 mMSO2p/6XNVOWvI+usIwfveUXidH3SszQhVI6imU=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPS id
	20251117085153epcas2p471783ca8e155c8cfc973c53712e541da~4vzrGc5bW0944209442epcas2p4i;
	Mon, 17 Nov 2025 08:51:53 +0000 (GMT)
Received: from epcas2p1.samsung.com (unknown [182.195.38.205]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4d91h86KWfz3hhTF; Mon, 17 Nov
	2025 08:51:52 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
	20251117085152epcas2p28df73e111ad216fc8356baad51864797~4vzqGEK5r1509715097epcas2p2Q;
	Mon, 17 Nov 2025 08:51:52 +0000 (GMT)
Received: from asswp146.dsn.sec.samsung.com (unknown [10.229.19.146]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20251117085152epsmtip1fd8ad765927667115c051255f099eab6~4vzp-yP2_0663206632epsmtip11;
	Mon, 17 Nov 2025 08:51:52 +0000 (GMT)
From: Sanghoon Bae <sh86.bae@samsung.com>
To: robh@kernel.org, krzk@kernel.org, conor+dt@kernel.org, vkoul@kernel.org,
	alim.akhtar@samsung.com, kishon@kernel.org
Cc: krzk+dt@kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	sowon.na@samsung.com, Sanghoon Bae <sh86.bae@samsung.com>
Subject: [PATCH 0/1] Add ExynosAutov920 hsi0 support to exynos-sysreg
Date: Mon, 17 Nov 2025 17:51:34 +0900
Message-ID: <20251117085134.289371-3-sh86.bae@samsung.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251117085134.289371-1-sh86.bae@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20251117085152epcas2p28df73e111ad216fc8356baad51864797
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251117085152epcas2p28df73e111ad216fc8356baad51864797
References: <20251117085134.289371-1-sh86.bae@samsung.com>
	<CGME20251117085152epcas2p28df73e111ad216fc8356baad51864797@epcas2p2.samsung.com>

The ExynosAutov920 SoC includes a PCIe IP and a hsi0 register block that
is mapped in the exynos-sysreg.

To manage PCIe PHY power, configure the PCIe PLL, and set the device direction,
the hsi0 registers need to be defined in exynos-sysreg.

This patch must be applied before the ExynosAutov920 PCIe PHY is enabled.

Sanghoon Bae (1):
  dt-bindings: soc: samsung: exynos-sysreg: add hsi0 for ExynosAutov920

 .../devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml   | 1 +
 1 file changed, 1 insertion(+)

-- 
2.45.2

