Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 441BA770FE
	for <linux-samsung-soc@vger.kernel.org>; Mon,  8 Jul 2024 11:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720437220; cv=none; b=g700OyTOD3YevQK3aZBHiwuffbjemz3CT6FWykFCVuatxzBsZQCr+sHwBs2643z9Z82YjIX3K+B+9O0CbmMS0mujmritfJldGINjTCxXWw7xl4Pt1CumnFewSoBOsBwJTDQaBS6vSbZzBf4OwYkOqWhgZXt/kZwMZcTtOdaN8AU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720437220; c=relaxed/simple;
	bh=51PRd3yDC5bHxq5JaOGYIPHqn175gZ4Fn2qBTR/FM94=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=VGP1T5sChLUrj93kZiXsCv2kyC5VgF7gvaA/tC9q/BTkKs/Zhv9vdsDdF2qVQPYOqZT5Y9wTe0EimzlWWfwwwCABOTCisimzdXzA20MLRQL7DJL3HxZ//WaGFFbg7IAyBqFTpxFUidMTxNCddrpOtSqMhxrYDaf3VxEBDuh+aOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=okIDcvAN; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="okIDcvAN"
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20240708111335epoutp023be550e67e16a0118216519b2c42cd44~gOIhIPYRg2930629306epoutp02U
	for <linux-samsung-soc@vger.kernel.org>; Mon,  8 Jul 2024 11:13:35 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20240708111335epoutp023be550e67e16a0118216519b2c42cd44~gOIhIPYRg2930629306epoutp02U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1720437215;
	bh=ROfVGGZWGqup1XDHbJbSzzM7UC2MvL7xcAukBtR4Hg4=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=okIDcvANgJLQGin++XxqQtlFMHQ3eK6L/Y2MB05x6XfjJJTxGhSod9Fv4/GmbT+LZ
	 BqOcsY5Zm+P2bfHspZ0+23R8/8tilsyKIUucg2PH059URB2GpQAdCcH2kB9Tq2s7Rt
	 tIFxBol46H82sJXl1CBhvO3VZokicYaJ/NLSx0og=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTP id
	20240708111335epcas2p31bb058938cd8aa055e868c1b1186a2c5~gOIgvlxmP1871518715epcas2p3r;
	Mon,  8 Jul 2024 11:13:35 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.36.100]) by
	epsnrtp4.localdomain (Postfix) with ESMTP id 4WHhM24rXMz4x9Pq; Mon,  8 Jul
	2024 11:13:34 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
	epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
	26.3A.09848.ED9CB866; Mon,  8 Jul 2024 20:13:34 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20240708111334epcas2p3c6cb1a6726996ad4392c00ebc0a2e03b~gOIfzoOsO1351613516epcas2p3H;
	Mon,  8 Jul 2024 11:13:34 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20240708111334epsmtrp15615792528d3181260fc2ff58aafaf17~gOIfythEv3023330233epsmtrp1q;
	Mon,  8 Jul 2024 11:13:34 +0000 (GMT)
