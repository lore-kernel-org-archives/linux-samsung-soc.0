Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83259B67D
	for <linux-samsung-soc@vger.kernel.org>; Tue,  1 Oct 2024 09:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727774786; cv=none; b=jgNdTwchl418tgaulJo++ZQAleUv7IQR0kTTWZUWFjVxdH+yysK+43NBnf68pP4PxofUtD/1RPjwOuwLDUpZFNN0ZFdIoUAciSGvepVmGZ+Ixq2CmZzDfVGiLEYe1ZDgsRla9uD8AmXGGW+w4G7dMM0cYekGyC2xcMXei8FqthU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727774786; c=relaxed/simple;
	bh=8KIr8c0ryeTX0ItSMQoDRRqktHwk49XiMkLG1N1m/v8=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=tTDfmDPq69krn1MRUUqtI56rp9h7JbaUSbby614f9GePILuuXrBugs7/QsVOqla8I188bo0zZuPGrp/QinXEnejup8HCyiUPMWqgpbRiIH8Lz47Q/d4OMOimn5jy+wszdbC6Ixo2jWfOs6SGZcx60aF69qeOsr6rEFMHG4ibqiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=uc3r7U4k; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="uc3r7U4k"
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20241001092617epoutp0128c511fdc86a46d9e5a80d41feef22d6~6SgF0vFub0690506905epoutp01a
	for <linux-samsung-soc@vger.kernel.org>; Tue,  1 Oct 2024 09:26:17 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20241001092617epoutp0128c511fdc86a46d9e5a80d41feef22d6~6SgF0vFub0690506905epoutp01a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1727774777;
	bh=uEV7AKekCPqeEJnBRs0q31kqOMH6sTgLv47MuznncBY=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=uc3r7U4ka/FpByJHvbucEip1sX3VwM7UKkENQ0zI/+1pe9vWnfjz2FRvUBEBAheeL
	 e2AzKQTx3axK2JeQ9x31PKpMH8b8kJ68rj+qqnNvJCbo22Xb36IAfWELTsWGZWJksl
	 c5PrFTmtU4vQhZrsBVE1P+TAY3u6ognYksUDuZAo=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTP id
	20241001092616epcas5p1f746a3355f44e3ac588bb08ac96fb6da~6SgFIAaPP2097520975epcas5p1W;
	Tue,  1 Oct 2024 09:26:16 +0000 (GMT)
Received: from epsmges5p3new.samsung.com (unknown [182.195.38.181]) by
	epsnrtp4.localdomain (Postfix) with ESMTP id 4XHsxy1rTGz4x9Pw; Tue,  1 Oct
	2024 09:26:14 +0000 (GMT)
Received: from epcas5p4.samsung.com ( [182.195.41.42]) by
	epsmges5p3new.samsung.com (Symantec Messaging Gateway) with SMTP id
	9D.08.09800.630CBF66; Tue,  1 Oct 2024 18:26:14 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20241001092437epcas5p220d68d2b7aeeda4f766e4c83c7c9e79a~6SepGB6Ha0604706047epcas5p27;
	Tue,  1 Oct 2024 09:24:37 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20241001092437epsmtrp144171194025493dde8b4dd0f78c40c98~6SepFV66K2044120441epsmtrp1K;
	Tue,  1 Oct 2024 09:24:37 +0000 (GMT)
