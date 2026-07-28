Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F88F3CC9F2
	for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Jul 2026 12:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785243513; cv=none; b=UW3YsBLC6xVZ+3aIxDH7+Q9E8bOhcD0d1rAZdHl8nl+H71+MPZMjO4yPacfye9wK4ssxAeogJiJJVqz1fDIoXmbn/TKL6BFq/4NNKXDNyYaVoCgKr3tADDSbk8xV+2rAOdwwLA4Es+eZtbBMSGrmvPUbn3jVVFEeeHOZgcip7Ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785243513; c=relaxed/simple;
	bh=OyeMR3cJ8WscoN9OGaEmLNZDYNaijSeGjPRw6L+pOcQ=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=cQXfMGD6pCxPIdztl3i+CGACkVZHJtApwV2GrqiKq7agMH/LLDraGKxJmlBHIBngAfayXbChu7xP6C8tgj+6Xtpymt6RrXzGDPoXFmO+JTnl3cdg/l1rDmK2mA3fHvf2rBFdSH2wg8S8YOuZFJcVBBQNr8AYW9ynfOcRwWF+1Ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=jMwErqVP; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="jMwErqVP"
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20260728125829epoutp013c1045861f7af871fcbb5a348ebcc7f9~GdYNRC2vi3158331583epoutp01F
	for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Jul 2026 12:58:29 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20260728125829epoutp013c1045861f7af871fcbb5a348ebcc7f9~GdYNRC2vi3158331583epoutp01F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1785243509;
	bh=lP8NFI+OyPbuHpmHiNFGcoCPEUIZN9SjQ1oJW+fJU5w=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=jMwErqVPaYU4tg2Pdd4hiH3qtqC/7+zSM7dugheIyDvJKTz9hpPzdqga2rGaHvoE9
	 p4a13nPZy0ZabfrCAxTvmW78fWxVfrPzpzX+4PZH4B8ob6O0NVYPl0WUDFSHDktWAw
	 jr/1ei3zABv0wfGVrpKxrqivB0adp89K203X9544=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20260728125828epcas5p4edd38fced31f7d66d97b9b54ba5e1b47~GdYM0tjCt2003420034epcas5p4b;
	Tue, 28 Jul 2026 12:58:28 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.88]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4h8b9v4mB8z6B9m5; Tue, 28 Jul
	2026 12:58:27 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20260728125827epcas5p48c135e631ddefc9fe2b2252ccebc0ab1~GdYLbRdWe2003420034epcas5p4O;
	Tue, 28 Jul 2026 12:58:27 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20260728125824epsmtip1a9f6f9957fcd7f540921087e09b53790~GdYJAkdYa0610306103epsmtip1P;
	Tue, 28 Jul 2026 12:58:24 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, "'raghav.s'"
	<raghav.s@samsung.com>, <s.nawrocki@samsung.com>, <cw00.choi@samsung.com>,
	<peter.griffin@linaro.org>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<bmasney@redhat.com>, <robh@kernel.org>, <conor+dt@kernel.org>
Cc: <linux-samsung-soc@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <hajun.sung@samsung.com>,
	<is.gandhi@samsung.com>, <ts.amit@samsung.com>, <pokala.reddy@samsung.com>
In-Reply-To: <0c948180-3112-4e92-b752-0015c55fb26c@kernel.org>
Subject: RE: [PATCH 04/13] arm64: dts: exynos8855: add cmu_top & cmu_peric
 clock DT nodes
Date: Tue, 28 Jul 2026 18:28:23 +0530
Message-ID: <079301dd1e90$c7d14ed0$5773ec70$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIRARWKMB8/axP+0I5R2y9G0OYjygMlHcTpAvLC774CITPxwwH7jt1WAdEvQ0+1uu02gA==
Content-Language: en-us
X-CMS-MailID: 20260728125827epcas5p48c135e631ddefc9fe2b2252ccebc0ab1
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260728115256epcas5p38cbcfe68218d08301d237705388e6e62
References: <20260728121111.2077860-1-raghav.s@samsung.com>
	<CGME20260728115256epcas5p38cbcfe68218d08301d237705388e6e62@epcas5p3.samsung.com>
	<20260728121111.2077860-5-raghav.s@samsung.com>
	<8582d4f9-1a78-4f47-bab9-c52393dffbd1@kernel.org>
	<079201dd1e8b$eca22680$c5e67380$@samsung.com>
	<0c948180-3112-4e92-b752-0015c55fb26c@kernel.org>

