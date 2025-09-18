Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C705A2D94AC
	for <linux-samsung-soc@vger.kernel.org>; Thu, 18 Sep 2025 09:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758186139; cv=none; b=cxJ6iIzX9jtGqnGFXuBOSZajHxrIUPG3GbXyMHTECDlHU2vkgH88ceJe8E8SV37W6LdFbjvOp+4v4LhQyXeNTXdkJPX51fTAyz0RZFEZLb147dbH0V3Rk0A4um47FXbb1hly63/0ZgKFnHONCt68aXDEYAMaYbdaAW4jfpr9BVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758186139; c=relaxed/simple;
	bh=yUo0gwp5DmrYyI9pysjTCC8QKBXzpTTeyo4OlcnCFGg=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=p/Awa/jzsKEoTOFMrBA9p3ZithZmJALE6FnchvY8FZpYFau9ShAmR2vEdckUKvIe/bHjS1lA2YifCmaEJNg12LFjpeYO8nOaQCC3awgz6GNgqNkm+hSD8ZGu0QqsZm77rIcWNCeeZBOlXsr3sgtW0lc+MBPcEewIz90eOgy2FDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=Tke3dUod; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Tke3dUod"
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250918090214epoutp04af370a4703d90b987ae3684793b5988c~mVPlhiKS21550415504epoutp046
	for <linux-samsung-soc@vger.kernel.org>; Thu, 18 Sep 2025 09:02:14 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250918090214epoutp04af370a4703d90b987ae3684793b5988c~mVPlhiKS21550415504epoutp046
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1758186134;
	bh=xohElGlOL2qwuc7CaXtsWhYSzs957c36W9/xGMuImuk=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=Tke3dUodbTkau937Ut/TVOrn/aNDPd2vymNswh+GMDtCRYjpedMriimw/19fSwSYl
	 wwNtG0nmJ2Kh1n213M6brzVDxjNZnNIktmmkeTmyaZ8mEEWlwDUiMD3RV8qkNvaovC
	 mYTstNC50VWVjjKuDglzFK/mupZRxUzrefG0A4Hs=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250918090214epcas5p4d1ca88ffc44bb86f416cc7356a33e7ec~mVPlAaEad0371503715epcas5p4Z;
	Thu, 18 Sep 2025 09:02:14 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.95]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4cS8ln0298z3hhTD; Thu, 18 Sep
	2025 09:02:13 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250918090212epcas5p1fae66bbfa75ebed68841f83a10714c54~mVPjcjgHK3151831518epcas5p1m;
	Thu, 18 Sep 2025 09:02:12 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250918090209epsmtip29e21b8aa35276b5789667d683987389a~mVPg-y8no2788427884epsmtip2w;
	Thu, 18 Sep 2025 09:02:09 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Raghav Sharma'" <raghav.s@samsung.com>, <krzk@kernel.org>,
	<s.nawrocki@samsung.com>, <cw00.choi@samsung.com>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <robh@kernel.org>,
	<conor+dt@kernel.org>, <sunyeal.hong@samsung.com>, <shin.son@samsung.com>
Cc: <linux-samsung-soc@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <chandan.vn@samsung.com>,
	<dev.tailor@samsung.com>, <karthik.sun@samsung.com>
In-Reply-To: <20250915095401.3699849-4-raghav.s@samsung.com>
Subject: RE: [PATCH v2 3/3] arm64: dts: exynosautov920: add CMU_M2M clock DT
 nodes
Date: Thu, 18 Sep 2025 14:32:08 +0530
Message-ID: <087c01dc287a$ebd50680$c37f1380$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIDMWX7dzjI2+lsAsCe3lTeFtXiqgFAK0RPAkIX1i20Ln7xwA==
Content-Language: en-us
X-CMS-MailID: 20250918090212epcas5p1fae66bbfa75ebed68841f83a10714c54
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250915094517epcas5p2186fc92cca758b6fe610c0ec91ee51bc
References: <20250915095401.3699849-1-raghav.s@samsung.com>
	<CGME20250915094517epcas5p2186fc92cca758b6fe610c0ec91ee51bc@epcas5p2.samsung.com>
	<20250915095401.3699849-4-raghav.s@samsung.com>

Hi Raghav

> -----Original Message-----
> From: Raghav Sharma <raghav.s@samsung.com>
> Sent: Monday, September 15, 2025 3:24 PM
> To: krzk@kernel.org; s.nawrocki@samsung.com; cw00.choi@samsung.com;
> alim.akhtar@samsung.com; mturquette@baylibre.com; sboyd@kernel.org;
> robh@kernel.org; conor+dt@kernel.org; sunyeal.hong@samsung.com;
> shin.son@samsung.com
> Cc: linux-samsung-soc@vger.kernel.org; linux-clk@vger.kernel.org;
> devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
> kernel@vger.kernel.org; chandan.vn@samsung.com; dev.tailor@samsung.com;
> karthik.sun@samsung.com; Raghav Sharma <raghav.s@samsung.com>
> Subject: [PATCH v2 3/3] arm64: dts: exynosautov920: add CMU_M2M clock DT
> nodes
> 
> Add required dt node for CMU_M2M block, which provides clocks for M2M IP
> 
> Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
> ---

Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>

