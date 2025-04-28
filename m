Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6585E4A35
	for <linux-samsung-soc@vger.kernel.org>; Mon, 28 Apr 2025 10:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745837275; cv=none; b=u+ZqF5AdTc5Gt3Si89U2ZXH460BfoRWtVtpFioxPjKHw9SXsgxBjOqTcEE5R03QvvmjuIHyGQcc5yiWzX5bYTBKwJIws6Ie1MRNAdLr0DiLJgw4kLgf8r/OxJumMnFMvnxZ4q+SnQDSbW6Us3XiIAoIlCjpj+XPnJXYIGrI/xI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745837275; c=relaxed/simple;
	bh=QVj572gl1UZs0yo7wu2GkDp7uDGfaDZCRXtBr1Ehiho=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=Q70oFMQpOIw2b1Ibb/1qNKdi2CwS5rhbqy9wS2rOCmaHSY6nvrd+GLhMz2q9o50bBkSWa07bz+n52lptxfbSDs6rJM9PGtqL74aFotG3Xpwsbdp4rTtILrcNaodNE4gKm3gw/svQjOG3aoNATIWraSRMwAbJSOydQJN+3ZzQC0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=IkmTug4G; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="IkmTug4G"
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250428104750epoutp03bb7e503c726fc5176e3a83fcd899c5b3~6db9i7e0M2894128941epoutp03a
	for <linux-samsung-soc@vger.kernel.org>; Mon, 28 Apr 2025 10:47:50 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250428104750epoutp03bb7e503c726fc5176e3a83fcd899c5b3~6db9i7e0M2894128941epoutp03a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1745837270;
	bh=8/hDEvTARkekh8PU2IM8Bbc0ycSsnAaU7M9v86mcb9g=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=IkmTug4GWjDS0jquDtpySwCDmHQU9T77BLnYrn5D8s4arZiqsQY3Y6BEJHQiLrBh0
	 V6oqQxBlmvgqNtEdjw6P0UkvkdnpeK0yTARAcWjOzR41z2mCC+24jXjnIU0qkj1aYw
	 am1co3wuqJk9zeTnmfzyPCcQYK9ErVqo0N8+SR+o=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPS id
	20250428104749epcas2p33b751cc01acf6536b552f3033408d2f2~6db9Dodrm1471414714epcas2p3L;
	Mon, 28 Apr 2025 10:47:49 +0000 (GMT)