Hi Krzysztof

> -----Original Message-----
> From: Krzysztof Kozlowski <krzk=40kernel.org>
> Sent: Tuesday, July 28, 2026 5:55 PM
> To: Alim Akhtar <alim.akhtar=40samsung.com>; 'raghav.s'
> <raghav.s=40samsung.com>; s.nawrocki=40samsung.com;
> cw00.choi=40samsung.com; peter.griffin=40linaro.org;
> mturquette=40baylibre.com; sboyd=40kernel.org; bmasney=40redhat.com;
> robh=40kernel.org; conor+dt=40kernel.org
> Cc: linux-samsung-soc=40vger.kernel.org; linux-clk=40vger.kernel.org;
> devicetree=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org; lin=
ux-
> kernel=40vger.kernel.org; hajun.sung=40samsung.com;
> is.gandhi=40samsung.com; ts.amit=40samsung.com;
> pokala.reddy=40samsung.com
> Subject: Re: =5BPATCH 04/13=5D arm64: dts: exynos8855: add cmu_top &
> cmu_peric clock DT nodes
>=20
> On 28/07/2026 14:23, Alim Akhtar wrote:
> > Hi Krzysztof,
> >
> >> -----Original Message-----
> >> From: Krzysztof Kozlowski <krzk=40kernel.org>
> >> Sent: Tuesday, July 28, 2026 5:30 PM
> >> To: raghav.s <raghav.s=40samsung.com>; s.nawrocki=40samsung.com;
> >> cw00.choi=40samsung.com; peter.griffin=40linaro.org;
> >> alim.akhtar=40samsung.com; mturquette=40baylibre.com;
> sboyd=40kernel.org;
> >> bmasney=40redhat.com; robh=40kernel.org; conor+dt=40kernel.org
> >> Cc: linux-samsung-soc=40vger.kernel.org; linux-clk=40vger.kernel.org;
> >> devicetree=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org;
> >> linux- kernel=40vger.kernel.org; hajun.sung=40samsung.com;
> >> is.gandhi=40samsung.com; ts.amit=40samsung.com;
> pokala.reddy=40samsung.com
> >> Subject: Re: =5BPATCH 04/13=5D arm64: dts: exynos8855: add cmu_top &
> >> cmu_peric clock DT nodes
> >>
> >> On 28/07/2026 14:11, raghav.s wrote:
> >>> Add required dt node for cmu_top & cmu_peric block
> >>>
> >>> Signed-off-by: raghav.s <raghav.s=40samsung.com>
> >>> ---
> >>>  arch/arm64/boot/dts/exynos/exynos8855.dtsi =7C 24
> >>> ++++++++++++++++++++++
> >>>  1 file changed, 24 insertions(+)
> >>
> >> Please organize your patches in reasonable order. DTS is never in the
> >> middle, see submitting patches (both documents) and maintainer-soc
> profile.
> >>
> > The thought was to add clks block wise and hence we see DTS coming in
> between but for the other blocks.
> > e.g. patch-2 and 3 adds binding and driver for TOP and PERIC and this p=
atch-
> 4 adds DTS.
> > And patch-5 and 6 adds binding and driver for PERIS and patch-7 adds DT=
S
> and so on.
> >
> > Cover-letter should have explained this.
> >
> > Are you suggesting to re-order all the binding first followed by all bl=
ocks
> driver and then add a single DTS for all clock controller?
> >
> > Does current approach helps in review?
>=20
> If you ask this, you did not read the docs.
>=20
I think I just explain the reason why DTS came in-between for each block.
Probably this series should have been sent in multiple chunks, if not, then=
 as you pointed and docs says DTS to be placed at the end of driver changes=
. Agreed.=20
=20
> Best regards,
> Krzysztof

