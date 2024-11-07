Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F07E91F428A
	for <linux-samsung-soc@vger.kernel.org>; Thu,  7 Nov 2024 11:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730977826; cv=none; b=ctaU4s7GRWpeCFjEZ4vpelBEaFSLQuVJTIkRGFAVFycJzhwXBbhf8fHI0vFnj+GDQ7FOs+eg4OWKOkuEkhZ34oEhp5tuIuOfc6xIS0mDFtyDeUCdsCmAAQvsixiPR/rLBDpbSN+LO9xGax4QIzbxNaoXzkzyWe0rM6cKOwuxU/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730977826; c=relaxed/simple;
	bh=37kX0iguOchGjTsjVooGWla8IG+1es7xHB2HUS6IKT4=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=We/l1ZyfF1s7vH8wVvunE8qUl/fU6EYdJyVkqtk5d7d6N8FeehdW3knuuTr9vPLfPvVJ7GalR49L5HguKfvwCcVuCuW9lA+9u3/rwo/aVwBQg2yAzKgAMyJQ2i7slETg+70bxNy/ba5C6W7h7zMNnruZkSk0WH5jkHWrSJKeD1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=KdxARm6m; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="KdxARm6m"
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20241107111020epoutp0473e9914311f89ab54ed48b1d63c73a4a~Fqyg0fRtV2071020710epoutp04M
	for <linux-samsung-soc@vger.kernel.org>; Thu,  7 Nov 2024 11:10:20 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20241107111020epoutp0473e9914311f89ab54ed48b1d63c73a4a~Fqyg0fRtV2071020710epoutp04M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1730977821;
	bh=ErKfMAXhZvdimd8V3JdwYYUKfdLTT3qW9UBaUsKeldo=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=KdxARm6mLEunMqRvn7fVFUur31j8WSAFkKe/eAqmDAxZwCmuoyVjnhoYektGWI+fb
	 gK+5inciNL5rCOus+fLn1LvKFSvwGUyrVXAJRWEobUjyC+2lBkizLp5Yp7geJp/52i
	 ydU3dF4yNiutL2Z/3ttjdv13UX/7IkiR/I9okZPg=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTP id
	20241107111020epcas5p35c58aefff30ecfb19db8d3c7f11a20ed~FqygPLB2d1390413904epcas5p31;
	Thu,  7 Nov 2024 11:10:20 +0000 (GMT)
Received: from epsmgec5p1new.samsung.com (unknown [182.195.38.179]) by
	epsnrtp1.localdomain (Postfix) with ESMTP id 4XkfVy503Dz4x9Pp; Thu,  7 Nov
	2024 11:10:18 +0000 (GMT)
Received: from epcas5p3.samsung.com ( [182.195.41.41]) by
	epsmgec5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	9B.2E.08574.A10AC276; Thu,  7 Nov 2024 20:10:18 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20241107111017epcas5p4a7ecdad34dd6f9ce081ee12658f1ed84~Fqyd7UcuY2857628576epcas5p45;
	Thu,  7 Nov 2024 11:10:17 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20241107111017epsmtrp1223a24bc11b44ec128052649356a522e~Fqyd6o-FS1010610106epsmtrp16;
	Thu,  7 Nov 2024 11:10:17 +0000 (GMT)
