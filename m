Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02FA4193432
	for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Sep 2024 11:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726745741; cv=none; b=ro1CFEnX776/IBI3JvbzpmXuwDPU6EXpstcTDPSGL7LSSr0fh2QZHLYKW887gqHClzNf+fVpxXxTWNTq7LXeByMAFlDG1bRa6I2CNp6KE/4e2znNMY0FFVKPnbqjdt9F1elMbT+69JRk+mCRbk8CSENrcSlZGEaCjMCmH7UbGSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726745741; c=relaxed/simple;
	bh=v1yp+g/83s6wGogaspPIvIwCmzCR/Tg0nLpzkLi6XYE=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=MRzONVCPiqE3Fq/MEBgps5vQ4M/uttnVJtqvPsyAObJOFOwRJlXVHtYXd0GP6npHP0x2b3hOxmN1e+b78aEPo/R6dDntBVO+VVF23gF0edUQGon+0v0DE+R6PbBKPTAascfh8+mEVDJ2D/vLkmuVWUpOotDQXPA/cjJ0s9YFIBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=Bh6du5e4; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Bh6du5e4"
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20240919113536epoutp01223df8f78105c8f304a31a0ed8863ee2~2ohlaVLkD0128601286epoutp011
	for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Sep 2024 11:35:36 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20240919113536epoutp01223df8f78105c8f304a31a0ed8863ee2~2ohlaVLkD0128601286epoutp011
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1726745736;
	bh=K3y0TmJ0KOSMe1B71qo5P4/JWi2UBjrMDsg+uKZuw04=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=Bh6du5e4JNBTU73uMJC6BpXkGz/QrsQU6VhoZooGFBJ+WmdINXKDZfQEclg9yjtBW
	 kL67d7jH6vHKtsluomn81AZqFOWbPFcu1S3Z6iUqWxCs8y+jiMFSB+K9sw4vVc0Ku8
	 MDNmII0vH3pARRgLNsnTInJBJphtEYJQnnBRox8c=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTP id
	20240919113535epcas5p2121a9a5215c8f5c4fa9fb669322d2c0d~2ohkCLq9H1461514615epcas5p2b;
	Thu, 19 Sep 2024 11:35:35 +0000 (GMT)
Received: from epsmgec5p1new.samsung.com (unknown [182.195.38.183]) by
	epsnrtp1.localdomain (Postfix) with ESMTP id 4X8YNj4rJ2z4x9Pv; Thu, 19 Sep
	2024 11:35:33 +0000 (GMT)
Received: from epcas5p1.samsung.com ( [182.195.41.39]) by
	epsmgec5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	1C.8A.08855.58C0CE66; Thu, 19 Sep 2024 20:35:33 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20240919113352epcas5p38ddc91967f3922f4639a3453a14f2822~2ogEeTn5q0552905529epcas5p3j;
	Thu, 19 Sep 2024 11:33:52 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20240919113352epsmtrp227f001d01e63d327a5c44a1e596e7e1e~2ogEdkIcw2761427614epsmtrp2g;
	Thu, 19 Sep 2024 11:33:52 +0000 (GMT)
