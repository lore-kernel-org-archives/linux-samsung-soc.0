Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FC4F34B198
	for <linux-samsung-soc@vger.kernel.org>; Wed, 17 Dec 2025 12:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765975665; cv=none; b=C4e95nXOrQpCrPN0R+pHwBy16oyQPpHovuQaEGzAAwW9Zs9Lo2zFeEfpH/2YhfecfvmplzcLjSabheg/xz9y6aQE8AEZdU8lih2/R8LUII3M6EW4xxt/dAPtise/hFAR0MzM+cGRi+MkaaKCmS72becFh2kmB0Qyt3XEzQFYRqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765975665; c=relaxed/simple;
	bh=4gR7l5NomvQrZ9PhUm8tiv2Zgb0LTNdrEzzIwrM2YNo=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=qUS0ov408fUGV7uNmYT/+crk65z+M6VdJd3/ayGROWYnnyXfuHxkdj1FAWstBqrNU+0hwlplVhcmXi3+Wnwsnp2RBFcq6tb6yLnjH9GAbMjkC+kclRbwmv7DIizjrjE4VABTrFImUhbvwb3BrVYAzdfb0NILZit9oJvYvtw2gBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=DactHyrv; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="DactHyrv"
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20251217124741epoutp015add3f5e85b96d033ee8421c31915a0b~CAYIKfVpW2116221162epoutp01T
	for <linux-samsung-soc@vger.kernel.org>; Wed, 17 Dec 2025 12:47:41 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20251217124741epoutp015add3f5e85b96d033ee8421c31915a0b~CAYIKfVpW2116221162epoutp01T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1765975661;
	bh=YrrOmhiyiOq4yDJCEVzWpuHvN8KFfb2K+eM0p+8fJ70=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=DactHyrvwkaASRA+9HuxX9PhTjnxnphj8NJUKFheXEq/6ot+Z4PIPsog9Q1DYWXlE
	 qleM7jfZR6yJ8ttUaLeBxyG8QRc1qNsBIVI8WJK13HT6nyLO3j/vVwNafFl3LKFRZi
	 IeWtE6SEK9QKCyTr/O6Cesua6mqPRBOB7DUDuhdg=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20251217124740epcas5p3a5b1b2050b6c3d8e3e9e6d5dedff6f6f~CAYHSVT7Y0703507035epcas5p3Q;
	Wed, 17 Dec 2025 12:47:40 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.94]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4dWYVM706Cz6B9m5; Wed, 17 Dec
	2025 12:47:39 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20251217124738epcas5p4eb8ba44b348c02adf77fddc8ac38a7c9~CAYFG2oVJ0801908019epcas5p4V;
	Wed, 17 Dec 2025 12:47:38 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20251217124732epsmtip1b0e3f2327a7b0a6251274a38d05cf3d8~CAX-p-MpQ1194311943epsmtip1L;
	Wed, 17 Dec 2025 12:47:32 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Raghav Sharma'" <raghav.s@samsung.com>, <krzk@kernel.org>,
	<s.nawrocki@samsung.com>, <cw00.choi@samsung.com>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <robh@kernel.org>,
	<conor+dt@kernel.org>, <sunyeal.hong@samsung.com>, <shin.son@samsung.com>
Cc: <linux-samsung-soc@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <chandan.vn@samsung.com>,
	<dev.tailor@samsung.com>, <karthik.sun@samsung.com>
In-Reply-To: <20251119114744.1914416-4-raghav.s@samsung.com>
Subject: RE: [PATCH 3/3] arm64: dts: exynosautov920: add CMU_MFD clock DT
 nodes
Date: Wed, 17 Dec 2025 18:17:29 +0530
Message-ID: <139b01dc6f53$534e6e90$f9eb4bb0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQH7EhboaEaVd13SrnoN6ZCnkjrAPAJkRUHKAfQSjhO0xb9t8A==
Content-Language: en-us
X-CMS-MailID: 20251217124738epcas5p4eb8ba44b348c02adf77fddc8ac38a7c9
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251119113935epcas5p33c4cac5a961ce334bde5988ef74b09ed
References: <20251119114744.1914416-1-raghav.s@samsung.com>
	<CGME20251119113935epcas5p33c4cac5a961ce334bde5988ef74b09ed@epcas5p3.samsung.com>
	<20251119114744.1914416-4-raghav.s@samsung.com>

Hello Raghav

> -----Original Message-----
> From: Raghav Sharma <raghav.s@samsung.com>
> Sent: Wednesday, November 19, 2025 5:18 PM
> To: krzk@kernel.org; s.nawrocki@samsung.com; cw00.choi@samsung.com;
> alim.akhtar@samsung.com; mturquette@baylibre.com; sboyd@kernel.org;
> robh@kernel.org; conor+dt@kernel.org; sunyeal.hong@samsung.com;
> shin.son@samsung.com
> Cc: linux-samsung-soc@vger.kernel.org; linux-clk@vger.kernel.org;
> devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
> kernel@vger.kernel.org; chandan.vn@samsung.com;
> dev.tailor@samsung.com; karthik.sun@samsung.com; Raghav Sharma
> <raghav.s@samsung.com>
> Subject: [PATCH 3/3] arm64: dts: exynosautov920: add CMU_MFD clock DT
> nodes
> 
> Add required dt node for cmu_mfd block, which provides clocks for MFD IP
> 
> Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
> ---
Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>


