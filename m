Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 775BF8F40
	for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Nov 2024 02:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732675602; cv=none; b=jm8OPnyCh1U+YbE5KPObylmWV5cPthnz8hinrm3XFyb9BxjanYDkby9ZWi33p2ac64677Ap5uBiK7StebVtMBamzb6OPhvHZh3XtGMkKeLTsfDxS+LvBX0MkPfNSsKElCqRu5ymT+147cgpIesSpbEwQf+lcYAb4muvBzR4Snhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732675602; c=relaxed/simple;
	bh=g3jrdiXAyamphHmJlQj65Lpn3Ne/PFcoEi6Hak4e7Sc=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=NmM0de+777oNSC8MZTLmBELtsacdQaPqN0NcrugyLPOc2dtbG0Z7epKX9taM/b2Zd75yGOrq0BypiMNBg2g7Q0Ok1gW9zNG5UAcl0hEYKoK5oWBe007tVII5zRxJkyj+7yL6M1/c7zhkfvFDcfxobYBRdJGR2ypYNTWt7O85g/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=vcOOqERo; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="vcOOqERo"
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20241127024638epoutp03b2472cfdf7e2d793282a332b4081e539~Ls0bPMxr80210802108epoutp03R
	for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Nov 2024 02:46:38 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20241127024638epoutp03b2472cfdf7e2d793282a332b4081e539~Ls0bPMxr80210802108epoutp03R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1732675598;
	bh=7YWGnKGZDJIDF38c8GPOFH3iZjdUyWWmxhPz3i4NxjI=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=vcOOqERoMpg6kJO4r2AATkX5svR6f1Ybfq2NWdZoEGfoRl+ym4s+CTbKiZTEVtTdP
	 v26RhgOasIc8S5b2a++kKKtLQd+LNu94873EuGFn7mIhT+eRkRQaSM6ncLdOWtXnYL
	 52kMUoVkpwc6CVb3xtpFnh/gRmVfmxMmuNjzIros=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTP id
	20241127024637epcas5p2c14793be01c0715ce78f792abb52cae4~Ls0akuDam0421704217epcas5p29;
	Wed, 27 Nov 2024 02:46:37 +0000 (GMT)
Received: from epsmgec5p1new.samsung.com (unknown [182.195.38.174]) by
	epsnrtp2.localdomain (Postfix) with ESMTP id 4XykNW2YYSz4x9Pt; Wed, 27 Nov
	2024 02:46:35 +0000 (GMT)
Received: from epcas5p4.samsung.com ( [182.195.41.42]) by
	epsmgec5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	7C.67.19710.70886476; Wed, 27 Nov 2024 11:46:31 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20241127024631epcas5p3c25499e2235fd5752282c0f36a0625bc~Ls0U3uMlW0958009580epcas5p3s;
	Wed, 27 Nov 2024 02:46:31 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20241127024631epsmtrp272398a394a146764b74cd7c99e78c134~Ls0U2_izK1289212892epsmtrp2S;
	Wed, 27 Nov 2024 02:46:31 +0000 (GMT)
