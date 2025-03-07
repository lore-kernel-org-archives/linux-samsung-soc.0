Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 967E833F7
	for <linux-samsung-soc@vger.kernel.org>; Fri,  7 Mar 2025 09:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741339048; cv=none; b=VuKi3AtP4VhB+A6IXsBF9ez9/Uvx6YhdF8WGhGyZXY/lyvu1kwgU0OQYMoJqbIKRYvJ6Drt19Sxpe+t+KRk7K5iLzjMEFsOh3f5vyJ8YaWCBvcrunmwaIp/NJe6NhmAW5PfrYPU0e9x41+kGQw1B55vQtI0Yhnwr/LczSJG+/KA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741339048; c=relaxed/simple;
	bh=RzGnIAaAr1QbaQI1NAcfwnscflSs4G8+bElAGSyMD1w=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:References; b=oaZiXDhEmzUa9SFJRpyZpigg6XMaZtlFnUiOwZM3HCtVLm2UCdJZgAHUJeZZjF7NA0cFmMXpN5n1hsWhfNBAe558T7OAvAHt+piBxY+AitHYtMsSFfYtVpU+QseMV1ZQ/z7VPyIkjNsxTj0DNxjnhom2VLKLqsgl185UnKOuJhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=dKpNPkHa; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="dKpNPkHa"
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250307091722epoutp034716eb8122715eb58346b89c218071e1~qeqIUgAgy1019110191epoutp03E
	for <linux-samsung-soc@vger.kernel.org>; Fri,  7 Mar 2025 09:17:22 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250307091722epoutp034716eb8122715eb58346b89c218071e1~qeqIUgAgy1019110191epoutp03E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1741339042;
	bh=185Ja854VTzfzWHeH+MtHZtLQWIW5M+QZCIfbb5dNtU=;
	h=From:To:Cc:Subject:Date:References:From;
	b=dKpNPkHabwiyV/cViirXUlt2xrA7o2tipQD9XA3Ul8IAl/JczMid1440OOntXDRSv
	 azhj1x+VjAXbJt/0Sg6TCv6z67XF0TtXYGWPQdcR8SXAanHFkwUTtD1N7GxapCG6RF
	 Uzsc3aG1K7Ri9eVEY/zL5102cuKGLxnO8YcpDJ6I=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTP id
	20250307091721epcas5p392bc469dbc0665e5f08a809a48aa7810~qeqHzYNlz2415824158epcas5p3H;
	Fri,  7 Mar 2025 09:17:21 +0000 (GMT)
Received: from epsmges5p3new.samsung.com (unknown [182.195.38.179]) by
	epsnrtp3.localdomain (Postfix) with ESMTP id 4Z8LKC5XcHz4x9Q8; Fri,  7 Mar
	2025 09:17:19 +0000 (GMT)
Received: from epcas5p2.samsung.com ( [182.195.41.40]) by
	epsmges5p3new.samsung.com (Symantec Messaging Gateway) with SMTP id
	B7.70.19956.F99BAC76; Fri,  7 Mar 2025 18:17:19 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250307045516epcas5p3b4006a5e2005beda04170179dc92ad16~qbFSNT0L72386823868epcas5p3O;
	Fri,  7 Mar 2025 04:55:16 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250307045516epsmtrp2d2f71c4e23d20cc7ea2f0eb122e35b63~qbFSMafY11515815158epsmtrp2n;
	Fri,  7 Mar 2025 04:55:16 +0000 (GMT)
X-AuditID: b6c32a4b-fd1f170000004df4-83-67cab99f4041
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	D7.9C.23488.43C7AC76; Fri,  7 Mar 2025 13:55:16 +0900 (KST)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250307045513epsmtip1782275a4c58c5c3dd3c148b303996ece~qbFP-Qy620867808678epsmtip1-;
	Fri,  7 Mar 2025 04:55:13 +0000 (GMT)
