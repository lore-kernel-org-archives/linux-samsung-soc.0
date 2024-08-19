Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FCB815E5A6
	for <linux-samsung-soc@vger.kernel.org>; Mon, 19 Aug 2024 09:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724059954; cv=none; b=UUbkyDW286OQqKmhqG1Wkf6ff6jt5zZ32yz1YHz06/JF/heAkKQnhpRgCArbTnQ3IwVfe2eGfOX6KjF9o05W4ayKiprVvrayKcgjFxbO2RAYId6RAaxFWVJLjUi7cYNw9AHQv//k2qfktMZdERJIM8V+whZ2ycnXsLUPBJ5bsTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724059954; c=relaxed/simple;
	bh=y8FykAMCJQYb6V318MYDx5Syo5CHN0Ic/kpPbjonFI4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:MIME-Version:
	 Content-Type:References; b=CqqefFqIOqRny0u8AflKBQWKp+ZILJkkI03ZO1btlcuXe137707+2OJms9ZaVQe8c0nA9h74OKjkyiTWar2OmOA8aewVSxYGy492HgBj5f8fLw2+amTWMHisnhGcvRnTSkkzr2IBlk7XYhtTIi7VVNxGYc85F1SebRwEdLACNs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=K0jhXwOw; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="K0jhXwOw"
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20240819093230epoutp03aab09e9219aadc20ffa49b1940f91449~tF2PgXrkH0541305413epoutp034
	for <linux-samsung-soc@vger.kernel.org>; Mon, 19 Aug 2024 09:32:30 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20240819093230epoutp03aab09e9219aadc20ffa49b1940f91449~tF2PgXrkH0541305413epoutp034
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1724059950;
	bh=v6JcaDQvF7fnOy6LUz32eC5Yk1ca9Qh8Q9FuzWwFM5A=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=K0jhXwOwpazrnl9sBoQLSX9oPY574vci3DlgUrrL6qMVNclDH/87K77xV95ZtW4fw
	 NljgZ/Py7n7aQd9E9mVyxGFHZkIZ6UcMpJZkDeubDWQdHK1DePqEyYvrjjnB4pYSum
	 weMJ98JmWgFwbtU3LQCttVWCS8HhM/BXegPmeEl4=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
	epcas1p1.samsung.com (KnoxPortal) with ESMTP id
	20240819093229epcas1p11822c9de1b260023e3c5f23e0e8eb1bf~tF2Ox9MSR1392813928epcas1p1_;
	Mon, 19 Aug 2024 09:32:29 +0000 (GMT)
Received: from epsmges1p1.samsung.com (unknown [182.195.38.232]) by
	epsnrtp3.localdomain (Postfix) with ESMTP id 4WnS702pgCz4x9Pt; Mon, 19 Aug
	2024 09:32:28 +0000 (GMT)
Received: from epcas1p2.samsung.com ( [182.195.41.46]) by
	epsmges1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
	28.C9.09734.C2113C66; Mon, 19 Aug 2024 18:32:28 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
	20240819093227epcas1p3b744262db1ccf2d8735bdb0824b281e0~tF2NbIpXW0813608136epcas1p3B;
	Mon, 19 Aug 2024 09:32:27 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20240819093227epsmtrp2ab990302a791842a0208ad6eaa05aaf9~tF2NaQfJk2819928199epsmtrp2j;
	Mon, 19 Aug 2024 09:32:27 +0000 (GMT)
