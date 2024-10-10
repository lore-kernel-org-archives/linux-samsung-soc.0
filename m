Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A62C547A60
	for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Oct 2024 10:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728557396; cv=none; b=EEo/dvokah3o56d8lZ10djTLHVWMRvqR9L/OM064MkaZhrLeAo9Co0QsZoZ7fJlxK82PvcvouJqy7sIs+niN6Eq6Nd+k++IVWbT8EG9CoMBe3yAl2maveS8hSGUNRFJ9JCHt5IDujNphzBTGvqyhJWSG+RGEG2qGCR2VrkMMpmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728557396; c=relaxed/simple;
	bh=iMXkWNY0bNQiK/qpWqcYtLcQ5QR2FQuA0xFLkiCEBYY=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=H0573Yi4n8a/YAZ7ZdcSHXwhX++ciKehcKmb2EN16h0xu2Awgx7xTWPqesP6/cc5I01nyWp8XEnrWyjece2bbRj/W7GOoj74gfnTwpvgiD06ZzXOnkY4rFHscnmOtR79U8veHjaiV2epTdh96jTqg41hBPF7OJw6ENzXIcOVFYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=WW35KARi; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="WW35KARi"
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20241010104950epoutp02622d698df79c1525d20cd54961c48658~9EcndXTG32477924779epoutp02Y
	for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Oct 2024 10:49:50 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20241010104950epoutp02622d698df79c1525d20cd54961c48658~9EcndXTG32477924779epoutp02Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1728557390;
	bh=yaB9itcDCiaaIcwDZvNEYBezr6d2OLBDCgCbD010Qfk=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=WW35KARikKErMTLLQaUmbiWQw5c1I8g88JWIl674IHRBrkVffSz0aKxWsWSLQbj0I
	 LG0f8j+/XgO1NVTh9tLcg00M+G50AUl9lKUp3y3HXI9pFRLCZjP9IqpQ1oiDvI4R39
	 G9qje+0dY9U7uQPFY/oT4HUr34mMGJah/eK+k5ic=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTP id
	20241010104950epcas5p4652a31c14bbb7849027c6d8333e931bb~9Ecm8uhkP3218632186epcas5p4q;
	Thu, 10 Oct 2024 10:49:50 +0000 (GMT)
Received: from epsmges5p1new.samsung.com (unknown [182.195.38.174]) by
	epsnrtp3.localdomain (Postfix) with ESMTP id 4XPRND2hnVz4x9Pw; Thu, 10 Oct
	2024 10:49:48 +0000 (GMT)
Received: from epcas5p2.samsung.com ( [182.195.41.40]) by
	epsmges5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	7A.45.09420.C41B7076; Thu, 10 Oct 2024 19:49:48 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20241010104554epcas5p19fa883f33168b2742738e8edcf1f836a~9EZLkRH-22586025860epcas5p1O;
	Thu, 10 Oct 2024 10:45:54 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20241010104554epsmtrp2160f811a65734e82a61728cee45e78be~9EZLjbKzs2675126751epsmtrp2b;
	Thu, 10 Oct 2024 10:45:54 +0000 (GMT)