From: Swathi K S <swathi.ks@samsung.com>
To: krzk+dt@kernel.org, linux-fsd@tesla.com, robh@kernel.org,
	conor+dt@kernel.org, richardcochran@gmail.com, alim.akhtar@samsung.com
Cc: jayati.sahu@samsung.com, swathi.ks@samsung.com,
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, pankaj.dubey@samsung.com, ravi.patel@samsung.com,
	gost.dev@samsung.com
Subject: [PATCH v8 0/2] arm64: dts: fsd: Add Ethernet support for FSD SoC
Date: Fri,  7 Mar 2025 10:19:02 +0530
Message-Id: <20250307044904.59077-1-swathi.ks@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpmk+LIzCtJLcpLzFFi42LZdlhTQ3f+zlPpBn03tC0ezNvGZrFm7zkm
	i/lHzrFa3Dywk8niyKklTBYvZ91js9j0+BqrxcNX4RaXd81hs5hxfh+TxbEFYhaLtn5ht3j4
	YQ+7xZEzL5gt/u/ZwW7xZeNNdgcBj52z7rJ7bFrVyeaxeUm9R9+WVYwe/5rmsnt83iQXwBaV
	bZORmpiSWqSQmpecn5KZl26r5B0c7xxvamZgqGtoaWGupJCXmJtqq+TiE6DrlpkDdLWSQlli
	TilQKCCxuFhJ386mKL+0JFUhI7+4xFYptSAlp8CkQK84Mbe4NC9dLy+1xMrQwMDIFKgwITtj
	/yu9gh6uivufTjA3MDZxdDFyckgImEgcuLqUsYuRi0NIYDejRP/eViYI5xOjxM0jDawQzjdG
	ic9bJrHDtKzoOMACkdjLKHFq3lpmCOcLo8T///1MIFVsAhoS11dsZwdJiAi0MUoce9oI5jAL
	zGWSWHVwGxtIlbCAp8Ty02vA5rIIqEpMbNjODGLzClhJNH2dxAaxT15i9YYDYCskBL6yS5z7
	BdLMAeS4SLy8GghRIyzx6vgWqPukJD6/2wvVGy+xuu8qC4SdIXH310SouL3EgStzWEDGMAto
	SqzfpQ8RlpWYemod2APMAnwSvb+fMEHEeSV2zIOxlSX+vr4GNVJSYtvS91BrPSRWNnaDnS8k
	ECtx6OEW1gmMsrMQNixgZFzFKJlaUJybnlpsWmCcl1oOj6nk/NxNjODUqOW9g/HRgw96hxiZ
	OBgPMUpwMCuJ8KptP5UuxJuSWFmVWpQfX1Sak1p8iNEUGGQTmaVEk/OByTmvJN7QxNLAxMzM
	zMTS2MxQSZy3eWdLupBAemJJanZqakFqEUwfEwenVAPTgnNNExuV/a83XM5XNvEOmuwqahPF
	yf3dhnnZnIazRb/8g69+vX2g9ef/nk/1y23msE5Ni1dzurpwz2evdN9Xh60PvNjtUBLm9e3/
	74UZX13v9t6e3cphfNl75sW5AjF/l//4OpF7Hm9z1MWZwXx/J7kVTAxtcLOfdElmxcE2o4Ot
	2xVmPTNizQtoeuj5yvvNbVeB3AOx/JVFO/5nSP0W46+epqQiEc5sN39vmG+pXQ2rR1blDy7h
	vj3mZ0quLZyz+83T+n32v5hsTRRe9prJPpkRnXXVIKOO1erLgdCFsg7t86uuFfQ3PU4Q0+P5
	9Nii5e4WwTBrNvO2H27q/A8ykrN2TF3rrsXtbLfqa6sSS3FGoqEWc1FxIgB5YZqEFgQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPLMWRmVeSWpSXmKPExsWy7bCSnK5Jzal0g76zXBYP5m1js1iz9xyT
	xfwj51gtbh7YyWRx5NQSJouXs+6xWWx6fI3V4uGrcIvLu+awWcw4v4/J4tgCMYtFW7+wWzz8
	sIfd4siZF8wW//fsYLf4svEmu4OAx85Zd9k9Nq3qZPPYvKTeo2/LKkaPf01z2T0+b5ILYIvi
	sklJzcksSy3St0vgytj/Sq+gh6vi/qcTzA2MTRxdjJwcEgImEis6DrB0MXJxCAnsZpT43n+G
	DSIhKfGpeSorhC0ssfLfc3aIok+MEos2fGUESbAJaEhcX7EdLCEi0McosWF7K9goZoHlTBIL
	DjSAVQkLeEosP72GHcRmEVCVmNiwnRnE5hWwkmj6OglqnbzE6g0HmCcw8ixgZFjFKJlaUJyb
	nptsWGCYl1quV5yYW1yal66XnJ+7iREcploaOxjffWvSP8TIxMF4iFGCg1lJhFdw88l0Id6U
	xMqq1KL8+KLSnNTiQ4zSHCxK4rwrDSPShQTSE0tSs1NTC1KLYLJMHJxSDUxBf+qu31/3+U7g
	/hSPs16VmsxB+4T3tkWlv/lg/dD7753+nJIDRpfPXlb/82ZXs+kXuQU54pPuSvlmOtx8M1PB
	7yabzyzeIM+ceent6vfk+nW/NLzWdBBOzpha9n/mlMCFpdO3ZDEYZ87d4uvVtOdf1pKNzH/t
	fzPXzwl4ISLJ8KN+lUDNyaPGTVX2vddLU8Qer/9ftn5tVbj/A5knmbF5R0S3H85V9vL4anfw
	3YEreqcFnXvi3XpEGm+cOOG+uvCbm+mb+mfZJvPUKwUs7kparjnHuvd3yFc9kzUfVjts+eIh
	X8shue7A9BMXcjes+bbkbliL5SUtmdkaYf+dOO7KnlirWHoy5ilLQlLyvl9KLMUZiYZazEXF
	iQChviJuwgIAAA==
