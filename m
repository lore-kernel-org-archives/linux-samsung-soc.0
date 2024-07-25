Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C844687
	for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Jul 2024 01:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721870923; cv=none; b=sOPKLNAuYWWeb/yZCATRa2yRilILtRlqY30iLONUyngzaBL0ABkQQD+kww1d+ynYG2cJDo9gMLb4ZyD2nprEkXZbatiW+QUJcce5X70VU5+EBCcgvmZWVq965aA+bySX14763h8IOMptX0oG+wbeJBVuMbhf5gYCJz37gete1Y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721870923; c=relaxed/simple;
	bh=93QoUvYNpaXjf/oi4/5ZnzIKnjE+RDQO+G2+qlbiUpY=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=kagZlcOBotyolr1A0y4vy1msn+d35CtA/hRBPIHCxsdlkVYlmefs0wrmFlWiWJE7aBH2g39BtZfPpj8/wztSSXWqUm1hcpSCgHfzKZASohrDQ5y7Zs4WWQxEGe4YbQnEyp0xrb39cxN7Y9ww+UKWxBbNwWe4VvlSBn7t5sJv+dY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=SQ37MeMx; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="SQ37MeMx"
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20240725012838epoutp03ec87ebe129407c7b6c4dc3ac5ab6f167~lUHpXZZhZ1737517375epoutp03m
	for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Jul 2024 01:28:38 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20240725012838epoutp03ec87ebe129407c7b6c4dc3ac5ab6f167~lUHpXZZhZ1737517375epoutp03m
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1721870918;
	bh=eYXPHhdClqTMdVTqA66Qfhv5w8dRduzyKPjbIZb4jUw=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=SQ37MeMx2K3QfurkxveQDYzA94Ak8Vc77aQLKaet8WfVNkNp6xRDjUq23K3NhzZlQ
	 iVW9WYP4RSbpqFjMc3XdCmOlpsuG6L1lbSAGdKJG4HDH+E/qfXLPPnyBngr59J9RO2
	 yb9wck8Iur9Z7LIm+vIwnpMwE85UX1vLkC21NfTM=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTP id
	20240725012838epcas2p4de7572a55604a9d19ad45e8f8c65a139~lUHo9ITPn2511725117epcas2p47;
	Thu, 25 Jul 2024 01:28:38 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.36.90]) by
	epsnrtp2.localdomain (Postfix) with ESMTP id 4WTtZF5m9kz4x9Q0; Thu, 25 Jul
	2024 01:28:37 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
	epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
	90.B9.10012.54AA1A66; Thu, 25 Jul 2024 10:28:37 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
	20240725012836epcas2p29e970d29dec0926032eb8f7e215ea784~lUHnf_4uM1436914369epcas2p2N;
	Thu, 25 Jul 2024 01:28:36 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20240725012836epsmtrp2ee2b3c5afa655f4a784157b420ae7059~lUHnfGxRH1878218782epsmtrp2M;
	Thu, 25 Jul 2024 01:28:36 +0000 (GMT)
