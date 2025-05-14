Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BACD6295D89
	for <linux-samsung-soc@vger.kernel.org>; Thu, 15 May 2025 06:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747292329; cv=none; b=F7DHQhOVwE60IUixOdN8+Mr2uPCIu9T5IdHqHZ8zVo8yYaz+vU1ZsHhZ1MPfosjwl8cfJw8WgAlKR9VI9aJuJV+artJzuu2BgWtH8h3VkajCKE0NeQYFGO57H8mtMY/snpbHbCzV3wqyQkey62flrXkd1jG1MRuZKfAjdsq1cz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747292329; c=relaxed/simple;
	bh=6vIp4NzWmpkPXqP/aD1WmBM6BCLAGcKZVad9IgBArHM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 References; b=fS7pz9XgONHECse2w5vfhxPcojwHRhDc09eP40FfAqYAFSqobAdXQ3TAiS7j9wMhm5DM8lo1G2kay71L8Om2BF7LRJf6cSemN3sHknw1KkSxChAExGfPHNu0AafELRtJxxukembVlUZRi85SSmQP/+aT35Zfz1X3Irs2iRHQ8sM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=gkjnkQNl; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="gkjnkQNl"
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250515065843epoutp03b670db08269d676e541736b55f2e1f81~-oRxbU3-_0125901259epoutp03p
	for <linux-samsung-soc@vger.kernel.org>; Thu, 15 May 2025 06:58:43 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250515065843epoutp03b670db08269d676e541736b55f2e1f81~-oRxbU3-_0125901259epoutp03p
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1747292323;
	bh=T+tQKDNqFz0vrJcNWHZ7SWfrYWc8+05T1uWtrqP/8gg=;
	h=From:To:Cc:Subject:Date:References:From;
	b=gkjnkQNl/C6dvk+3lctfvTFGIxD5XWUnfpc6pxh3C0Ow/CxHtp9r5NDKQfMv6JVwr
	 7ce5MTucoeqX/qrZxjaJY8WYwMtmZ5kfmwizEN1DFCuGziMdgB/bGykgp2KtAe8p/u
	 9RZR0axNtI8cntL5J4ZwjsBqLKjPbGrYx7QG6QBM=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20250515065842epcas5p39299e3e0ccd1f6d0c9085f006a5b8bbe~-oRwyKJUF0043300433epcas5p3C;
	Thu, 15 May 2025 06:58:42 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.182]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4ZygzP3YH2z6B9m6; Thu, 15 May
	2025 06:58:41 +0000 (GMT)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250514133841epcas5p1993cdc39779e2e67790c84bdcb95a161~-aFskRMwc1651716517epcas5p1x;
	Wed, 14 May 2025 13:38:41 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250514133841epsmtrp182ecc0d6f6db8ee036d95ebc3a602f8e~-aFsjOVMD2249722497epsmtrp1v;
	Wed, 14 May 2025 13:38:41 +0000 (GMT)
X-AuditID: b6c32a29-566fe7000000223e-d6-68249ce06e42
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	77.3C.08766.0EC94286; Wed, 14 May 2025 22:38:40 +0900 (KST)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250514133837epsmtip211d9cfffb87f564e51c11db6b8184519~-aFppGDet2568925689epsmtip2B;
	Wed, 14 May 2025 13:38:37 +0000 (GMT)
From: Pritam Manohar Sutar <pritam.sutar@samsung.com>
To: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, alim.akhtar@samsung.com,
	andre.draszik@linaro.org, peter.griffin@linaro.org, kauschluss@disroot.org,
	m.szyprowski@samsung.com, s.nawrocki@samsung.com
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, rosa.pila@samsung.com,
	dev.tailor@samsung.com, faraz.ata@samsung.com, muhammed.ali@samsung.com,
	selvarasu.g@samsung.com, Pritam Manohar Sutar <pritam.sutar@samsung.com>
