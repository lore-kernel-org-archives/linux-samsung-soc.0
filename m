Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A67C3367B61
	for <linux-samsung-soc@vger.kernel.org>; Fri, 31 Jul 2026 06:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785479292; cv=none; b=AGHqK95zTxt68HwV1w2R7ewd6b5jcTNftXjgdZ52Qk4cxOPxdPUNStbtJCll8QfJs+9zgHIyozevFVBfowmnfytH+dISVfijGkv2DEfGowh4usWGZa4KyIINr3JNcViagLdbEI0e13xo8e1sgMlhV6ZgQ6treTly2arhZ/jVRaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785479292; c=relaxed/simple;
	bh=zGYch3/BJvWeKvc1uvKnWDwR/Z7lp+PLPQTFHRhzmao=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=JbveeIUcmROqAh6eOeWW0g7MVPN4mj6LgI63ZhVINjFVHwuOdR02h35f0+JEbY9WM3mgWBK9uQKKAoE0K6qgtjVnamUgRZR8ngtUpiDQEXgolgiPV+Ibum7Kj9wFpUmGEGzN1SSnHsUVauwBaruipOMJh/fb54taDav6dSZ4HSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=U69aHvAn; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="U69aHvAn"
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20260731062808epoutp03f030b86a14d5d42d4531029fe15d7ff9~HS-PtNIBr1330813308epoutp03c
	for <linux-samsung-soc@vger.kernel.org>; Fri, 31 Jul 2026 06:28:08 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20260731062808epoutp03f030b86a14d5d42d4531029fe15d7ff9~HS-PtNIBr1330813308epoutp03c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1785479288;
	bh=TIfe/G3y8DznxsDg++Y9/l5+8bOWnAYzQhK3ZnU/dY4=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=U69aHvAnKAtBK9qtGTDrEGYHgHJXa/vMuXh1ZamM1XXsz4RRFOt6TVWQ4/+bx6Ghp
	 4HDGJ5wR+dgW7FgIUBbOLNwrCuQTFNH/DaSQ4QrrBQBwrstHEseZHcL7vjtzocPewq
	 FVhc3MpFpBK2OUQf3a0carmDifmuIBmsgeQrKLfo=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20260731062807epcas5p39055173e7a2aa9259b60a6fb35fae4a8~HS-Ov_lO21472214722epcas5p3E;
	Fri, 31 Jul 2026 06:28:07 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.87]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4hBGN63z7kz2SSKn; Fri, 31 Jul
	2026 06:28:06 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20260731062805epcas5p284b192877ee85610e28157dba8593c14~HS-NOPIvb2967729677epcas5p2F;
	Fri, 31 Jul 2026 06:28:05 +0000 (GMT)
Received: from INBRO002198 (unknown [107.122.5.156]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20260731062802epsmtip1ccfd7a2dcd6f7a7cc90e30e2c0431977~HS-KqhvVn0207602076epsmtip1W;
	Fri, 31 Jul 2026 06:28:02 +0000 (GMT)
From: "Raghav Sharma" <raghav.s@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, <s.nawrocki@samsung.com>,
	<cw00.choi@samsung.com>, <peter.griffin@linaro.org>,
	<alim.akhtar@samsung.com>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<bmasney@redhat.com>, <robh@kernel.org>, <conor+dt@kernel.org>
Cc: <linux-samsung-soc@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <hajun.sung@samsung.com>,
	<is.gandhi@samsung.com>, <ts.amit@samsung.com>, <pokala.reddy@samsung.com>
In-Reply-To: <b2c668f3-addb-4c82-91c6-56651a601318@kernel.org>
Subject: RE: [PATCH 01/13] clk: samsung: clk-pll: Add supoprt for pll_4313
Date: Fri, 31 Jul 2026 11:58:01 +0530
Message-ID: <04ad01dd20b5$bea55aa0$3bf00fe0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIRARWKMB8/axP+0I5R2y9G0OYjygKrecYYAnZw0bcBYDpv3rXrUEDQ
Content-Language: en-us
X-CMS-MailID: 20260731062805epcas5p284b192877ee85610e28157dba8593c14
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260728115245epcas5p2ffe1f7c31c6dd85161445d61a94e82e6
References: <20260728121111.2077860-1-raghav.s@samsung.com>
	<CGME20260728115245epcas5p2ffe1f7c31c6dd85161445d61a94e82e6@epcas5p2.samsung.com>
	<20260728121111.2077860-2-raghav.s@samsung.com>
	<b2c668f3-addb-4c82-91c6-56651a601318@kernel.org>



> -----Original Message-----
> From: Krzysztof Kozlowski <krzk@kernel.org>
> Sent: Tuesday, July 28, 2026 5:29 PM
> To: raghav.s <raghav.s@samsung.com>; s.nawrocki@samsung.com;
> cw00.choi@samsung.com; peter.griffin@linaro.org;
> alim.akhtar@samsung.com; mturquette@baylibre.com; sboyd@kernel.org;
> bmasney@redhat.com; robh@kernel.org; conor+dt@kernel.org
> Cc: linux-samsung-soc@vger.kernel.org; linux-clk@vger.kernel.org;
> devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
> kernel@vger.kernel.org; hajun.sung@samsung.com;
> is.gandhi@samsung.com; ts.amit@samsung.com;
> pokala.reddy@samsung.com
> Subject: Re: [PATCH 01/13] clk: samsung: clk-pll: Add supoprt for pll_4313
> 
> On 28/07/2026 14:10, raghav.s wrote:
> > From: Alim Akhtar <alim.akhtar@samsung.com>
> >
> > PLLs 4313 are found in the Exynos8855 SoC and it is similar to
> > pll_531x except for CON8 offset, so re-using code for
> > pll_4313
> >
> > Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> > Signed-off-by: raghav.s <raghav.s@samsung.com>
> 
> Looks like name duplicates login.
> 
> Best regards,
> Krzysztof

Hi Krzysztof
Looks like this was an issue with my gitconfig, will fix this
Thanks for pointing out

Regards
Raghav