X-CMS-MailID: 20250307045516epcas5p3b4006a5e2005beda04170179dc92ad16
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250307045516epcas5p3b4006a5e2005beda04170179dc92ad16
References: <CGME20250307045516epcas5p3b4006a5e2005beda04170179dc92ad16@epcas5p3.samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>

FSD platform has two instances of EQoS IP, one is in FSYS0 block and
another one is in PERIC block. This patch series add required DT file
modifications for the same.

Changes since v1:
1. Addressed the format related corrections.
2. Addressed the MAC address correction.

Changes since v2:
1. Corrected intendation issues.

Changes since v3:
1. Removed alias names of ethernet nodes

Changes since v4:
1. Added more details to the commit message as per review comment.

Changes since v5:
1. Avoided inserting node in the end and inserted it in between as per
address.
2. Changed the node label.
3. Separating DT patches from net patches and posting in different
branches.

Changes since v6:
1. Addressed Andrew's review comment and removed phy-mode from .dtsi to
.dts

Changes since v7:
1. Addressed Russell's review comment-Implemented clock tree setup in DT

Swathi K S (2):
  arm64: dts: fsd: Add Ethernet support for FSYS0 Block of FSD SoC
  arm64: dts: fsd: Add Ethernet support for PERIC Block of FSD SoC

 arch/arm64/boot/dts/tesla/fsd-evb.dts      |  20 ++++
 arch/arm64/boot/dts/tesla/fsd-pinctrl.dtsi | 112 +++++++++++++++++++++
 arch/arm64/boot/dts/tesla/fsd.dtsi         |  50 +++++++++
 3 files changed, 182 insertions(+)

-- 
2.17.1