X-AuditID: b6c32a45-447fe70000002678-ab-668bc9def90f
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	76.20.29940.DD9CB866; Mon,  8 Jul 2024 20:13:33 +0900 (KST)
Received: from [10.229.8.168] (unknown [10.229.8.168]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20240708111333epsmtip1dc328a84c0f7643e96fcb6365aeefd92~gOIfa3D7y3118131181epsmtip1S;
	Mon,  8 Jul 2024 11:13:33 +0000 (GMT)
Message-ID: <c4343994-bd0a-0786-964c-5d564393be7d@samsung.com>
Date: Mon, 8 Jul 2024 20:13:16 +0900
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
	Thunderbird/102.11.0
Subject: Re: [PATCH v2 4/4] clk: samsung: add top clock support for Exynos
 Auto v920 SoC
Content-Language: en-US
To: Sunyeal Hong <sunyeal.hong@samsung.com>, Krzysztof Kozlowski
	<krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi
	<cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, Michael
	Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob
	Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
From: Jaewon Kim <jaewon02.kim@samsung.com>
In-Reply-To: <20240707231331.3433340-5-sunyeal.hong@samsung.com>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrBJsWRmVeSWpSXmKPExsWy7bCmue69k91pBveeKls8mLeNzWLN3nNM
	Fte/PGe1mH/kHKvF+fMb2C02Pb7GavGx5x6rxeVdc9gsZpzfx2Rx8ZSrxf89O9gtDr9pZ7X4
	d20ji0XTsvVMDnwe72+0sntsWtXJ5rF5Sb1H35ZVjB6fN8kFsEZl22SkJqakFimk5iXnp2Tm
	pdsqeQfHO8ebmhkY6hpaWpgrKeQl5qbaKrn4BOi6ZeYA3amkUJaYUwoUCkgsLlbSt7Mpyi8t
	SVXIyC8usVVKLUjJKTAv0CtOzC0uzUvXy0stsTI0MDAyBSpMyM7o3nGWpeAsb8WpHd1sDYyr
	ubsYOTkkBEwkjh3ewAZiCwnsYJR42iAEYX9ilDj/O66LkQvI/sYose3BfBaYhq4HrUwQib2M
	EhsPvGOGcF4zSizf+YwRpIpXwE5i89I1YB0sAioSvc+nMkHEBSVOznwCFhcViJZoXXYfbLWw
	QJTEu9P72EFsZgFxiVtP5oNtEBF4yiRx5kIXG4jDLLCEUWL76TPMIFVsAtoS39cvZgWxOQUc
	JN7NuMEE0S0vsf3tHLCTJAQOcEj0zdvGCnG4i8Sp7d1QTwhLvDq+hR3ClpJ42d8GZedLtF05
	A2XXSGxccIkRwraXWHTmJ1CcA2iBpsT6XfogpoSAssSRWywQa/kkOg7/ZYcI80p0tAlBNKpJ
	3J96jg3ClpGYdGQlE4TtIbH86CumCYyKs5CCZRaS92cheWYWwt4FjCyrGMVSC4pz01OLjQoM
	4ZGdnJ+7iRGchLVcdzBOfvtB7xAjEwfjIUYJDmYlEd7Tj9vThHhTEiurUovy44tKc1KLDzGa
	AiNnIrOUaHI+MA/klcQbmlgamJiZGZobmRqYK4nz3mudmyIkkJ5YkpqdmlqQWgTTx8TBKdXA
	pLXUvUM8vLn+7JFsvQ11IfzVl/7+eySubsy/eDP7KoMNXysLigveZuYd0fye/yeZT37+JkFG
	teZ7njeFRT7+urtr2iJeCZUnNwpcin3uhD+6abF550mdaG+1qJD3U8oe9XB8OvN2W79PybpD
	GZ+O/Gx0Wm344nmGsWqFvd3+mYd+Fyjzqpypj25ZuUxmi283d5r3vEcGDV8OVP5iubxe3sq1
	ZuI5xv1TU6vWveZn0NNt23kp5te9HF+RgiNzUiyDYva9kmTL+Vt0hz3zGBN30EIbSwmfgLZv
	rGZM/e525xaIVx1yVWFbE7GVvyP5tzpTnteexiPz7q5M5FlWobVNXEFDSfEk14HN+hev3GVT
	YinOSDTUYi4qTgQAzzrdGksEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprFIsWRmVeSWpSXmKPExsWy7bCSnO69k91pBrNdLB7M28ZmsWbvOSaL
	61+es1rMP3KO1eL8+Q3sFpseX2O1+Nhzj9Xi8q45bBYzzu9jsrh4ytXi/54d7BaH37SzWvy7
	tpHFomnZeiYHPo/3N1rZPTat6mTz2Lyk3qNvyypGj8+b5AJYo7hsUlJzMstSi/TtErgyunec
	ZSk4y1txakc3WwPjau4uRk4OCQETia4HrUxdjFwcQgK7GSV6Zz1ihUjISCx/1scGYQtL3G85
	wgpR9JJR4v+NL8wgCV4BO4nNS9ewgNgsAioSvc+nMkHEBSVOznwCFhcViJZY/fkC2FBhgSiJ
	d6f3sYPYzALiEreezAfbLCLwkkni1Y4/LCAOs8ASRoljm3ZB3XSSUeLj3c1g69gEtCW+r18M
	NopTwEHi3YwbTBCjzCS6tnYxQtjyEtvfzmGewCg0C8kls5BsnIWkZRaSlgWMLKsYJVMLinPT
	c4sNCwzzUsv1ihNzi0vz0vWS83M3MYKjT0tzB+P2VR/0DjEycTAeYpTgYFYS4T39uD1NiDcl
	sbIqtSg/vqg0J7X4EKM0B4uSOK/4i94UIYH0xJLU7NTUgtQimCwTB6dUA5OouSrriklbpz69
	Y2Fkeef345MdwY8WzE1M4VuZ1HBv3gFFO56KAMZfCyd6O69fIPJYMEKz0FmAb2+P1MqG0Pmr
	7DfwvC/fop8SvTNDIfgKe/3RtQucL0w7w80TXTBp21EW5WT9BYa3DDkTD+5kX/KT78pdQ/H5
	a9vm/0xL/fEqJESwfeJ1hvI7khlPc9aXXj421SQs6rz7TzHFrk2TA2csZn+Yt523cqXZ2a+n
	Li2Tmjrx1I7nwVy2Ku/MS4+7VH+76RgoccYhmPUBr8eGD/1yK2ttjm1juyNwkTPMzGOqNAOb
	0sZpXOuXp9dKexeKMjlOPSApe+z/l5MiWzyUBP84OT/eJHk+f3taY1Ca4BwlluKMREMt5qLi
	RACKqEgrLQMAAA==
X-CMS-MailID: 20240708111334epcas2p3c6cb1a6726996ad4392c00ebc0a2e03b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240707231445epcas2p3f7d7412f507fa21493de6db04f7b5c7a
References: <20240707231331.3433340-1-sunyeal.hong@samsung.com>
	<CGME20240707231445epcas2p3f7d7412f507fa21493de6db04f7b5c7a@epcas2p3.samsung.com>
	<20240707231331.3433340-5-sunyeal.hong@samsung.com>

Hi Sunyeal


On 7/8/24 08:13, Sunyeal Hong wrote:
> This adds support for CMU_TOP which generates clocks for all the
> function blocks such as CORE, HSI0/1/2, PERIC0/1 and so on. For
> CMU_TOP, PLL_SHARED0,1,2,3,4 and 5 will be the sources of this block
> and they will generate bus clocks.
>
> Signed-off-by: Sunyeal Hong <sunyeal.hong@samsung.com>
> ---
>   drivers/clk/samsung/Makefile             |    1 +
>   drivers/clk/samsung/clk-exynosautov920.c | 1173 ++++++++++++++++++++++
>   2 files changed, 1174 insertions(+)
>   create mode 100644 drivers/clk/samsung/clk-exynosautov920.c
>
> diff --git a/drivers/clk/samsung/Makefile b/drivers/clk/samsung/Makefile
> index 3056944a5a54..f704b0e11d08 100644
> --- a/drivers/clk/samsung/Makefile
> +++ b/drivers/clk/samsung/Makefile
> @@ -25,3 +25,4 @@ obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-gs101.o
>   obj-$(CONFIG_S3C64XX_COMMON_CLK)	+= clk-s3c64xx.o
>   obj-$(CONFIG_S5PV210_COMMON_CLK)	+= clk-s5pv210.o clk-s5pv210-audss.o
>   obj-$(CONFIG_TESLA_FSD_COMMON_CLK)	+= clk-fsd.o
> +obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynosautov920.o

Must be sorted alphabetically.

plz move below clk-exynosautov9

> diff --git a/drivers/clk/samsung/clk-exynosautov920.c b/drivers/clk/samsung/clk-exynosautov920.c
> new file mode 100644
> index 000000000000..c24353bc04b7
> --- /dev/null
> +++ b/drivers/clk/samsung/clk-exynosautov920.c
> @@ -0,0 +1,1173 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2024 Samsung Electronics Co., Ltd.
> + * Author: Sunyeal Hong <sunyeal.hong@samsung.com>
> + *
> + * Common Clock Framework support for ExynosAuto V9 SoC.

There is some type.

(V9 -> V920)


Thanks
Jaewon Kim