X-AuditID: b6c32a4b-23fff70000002648-36-66fbc036f9b0
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	2D.B2.08229.5DFBBF66; Tue,  1 Oct 2024 18:24:37 +0900 (KST)
Received: from FDSFTE196 (unknown [107.116.189.214]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20241001092435epsmtip2a711f1c09bcaa3ec1ef771a9d53a1818~6SenhES3P1396013960epsmtip2_;
	Tue,  1 Oct 2024 09:24:35 +0000 (GMT)
From: "Inbaraj E" <inbaraj.e@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, "'Stephen Boyd'"
	<sboyd@kernel.org>, <alim.akhtar@samsung.com>, <cw00.choi@samsung.com>,
	<linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-samsung-soc@vger.kernel.org>, <mturquette@baylibre.com>,
	<s.nawrocki@samsung.com>
Cc: <pankaj.dubey@samsung.com>, <gost.dev@samsung.com>
In-Reply-To: <1c6c56f7-bdda-4e14-9910-80e0cda0d631@kernel.org>
Subject: RE: [PATCH] clk: samsung: fsd: Mark PLL_CAM_CSI as critical
Date: Tue, 1 Oct 2024 14:54:34 +0530
Message-ID: <03ca01db13e3$bc12e360$3438aa20$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQMYu0UT7KgXFJ9p8WqzYl/+4ytJPAKVNCMjAc9ECZkCVSVjTgGurbUsAUVIpqkCfYGRoa+U+ARQ
Content-Language: en-in
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrBJsWRmVeSWpSXmKPExsWy7bCmlq7Zgd9pBpO6uC0ezNvGZnH9y3NW
	i5sHdjJZnD+/gd3iY889VovLu+awWcw4v4/J4uIpV4tFW7+wWxx+085q8e/aRhYHbo/3N1rZ
	PTat6mTz6NuyitHj8ya5AJaobJuM1MSU1CKF1Lzk/JTMvHRbJe/geOd4UzMDQ11DSwtzJYW8
	xNxUWyUXnwBdt8wcoKOUFMoSc0qBQgGJxcVK+nY2RfmlJakKGfnFJbZKqQUpOQUmBXrFibnF
	pXnpenmpJVaGBgZGpkCFCdkZl99NZS/YaVCx9e9p5gbGXo0uRk4OCQETibVbjjN3MXJxCAns
	ZpR4u/AHE4TziVHi25vfjBDON0aJyc96GGFaHk+dzg5iCwnsZZRo+yMIUfQSqP1ECxNIgk1A
	U+Lm0X9g3SICS5kkOu/9AOtgFjCT2HL3PmsXIwcHp4CdxOFNgiBhYQEXiRn/LjGD2CwCKhLX
	f0Es4BWwlHjzcD0LhC0ocXLmExaIMdoSyxa+ZoY4SEHi59NlrCC2iECUxILTG9kgasQljv7s
	AftNQmAth8SEzc/YQPZKAC3r2KYC0Sss8er4FnYIW0riZX8blO0jsX/OL6iHMySObV/OCmHb
	Sxy4MocFZAwz0I/rd+lDhGUlpp5axwSxlk+i9/cTJog4r8SOeTC2ssTMI/fZIGxJiZ2Xd7JM
	YFSaheSzWUg+m4Xkg1kI2xYwsqxilEwtKM5NTy02LTDOSy2Hx3dyfu4mRnCS1fLewfjowQe9
	Q4xMHIyHGCU4mJVEeO8d+pkmxJuSWFmVWpQfX1Sak1p8iNEUGNwTmaVEk/OBaT6vJN7QxNLA
	xMzMzMTS2MxQSZz3devcFCGB9MSS1OzU1ILUIpg+Jg5OqQYmWdn37o0uMv6sTN/4g33O9T5g
	uzVvr9KvX/KP1sRWNyqk6lTZHXlp5bbdr8xpW5GBSdP73XvWy2jbTzBpldDi2+dx73Y8d7Hk
	dLYMUz+z1Isp+3MvtjdsLrm5ybYjeNuWkuLFZ7+XaKuvVFj0i5er4NOvDaWBKnzMSlu2dy+9
	yspqd1zxzu5VNSEyRzdm/DKYetJ16cLUPp6DvEYHLwdtUX7duuJS+bv1SROsJ3oqdTotKdAV
	3Z8Sop6dlqgksvhZhk8X/4RFz/4dXtnvPM3z3YkrelF3w/3KVnetmrx2QeKc/hg7cfnbhc1X
	zBQDl8fJTopXPjktbqqI2RKeEw4Gt47PCmr/zHHizqn2k7xKLMUZiYZazEXFiQDJzxhGOwQA
	AA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprAIsWRmVeSWpSXmKPExsWy7bCSvO7V/b/TDF5fl7d4MG8bm8X1L89Z
	LW4e2Mlkcf78BnaLjz33WC0u75rDZjHj/D4mi4unXC0Wbf3CbnH4TTurxb9rG1kcuD3e32hl
	99i0qpPNo2/LKkaPz5vkAliiuGxSUnMyy1KL9O0SuDJm31vFWHBAv6J/8gnmBsY29S5GTg4J
	AROJx1Ons3cxcnEICexmlFi5/jYrREJSYvZvkASILSyx8t9zMFtI4DmjxIuVVSA2m4CmxM2j
	/xhBmkUE1jJJdGxfyQiSYBawkFj+5zobREMDs8SNZ+VdjBwcnAJ2Eoc3CYKEhQVcJGb8u8QM
	YrMIqEhc/wWxi1fAUuLNw/UsELagxMmZT1ggRmpL9D5sZYSxly18zQxxm4LEz6fLwG4WEYiS
	WHB6IxtEjbjE0Z89zBMYhWchGTULyahZSEbNQtKygJFlFaNkakFxbnpusWGBYV5quV5xYm5x
	aV66XnJ+7iZGcKRpae5g3L7qg94hRiYOxkOMEhzMSiK89w79TBPiTUmsrEotyo8vKs1JLT7E
	KM3BoiTOK/6iN0VIID2xJDU7NbUgtQgmy8TBKdXAdPBG743lvjt0/n5z+sptWfPvNut5luhb
	vQFRfge3KN96/O5+hq5E2IPDZ8r0rmfO0jvOEiPEuEf01SblOcpuu3eG7LX+bHf7UywP//2p
	/nnzTu0Ovjzt35rJfLdmpDNfsL+95e77uTJZM3wWGS++tWH7+dSvoevOsTKKTdnK+9jyjPMu
	oY9irgEX50gEXua+3b1JNeRWZdGzQ27Ps8tMy5uP7WNXz58/TbfsJ8/RuAdbBasc718Qed5g
	e3y5iKlbvP5UDeM+hrdBElxXimJOl7UGSy/qqdec/YB7+/6aNWc+3JrZoidc+0bp2YzWlp7N
	iUKRqx2fLN/Z4XnYp+fgDM4XjFf/9FzN5/DKtt++YYISS3FGoqEWc1FxIgAYZuEZIwMAAA==
X-CMS-MailID: 20241001092437epcas5p220d68d2b7aeeda4f766e4c83c7c9e79a
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



> -----Original Message-----
> From: Krzysztof Kozlowski <krzk=40kernel.org>
> Sent: 20 September 2024 18:07
> To: Inbaraj E <inbaraj.e=40samsung.com>; 'Stephen Boyd'
> <sboyd=40kernel.org>; alim.akhtar=40samsung.com; cw00.choi=40samsung.com;
> linux-clk=40vger.kernel.org; linux-kernel=40vger.kernel.org; linux-samsun=
g-
> soc=40vger.kernel.org; mturquette=40baylibre.com; s.nawrocki=40samsung.co=
m
> Cc: pankaj.dubey=40samsung.com; gost.dev=40samsung.com
> Subject: Re: =5BPATCH=5D clk: samsung: fsd: Mark PLL_CAM_CSI as critical
>=20
> On 20/09/2024 06:15, Inbaraj E wrote:
> >
> >
> >> -----Original Message-----
> >> From: Inbaraj E <inbaraj.e=40samsung.com>
> >> Sent: 20 September 2024 09:35
> >> To: 'Krzysztof Kozlowski' <krzk=40kernel.org>; 'Stephen Boyd'
> >> <sboyd=40kernel.org>; 'alim.akhtar=40samsung.com'
> >> <alim.akhtar=40samsung.com>; 'cw00.choi=40samsung.com'
> >> <cw00.choi=40samsung.com>; 'linux-clk=40vger.kernel.org' <linux-
> >> clk=40vger.kernel.org>; 'linux-kernel=40vger.kernel.org' <linux-
> >> kernel=40vger.kernel.org>; 'linux-samsung-soc=40vger.kernel.org' <linu=
x-
> >> samsung-soc=40vger.kernel.org>; 'mturquette=40baylibre.com'
> >> <mturquette=40baylibre.com>; 's.nawrocki=40samsung.com'
> >> <s.nawrocki=40samsung.com>
> >> Cc: 'pankaj.dubey=40samsung.com' <pankaj.dubey=40samsung.com>;
> >> 'gost.dev=40samsung.com' <gost.dev=40samsung.com>
> >> Subject: RE: =5BPATCH=5D clk: samsung: fsd: Mark PLL_CAM_CSI as critic=
al
> >>
> >>
> >>
> >>> -----Original Message-----
> >>> From: Krzysztof Kozlowski <krzk=40kernel.org>
> >>> Sent: 19 September 2024 17:33
> >>> To: Inbaraj E <inbaraj.e=40samsung.com>; 'Stephen Boyd'
> >>> <sboyd=40kernel.org>; alim.akhtar=40samsung.com;
> >> cw00.choi=40samsung.com;
> >>> linux-clk=40vger.kernel.org; linux-kernel=40vger.kernel.org;
> >>> linux-samsung- soc=40vger.kernel.org; mturquette=40baylibre.com;
> >>> s.nawrocki=40samsung.com
> >>> Cc: pankaj.dubey=40samsung.com; gost.dev=40samsung.com
> >>> Subject: Re: =5BPATCH=5D clk: samsung: fsd: Mark PLL_CAM_CSI as criti=
cal
> >>>
> >>> On 19/09/2024 13:33, Inbaraj E wrote:
> >>>>
> >>>>
> >>>>> -----Original Message-----
> >>>>> From: Stephen Boyd <sboyd=40kernel.org>
> >>>>> Sent: 19 September 2024 15:51
> >>>>> To: Inbaraj E <inbaraj.e=40samsung.com>; alim.akhtar=40samsung.com;
> >>>>> cw00.choi=40samsung.com; krzk=40kernel.org; linux-
> clk=40vger.kernel.org;
> >>>>> linux- kernel=40vger.kernel.org; linux-samsung-soc=40vger.kernel.or=
g;
> >>>>> mturquette=40baylibre.com; s.nawrocki=40samsung.com
> >>>>> Cc: pankaj.dubey=40samsung.com; gost.dev=40samsung.com; Inbaraj E
> >>>>> <inbaraj.e=40samsung.com>
> >>>>> Subject: Re: =5BPATCH=5D clk: samsung: fsd: Mark PLL_CAM_CSI as
> >>>>> critical
> >>>>>
> >>>>> Quoting Inbaraj E (2024-09-17 03:10:16)
> >>>>>> PLL_CAM_CSI is the parent clock for the ACLK and PCLK in the
> >>>>>> CMU_CAM_CSI block. When we gate ACLK or PCLK, the clock
> >> framework
> >>>>> will
> >>>>>> subsequently disables the parent clocks(PLL_CAM_CSI). Disabling
> >>>>>> PLL_CAM_CSI is causing sytem level halt.
> >>>>>>
> >>>>>> It was observed on FSD SoC, when we gate the ACLK and PCLK
> during
> >>>>>> CSI stop streaming through pm_runtime_put system is getting
> halted.
> >>>>>> So marking PLL_CAM_CSI as critical to prevent disabling.
> >>>>>>
> >>>>>> Signed-off-by: Inbaraj E <inbaraj.e=40samsung.com>
> >>>>>> ---
> >>>>>
> >>>>> Please add a fixes tag. Although this is likely a band-aid fix
> >>>>> because marking something critical leaves it enabled forever.
> >>>>
> >>>> Sure, will add fixes tag. As per HW manual, this PLL_CAM_CSI is
> >>>> supplying clock even for CMU SFR access of CSI block, so we can't
> >>>> gate this.
> >>>
> >>> Hm, I am not so sure. The CMU driver should just take appropriate clo=
ck.
> >>> Sprinkling CLK_CRITICAL looks as substitute of missing clock
> >>> handling/
> >>
> >> As per HW design, PLL_CAM_CSI is responsible for suppling clock to
> >> CSI SFR, CMU SFR and some internal block of CAM_CSI. In this some of
> >> the clock is not handled by any driver but it is required for CSI to
> >> work properly. For example CSI NOC clock. So this is the reason we are
> marking PLL_CAM_CSI as critical.
> >>
> >
> > This is clock hierarchy for CMU_CAM_CSI block.
> >
> > PLL_CAM_CSI -----> DIVIDER --------> CSI_SFR clock
> > 			=7C
> > 			=7C----> DIVIDER --------> CMU_SFR clock
> > 			=7C
> > 			=7C----> DIVIDER --------> CSI NOC clock.
> >
>=20
> And what is the problem in adding proper handling in the driver? You just
> described case valid for 99% of SoC components.

Hi Kryzstof,

Sorry, but it seems I was not able to explain the issue. Let me add more
details:
So for CSI IP we have two clocks as ACLK and PCLK which needs to be
handled by the driver during start and stop streaming.=20

In BLK_CSI we have CSI IP along with other bunch supporting modules such
as CMU_CSI, NOC_CSI, CSI_SFR. For all these components of BLK_CSI we have
a single top level parent PLL clock as PLL_CAM_CSI.=20

Now if we look into CSI driver perspective it needs only ACLK and PCLK
clocks for it's operations. But to access CMU SFRs (including ACLK/PCLK
or any other CMU SFR of BLK_CSI) we need parent clock keep supplying=20
clocks. While we try to gate ACLK clock, due to propagation logic of clock
gating the CCF scans all the clocks from leaf level to the parent clock
and tries to gate clocks if enable/disable ops is valid for any such
clock.=20

Issue here is that we are trying to gate PLL_CAM_CSI which itself is
accessible only when this clock is enabled. In fact none of CMU_SFR will
be accessible as soon as PLL_CAM_CSI is gated. CSI driver is not intended
to gate this PLL clock but only the leaf level clock which is supplying to
CSI IP. So in absence of any alternate source of clock hierarchy which
can supply clock for CMU_CSI we can't gate PLL_CAM_CSI.=20

Please let us know if you have any other queries why we are insisting on
marking PLL_CAM_CSI as CRITICAL clock.

Regards,
Inbaraj E

>=20
> Best regards,
> Krzysztof