X-AuditID: b6c32a47-ea1fa7000000271c-ba-66a1aa45d6d8
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	27.4B.08456.44AA1A66; Thu, 25 Jul 2024 10:28:36 +0900 (KST)
Received: from KORCO118965 (unknown [10.229.18.201]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20240725012836epsmtip12b44db21ef24a84496629d7283188584~lUHnQAQRg1203912039epsmtip12;
	Thu, 25 Jul 2024 01:28:36 +0000 (GMT)
From: "sunyeal.hong" <sunyeal.hong@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, "'Sylwester Nawrocki'"
	<s.nawrocki@samsung.com>, "'Chanwoo Choi'" <cw00.choi@samsung.com>, "'Alim
 Akhtar'" <alim.akhtar@samsung.com>, "'Michael Turquette'"
	<mturquette@baylibre.com>, "'Stephen Boyd'" <sboyd@kernel.org>, "'Rob
 Herring'" <robh@kernel.org>, "'Conor Dooley'" <conor+dt@kernel.org>
Cc: <linux-samsung-soc@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
In-Reply-To: <73922d54-2fb2-480b-a2af-1b1454429d52@kernel.org>
Subject: RE: [PATCH v4 2/4] arm64: dts: exynos: add initial CMU clock nodes
 in ExynosAuto v920
Date: Thu, 25 Jul 2024 10:28:36 +0900
Message-ID: <035701dade31$f8815440$e983fcc0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQKlY5hu3bVCnsOExtpi/jJA6pOgwAIK48nRASeT9zcBnRCPFrBLH7ug
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrKJsWRmVeSWpSXmKPExsWy7bCmqa7rqoVpBt8OaFg8mLeNzWLN3nNM
	Fte/PGe1mH/kHKvF+fMb2C02Pb7GavGx5x6rxeVdc9gsZpzfx2Rx8ZSrxf89O9gtDr9pZ7X4
	d20jiwOvx/sbrewem1Z1snlsXlLv0bdlFaPH501yAaxR2TYZqYkpqUUKqXnJ+SmZeem2St7B
	8c7xpmYGhrqGlhbmSgp5ibmptkouPgG6bpk5QCcqKZQl5pQChQISi4uV9O1sivJLS1IVMvKL
	S2yVUgtScgrMC/SKE3OLS/PS9fJSS6wMDQyMTIEKE7Izpt/+yF5wkL+ia+od5gbGPTxdjJwc
	EgImEvv2XmDqYuTiEBLYwSjxu2shM4TziVHi/dwD7BDON0aJ1ztvssO0vO29yQiR2MsocfHE
	bKj+l4wS/64dBatiE9CXWN19mw0kISJwh0ni8vQ3YLOYBdYxSmyeeQSsilPATuLlo7NsILaw
	QILEi+9PWUBsFgFViY5Pu4FqODh4BSwlHi4oAwnzCghKnJz5BKyEWUBbYtnC18wQJylI/Hy6
	jBXEFhFwk2ib/4QJokZEYnZnG9hDEgInOCQOrXjLBtHgInH630uoZmGJV8e3QP0mJfH53V6o
	mnyJydffMkE0NzBKXPvXDdVgL7HozE+w45gFNCXW79IHMSUElCWO3IK6jU+i4/Bfdogwr0RH
	mxBEo5rEpyuXoYbISBw78Yx5AqPSLCSfzULy2SwkH8xC2LWAkWUVo1hqQXFuemqxUYExPLqT
	83M3MYLTr5b7DsYZbz/oHWJk4mA8xCjBwawkwvvk1dw0Id6UxMqq1KL8+KLSnNTiQ4ymwKCe
	yCwlmpwPzAB5JfGGJpYGJmZmhuZGpgbmSuK891rnpggJpCeWpGanphakFsH0MXFwSjUweXFy
	tJXE2ryacdeCVaT49d6F+8Wfxn94+Cq3KO1bY9DCpyZfby2tknVb/cmVuYJ506WNVz4vf2/4
	f4WfKk+S1Ck5ecfVLuuNRGTTIw+dyHvxLClj8x+1eQL/ZnEuYClLkfJwiA5ZqTkz9vC6PAvJ
	2SbH/vX+iOU6u//qtsf7dx1dPSt3ed3lnayq2+r4Zwn5z31j+vOLUIbTjgOxStwLHkx8ppts
	dHfq85OHnhc/3f4tf+GVrzY7NOIig9w+My05p3HldO39iJ2SPfejsxe9Tkt3MXM/51Ua13cr
	7QnPoQcxxXs7Go002ZJ681XKb3/m2a8zS/vkmrln865ZfM24VJj3acYjy9oQtXdTvuk85Vdi
	Kc5INNRiLipOBADofneHSAQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrIIsWRmVeSWpSXmKPExsWy7bCSnK7LqoVpBh8a9S0ezNvGZrFm7zkm
	i+tfnrNazD9yjtXi/PkN7BabHl9jtfjYc4/V4vKuOWwWM87vY7K4eMrV4v+eHewWh9+0s1r8
	u7aRxYHX4/2NVnaPTas62Tw2L6n36NuyitHj8ya5ANYoLpuU1JzMstQifbsEroztj5awF7zn
	q+iZcJ61gfEVdxcjJ4eEgInE296bjF2MXBxCArsZJfb+nsAGkZCR2Njwnx3CFpa433KEFaLo
	OaPE16+tjCAJNgF9idXdt9lAEiICj5gkph/5xA7iMAtsYpQ4t/smG0TLd0aJK19awWZxCthJ
	vHx0FmyHsECcxNUFV1lBbBYBVYmOT7uBajg4eAUsJR4uKAMJ8woISpyc+YQFxGYW0JbofQix
	GcRetvA1M8R5ChI/ny4DGyMi4CbRNv8JE0SNiMTszjbmCYzCs5CMmoVk1Cwko2YhaVnAyLKK
	UTK1oDg3PbfYsMAoL7Vcrzgxt7g0L10vOT93EyM4FrW0djDuWfVB7xAjEwfjIUYJDmYlEd4n
	r+amCfGmJFZWpRblxxeV5qQWH2KU5mBREuf99ro3RUggPbEkNTs1tSC1CCbLxMEp1cAU2x0Y
	9jlm1cqALrsP+9av7zZfFfaioG+uUG7O5/gCs5TT7O/mGltqnGVLL126pLDs2DR3p7bVe3tN
	Dd47h3w0/W307OqkuWaXv7Quk92+Y7fERamrH7La3sW9MgiZXhHQtjkwnjl5VuD7gNWfDnxR
	un2qbf6e64bWZ5NUWWKc1Y9134+/r1NT8yWN6cMG26BDz3nTIn8dFmuo0pGSkb+vvm3J9ldt
	VvMPt10P4r7bUGC7VSL4vqs1++S964Nm7rrJtqCov9Mi1XiTnHzX/sYmUbGX1mHV81grplk2
	ZXBFPzzb2H/8rmUgu7nK6hIV5v3zrG9EKv+dv/DLzhVxZ9c7TWKO6CnlljtsMqvlxT4lluKM
	REMt5qLiRACgz1mrNAMAAA==
X-CMS-MailID: 20240725012836epcas2p29e970d29dec0926032eb8f7e215ea784
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240722223341epcas2p1b08b47cfefa981a2b31aad7878e3db64
References: <20240722223333.1137947-1-sunyeal.hong@samsung.com>
	<CGME20240722223341epcas2p1b08b47cfefa981a2b31aad7878e3db64@epcas2p1.samsung.com>
	<20240722223333.1137947-3-sunyeal.hong@samsung.com>
	<73922d54-2fb2-480b-a2af-1b1454429d52@kernel.org>

Hello Krzysztof,

> -----Original Message-----
> From: Krzysztof Kozlowski <krzk=40kernel.org>
> Sent: Wednesday, July 24, 2024 7:14 PM
> To: Sunyeal Hong <sunyeal.hong=40samsung.com>; Sylwester Nawrocki
> <s.nawrocki=40samsung.com>; Chanwoo Choi <cw00.choi=40samsung.com>; Alim
> Akhtar <alim.akhtar=40samsung.com>; Michael Turquette
> <mturquette=40baylibre.com>; Stephen Boyd <sboyd=40kernel.org>; Rob Herri=
ng
> <robh=40kernel.org>; Conor Dooley <conor+dt=40kernel.org>
> Cc: linux-samsung-soc=40vger.kernel.org; linux-clk=40vger.kernel.org;
> devicetree=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org; lin=
ux-
> kernel=40vger.kernel.org
> Subject: Re: =5BPATCH v4 2/4=5D arm64: dts: exynos: add initial CMU clock
> nodes in ExynosAuto v920
>=20
> On 23/07/2024 00:33, Sunyeal Hong wrote:
> > Add cmu_top, cmu_peric0 clock nodes and switch USI clocks instead of
> > dummy fixed-rate-clock.
> >
> > Signed-off-by: Sunyeal Hong <sunyeal.hong=40samsung.com>
>=20
> Thank you for your patch. There is something to discuss/improve.
>=20
> >  	cpus: cpus =7B
> >  		=23address-cells =3D <2>;
> >  		=23size-cells =3D <0>;
> > =40=40 -182,6 +172,28 =40=40 chipid=4010000000 =7B
> >  			reg =3D <0x10000000 0x24>;
> >  		=7D;
> >
> > +		cmu_peric0: clock-controller=4010800000 =7B
> > +			compatible =3D =22samsung,exynosautov920-cmu-peric0=22;
> > +			reg =3D <0x10800000 0x8000>;
> > +			=23clock-cells =3D <1>;
> > +
> > +			clocks =3D <&xtcxo>,
> > +				 <&cmu_top DOUT_CLKCMU_PERIC0_NOC>,
> > +				 <&cmu_top DOUT_CLKCMU_PERIC0_IP>;
> > +			clock-names =3D =22oscclk=22,
> > +				      =22noc=22,
> > +				      =22ip=22;
> > +		=7D;
> > +
> > +		cmu_top: clock-controller=4011000000 =7B
>=20
> This does not look ordered. Please read DTS coding style.
>=20
I will modify it by referring to the Order of Nodes item in the dts coding =
style guide document.

> Best regards,
> Krzysztof

Thanks,
Sunyeal Hong.