X-AuditID: b6c32a49-0d5ff700000024cc-c0-6707b14cc17b
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	5C.2C.07371.260B7076; Thu, 10 Oct 2024 19:45:54 +0900 (KST)
Received: from FDSFTE196 (unknown [107.116.189.214]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20241010104552epsmtip1f5e87c940987a831806f878b5943e0b7~9EZJ76xC_2499324993epsmtip1b;
	Thu, 10 Oct 2024 10:45:52 +0000 (GMT)
From: "Inbaraj E" <inbaraj.e@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, "'Stephen Boyd'"
	<sboyd@kernel.org>, <alim.akhtar@samsung.com>, <cw00.choi@samsung.com>,
	<linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-samsung-soc@vger.kernel.org>, <mturquette@baylibre.com>,
	<s.nawrocki@samsung.com>
Cc: <pankaj.dubey@samsung.com>, <gost.dev@samsung.com>
In-Reply-To: <2b3566dd-71ac-4ef7-abdc-524277879aa6@kernel.org>
Subject: RE: [PATCH] clk: samsung: fsd: Mark PLL_CAM_CSI as critical
Date: Thu, 10 Oct 2024 16:15:51 +0530
Message-ID: <08d001db1b01$94a9b9f0$bdfd2dd0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQMYu0UT7KgXFJ9p8WqzYl/+4ytJPAKVNCMjAc9ECZkCVSVjTgGurbUsAUVIpqkCfYGRoQL0rVzSAfBMA4ivfAuNkA==
Content-Language: en-in
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrJJsWRmVeSWpSXmKPExsWy7bCmhq7PRvZ0g+2feS0ezNvGZnH9y3NW
	i5sHdjJZnD+/gd3iY889VovLu+awWcw4v4/J4uIpV4tFW7+wWxx+085q8e/aRhYHbo/3N1rZ
	PTat6mTz6NuyitHj8ya5AJaobJuM1MSU1CKF1Lzk/JTMvHRbJe/geOd4UzMDQ11DSwtzJYW8
	xNxUWyUXnwBdt8wcoKOUFMoSc0qBQgGJxcVK+nY2RfmlJakKGfnFJbZKqQUpOQUmBXrFibnF
	pXnpenmpJVaGBgZGpkCFCdkZf7d0MxVMVq64P8u/gfGLdBcjJ4eEgInEkR3dzF2MXBxCArsZ
	JWbMnMoC4XxilDhz5ykjhPONUWJ/22EmmJb9tyZDtexllNh5s58NwnnJKHFo3wZWkCo2AU2J
	m0f/gbWLCCxlkui894MdJMEsYCax5e59sCJOATuJDw0bwOLCAi4SM/5dAhrLwcEioCqxaIYL
	SJhXwFJi2uMTrBC2oMTJmU9YIMZoSyxb+JoZ4iIFiZ9Pl4HViAhkSRzb/ACqRlzi6M8esEsl
	BJZySKw/dIURosFF4tnBvVDNwhKvjm9hh7ClJD6/28sGYftI7J/zC6o+Q+LY9uWsELa9xIEr
	c1hA7mQGenL9Ln2IsKzE1FPrmCD28kn0/n4CDS1eiR3zYGxliZlH7kONl5TYeXknywRGpVlI
	XpuF5LVZSF6YhbBtASPLKkbJ1ILi3PTUYtMCw7zUcniEJ+fnbmIEp1ktzx2Mdx980DvEyMTB
	eIhRgoNZSYRXdyFruhBvSmJlVWpRfnxRaU5q8SFGU2BwT2SWEk3OByb6vJJ4QxNLAxMzMzMT
	S2MzQyVx3tetc1OEBNITS1KzU1MLUotg+pg4OKUamILybAIEvxXvVT4reuODm0y7413x3Osn
	1nPFXvf/y+XfIVumy7tg+c15si0ll9i33tD9/aE3Vb/L6HB7Fatm/fUOPw+nXX4O7L80396+
	wXO8iOurxJ6K/2uC9Ff8CmFyZ06Jzm3ZtUDwivLyShXD5ndriwV1vs37+zAiWcNJ+11CesAb
	vrO/snNmxti/iPDiz1rHJsSiP/mGMPORKIZoz+izzhwNmQHHv6kuOVImWnUn1qGkcrOy8pHQ
	gz9V010XPN4ueiZc9bPWgtv/vkU2MDj+fdVlLBYv77r/zPTtr9ts+Wfl9je+O1mRcmRH8gq/
	yY7zF3B6/ZosVP3ESWLLle173wgkvy4oVOc4cWWJEktxRqKhFnNRcSIAZELxqDwEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprIIsWRmVeSWpSXmKPExsWy7bCSnG7SBvZ0g/urpCwezNvGZnH9y3NW
	i5sHdjJZnD+/gd3iY889VovLu+awWcw4v4/J4uIpV4tFW7+wWxx+085q8e/aRhYHbo/3N1rZ
	PTat6mTz6NuyitHj8ya5AJYoLpuU1JzMstQifbsErozfdwsLupUrLq7dxdbAeEO6i5GTQ0LA
	RGL/rcnMXYxcHEICuxkl/vz6wQiRkJSY/Xs6O4QtLLHy33N2iKLnjBITuyewgSTYBDQlbh79
	xwiSEBFYyyTRsX0lWDezgIXE8j/X2SA6HjBL9P35DpbgFLCT+NCwAWyssICLxIx/l4B2c3Cw
	CKhKLJrhAhLmFbCUmPb4BCuELShxcuYTFoiZ2hK9D1sZYexlC18zQ1ynIPHz6TKwehGBLIlj
	mx9A1YtLHP3ZwzyBUXgWklGzkIyahWTULCQtCxhZVjFKphYU56bnJhsWGOallusVJ+YWl+al
	6yXn525iBMealsYOxnvz/+kdYmTiYDzEKMHBrCTCq7uQNV2INyWxsiq1KD++qDQntfgQozQH
	i5I4r+GM2SlCAumJJanZqakFqUUwWSYOTqkGJse2a8ebvn6KK7/86AGXypZ0vv0H/uZw3dod
	XlZ/vE4x5pXQqxksnI9/6d+VZyoLvSN6w8xF+f6OBqd7nz8eyPQ7JappMu2eqKSlS3SwYv16
	xkAFEecnLR8+GV7qC2ZZ8NblzfLUNRLZxbXCzEZ8LDtlNdpufnr8vS5x45/oy86Wjze/+HCD
	s73rbILD8U+dBXvsy/5f+GeywmtO/DvWX2lhbSdZ3S2uTin9yiXCufajvnzr9d7fC08Uf90y
	Izr4rGjGx5J/jusPNThe9eee9Pf00icPt28VO6Jx0ZRzg8qem7/PMK1/oO1/a9umD08d4mrr
	JGQO+qb0noyoN34sLPiDfRef6zKlw0K1pl6Py5VYijMSDbWYi4oTATGQXK8kAwAA
X-CMS-MailID: 20241010104554epcas5p19fa883f33168b2742738e8edcf1f836a
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
	<00f001db0a87$cd9ddfa0$68d99ee0$@samsung.com>
	<633ff284-101d-4651-833e-a6b01626c9a1@kernel.org>
	<011401db0b13$cbd045f0$6370d1d0$@samsung.com>
	<1c6c56f7-bdda-4e14-9910-80e0cda0d631@kernel.org>
	<03ca01db13e3$bc12e360$3438aa20$@samsung.com>
	<2b3566dd-71ac-4ef7-abdc-524277879aa6@kernel.org>



> -----Original Message-----
> From: Krzysztof Kozlowski <krzk=40kernel.org>
> Sent: 01 October 2024 15:30
> To: Inbaraj E <inbaraj.e=40samsung.com>; 'Stephen Boyd'
> <sboyd=40kernel.org>; alim.akhtar=40samsung.com; cw00.choi=40samsung.com;
> linux-clk=40vger.kernel.org; linux-kernel=40vger.kernel.org; linux-samsun=
g-
> soc=40vger.kernel.org; mturquette=40baylibre.com; s.nawrocki=40samsung.co=
m
> Cc: pankaj.dubey=40samsung.com; gost.dev=40samsung.com
> Subject: Re: =5BPATCH=5D clk: samsung: fsd: Mark PLL_CAM_CSI as critical
>=20
> On 01/10/2024 11:24, Inbaraj E wrote:
> >>>>>>>> CSI stop streaming through pm_runtime_put system is getting
> >> halted.
> >>>>>>>> So marking PLL_CAM_CSI as critical to prevent disabling.
> >>>>>>>>
> >>>>>>>> Signed-off-by: Inbaraj E <inbaraj.e=40samsung.com>
> >>>>>>>> ---
> >>>>>>>
> >>>>>>> Please add a fixes tag. Although this is likely a band-aid fix
> >>>>>>> because marking something critical leaves it enabled forever.
> >>>>>>
> >>>>>> Sure, will add fixes tag. As per HW manual, this PLL_CAM_CSI is
> >>>>>> supplying clock even for CMU SFR access of CSI block, so we can't
> >>>>>> gate this.
> >>>>>
> >>>>> Hm, I am not so sure. The CMU driver should just take appropriate
> clock.
> >>>>> Sprinkling CLK_CRITICAL looks as substitute of missing clock
> >>>>> handling/
> >>>>
> >>>> As per HW design, PLL_CAM_CSI is responsible for suppling clock to
> >>>> CSI SFR, CMU SFR and some internal block of CAM_CSI. In this some
> >>>> of the clock is not handled by any driver but it is required for
> >>>> CSI to work properly. For example CSI NOC clock. So this is the
> >>>> reason we are
> >> marking PLL_CAM_CSI as critical.
> >>>>
> >>>
> >>> This is clock hierarchy for CMU_CAM_CSI block.
> >>>
> >>> PLL_CAM_CSI -----> DIVIDER --------> CSI_SFR clock
> >>> 			=7C
> >>> 			=7C----> DIVIDER --------> CMU_SFR clock
> >>> 			=7C
> >>> 			=7C----> DIVIDER --------> CSI NOC clock.
> >>>
> >>
> >> And what is the problem in adding proper handling in the driver? You
> >> just described case valid for 99% of SoC components.
> >
> > Hi Kryzstof,
> >
> > Sorry, but it seems I was not able to explain the issue. Let me add
> > more
> > details:
> > So for CSI IP we have two clocks as ACLK and PCLK which needs to be
> > handled by the driver during start and stop streaming.
> >
> > In BLK_CSI we have CSI IP along with other bunch supporting modules
> > such as CMU_CSI, NOC_CSI, CSI_SFR. For all these components of BLK_CSI
> > we have a single top level parent PLL clock as PLL_CAM_CSI.
> >
> > Now if we look into CSI driver perspective it needs only ACLK and PCLK
> > clocks for it's operations. But to access CMU SFRs (including
> > ACLK/PCLK or any other CMU SFR of BLK_CSI) we need parent clock keep
> > supplying clocks. While we try to gate ACLK clock, due to propagation
> > logic of clock gating the CCF scans all the clocks from leaf level to
> > the parent clock and tries to gate clocks if enable/disable ops is
> > valid for any such clock.
> >
> > Issue here is that we are trying to gate PLL_CAM_CSI which itself is
> > accessible only when this clock is enabled. In fact none of CMU_SFR
> > will be accessible as soon as PLL_CAM_CSI is gated. CSI driver is not
> > intended
>=20
> Obviously, but your CMU is taking the necessary clock and enabled it so w=
hat
> is the problem?
>=20
> > to gate this PLL clock but only the leaf level clock which is
> > supplying to CSI IP. So in absence of any alternate source of clock
> > hierarchy which can supply clock for CMU_CSI we can't gate PLL_CAM_CSI.
> >
> > Please let us know if you have any other queries why we are insisting
> > on marking PLL_CAM_CSI as CRITICAL clock.
>=20
> This is so far quite obvious - just like in all other cases, you need the=
 top clock
> taken by proper driver. I don't think you are looking at right drivers an=
d right
> problem here.
>=20

Hi Krzysztof,

In this case, platform driver need to get this PLL clock and keep it
enabled always. As PLL_CAM_CSI is source clock for accessing CMU
registers of CSI block, and PLL_CAM_CSI itself lies in CSI_CMU,
driver need to prepare and keep it enabled always. This way other PCLK
and ACLK clocks can be gated. But the PLL_CAM_CSI which is parent of the
PCLK and ACLK gate clock won't be disabled. Hope this should not be a
concern.=20

Regards,
Inbaraj E

> Best regards,
> Krzysztof


