Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF5C1531E8
	for <linux-samsung-soc@vger.kernel.org>; Thu, 12 Feb 2026 08:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770884206; cv=none; b=hb4c9R8J3LhF6tok+jvp70Bfn0ltzrR+lFDUmkztCSgcjev5n14k+zJf22evuTglwaEy4UgTXmuKbV5oaApejblU2paScP3JkQ3P3sZtlovwfZUwHGaqW5/pP3IykAlSGcBu8xjyUYQW1yTnv0xDXDyPzSnEauudHTgSLDk4la0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770884206; c=relaxed/simple;
	bh=v/5qMrdIXjRmEOGy1fxpbfXdM8SXsCe8TcNwkmpAdT0=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=qnpH93LQsa/OqKR+g67MI0b/iR8GbY9k3P1OW91WGA6EbL/bOW/0Alpy9U+jNDsjCjdm/1H1B3brawV5B3KrZCPP4k7eeRwnJHME+3sC/LGcB9H5qQQJ2HCYLaDZKj/Nhlvkj+b2AfHQakK8SP852EqLTer3SVsg2Mai+Vhg0sA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=KyIhY3oK; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="KyIhY3oK"
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20260212081642epoutp037d7a1b709e074483c4c652a3cc21f841~TcczRKfU60637806378epoutp03j
	for <linux-samsung-soc@vger.kernel.org>; Thu, 12 Feb 2026 08:16:42 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20260212081642epoutp037d7a1b709e074483c4c652a3cc21f841~TcczRKfU60637806378epoutp03j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1770884203;
	bh=fYXLMUq51ld2S/ccOGRxNiqqyw4cWbXp17P8AE98wuM=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=KyIhY3oKGhmqh6YT15Bd+37kr9x243c0YtJKPHmHkBRNCgNyFp5E2ciTJczDwzSsd
	 iyXXpASMrnz+G1vwWk4h3dRocTKnSZpzib0hyhiO04ni9OIGPBmr3ZCtoejh0oC4NL
	 e6+qroj+K65Kx8PIVakpsOZ6drSrN2pNtajKRfZk=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPS id
	20260212081642epcas2p14f5b709689d0447523bed621d50b7443~TccymksnI1103211032epcas2p1J;
	Thu, 12 Feb 2026 08:16:42 +0000 (GMT)
Received: from epcas2p3.samsung.com (unknown [182.195.38.205]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4fBSnP5hPLz3hhT4; Thu, 12 Feb
	2026 08:16:41 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
	20260212081641epcas2p18a5bad8edf23c5a35c1562245ee2224f~TccxhWPdl1102611026epcas2p1L;
	Thu, 12 Feb 2026 08:16:41 +0000 (GMT)
Received: from KORCO118486 (unknown [12.80.208.104]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20260212081641epsmtip2ce95176f21ce81ae846c45bf83f14e93~TccxdL9P02450824508epsmtip2L;
	Thu, 12 Feb 2026 08:16:41 +0000 (GMT)
From: "Sanghoon Bae" <sh86.bae@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, <robh@kernel.org>,
	<conor+dt@kernel.org>, <vkoul@kernel.org>, <alim.akhtar@samsung.com>,
	<kishon@kernel.org>
Cc: <krzk+dt@kernel.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-samsung-soc@vger.kernel.org>,
	<sowon.na@samsung.com>
In-Reply-To: <474a7e3d-a506-4f4a-8bfb-fa6d203707cd@kernel.org>
Subject: RE: [PATCH 1/1] dt-bindings: soc: samsung: exynos-sysreg: add hsi0
 for ExynosAutov920
Date: Thu, 12 Feb 2026 17:16:36 +0900
Message-ID: <000d01dc9bf7$eaa23a80$bfe6af80$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQFOtjm7Fjd07XGZZ5ZMM+QG6R8EygIDKRClAfmnLMoCGtr0xrZpxQyw
Content-Language: ko
X-CMS-MailID: 20260212081641epcas2p18a5bad8edf23c5a35c1562245ee2224f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251117085146epcas2p303931d9501af51f08639b17ab7cbe34b
References: <20251117085134.289371-1-sh86.bae@samsung.com>
	<CGME20251117085146epcas2p303931d9501af51f08639b17ab7cbe34b@epcas2p3.samsung.com>
	<20251117085134.289371-2-sh86.bae@samsung.com>
	<474a7e3d-a506-4f4a-8bfb-fa6d203707cd@kernel.org>

> On 17/11/2025 09:51, Sanghoon Bae wrote:
> > Add hsi0 compatible for ExynosAutov920 PCIe settings for:
> > - PCIe PHY power control
> > - PLL settings for PCIe
> > - PCIe device direction (RC/EP)
> >
> > Signed-off-by: Sanghoon Bae <sh86.bae@samsung.com>
> > ---
> >  .../devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml   | 1 +
> >  1 file changed, 1 insertion(+)
> 
> You miss an user for this binding.
Will add the dt node for samsung,exynosautov920-hsi0-sysreg in the patchset.