Received: from epcas2p4.samsung.com (unknown [182.195.36.70]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4ZmKsd43pZz6B9m4; Mon, 28 Apr
	2025 10:47:49 +0000 (GMT)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20250428104748epcas2p30878b575c575cf1643e18c5a3262bdf2~6db8BcP2V1471414714epcas2p3J;
	Mon, 28 Apr 2025 10:47:48 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250428104748epsmtrp25e9dc72661f9d5c0aa2e9aa4a42d17a0~6db8AhQj_1596115961epsmtrp2U;
	Mon, 28 Apr 2025 10:47:48 +0000 (GMT)
X-AuditID: b6c32a29-55afd7000000223e-6f-680f5cd49a7b
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	2C.2E.08766.4DC5F086; Mon, 28 Apr 2025 19:47:48 +0900 (KST)
Received: from KORCO115296 (unknown [12.36.150.221]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250428104748epsmtip266684e1bd6f04a2318d1a81135e35c24~6db7zResW1682516825epsmtip2B;
	Mon, 28 Apr 2025 10:47:48 +0000 (GMT)
From: =?UTF-8?B?7IaQ7Iug?= <shin.son@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, "'Sylwester Nawrocki'"
	<s.nawrocki@samsung.com>, "'Chanwoo Choi'" <cw00.choi@samsung.com>, "'Alim
 Akhtar'" <alim.akhtar@samsung.com>, "'Michael Turquette'"
	<mturquette@baylibre.com>, "'Stephen Boyd'" <sboyd@kernel.org>, "'Rob
 Herring'" <robh@kernel.org>, "'Conor Dooley'" <conor+dt@kernel.org>,
	"'Sunyeal Hong'" <sunyeal.hong@samsung.com>
Cc: <linux-samsung-soc@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
In-Reply-To: <a3438b8b-0fd2-454f-a539-39aa7cfcd57b@kernel.org>
Subject: RE: [PATCH 2/3] clk: samsung: exynosautov920: add cpucl1/2 clock
 support
Date: Mon, 28 Apr 2025 19:47:48 +0900
Message-ID: <02d901dbb82a$fb7493a0$f25dbae0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 15.0
Thread-Index: AQJbASRnoWq0F4GjHT9tcwPYQHtTxAJlNrzkAk/ocBIDccya67J5G+NQ
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrOIsWRmVeSWpSXmKPExsWy7bCSvO6VGP4Mg9cPNC0ezNvGZrFm7zkm
	i+tfnrNazD9yjtXi/PkN7BabHl9jtfjYc4/V4vKuOWwWM87vY7K4eMrV4v+eHewWh9+0s1r8
	u7aRxaJp2XomBz6P9zda2T02repk89i8pN6jb8sqRo/Pm+QCWKO4bFJSczLLUov07RK4Mt40
	TGEtaBasWL/nGmsD42S+LkZODgkBE4kJJzaydTFycQgJ7GaUaPuynAUiISFxeMYERghbWOJ+
	yxFWiKLnjBILf95kA0mwCRhKrPqxnQkkISIwkVni0ocLLCAOs8AmRolzu29CzX3PKHHpxn6w
	uZwCdhKL5qwEs4UFAiVadx9jBbFZBFQl7v85CmbzClhKPFnbxAZhC0qcnPkErJ5ZQFui92Er
	I4QtL7H97RxmiPsUJHZ/gugVEXCTeL1sJVS9iMTszjbmCYzCs5CMmoVk1Cwko2YhaVnAyLKK
	UTK1oDg3PbfYsMAwL7Vcrzgxt7g0L10vOT93EyM4LrU0dzBuX/VB7xAjEwfjIUYJDmYlEd4q
	A/4MId6UxMqq1KL8+KLSnNTiQ4zSHCxK4rziL3pThATSE0tSs1NTC1KLYLJMHJxSDUzRS2Uf
	Xkvny2mt6b25QHLRLvN9MUET3Y07hE4q53C94fsa1fX4v7fqQcfa6SunO+Tnx9+0Kbx7WC7R
	WWXdiaUJmY+Su1af9Ph/+mO9t+FCxxZ+z/kOXzzO7dR02lKzvTGzuunOl/vh4gcuzjqgWu60
	VCpI7FWFcO4u60fXEtP776hx81r/OPNYnWPj+q3KRxfFnBc22FgTcqHB5GZ1jcDK2M9Kj+KZ
	Z65LqLo4QcB6o/wB7+0tLocOl4Qf9S77UxnqzcylvCJ4xdnTP67tjvhqI2qfdf6leAyzn4rh
	yfUuS9Z9nN3Nezxi+o00/swrXgK6RzYFM3w6+btefzZLE091Qf2MSKFnRSos0+tLFymxFGck
	GmoxFxUnAgB3Cq3qOgMAAA==
X-CMS-MailID: 20250428104748epcas2p30878b575c575cf1643e18c5a3262bdf2
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250428084728epcas2p17a0253f04de15c23ab6362113a0d47bb
References: <20250428084721.3832664-1-shin.son@samsung.com>
	<CGME20250428084728epcas2p17a0253f04de15c23ab6362113a0d47bb@epcas2p1.samsung.com>
	<20250428084721.3832664-3-shin.son@samsung.com>
	<a3438b8b-0fd2-454f-a539-39aa7cfcd57b@kernel.org>

Hello, Krzysztof Kozlowski.

> -----Original Message-----
> From: Krzysztof Kozlowski [mailto:krzk@kernel.org]
> Sent: Monday, April 28, 2025 6:15 PM
> To: Shin Son <shin.son@samsung.com>; Sylwester Nawrocki
> <s.nawrocki@samsung.com>; Chanwoo Choi <cw00.choi@samsung.com>; Alim
> Akhtar <alim.akhtar@samsung.com>; Michael Turquette
> <mturquette@baylibre.com>; Stephen Boyd <sboyd@kernel.org>; Rob Herring
> <robh@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Sunyeal Hong
> <sunyeal.hong@samsung.com>
> Cc: linux-samsung-soc@vger.kernel.org; linux-clk@vger.kernel.org;
> devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
> kernel@vger.kernel.org
> Subject: Re: [PATCH 2/3] clk: samsung: exynosautov920: add cpucl1/2 clock
> support
> 
> On 28/04/2025 10:47, Shin Son wrote:
> > Register compatible and cmu_info data to support clock CPUCL1/2 (CPU
> > Cluster 1 and CPU Cluster 2), these provide clock for
> > CPUCL1/2_SWTICH/CLUSTER.
> >
> > These clocks are required early during boot for the CPUs, so they are
> > declared using CLK_OF_DECLARE instead of being registered through a
> > platform driver.
> >
> > Signed-off-by: Shin Son <shin.son@samsung.com>
> > ---
> >  drivers/clk/samsung/clk-exynosautov920.c | 208
> > ++++++++++++++++++++++-
> >  1 file changed, 207 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/clk/samsung/clk-exynosautov920.c
> > b/drivers/clk/samsung/clk-exynosautov920.c
> > index 8021e0912e50..f8168eed4a66 100644
> > --- a/drivers/clk/samsung/clk-exynosautov920.c
> > +++ b/drivers/clk/samsung/clk-exynosautov920.c
> > @@ -18,7 +18,9 @@
> >
> >  /* NOTE: Must be equal to the last clock ID increased by one */
> >  #define CLKS_NR_TOP			(DOUT_CLKCMU_TAA_NOC + 1)
> > -#define CLKS_NR_CPUCL0			(CLK_DOUT_CLUSTER0_PERIPHCLK + 1)
> > +#define CLKS_NR_CPUCL0			(CLK_DOUT_CPUCL0_NOCP + 1)
> 
> 
> You just added that line a week ago and it is already incorrect? Then it
> needs patch on its own explaining what are you fixing.
> 
> 
> Best regards,
> Krzysztof

Understood. I will separate the fix into its own patch and resend it.

Best regards,
Shin Son