Subject: [PATCH 0/2] initial usbdrd phy support for Exynosautov920 soc
Date: Wed, 14 May 2025 19:18:11 +0530
Message-Id: <20250514134813.380807-1-pritam.sutar@samsung.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrHLMWRmVeSWpSXmKPExsWy7bCSvO6DOSoZBu/Omls8mLeNzWLLq80s
	Fmv2nmOyuLdjGbvF/CPnWC2u3VjIbvHn33k2i6Ot/5ktXs66x2ax6fE1VovLu+awWUxY9Y3F
	Ysb5fUwWa4/cZbc4/6KL1WLDjH8sFs/urWCz+L9nB7vFl58PmC0Ov2lntTiy/COTxc47J5gd
	xDxOrtvM5LFpVSebx51re9g8Ni+p9+jbsorR4/MmuQC2KC6blNSczLLUIn27BK6MOXsnsBSc
	Y63oXdLC1MB4gKWLkZNDQsBE4vKKScxdjFwcQgK7GSXeHm9kg0jISDyatpEVwhaWWPnvOTuI
	LSTwllFi+TfLLkYODjYBU4mJexJAekUEepgknl79wQbiMAs8YpI4sOULWLOwgJvEybbZzCA2
	i4CqxKvvTWCDeAXsJDZ+OQy1QF5i/8GzzBBxQYmTM5+AXccMFG/eOpt5AiPfLCSpWUhSCxiZ
	VjFKphYU56bnFhsWGOallusVJ+YWl+al6yXn525iBEeRluYOxu2rPugdYmTiYDzEKMHBrCTC
	ez1LOUOINyWxsiq1KD++qDQntfgQozQHi5I4r/iL3hQhgfTEktTs1NSC1CKYLBMHp1QD0/ke
	SYefVdIWPxzPbfec9p+lQMA17vPV/ff0J/td7I+MXMv3oVb4SEF/1K6wBzmRLIlX+Lk+mHxO
	fBstcMOiTO3Xntti5wO3ctlfcKjbfS61P9YwSdzqpeSu2ckPXcrSzH+pFqldMOfR/rarQdrs
	aMpJm++zMjwYfsl/UPNdoTLX9FdG689Lj6+XVy4Omlgx/0T3+XCGGV3G6b7nTY9GporsuLRA
	n1VcSsZ4ps3fiVuPvBJsnLXg/N3YwDdKr5/KTVC5pqrEtuKMYH9Gn6D6+psTzETeK8t1Jcy/
	+Fum1kj570rJws5302SSXe+59sZeC+OyEjdKlfmqdUXgSMAz5gWH1p+L7jz0LGrCsXmtSizF
	GYmGWsxFxYkAvrs9qhEDAAA=
X-CMS-MailID: 20250514133841epcas5p1993cdc39779e2e67790c84bdcb95a161
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250514133841epcas5p1993cdc39779e2e67790c84bdcb95a161
References: <CGME20250514133841epcas5p1993cdc39779e2e67790c84bdcb95a161@epcas5p1.samsung.com>

This SoC has a single USB 3.1 DRD combo phy and three USB2.0
DRD phy controllers that only support the UTMI+ interface. 
This SoC is very similar to the existing Exynos850 support
in this driver. We have supported only UTMI+ in this patchset.

The difference is that combo phy supports both UTMI+(HS) and 
PIPE3(SS) and is out of scope in this patchset.

Pritam Manohar Sutar (2):
  dt-bindings: phy: samsung,usb3-drd-phy: add dt-schema for
    ExynosAutov920
  phy: exyons5-usbdrd: support HS phy for ExynosAutov920

 .../bindings/phy/samsung,usb3-drd-phy.yaml    | 27 ++++++
 drivers/phy/samsung/phy-exynos5-usbdrd.c      | 85 +++++++++++++++++++
 2 files changed, 112 insertions(+)

-- 
2.34.1