X-AuditID: b6c32a44-c785524000004cfe-72-6746880755db
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	BC.BB.18729.70886476; Wed, 27 Nov 2024 11:46:31 +0900 (KST)
Received: from INBRO002756 (unknown [107.122.12.5]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20241127024629epsmtip2cfecd751fc57d828c96a6e88ab11039e~Ls0S1WOkY2260522605epsmtip29;
	Wed, 27 Nov 2024 02:46:29 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Sowon Na'" <sowon.na@samsung.com>, <robh@kernel.org>,
	<krzk@kernel.org>, <conor+dt@kernel.org>, <vkoul@kernel.org>,
	<kishon@kernel.org>
Cc: <krzk+dt@kernel.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-samsung-soc@vger.kernel.org>
In-Reply-To: <20241118021009.2858849-3-sowon.na@samsung.com>
Subject: RE: [PATCH v3 2/3] phy: samsung-ufs: support ExynosAutov920 ufs phy
 driver
Date: Wed, 27 Nov 2024 08:16:26 +0530
Message-ID: <000001db4076$90629520$b127bf60$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQKN54LK9wdlweRKh/1XLNX4aAwNFgJqmbyrAh6osHmxQNOEoA==
Content-Language: en-us
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprPJsWRmVeSWpSXmKPExsWy7bCmli57h1u6wcnF5hZr9p5jsph/5Byr
	xdHW/8wWL2fdY7M4f34Du8XlXXPYLGac38dk8X/PDnaL3z8PMVnsvHOC2YHLY9OqTjaPvi2r
	GD0+b5ILYI7KtslITUxJLVJIzUvOT8nMS7dV8g6Od443NTMw1DW0tDBXUshLzE21VXLxCdB1
	y8wBukVJoSwxpxQoFJBYXKykb2dTlF9akqqQkV9cYquUWpCSU2BSoFecmFtcmpeul5daYmVo
	YGBkClSYkJ3x4mwra8FstoreqR9ZGhj7WbsYOTkkBEwkXl7tZOxi5OIQEtjNKNHcdJoJwvnE
	KNF0/xszhPONUaLt5w82mJbtz+dDJfYySpzv7YdyXjBKLL6+E6yKTUBXYsfiNjaQhIjAREag
	lr9Agzk4mAVqJfZ3moDUcArYSFx9sZYZJCwsECrR+NAMJMwioCrx/tpFJhCbV8BS4t/puYwQ
	tqDEyZlPWEBsZgF5ie1v5zBDHKQg8fPpMrB/RAScJN4dvMAKUSMu8fLoEXaQEyQEFnJI7J32
	hAmiwUViyd+/jBC2sMSr41vYIWwpic/v9kJ9mS1x/OIsKLtCorv1I1SNvcTORzdZIF7RlFi/
	Sx9iF59E7+8nYB9KCPBKdLQJQVSrSjS/u8oCYUtLTOzuhga7h8SHaysYJzAqzkLy2Swkn81C
	8sEshGULGFlWMUqmFhTnpqcmmxYY5qWWw+M7OT93EyM4pWq57GC8Mf+f3iFGJg7GQ4wSHMxK
	Irx84s7pQrwpiZVVqUX58UWlOanFhxhNgcE9kVlKNDkfmNTzSuINTSwNTMzMzEwsjc0MlcR5
	X7fOTRESSE8sSc1OTS1ILYLpY+LglGpgEnmzxHpL35ll9deKNp3hXO25njlz8as7Li9slsT4
	bD5xi8Hr1M0Et69C7YmNXDOSWXk23cv5KV6mbFMtzRz/e8deIVbGz4tceLLXlfOd2xy380b2
	+srgBVZxPceXJC96bLJlycOwVpWAR2miFXFHnA065nEd9v+ec90jWFf9ZF5Why2j/0+Xe8XW
	Phc3fKqPOPL15OqDsXOe/7LxfS3OGHW87/XxmSkxHq+2/LzvcmpCw1vrI9MfCjZu1Vl74cyi
	aTtubVjRtTlGUn+TRW/q/dnyydoefB177jzZMVXW/dmHVecKtgnlr+vNlf20RndH/3fDaP+r
	Xxap8xkctEtzPirs112+/kt89M8TM7WkXJVYijMSDbWYi4oTAfIgw8syBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupkkeLIzCtJLcpLzFFi42LZdlhJXpe9wy3d4M4eSYs1e88xWcw/co7V
	4mjrf2aLl7PusVmcP7+B3eLyrjlsFjPO72Oy+L9nB7vF75+HmCx23jnB7MDlsWlVJ5tH35ZV
	jB6fN8kFMEdx2aSk5mSWpRbp2yVwZbw428paMJutonfqR5YGxn7WLkZODgkBE4ntz+czdzFy
	cQgJ7GaUmDjjJAtEQlri+sYJ7BC2sMTKf8/ZIYqeMUq8/v+eCSTBJqArsWNxGxtIQkRgOqPE
	vjU/mEESzAKNjBIXO9ggOvYySjQ9aQbbxylgI3H1xVqgIg4OYYFgiTm3y0DCLAKqEu+vXQQb
	yitgKfHv9FxGCFtQ4uTMJywQM7Ulnt58CmXLS2x/O4cZ4joFiZ9Pl4GNFxFwknh38AIrRI24
	xMujR9gnMArPQjJqFpJRs5CMmoWkZQEjyypGydSC4tz03GLDAsO81HK94sTc4tK8dL3k/NxN
	jODY0tLcwbh91Qe9Q4xMHIyHGCU4mJVEePnEndOFeFMSK6tSi/Lji0pzUosPMUpzsCiJ84q/
	6E0REkhPLEnNTk0tSC2CyTJxcEo1MK1TOyHL8ss4w1MvxiXrvErMViP5TVeLQs1OLr/BsdTo
	VKAPf11TjVg5578Ntyr2rxK58cT/owrnYT/fq1VrVuU/WZtxZnlr2fWja2NPlk3hK/oZ2f7X
	fPOO+7oLXymtKFg1t3GG/jGDktM1/wQ2//39JUnBNyFPtSl11732FdVrNlYLiFbIxL6OPPY5
	LvXRva9Klzjt+w8re8wu3F3xn4u33mtxz26h079TWyQOz5lz7Zxuzf/aiqu3V9zctDv8dWnq
	ntaIR+pZnzuWbJYV2t+/Ibgi5vWb2ncZdw+VZarmi1krBjwI/XDa87WBr8IdM46Tv/Z+mpC+
	VH/JGRYbtwndBkffnF/2an+od91hBw4lluKMREMt5qLiRACyQh52HAMAAA==
X-CMS-MailID: 20241127024631epcas5p3c25499e2235fd5752282c0f36a0625bc
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20241118021011epcas2p4b71dadce42a321213bdf8d445a312a8f
References: <20241118021009.2858849-1-sowon.na@samsung.com>
	<CGME20241118021011epcas2p4b71dadce42a321213bdf8d445a312a8f@epcas2p4.samsung.com>
	<20241118021009.2858849-3-sowon.na@samsung.com>

Hi Sowon

> -----Original Message-----
> From: Sowon Na <sowon.na@samsung.com>
> Sent: Monday, November 18, 2024 7:40 AM
> To: robh@kernel.org; krzk@kernel.org; conor+dt@kernel.org;
> vkoul@kernel.org; alim.akhtar@samsung.com; kishon@kernel.org
> Cc: krzk+dt@kernel.org; linux-kernel@vger.kernel.org;
> devicetree@vger.kernel.org; linux-samsung-soc@vger.kernel.org;
> sowon.na@samsung.com
> Subject: [PATCH v3 2/3] phy: samsung-ufs: support ExynosAutov920 ufs phy
> driver
> 
> Add support for ExynosAutov920 ufs phy driver.
> 
> Signed-off-by: Sowon Na <sowon.na@samsung.com>
> ---
Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>

.
.
.
>  drivers/phy/samsung/Makefile                 |   1 +
>  drivers/phy/samsung/phy-exynosautov920-ufs.c | 167
> --
> 2.45.2


