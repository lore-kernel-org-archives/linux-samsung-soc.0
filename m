Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8834262FEF
	for <linux-samsung-soc@vger.kernel.org>; Sat, 10 May 2025 02:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746844125; cv=none; b=FcA0Rkl8ZxOINiW3rwyIrcgDJSXRK1BXVVfm7w0Mi/+bvkEXaUVnsoickgFn2g2k61blv7QNbNJs78dEvrJbz3qjIeQM17l1/X2nUiAeC0LJh7q/iiztDz17eeh/avuQTT0reNmUmiDV4gEahbBhI06EDaADt1aaFjIRWJR5xNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746844125; c=relaxed/simple;
	bh=wzaNYL5XxypF2ie5zb9BPa/nkiwXBYjeHp0uSYBFbbQ=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=TlVmoitOP2ATg+2btGizp4lEQvh1R/2/0CF9wmvbMy1Lyz/SMp0gmsaqsd3XQO0RQtbzc+5M3VRvujlcSCeos4n1XOLSLJ5E3HsinTiKFtG228imkA7SgAQzlrAPX+UO8BqbrvEbhKN57msXewAzSIQ/J+EQ/YRQ7qh0cz1YjdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=GSuAA2uo; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="GSuAA2uo"
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250510022839epoutp0341f3d14889fd08aed7d29c930303f282~_CXi7jjLn0823408234epoutp03V
	for <linux-samsung-soc@vger.kernel.org>; Sat, 10 May 2025 02:28:39 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250510022839epoutp0341f3d14889fd08aed7d29c930303f282~_CXi7jjLn0823408234epoutp03V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1746844119;
	bh=OMQQgRzKRMxctcYpGXbSKjA/hpXZSmYOzyU6SVM8EaM=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=GSuAA2uo7mU0ClLAf30T+JPDNR1sX4ak6XhD4BUyH+i9WHmf5kij07QdRi1XByvR4
	 8ymTWzEcEFD6Idz5cCYtoALme4xg//7V17MFuFOpxnU7CcXYO/r4N9cluOJmXE1RN5
	 EQ40Z5noUeCkbJunnZnEzRag847b/zD/lVMuZ0wE=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250510022838epcas5p28e74cb800febced7f58728200ce47115~_CXhv0UP32406324063epcas5p2k;
	Sat, 10 May 2025 02:28:38 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.179]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4ZvVD42xvxz6B9m6; Sat, 10 May
	2025 02:28:36 +0000 (GMT)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250510022835epcas5p1c9bcad7541f77b798cd1510b7b612ddf~_CXesPXs51597015970epcas5p1r;
	Sat, 10 May 2025 02:28:35 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250510022835epsmtrp1c274660011cbf5ec9b262358934dc063~_CXeqj9Nq0425404254epsmtrp1a;
	Sat, 10 May 2025 02:28:35 +0000 (GMT)
X-AuditID: b6c32a52-40bff70000004c16-22-681eb9d27cec
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	EE.70.19478.2D9BE186; Sat, 10 May 2025 11:28:34 +0900 (KST)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250510022832epsmtip2d27f435acb90026832818feb5f8b4bba~_CXcp-X2a2690626906epsmtip2W;
	Sat, 10 May 2025 02:28:32 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Pritam Manohar Sutar'" <pritam.sutar@samsung.com>, <krzk@kernel.org>,
	<s.nawrocki@samsung.com>, <cw00.choi@samsung.com>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <sunyeal.hong@samsung.com>
Cc: <linux-samsung-soc@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<rosa.pila@samsung.com>, <dev.tailor@samsung.com>, <faraz.ata@samsung.com>,
	"'stable'" <stable@kernel.org>