X-AuditID: b6c32a35-babff70000002606-94-66c3112cf518
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	37.BE.08456.B2113C66; Mon, 19 Aug 2024 18:32:27 +0900 (KST)
Received: from [10.113.111.204] (unknown [10.113.111.204]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20240819093227epsmtip164fcf2177353f5dc2e1e9f1eb6794b88~tF2NCe3at0330503305epsmtip1d;
	Mon, 19 Aug 2024 09:32:27 +0000 (GMT)
Message-ID: <7f77dcc41173f2a20a0264b6242ecdac6ea85ad9.camel@samsung.com>
Subject: Re: [PATCH v6 4/4] clk: samsung: add top clock support for
 ExynosAuto v920 SoC
From: Kwanghoon Son <k.son@samsung.com>
To: Sunyeal Hong <sunyeal.hong@samsung.com>, Krzysztof Kozlowski
	<krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi
	<cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, Michael
	Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob
	Herring <robh@kernel.org>,  Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Mon, 19 Aug 2024 18:32:27 +0900
In-Reply-To: <20240819052416.2258976-5-sunyeal.hong@samsung.com>
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrAJsWRmVeSWpSXmKPExsWy7bCmnq6O4OE0gxW3BCwezNvGZrFm7zkm
	i+tfnrNazD9yjtXi/PkN7BabHl9jtfjYc4/V4vKuOWwWM87vY7K4eMrV4v+eHewWh9+0s1r8
	u7aRxaJp2XomBz6P9zda2T02repk89i8pN6jb8sqRo/Pm+QCWKOybTJSE1NSixRS85LzUzLz
	0m2VvIPjneNNzQwMdQ0tLcyVFPISc1NtlVx8AnTdMnOA7lRSKEvMKQUKBSQWFyvp29kU5ZeW
	pCpk5BeX2CqlFqTkFJgW6BUn5haX5qXr5aWWWBkaGBiZAhUmZGc0TJ7NUtAgXDGz7RVTA+NR
	gS5GTg4JAROJJ88PsHYxcnEICexglLjedYMNJCEk8IlRYv+leojEN0aJ1o7z7DAd599+YYRI
	7GWU+DRhOhOE855R4s/8R6wgVbwCHhLn/n5hArGFBSIlni64wQxiswmoSyxpW8sO0iAi8IxJ
	4tSjT2DLmQWWMkpMunINbDmLgKpE6+nXLF2MHBycAg4SvxuSQMLMAtoSyxa+BhskKiAv0fDw
	BDPEMkGJkzOfsIDMkRBYyyFxZ8tmVohbXSSe7b8JZQtLvDq+BeoHKYnP7/ayQdjZEkc/wtgl
	EtdnLYKqN5bYv3QyE8gNzAKaEut36UPcwCfx7msPK0hYQoBXoqNNCMKUl7jVWQ7RKCpx5ulH
	Noiwh8SNldDQPcko8aN9D9sERvlZSJ6ZheSBWQi7FjAyr2IUSy0ozk1PLTYsMIRHanJ+7iZG
	cFLVMt3BOPHtB71DjEwcjIcYJTiYlUR4u18eTBPiTUmsrEotyo8vKs1JLT7EaAoM0YnMUqLJ
	+cC0nlcSb2hiaWBiZmRsYmFoZqgkznvmSlmqkEB6YklqdmpqQWoRTB8TB6dUA5OPV79AxgLx
	QGPLK9t5Fv8LPrqsYcaZWzPvrz/Ne3b6qsxd6rpzskr7Rd3fiFzNbLrQs0Lx7v8rYXq1PEUt
	+ydtT7r/oLT69gmzho6AH0+tDv76dbleUe7TuqnXr762yu9c/iKvuGTthecJnA2XzY4KvxGS
	OnBaW8476dCVTX4ai8+E3Jia/2SSucZWDqb5CgrXK7gyZ/Kd9J9S8sHR69Esnl/XHF7qT6nf
	ccpDPexL5F8GyxnK5cKt172ecMd6dyusvf3E/MzxvDMHp63bq7helb/O8J/Z5XurXji0Gj78
	xH+rnT1pXX7X5ovrt/9+q7Bakrv5Bb/JSa3Dv3ZvyDhq/Gj9pn/iUpf+mZpOZZvUrsRSnJFo
	qMVcVJwIANh0wh0zBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrPLMWRmVeSWpSXmKPExsWy7bCSnK624OE0g81L1S0ezNvGZrFm7zkm
	i+tfnrNazD9yjtXi/PkN7BabHl9jtfjYc4/V4vKuOWwWM87vY7K4eMrV4v+eHewWh9+0s1r8
	u7aRxaJp2XomBz6P9zda2T02repk89i8pN6jb8sqRo/Pm+QCWKO4bFJSczLLUov07RK4MnYf
	/8NW0CtU0b96K2sD4z7+LkZODgkBE4nzb78wdjFycQgJ7GaUODbhNjtEQlSi43IjUIIDyBaW
	OHy4GKLmLaPE3gcHGEFqeAU8JM79/cIEYgsLREo8XXCDGcRmE1CXWNK2lh2kQUTgBZPE/yfL
	WEESzALLGCUW32cBsVkEVCVaT79mAVnAKeAg8bshCSQsJHCaUWLTZxWIck2J1u2/2SFsbYll
	C1+DzRcVkJdoeHiCGeIGQYmTM5+wTGAUnIWkZRaSlllIyhYwMq9ilEwtKM5Nzy02LDDKSy3X
	K07MLS7NS9dLzs/dxAiOIy2tHYx7Vn3QO8TIxMF4iFGCg1lJhLf75cE0Id6UxMqq1KL8+KLS
	nNTiQ4zSHCxK4rzfXvemCAmkJ5akZqemFqQWwWSZODilGpgk/7h/ZLm+VOfglWVdUexrE1b5
	nUtw3KaxI1dnc/UjqYzrkkIras+6/5doFJl//XgtS7hfcO3tzRcNnspxOfBaPLRglCvkcbmr
	P0lw/un32XkaC4M5mhV+e78qPHXDyKjpx8t/VUZzYmNUb/Hqvetu55q3XuRQaMCf332Kj0Ty
	nniI7kjj2+DlLqB5W32v9E2hrM63EzyUf9/3Mlz3IP0lt4G47Vyd+PpLZsbTdrxdtcN3lpjM
	jPZ4EWOOI27H+J9xxwrmO52aauUqaf9le6NI1K27xQp+4s7/Nny6cCy3/Htpo3q4/Rymlm8e
	YgwsT6fPVztw6oZY5HUuzkcp0WdvzJ4zu+VDZMW9jRJ3i5VYijMSDbWYi4oTAbPsFi0SAwAA
X-CMS-MailID: 20240819093227epcas1p3b744262db1ccf2d8735bdb0824b281e0
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240819052422epcas2p258a29e773ebdd60573078c21f7a7da12
References: <20240819052416.2258976-1-sunyeal.hong@samsung.com>
	<CGME20240819052422epcas2p258a29e773ebdd60573078c21f7a7da12@epcas2p2.samsung.com>
	<20240819052416.2258976-5-sunyeal.hong@samsung.com>

On Mon, 2024-08-19 at 14:24 +0900, Sunyeal Hong wrote:
> This adds support for CMU_TOP which generates clocks for all the
> function blocks such as CORE, HSI0/1/2, PERIC0/1 and so on. For
> CMU_TOP, PLL_SHARED0,1,2,3,4 and 5 will be the sources of this block
> and they will generate bus clocks.
>=20
> Signed-off-by: Sunyeal Hong <sunyeal.hong=40samsung.com>
> ---
>  drivers/clk/samsung/Makefile             =7C    1 +
>  drivers/clk/samsung/clk-exynosautov920.c =7C 1173 ++++++++++++++++++++++
>  2 files changed, 1174 insertions(+)
>  create mode 100644 drivers/clk/samsung/clk-exynosautov920.c
>=20
> diff --git a/drivers/clk/samsung/Makefile b/drivers/clk/samsung/Makefile
> index 3056944a5a54..f1ba48758c78 100644
> --- a/drivers/clk/samsung/Makefile
> +++ b/drivers/clk/samsung/Makefile
> =40=40 -21,6 +21,7 =40=40 obj-=24(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+=3D cl=
k-exynos7.o
>  obj-=24(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+=3D clk-exynos7885.o
>  obj-=24(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+=3D clk-exynos850.o
>  obj-=24(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+=3D clk-exynosautov9.o
> +obj-=24(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+=3D clk-exynosautov920.o
>  obj-=24(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+=3D clk-gs101.o
>  obj-=24(CONFIG_S3C64XX_COMMON_CLK)	+=3D clk-s3c64xx.o
>  obj-=24(CONFIG_S5PV210_COMMON_CLK)	+=3D clk-s5pv210.o clk-s5pv210-audss.=
o
> diff --git a/drivers/clk/samsung/clk-exynosautov920.c b/drivers/clk/samsu=
ng/clk-exynosautov920.c
> new file mode 100644
> index 000000000000..c17d25e3c9a0
> --- /dev/null
> +++ b/drivers/clk/samsung/clk-exynosautov920.c

=5Bsnip=5D

> +=7D;
> +
> +static const struct samsung_cmu_info peric0_cmu_info __initconst =3D =7B
> +	.mux_clks		=3D peric0_mux_clks,
> +	.nr_mux_clks		=3D ARRAY_SIZE(peric0_mux_clks),
> +	.div_clks		=3D peric0_div_clks,
> +	.nr_div_clks		=3D ARRAY_SIZE(peric0_div_clks),
> +	.nr_clk_ids		=3D CLKS_NR_PERIC0,
> +	.clk_regs		=3D peric0_clk_regs,
> +	.nr_clk_regs		=3D ARRAY_SIZE(peric0_clk_regs),
> +	.clk_name		=3D =22dout_clkcmu_peric0_noc=22,

same question.
Isn't it =22noc=22?
https://lore.kernel.org/linux-samsung-soc/58dfae564a4a624e464c7803a309f1f07=
b5ae83d.camel=40samsung.com/

In my case(autov9),=C2=A0if=20put=20wrong=20clk_name=20dmesg=20will=20show=
=20that,=0D=0Aexynos_arm64_register_cmu:=20could=20not=20enable=20bus=20clo=
ck=20...;=20err=20=3D=20-2=0D=0A=0D=0AKwang.=0D=0A=0D=0A=0D=0A