X-AuditID: b6c32a44-15fb870000002297-1e-66ec0c859edf
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	7E.59.08456.02C0CE66; Thu, 19 Sep 2024 20:33:52 +0900 (KST)
Received: from FDSFTE196 (unknown [107.116.189.214]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20240919113351epsmtip2e8166dc69401aca149da2ee5aa51a6f6~2ogC0UNE02111021110epsmtip2l;
	Thu, 19 Sep 2024 11:33:50 +0000 (GMT)
From: "Inbaraj E" <inbaraj.e@samsung.com>
To: "'Stephen Boyd'" <sboyd@kernel.org>, <alim.akhtar@samsung.com>,
	<cw00.choi@samsung.com>, <krzk@kernel.org>, <linux-clk@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-samsung-soc@vger.kernel.org>,
	<mturquette@baylibre.com>, <s.nawrocki@samsung.com>
Cc: <pankaj.dubey@samsung.com>, <gost.dev@samsung.com>
In-Reply-To: <0d43a00985a815c1869ebc6c441a2aed.sboyd@kernel.org>
Subject: RE: [PATCH] clk: samsung: fsd: Mark PLL_CAM_CSI as critical
Date: Thu, 19 Sep 2024 17:03:49 +0530
Message-ID: <00f001db0a87$cd9ddfa0$68d99ee0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQMYu0UT7KgXFJ9p8WqzYl/+4ytJPAKVNCMjAc9ECZmvwHNJIA==
Content-Language: en-in
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrJJsWRmVeSWpSXmKPExsWy7bCmum4rz5s0g713lS0ezNvGZnH9y3NW
	i5sHdjJZnD+/gd3iY889VovLu+awWcw4v4/J4uIpV4tFW7+wWxx+085q8e/aRhYHbo/3N1rZ
	PTat6mTz6NuyitHj8ya5AJaobJuM1MSU1CKF1Lzk/JTMvHRbJe/geOd4UzMDQ11DSwtzJYW8
	xNxUWyUXnwBdt8wcoKOUFMoSc0qBQgGJxcVK+nY2RfmlJakKGfnFJbZKqQUpOQUmBXrFibnF
	pXnpenmpJVaGBgZGpkCFCdkZU9auZSz4KVxx6dUMxgbG7QJdjBwcEgImEts/mHYxcnEICexm
	lHj5sZ8RwvnEKHFx4gM2COcbo8SyXU1ADidYx+I7y1khEnsZJf5+fMoE4bxklLh28T8jSBWb
	gKbEzaP/wGwRgW4mic5VISA2s4CZxJa791lBbE4BB4mup1dYQGxhAReJGf8uMYPYLAKqEkuP
	3wWzeQUsJe6/m8MCYQtKnJz5hAVijrbEsoWvmSEuUpD4+XQZK8QuJ4lX55qhasQljv7sYQY5
	TkJgKYfEtGtX2CEaXCSWnOqFsoUlXh3fAmVLSXx+txfqTR+J/XN+MULYGRLHti9nhbDtJQ5c
	ATmIA2iBpsT6XfoQYVmJqafWMUHs5ZPo/f2ECSLOK7FjHoytLDHzyH2o8ZISOy/vZJnAqDQL
	yWuzkLw2C8kLsxC2LWBkWcUomVpQnJuemmxaYJiXWg6P8OT83E2M4DSr5bKD8cb8f3qHGJk4
	GA8xSnAwK4nwin94mSbEm5JYWZValB9fVJqTWnyI0RQY3hOZpUST84GJPq8k3tDE0sDEzMzM
	xNLYzFBJnPd169wUIYH0xJLU7NTUgtQimD4mDk6pBqapqrVOrNpLhBndxFz4XnQ919+92lZZ
	eVXErdi5inlqgt4qOxbd1Uu0fRl7ZqWXpILidTUz09MqcaqJcs/vB/Y8K/z1XIPD+Mmr8+ZS
	8/VSTMOSU0VCj4Y81eG/wpolXafwTkTM61Tg/9y3m0p3/w3x+NdQo77kENfEg/Eyhdw31h03
	PtBm9dLthvHdagHuXC0lk0ffl9iqGDdaVgbWrXpzq/zoLNm1ZptrGJ/0nr0re+X7H7GGQJd7
	jGd8ONcde3Fru87jNkUT3T7RfbvyJtv1XTtkHfbpa4yS7uZwwV/bQ9awHj3+S+ClqZqg8IZr
	QfMVumvLa7O/p/fcXyH+PJ99ypcrDWv37JFekHe/XImlOCPRUIu5qDgRAH6IrCk8BAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprIIsWRmVeSWpSXmKPExsWy7bCSvK4Cz5s0g7svNS0ezNvGZnH9y3NW
	i5sHdjJZnD+/gd3iY889VovLu+awWcw4v4/J4uIpV4tFW7+wWxx+085q8e/aRhYHbo/3N1rZ
	PTat6mTz6NuyitHj8ya5AJYoLpuU1JzMstQifbsErowpe58wFmwRrth/r5+9gfEDfxcjJ4eE
	gInE4jvLWbsYuTiEBHYzSrz52sYIkZCUmP17OjuELSyx8t9zMFtI4DmjxPblnCA2m4CmxM2j
	/xhBmkUEpjJJXHu6DqyZWcBCYvmf62wQDQcYJXaucAexOQUcJLqeXmEBsYUFXCRm/LvEDGKz
	CKhKLD1+F8zmFbCUuP9uDguELShxcuYTFoiZ2hK9D1sZYexlC18zQxynIPHz6TJWEFtEwEni
	1blmqHpxiaM/e5gnMArPQjJqFpJRs5CMmoWkZQEjyypGydSC4tz03GLDAqO81HK94sTc4tK8
	dL3k/NxNjOBY09Lawbhn1Qe9Q4xMHIyHGCU4mJVEeMU/vEwT4k1JrKxKLcqPLyrNSS0+xCjN
	waIkzvvtdW+KkEB6YklqdmpqQWoRTJaJg1OqgSmKV49ZXfzscaPkqI0S/S/kOQXD756Sd5vb
	xR/346TEeZd5Zf/WZn4W2nyzf0aT0KTnqU4lWr++BF15ltEV8ZAhILJzV29F2fJ5Esq+vZMi
	S1eo7VxoYXfVQfLcrv6UK32PDl5+z25tznHRQcQpy3CXoaLh/qPP1ove6zK7suIWb96/yiW9
	S3/q2AinXDc5ZKHhmHewneMKW6FXbxC3d3p33Pxjmp5F16d5OHhuir6lVh5e9XX6McnbjMyM
	i39ETeQuMt2q9E/FqFvoqk3oX76X1XmGiiaH1mTtnnP6v+L3jTyZUy9cawu8af544uHzqrW/
	j32wUNmmmDJRVM56913RrbKPr1TJNfTISPC2KrEUZyQaajEXFScCAAAM9ZokAwAA
X-CMS-MailID: 20240919113352epcas5p38ddc91967f3922f4639a3453a14f2822
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240917101102epcas5p3b17d2774cb74fd4cf61ea52fde85c300
References: <CGME20240917101102epcas5p3b17d2774cb74fd4cf61ea52fde85c300@epcas5p3.samsung.com>
	<20240917101016.23238-1-inbaraj.e@samsung.com>
	<0d43a00985a815c1869ebc6c441a2aed.sboyd@kernel.org>



> -----Original Message-----
> From: Stephen Boyd <sboyd=40kernel.org>
> Sent: 19 September 2024 15:51
> To: Inbaraj E <inbaraj.e=40samsung.com>; alim.akhtar=40samsung.com;
> cw00.choi=40samsung.com; krzk=40kernel.org; linux-clk=40vger.kernel.org; =
linux-
> kernel=40vger.kernel.org; linux-samsung-soc=40vger.kernel.org;
> mturquette=40baylibre.com; s.nawrocki=40samsung.com
> Cc: pankaj.dubey=40samsung.com; gost.dev=40samsung.com; Inbaraj E
> <inbaraj.e=40samsung.com>
> Subject: Re: =5BPATCH=5D clk: samsung: fsd: Mark PLL_CAM_CSI as critical
>=20
> Quoting Inbaraj E (2024-09-17 03:10:16)
> > PLL_CAM_CSI is the parent clock for the ACLK and PCLK in the
> > CMU_CAM_CSI block. When we gate ACLK or PCLK, the clock framework
> will
> > subsequently disables the parent clocks(PLL_CAM_CSI). Disabling
> > PLL_CAM_CSI is causing sytem level halt.
> >
> > It was observed on FSD SoC, when we gate the ACLK and PCLK during CSI
> > stop streaming through pm_runtime_put system is getting halted. So
> > marking PLL_CAM_CSI as critical to prevent disabling.
> >
> > Signed-off-by: Inbaraj E <inbaraj.e=40samsung.com>
> > ---
>=20
> Please add a fixes tag. Although this is likely a band-aid fix because ma=
rking
> something critical leaves it enabled forever.

Sure, will add fixes tag. As per HW manual, this PLL_CAM_CSI is
supplying clock even for CMU SFR access of CSI block, so we can't
gate this.

>=20
> >  drivers/clk/samsung/clk-fsd.c =7C 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/clk/samsung/clk-fsd.c
> > b/drivers/clk/samsung/clk-fsd.c index 6f984cfcd33c..b1764aab9429
> > 100644
> > --- a/drivers/clk/samsung/clk-fsd.c
> > +++ b/drivers/clk/samsung/clk-fsd.c
> > =40=40 -1637,8 +1637,9 =40=40 static const struct samsung_pll_rate_tabl=
e
> > pll_cam_csi_rate_table=5B=5D __initconst  =7D;
> >
> >  static const struct samsung_pll_clock cam_csi_pll_clks=5B=5D __initcon=
st =3D =7B
> > -       PLL(pll_142xx, 0, =22fout_pll_cam_csi=22, =22fin_pll=22,
> > -           PLL_LOCKTIME_PLL_CAM_CSI, PLL_CON0_PLL_CAM_CSI,
> pll_cam_csi_rate_table),
> > +       __PLL(pll_142xx, 0, =22fout_pll_cam_csi=22, =22fin_pll=22,
> > +               CLK_GET_RATE_NOCACHE =7C CLK_IS_CRITICAL,
> > + PLL_LOCKTIME_PLL_CAM_CSI,
>=20
> Please add a comment indicating that this clk can never turn off because
> <insert reason here>.

Sure, will post v2 after adding comment explaining reason behind
marking this clock as critical.

Regards,
Inbaraj E