X-AuditID: b6c32a44-6dbff7000000217e-8f-672ca01a640a
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	D2.E5.18937.910AC276; Thu,  7 Nov 2024 20:10:17 +0900 (KST)
Received: from INBRO002756 (unknown [107.122.12.5]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20241107111016epsmtip20c4b0a66a9d4db901980a397f922e43c~Fqyccu3gI1024010240epsmtip2v;
	Thu,  7 Nov 2024 11:10:16 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Sowon Na'" <sowon.na@samsung.com>, <robh@kernel.org>,
	<krzk@kernel.org>, <conor+dt@kernel.org>, <vkoul@kernel.org>,
	<kishon@kernel.org>
Cc: <krzk+dt@kernel.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-samsung-soc@vger.kernel.org>
In-Reply-To: <20241107041509.824457-3-sowon.na@samsung.com>
Subject: RE: [PATCH 1/3] dt-bindings: phy: Add ExynosAutov920 UFS PHY
 bindings
Date: Thu, 7 Nov 2024 16:40:15 +0530
Message-ID: <040601db3105$a07bb160$e1731420$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIBMTEpWuihsUcp3o3pzj8nZnl7oAJCJM3HAaAIt8OyQJcJoA==
Content-Language: en-us
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprPJsWRmVeSWpSXmKPExsWy7bCmpq7UAp10g7nTVC3W7D3HZDH/yDlW
	i6Ot/5ktXs66x2Zx/vwGdovLu+awWcw4v4/J4v+eHewWv38eYrLYeecEswOXx6ZVnWwefVtW
	MXp83iQXwByVbZORmpiSWqSQmpecn5KZl26r5B0c7xxvamZgqGtoaWGupJCXmJtqq+TiE6Dr
	lpkDdIuSQlliTilQKCCxuFhJ386mKL+0JFUhI7+4xFYptSAlp8CkQK84Mbe4NC9dLy+1xMrQ
	wMDIFKgwITvj5ZndTAXHuSouf7vJ1MD4haOLkZNDQsBE4uOPXSxdjFwcQgK7GSXW/T/ODpIQ
	EvjEKNE/SxoiAWT/nT+XGaaj8dlyJojETkaJ0237mSGcF4wST35+ZwKpYhPQldixuI0NJCEi
	MJFRYvvzv0AJDg5mgVqJ/Z0mIDWcAtYSd6Y3sILYwgIBElebe8BsFgEViflTV4OdwStgKfH/
	xCpGCFtQ4uTMJywgNrOAvMT2t3OgLlKQ+Pl0GViviICTxLQjF9ghasQlXh49wg5yg4TAVA6J
	x8f2skM0uEhs3HOFEcIWlnh1fAtUXEriZX8blJ0tcfziLDYIu0Kiu/UjVNxeYuejmywQv2hK
	rN+lD7GLT6L39xOwFyUEeCU62oQgqlUlmt9dZYGwpSUmdnezQtgeEkuvHmGewKg4C8lns5B8
	NgvJB7MQli1gZFnFKJlaUJybnppsWmCYl1oOj+/k/NxNjOCUquWyg/HG/H96hxiZOBgPMUpw
	MCuJ8PpHaacL8aYkVlalFuXHF5XmpBYfYjQFBvdEZinR5HxgUs8riTc0sTQwMTMzM7E0NjNU
	Eud93To3RUggPbEkNTs1tSC1CKaPiYNTqoGJzXJ9h+rWjuQQo6XMP0y5l+qGrZi+y+50QmYH
	R/+uWrN5Kx6FHH3j2O6b8IsruOrt0V/T/Vec6Wh757o2n+WyUHiDxvpe+1cyzzdwnhA5MPPc
	wWe+nncu6bQu7OtYWPgp0rvN8emVhxHF7Fa305fpz9tzqpvxhQNrh0W5a+rX5N+Wl++tMM1q
	PPl0ZctuByZ3leXXLxn9Teo//+vtwVevv7CGvryl/1vwa1SX15GZeX8+LbLsr1u9OHTe/EsV
	NbdseezmmU/qbooRvWCUlnzsq3z1j26DAr2OG998olW3hwSdkhGqPP9dkOmi6rf/0ZtNjJ57
	LrxvHxo15UFSRHzX4cvfjJ/36B1t25fD/81fiaU4I9FQi7moOBEA4Od7IjIEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpjkeLIzCtJLcpLzFFi42LZdlhJXldygU66wYUJuhZr9p5jsph/5Byr
	xdHW/8wWL2fdY7M4f34Du8XlXXPYLGac38dk8X/PDnaL3z8PMVnsvHOC2YHLY9OqTjaPvi2r
	GD0+b5ILYI7isklJzcksSy3St0vgynh5ZjdTwXGuisvfbjI1MH7h6GLk5JAQMJFofLacqYuR
	i0NIYDujxIbnF9khEtIS1zdOgLKFJVb+e84OUfSMUeLphr8sIAk2AV2JHYvb2EASIgLTGSX2
	rfnBDJJgFmhklLjYwQbRsZtRYvPq7WAJTgFriTvTG1hBbGEBP4nrR7vBbBYBFYn5U1eDreMV
	sJT4f2IVI4QtKHFy5hMWiKHaEk9vPoWy5SW2v53DDHGegsTPp8vA5ogIOElMO3KBHaJGXOLl
	0SPsExiFZyEZNQvJqFlIRs1C0rKAkWUVo2hqQXFuem5ygaFecWJucWleul5yfu4mRnBUaQXt
	YFy2/q/eIUYmDsZDjBIczEoivP5R2ulCvCmJlVWpRfnxRaU5qcWHGKU5WJTEeZVzOlOEBNIT
	S1KzU1MLUotgskwcnFINTLOU9i7efn7drBuGaxLXK5WduZ27gHmT+V/dn8cuyy7YLr12dwo/
	++7Twkd2sf4M5FcP/fS1YkHDDP+4tkxm61NbgS4TMjvJsFL8onJE36OHZtaLnN6/uZPp6dyw
	lWVFvYKaeHvO6u7/MmyOOS2fpGfzCxYX9kzcudHmt54+i0bS4SKXdH3120fOZqa4+Frp7P2x
	++rbZ1HZMRJpmStlb766G7fAao/1tA/GfakZJs9XWqyaNqnu0Kx51/MehTxb0THzPVtQWvXE
	pZcnnQ1Y4ebQfW1TQ0hlmpwcdxLPm1Qds59tRmdNmSbqRLDl7pp880SIdmaTxcfswGcKAh61
	94VlN3yd+erElh0Zt7dKK7EUZyQaajEXFScCAKnpBAoZAwAA
X-CMS-MailID: 20241107111017epcas5p4a7ecdad34dd6f9ce081ee12658f1ed84
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20241107041511epcas2p285a5b52a6784e509977a1574f7c9ee4a
References: <20241107041509.824457-1-sowon.na@samsung.com>
	<CGME20241107041511epcas2p285a5b52a6784e509977a1574f7c9ee4a@epcas2p2.samsung.com>
	<20241107041509.824457-3-sowon.na@samsung.com>

Hi Sowon

> -----Original Message-----
> From: Sowon Na <sowon.na@samsung.com>
> Sent: Thursday, November 7, 2024 9:45 AM
> To: robh@kernel.org; krzk@kernel.org; conor+dt@kernel.org;
> vkoul@kernel.org; alim.akhtar@samsung.com; kishon@kernel.org
> Cc: krzk+dt@kernel.org; linux-kernel@vger.kernel.org;
> devicetree@vger.kernel.org; linux-samsung-soc@vger.kernel.org;
> sowon.na@samsung.com
> Subject: [PATCH 1/3] dt-bindings: phy: Add ExynosAutov920 UFS PHY
> bindings
> 
> Add samsung,exynosautov920-ufs-phy compatible for ExynosAuto v920 SoC.
> 
> Signed-off-by: Sowon Na <sowon.na@samsung.com>
> ---
Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>

>  Documentation/devicetree/bindings/phy/samsung,ufs-phy.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/samsung,ufs-phy.yaml
> b/Documentation/devicetree/bindings/phy/samsung,ufs-phy.yaml
> index f402e31bf58d..d70ffeb6e824 100644
> --- a/Documentation/devicetree/bindings/phy/samsung,ufs-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/samsung,ufs-phy.yaml
> @@ -18,6 +18,7 @@ properties:
>        - google,gs101-ufs-phy
>        - samsung,exynos7-ufs-phy
>        - samsung,exynosautov9-ufs-phy
> +      - samsung,exynosautov920-ufs-phy
>        - tesla,fsd-ufs-phy
> 
>    reg:
> --
> 2.45.2