In-Reply-To: <20250506080154.3995512-1-pritam.sutar@samsung.com>
Subject: RE: [PATCH v2] clk: samsung: correct clock summary for hsi1 block
Date: Sat, 10 May 2025 07:58:31 +0530
Message-ID: <045701dbc153$3aa85bc0$aff91340$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJXoAhNt2lxpjQmxp3wpnZOkbsiiwIMDegbssMEZrA=
Content-Language: en-us
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrOIsWRmVeSWpSXmKPExsWy7bCSvO6lnXIZBvc2W1lc//Kc1eLejmXs
	FtduLGS3OH9+A7vFpsfXWC0+9txjtbi8aw6bxYzz+5gsLp5ytXh2bwWbxZefD5gtDr9pZ7X4
	d20ji8Wn8xfYLJqWrWdy4Pd4f6OV3WPTqk42j81L6j36tqxi9Pi8SS6ANYrLJiU1J7MstUjf
	LoErY8KGWYwFb3kqnh8xbmDcxdXFyMkhIWAicXzqNcYuRi4OIYHtjBIfdv5kgUhIS1zfOIEd
	whaWWPnvOTtE0XNGiaenDzCDJNgEdCV2LG5jA0mICFxhlJj2+ytYFbNAG5PE8v5uqJaJjBLd
	c2+wgbRwCjhITD7xHmyusICXxIfZ75hAbBYBVYnVl1aD1fAKWErMnfWMBcIWlDg58wmYzSyg
	LdH7sJURwpaX2P52DjPEfQoSP58uYwWxRQSsJJb0vmaGqBGXeHn0CPsERuFZSEbNQjJqFpJR
	s5C0LGBkWcUomlpQnJuem1xgqFecmFtcmpeul5yfu4kRHJdaQTsYl63/q3eIkYmD8RCjBAez
	kgjv806ZDCHelMTKqtSi/Pii0pzU4kOM0hwsSuK8yjmdKUIC6YklqdmpqQWpRTBZJg5OqQYm
	DwNVvcjuzwqBrrmVageSdl81THo57+PM5+sKU+4rMy19tOP+vcdnuharlJ1JfWaXkGw16Zuu
	0fs9O7bJdsr03nqt5hTiHOskcehUqkSv3bZ7O3v+5efXT/+9wjW52EeYcfHTuDdnUv2+bfiW
	eOVpzF3lLSui32u7p1kaTlD7JBF/POVggnXP4hVPzwc9e3j5RPs6lckPrgoa2H3s4lzTqJUo
	krZRdaLN5PZbjA3Nzdou91n/PxV+cu5weugX39ZKLvltN7R2f+Z5utb70kxPk9qKhYcfdqvu
	/rZOVzr38ca900qMfQ7+WruU+V7ulWA5j50CVdfWXSjfvD+t6U7F4Z5cS3nR4guCTg4fr1zs
	VmIpzkg01GIuKk4EAAY5zY86AwAA
X-CMS-MailID: 20250510022835epcas5p1c9bcad7541f77b798cd1510b7b612ddf
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250506075413epcas5p2ce0db6da9f359e9c3bb16b03c1a5eb4f
References: <CGME20250506075413epcas5p2ce0db6da9f359e9c3bb16b03c1a5eb4f@epcas5p2.samsung.com>
	<20250506080154.3995512-1-pritam.sutar@samsung.com>

Hi Pritam

> -----Original Message-----
> From: Pritam Manohar Sutar <pritam.sutar@samsung.com>
> Sent: Tuesday, May 6, 2025 1:32 PM
> To: krzk@kernel.org; s.nawrocki@samsung.com; cw00.choi@samsung.com;
> alim.akhtar@samsung.com; mturquette@baylibre.com; sboyd@kernel.org;
> sunyeal.hong@samsung.com
> Cc: linux-samsung-soc@vger.kernel.org; linux-clk@vger.kernel.org; linux-
> arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org;
> rosa.pila@samsung.com; dev.tailor@samsung.com;
> faraz.ata@samsung.com; Pritam Manohar Sutar
> <pritam.sutar@samsung.com>; stable <stable@kernel.org>
> Subject: [PATCH v2] clk: samsung: correct clock summary for hsi1 block
> 
> clk_summary shows wrong value for "mout_hsi1_usbdrd_user".
> It shows 400Mhz instead of 40Mhz as below.
> 
> dout_shared2_div4           1 1 0 400000000 0 0 50000 Y ...
>   mout_hsi1_usbdrd_user     0 0 0 400000000 0 0 50000 Y ...
>     dout_clkcmu_hsi1_usbdrd 0 0 0 40000000  0 0 50000 Y ...
> 
> Correct the clk_tree by adding correct clock parent for
> "mout_hsi1_usbdrd_user".
> 
> Post this change, clk_summary shows correct value.
> 
> dout_shared2_div4           1 1 0 400000000 0 0 50000 Y ...
>   mout_clkcmu_hsi1_usbdrd   0 0 0 400000000 0 0 50000 Y ...
>     dout_clkcmu_hsi1_usbdrd 0 0 0 40000000  0 0 50000 Y ...
>       mout_hsi1_usbdrd_user 0 0 0 40000000  0 0 50000 Y ...
> 
> Fixes: 485e13fe2fb6 ("clk: samsung: add top clock support for ExynosAuto
> v920 SoC")
> Cc: stable <stable@kernel.org>
> Signed-off-by: Pritam Manohar Sutar <pritam.sutar@samsung.com>
> ---

Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>

