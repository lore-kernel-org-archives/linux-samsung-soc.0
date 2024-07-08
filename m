Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 278064D8A9
	for <linux-samsung-soc@vger.kernel.org>; Mon,  8 Jul 2024 10:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720434591; cv=none; b=NPbp4bp1+stPWN4A2GCSp+xqycEhNUTvO7A+2AuFPS6VjS1rztO2rAGlpDm1ghEn+fitJIGG3xuZhH6eMa7U9CsbRDJ9O29MIWdPdAjD5rb54ipn7ZaPhRrs7LJ6Y9Oj/ToM0eO3fqqONmrjk8+aM/fYK5QhRdtT15Gi6uCFpYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720434591; c=relaxed/simple;
	bh=/ZvJTvcmE9aPETbkJhWmhgYarZUd7/0YkdrdOi3MJJI=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=A1/OWYXjAkwgaUGFXrbtYNvgJHaQCinaKkaPjysnsd3946IOkgdu++TtDphJ6VSHleu2PGJ1icyJL5M68rsg9il4+RG/Kf7PGlyfIg2A9UOi/iyKec2udeEjWY1HwnDXh/ekmJSSyj9uW064Bil6IZ3VgfXZ1nSLUaWADsMtTdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=C7V9skWu; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="C7V9skWu"
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20240708102947epoutp0374b62dc21d5e3d35f7c727789e3df90d~gNiRGBkGM0460704607epoutp03S
	for <linux-samsung-soc@vger.kernel.org>; Mon,  8 Jul 2024 10:29:47 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20240708102947epoutp0374b62dc21d5e3d35f7c727789e3df90d~gNiRGBkGM0460704607epoutp03S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1720434587;
	bh=9I+tPOsB1yepSP2MvCHhunRshCumusiuhsWZrNBfunc=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=C7V9skWuL3LOuNuqld1XGiJBHJfYubQVkeMg4i7qJGWrcQHTbnQubFCN/i3dnh/dr
	 YUXDm3eDdXs6pGTl/P0MRJziJXC2GHUti06yV1aK//KomUEVVbZ91SmR1yWQFqPt62
	 JxL8o9ENurAP5h5fYeM9HdK+HYmmVxSlS4zrl7vk=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTP id
	20240708102946epcas5p2946bf369f8ffe8f456a184c13c283d8d~gNiQVyKl61819518195epcas5p2I;
	Mon,  8 Jul 2024 10:29:46 +0000 (GMT)
Received: from epsmgec5p1-new.samsung.com (unknown [182.195.38.181]) by
	epsnrtp4.localdomain (Postfix) with ESMTP id 4WHgNS467fz4x9Q6; Mon,  8 Jul
	2024 10:29:44 +0000 (GMT)
Received: from epcas5p3.samsung.com ( [182.195.41.41]) by
	epsmgec5p1-new.samsung.com (Symantec Messaging Gateway) with SMTP id
	DC.1E.19174.89FBB866; Mon,  8 Jul 2024 19:29:44 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20240708102943epcas5p18979436522e364a60f14658b78a784ea~gNiOJBYMY2622226222epcas5p1a;
	Mon,  8 Jul 2024 10:29:43 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20240708102943epsmtrp297bcfc60acc449913c7d0b9572d4a9cf~gNiOH6PDC0821308213epsmtrp2W;
	Mon,  8 Jul 2024 10:29:43 +0000 (GMT)
X-AuditID: b6c32a50-87fff70000004ae6-d5-668bbf987e1b
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	7B.6D.19057.79FBB866; Mon,  8 Jul 2024 19:29:43 +0900 (KST)
Received: from INBRO002756 (unknown [107.122.12.5]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20240708102941epsmtip117c62ed7cfd98747cc1cbc18b1c082e8~gNiMM7SCJ0447404474epsmtip1i;
	Mon,  8 Jul 2024 10:29:41 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Sunyeal Hong'" <sunyeal.hong@samsung.com>, "'Krzysztof Kozlowski'"
	<krzk@kernel.org>, "'Sylwester Nawrocki'" <s.nawrocki@samsung.com>,
	"'Chanwoo Choi'" <cw00.choi@samsung.com>, "'Michael Turquette'"
	<mturquette@baylibre.com>, "'Stephen Boyd'" <sboyd@kernel.org>, "'Rob
 Herring'" <robh@kernel.org>, "'Conor Dooley'" <conor+dt@kernel.org>
Cc: <linux-samsung-soc@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
In-Reply-To: <20240707231331.3433340-2-sunyeal.hong@samsung.com>
Subject: RE: [PATCH v2 1/4] dt-bindings: clock: add Exynos Auto v920 SoC CMU
 bindings
Date: Mon, 8 Jul 2024 15:59:40 +0530
Message-ID: <000001dad121$bf3c0a80$3db41f80$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJHtUpDsgLCeLIQdS8546uqgvLWdQE7Blz4AfM7P5yw+WJ0wA==
Content-Language: en-us
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrBJsWRmVeSWpSXmKPExsWy7bCmpu6M/d1pBjO2yFqs2XuOyeL6l+es
	FvOPnGO1OH9+A7vFpsfXWC0+9txjtbi8aw6bxYzz+5gsLp5ytfi/Zwe7xeE37awW/65tZLFo
	WraeyYHX4/2NVnaPTas62Tw2L6n36NuyitHj8ya5ANaobJuM1MSU1CKF1Lzk/JTMvHRbJe/g
	eOd4UzMDQ11DSwtzJYW8xNxUWyUXnwBdt8wcoBOVFMoSc0qBQgGJxcVK+nY2RfmlJakKGfnF
	JbZKqQUpOQUmBXrFibnFpXnpenmpJVaGBgZGpkCFCdkZc3q3Mhb8T6/4dOsXYwPjlpAuRg4O
	CQETiT83UrsYuTiEBPYwStxsfsYI4XxilHi4YDYThPONUWLrlIMsXYycYB0vN5xghkjsZZS4
	8r4bquoFo8TsPT/ZQKrYBHQldixuA7NFBO4xSXzcaw5SxCywjlFi88wj7CAJTgEHiWk3joON
	FRYIl/h7YgJYnEVARWL5+5XMIDavgKXEttVL2SFsQYmTM5+A1TMLaEssW/iaGeIkBYmfT5ex
	Qixzkti//CszRI24xMujILu4gGoOcEj8+NwJ1eAi0b/sPCuELSzx6vgWdghbSuLzu71sEHa2
	xPGLs6DsConu1o9QNfYSOx/dZAGFHrOApsT6XfoQu/gken8/YYIEKq9ER5sQRLWqRPO7q9CQ
	k5aY2N0NtdVDYtK/R4wTGBVnIflsFpLPZiH5YBbCsgWMLKsYpVILinPTU5NNCwx181LL4TGe
	nJ+7iRGchLUCdjCu3vBX7xAjEwfjIUYJDmYlEd7Tj9vThHhTEiurUovy44tKc1KLDzGaAsN7
	IrOUaHI+MA/klcQbmlgamJiZmZlYGpsZKonzvm6dmyIkkJ5YkpqdmlqQWgTTx8TBKdXA5D+l
	Wqg0IKVYaatdZ6cbW3L/ysw5d6Zv+Z9/M+Zamnlm7LxUY5W0j0YODeJL7dbVLnnkY+18KLP3
	98Z00WO/ZvSL8cgd/2occK6XV6uqP/jypjkSHvETPM3Y9EsVsnlOnL0vHHn03/enCgvkHxUy
	zm69yLTyz/fK8k6h1esKd+W8EtI3WfDuM3O57alL14WTkpfvzV32QnjZjthFZuUn7lRdbP71
	Sob3FycPc2pzyOYmtYYNyRdij/Gfni43W3biQu0NZxwKJbacilJf1n3q0Lzo536//jdu0ldk
	PePxtGT1RmcvrZniepVpmzNOMAdtUufd5jtp2pW98n1GwrZsdlfuygV9sb62y7I68xeHEktx
	RqKhFnNRcSIABdAX3EsEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprPIsWRmVeSWpSXmKPExsWy7bCSnO70/d1pBg926Fis2XuOyeL6l+es
	FvOPnGO1OH9+A7vFpsfXWC0+9txjtbi8aw6bxYzz+5gsLp5ytfi/Zwe7xeE37awW/65tZLFo
	WraeyYHX4/2NVnaPTas62Tw2L6n36NuyitHj8ya5ANYoLpuU1JzMstQifbsEroy7Mz6yF+xP
	qZh2fCZ7A+OLgC5GTg4JAROJlxtOMIPYQgK7GSWuT7KAiEtLXN84gR3CFpZY+e85O0TNM0aJ
	+z/TQWw2AV2JHYvb2EBsEYEnTBJbD0d3MXJxMAtsYpQ4t/smG4gjJHCUUeLb2WmMIFWcAg4S
	024cZwGxhQVCJf7eOgEWZxFQkVj+fiXYFbwClhLbVi9lh7AFJU7OfAJWzyygLfH05lM4e9nC
	18wQ1ylI/Hy6jBXiCieJ/cu/MkPUiEu8PHqEfQKj8Cwko2YhGTULyahZSFoWMLKsYpRMLSjO
	Tc8tNiwwykst1ytOzC0uzUvXS87P3cQIjkMtrR2Me1Z90DvEyMTBeIhRgoNZSYT39OP2NCHe
	lMTKqtSi/Pii0pzU4kOM0hwsSuK83173pggJpCeWpGanphakFsFkmTg4pRqYZiU/OaPktODF
	xnmiTZ3zLP/8WJYadsfAmc89JjOafYdEjqvuBrNm4wdhqdPXPftTp3s3OO/ADt66E8kH9Gbc
	r94d9ap34w0OpnntRzIeRRp4nhZ8lX+uqkrpo94+v12itUuV4m+LvpuaYGovxzd7Vs/GaabC
	QrOjLnnNEmRYqfaA91XT1oea9RkLX6y+oJp8VVrG5ZPCNSP3c3oWy1S03y7iFio5F3gqx/rA
	5HfhrVv2J4infz5tpr7uTv4DjdK0BaJZ12v+xLXceXllftDc8JQ9ema7pXX4T19Zc+Pyit5/
	dXdVth4wPS/P6tZWcuJw39H49AU/Ku8y3mLg46j6GTj9wrmkyuVXZq7v+HxYWImlOCPRUIu5
	qDgRABFlXM8yAwAA
X-CMS-MailID: 20240708102943epcas5p18979436522e364a60f14658b78a784ea
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240707231444epcas2p17d7c9842f0acaff0cc352d5c15f38e73
References: <20240707231331.3433340-1-sunyeal.hong@samsung.com>
	<CGME20240707231444epcas2p17d7c9842f0acaff0cc352d5c15f38e73@epcas2p1.samsung.com>
	<20240707231331.3433340-2-sunyeal.hong@samsung.com>

Hello Sunyeal

> -----Original Message-----
> From: Sunyeal Hong <sunyeal.hong=40samsung.com>
> Sent: Monday, July 8, 2024 4:43 AM
> To: Krzysztof Kozlowski <krzk=40kernel.org>; Sylwester Nawrocki
> <s.nawrocki=40samsung.com>; Chanwoo Choi <cw00.choi=40samsung.com>;
> Alim Akhtar <alim.akhtar=40samsung.com>; Michael Turquette
> <mturquette=40baylibre.com>; Stephen Boyd <sboyd=40kernel.org>; Rob
> Herring <robh=40kernel.org>; Conor Dooley <conor+dt=40kernel.org>
> Cc: linux-samsung-soc=40vger.kernel.org; linux-clk=40vger.kernel.org;
> devicetree=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org; lin=
ux-
> kernel=40vger.kernel.org; Sunyeal Hong <sunyeal.hong=40samsung.com>
> Subject: =5BPATCH v2 1/4=5D dt-bindings: clock: add Exynos Auto v920 SoC =
CMU
> bindings
>=20
> Add dt-schema for Exynos Auto v920 SoC clock controller.
Prefer to have Exynos Auto -> ExynosAuto to match with the naming conventio=
n and the UM.

> Add device tree clock binding definitions for below CMU blocks.
>=20
> - CMU_TOP
> - CMU_PERIC0
>=20
> Signed-off-by: Sunyeal Hong <sunyeal.hong=40samsung.com>
> ---
>  .../clock/samsung,exynosautov920-clock.yaml   =7C 115 +++++++++++
>  .../clock/samsung,exynosautov920.h            =7C 191 ++++++++++++++++++
>  2 files changed, 306 insertions(+)
>  create mode 100644
> Documentation/devicetree/bindings/clock/samsung,exynosautov920-
> clock.yaml
>  create mode 100644 include/dt-bindings/clock/samsung,exynosautov920.h
>=20
> diff --git
> a/Documentation/devicetree/bindings/clock/samsung,exynosautov920-
> clock.yaml
> b/Documentation/devicetree/bindings/clock/samsung,exynosautov920-
> clock.yaml
> new file mode 100644
> index 000000000000..ade74d6e90c0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/samsung,exynosautov920-
> clo
> +++ ck.yaml
> =40=40 -0,0 +1,115 =40=40
> +=23 SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
> +---
> +=24id:
> +http://devicetree.org/schemas/clock/samsung,exynosautov920-
> clock.yaml=23
> +=24schema: http://devicetree.org/meta-schemas/core.yaml=23
> +
> +title: Samsung Exynos Auto v920 SoC clock controller
> +
> +maintainers:
> +  - Sunyeal Hong <sunyeal.hong=40samsung.com>
> +  - Chanwoo Choi <cw00.choi=40samsung.com>
> +  - Krzysztof Kozlowski <krzk=40kernel.org>
> +  - Sylwester Nawrocki <s.nawrocki=40samsung.com>
> +
> +description: =7C
> +  Exynos Auto v920 clock controller is comprised of several CMU units,
> +generating
> +  clocks for different domains. Those CMU units are modeled as separate
> +device
> +  tree nodes, and might depend on each other. Root clocks in that clock
> +tree are
> +  two external clocks:: OSCCLK/XTCXO (38.4 MHz) and RTCCLK/XrtcXTI
> (32768 Hz).
> +  The external OSCCLK must be defined as fixed-rate clock in dts.
> +
> +  CMU_TOP is a top-level CMU, where all base clocks are prepared using
> + PLLs and  dividers; all other clocks of function blocks (other CMUs)
> + are usually  derived from CMU_TOP.
> +
> +  Each clock is assigned an identifier and client nodes can use this
> + identifier  to specify the clock which they consume. All clocks
> + available for usage  in clock consumer nodes are defined as
> + preprocessor macros in  'include/dt-
> bindings/clock/samsung,exynosautov920.h' header.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - samsung,exynosautov920-cmu-top
> +      - samsung,exynosautov920-cmu-peric0
> +
> +  clocks:
> +    minItems: 1
> +    maxItems: 3
> +
> +  clock-names:
> +    minItems: 1
> +    maxItems: 3
> +
> +  =22=23clock-cells=22:
> +    const: 1
> +
> +  reg:
> +    maxItems: 1
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: samsung,exynosautov920-cmu-top
> +
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: External reference clock (38.4 MHz)
> +
> +        clock-names:
> +          items:
> +            - const: oscclk
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: samsung,exynosautov920-cmu-peric0
> +
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: External reference clock (38.4 MHz)
> +            - description: CMU_PERIC0 NOC clock (from CMU_TOP)
> +            - description: CMU_PERIC0 IP clock (from CMU_TOP)
> +
> +        clock-names:
> +          items:
> +            - const: oscclk
> +            - const: noc
> +            - const: ip
These are too generic name, please add peric0_noc and peric0_ip, and this i=
s to match with the UM.
I am sure in future you would like to add other IPs like USI, I2C etc for t=
he peric0 block
> +
> +required:
> +  - compatible
> +  - =22=23clock-cells=22
> +  - clocks
> +  - clock-names
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  =23 Clock controller node for CMU_PERIC0
> +  - =7C
> +    =23include <dt-bindings/clock/samsung,exynosautov920.h>
> +
> +    cmu_peric0: clock-controller=4010800000 =7B
> +        compatible =3D =22samsung,exynosautov920-cmu-peric0=22;
> +        reg =3D <0x10800000 0x8000>;
> +        =23clock-cells =3D <1>;
> +
> +        clocks =3D <&xtcxo>,
> +                 <&cmu_top DOUT_CLKCMU_PERIC0_NOC>,
> +                 <&cmu_top DOUT_CLKCMU_PERIC0_IP>;
> +        clock-names =3D =22oscclk=22,
> +                      =22noc=22,
> +                      =22ip=22;
> +    =7D;
> +
> +...
> diff --git a/include/dt-bindings/clock/samsung,exynosautov920.h
> b/include/dt-bindings/clock/samsung,exynosautov920.h
> new file mode 100644
> index 000000000000..9daa617c3636
> --- /dev/null
> +++ b/include/dt-bindings/clock/samsung,exynosautov920.h
> =40=40 -0,0 +1,191 =40=40
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright (c) 2024 Samsung Electronics Co., Ltd.
> + * Author: Sunyeal Hong <sunyeal.hong=40samsung.com>
> + *
> + * Device Tree binding constants for Exynos Auto V920 clock controller.
> + */
> +
> +=23ifndef _DT_BINDINGS_CLOCK_EXYNOSAUTOV920_H
> +=23define _DT_BINDINGS_CLOCK_EXYNOSAUTOV920_H
> +
> +/* CMU_TOP */
> +=23define FOUT_SHARED0_PLL		1
> +=23define FOUT_SHARED1_PLL		2
> +=23define FOUT_SHARED2_PLL		3
> +=23define FOUT_SHARED3_PLL		4
> +=23define FOUT_SHARED4_PLL		5
> +=23define FOUT_SHARED5_PLL		6
> +=23define FOUT_MMC_PLL			7
> +
> +/* MUX in CMU_TOP */
> +=23define MOUT_SHARED0_PLL		101
> +=23define MOUT_SHARED1_PLL		102
> +=23define MOUT_SHARED2_PLL		103
> +=23define MOUT_SHARED3_PLL		104
> +=23define MOUT_SHARED4_PLL		105
> +=23define MOUT_SHARED5_PLL		106
> +=23define MOUT_MMC_PLL			107
> +=23define MOUT_CLKCMU_CMU_BOOST		108
> +=23define MOUT_CLKCMU_CMU_CMUREF		109
> +=23define MOUT_CLKCMU_ACC_NOC		110
> +=23define MOUT_CLKCMU_ACC_ORB		111
> +=23define MOUT_CLKCMU_APM_NOC		112
> +=23define MOUT_CLKCMU_AUD_CPU		113
> +=23define MOUT_CLKCMU_AUD_NOC		114
> +=23define MOUT_CLKCMU_CPUCL0_SWITCH	115
> +=23define MOUT_CLKCMU_CPUCL0_CLUSTER	116
> +=23define MOUT_CLKCMU_CPUCL0_DBG		117
> +=23define MOUT_CLKCMU_CPUCL1_SWITCH	118
> +=23define MOUT_CLKCMU_CPUCL1_CLUSTER	119
> +=23define MOUT_CLKCMU_CPUCL2_SWITCH	120
> +=23define MOUT_CLKCMU_CPUCL2_CLUSTER	121
> +=23define MOUT_CLKCMU_DNC_NOC		122
> +=23define MOUT_CLKCMU_DPTX_NOC		123
> +=23define MOUT_CLKCMU_DPTX_DPGTC		124
> +=23define MOUT_CLKCMU_DPTX_DPOSC		125
> +=23define MOUT_CLKCMU_DPUB_NOC		126
> +=23define MOUT_CLKCMU_DPUB_DSIM		127
> +=23define MOUT_CLKCMU_DPUF0_NOC		128
> +=23define MOUT_CLKCMU_DPUF1_NOC		129
> +=23define MOUT_CLKCMU_DPUF2_NOC		130
> +=23define MOUT_CLKCMU_DSP_NOC		131
> +=23define MOUT_CLKCMU_G3D_SWITCH		132
> +=23define MOUT_CLKCMU_G3D_NOCP		133
> +=23define MOUT_CLKCMU_GNPU_NOC		134
> +=23define MOUT_CLKCMU_HSI0_NOC		135
> +=23define MOUT_CLKCMU_HSI1_NOC		136
> +=23define MOUT_CLKCMU_HSI1_USBDRD		137
> +=23define MOUT_CLKCMU_HSI1_MMC_CARD	138
> +=23define MOUT_CLKCMU_HSI2_NOC		139
> +=23define MOUT_CLKCMU_HSI2_NOC_UFS	140
> +=23define MOUT_CLKCMU_HSI2_UFS_EMBD	141
> +=23define MOUT_CLKCMU_HSI2_ETHERNET	142
> +=23define MOUT_CLKCMU_ISP_NOC		143
> +=23define MOUT_CLKCMU_M2M_NOC		144
> +=23define MOUT_CLKCMU_M2M_JPEG		145
> +=23define MOUT_CLKCMU_MFC_MFC		146
> +=23define MOUT_CLKCMU_MFC_WFD		147
> +=23define MOUT_CLKCMU_MFD_NOC		148
> +=23define MOUT_CLKCMU_MIF_SWITCH		149
> +=23define MOUT_CLKCMU_MIF_NOCP		150
> +=23define MOUT_CLKCMU_MISC_NOC		151
> +=23define MOUT_CLKCMU_NOCL0_NOC		152
> +=23define MOUT_CLKCMU_NOCL1_NOC		153
> +=23define MOUT_CLKCMU_NOCL2_NOC		154
> +=23define MOUT_CLKCMU_PERIC0_NOC		155
> +=23define MOUT_CLKCMU_PERIC0_IP		156
> +=23define MOUT_CLKCMU_PERIC1_NOC		157
> +=23define MOUT_CLKCMU_PERIC1_IP		158
> +=23define MOUT_CLKCMU_SDMA_NOC		159
> +=23define MOUT_CLKCMU_SNW_NOC		160
> +=23define MOUT_CLKCMU_SSP_NOC		161
> +=23define MOUT_CLKCMU_TAA_NOC		162
> +
> +/* DIV in CMU_TOP */
> +=23define DOUT_SHARED0_DIV1		201
> +=23define DOUT_SHARED0_DIV2		202
> +=23define DOUT_SHARED0_DIV3		203
> +=23define DOUT_SHARED0_DIV4		204
> +=23define DOUT_SHARED1_DIV1		205
> +=23define DOUT_SHARED1_DIV2		206
> +=23define DOUT_SHARED1_DIV3		207
> +=23define DOUT_SHARED1_DIV4		208
> +=23define DOUT_SHARED2_DIV1		209
> +=23define DOUT_SHARED2_DIV2		210
> +=23define DOUT_SHARED2_DIV3		211
> +=23define DOUT_SHARED2_DIV4		212
> +=23define DOUT_SHARED3_DIV1		213
> +=23define DOUT_SHARED3_DIV2		214
> +=23define DOUT_SHARED3_DIV3		215
> +=23define DOUT_SHARED3_DIV4		216
> +=23define DOUT_SHARED4_DIV1		217
> +=23define DOUT_SHARED4_DIV2		218
> +=23define DOUT_SHARED4_DIV3		219
> +=23define DOUT_SHARED4_DIV4		220
> +=23define DOUT_SHARED5_DIV1		221
> +=23define DOUT_SHARED5_DIV2		222
> +=23define DOUT_SHARED5_DIV3		223
> +=23define DOUT_SHARED5_DIV4		224
> +=23define DOUT_CLKCMU_CMU_BOOST		225
> +=23define DOUT_CLKCMU_ACC_NOC		226
> +=23define DOUT_CLKCMU_ACC_ORB		227
> +=23define DOUT_CLKCMU_APM_NOC		228
> +=23define DOUT_CLKCMU_AUD_CPU		229
> +=23define DOUT_CLKCMU_AUD_NOC		230
> +=23define DOUT_CLKCMU_CPUCL0_SWITCH	231
> +=23define DOUT_CLKCMU_CPUCL0_CLUSTER	232
> +=23define DOUT_CLKCMU_CPUCL0_DBG		233
> +=23define DOUT_CLKCMU_CPUCL1_SWITCH	234
> +=23define DOUT_CLKCMU_CPUCL1_CLUSTER	235
> +=23define DOUT_CLKCMU_CPUCL2_SWITCH	236
> +=23define DOUT_CLKCMU_CPUCL2_CLUSTER	237
> +=23define DOUT_CLKCMU_DNC_NOC		238
> +=23define DOUT_CLKCMU_DPTX_NOC		239
> +=23define DOUT_CLKCMU_DPTX_DPGTC		240
> +=23define DOUT_CLKCMU_DPTX_DPOSC		241
> +=23define DOUT_CLKCMU_DPUB_NOC		242
> +=23define DOUT_CLKCMU_DPUB_DSIM		243
> +=23define DOUT_CLKCMU_DPUF0_NOC		244
> +=23define DOUT_CLKCMU_DPUF1_NOC		245
> +=23define DOUT_CLKCMU_DPUF2_NOC		246
> +=23define DOUT_CLKCMU_DSP_NOC		247
> +=23define DOUT_CLKCMU_G3D_SWITCH		248
> +=23define DOUT_CLKCMU_G3D_NOCP		249
> +=23define DOUT_CLKCMU_GNPU_NOC		250
> +=23define DOUT_CLKCMU_HSI0_NOC		251
> +=23define DOUT_CLKCMU_HSI1_NOC		252
> +=23define DOUT_CLKCMU_HSI1_USBDRD		253
> +=23define DOUT_CLKCMU_HSI1_MMC_CARD	254
> +=23define DOUT_CLKCMU_HSI2_NOC		255
> +=23define DOUT_CLKCMU_HSI2_NOC_UFS	256
> +=23define DOUT_CLKCMU_HSI2_UFS_EMBD	257
> +=23define DOUT_CLKCMU_HSI2_ETHERNET	258
> +=23define DOUT_CLKCMU_ISP_NOC		259
> +=23define DOUT_CLKCMU_M2M_NOC		260
> +=23define DOUT_CLKCMU_M2M_JPEG		261
> +=23define DOUT_CLKCMU_MFC_MFC		262
> +=23define DOUT_CLKCMU_MFC_WFD		263
> +=23define DOUT_CLKCMU_MFD_NOC		264
> +=23define DOUT_CLKCMU_MIF_NOCP		265
> +=23define DOUT_CLKCMU_MISC_NOC		266
> +=23define DOUT_CLKCMU_NOCL0_NOC		267
> +=23define DOUT_CLKCMU_NOCL1_NOC		268
> +=23define DOUT_CLKCMU_NOCL2_NOC		269
> +=23define DOUT_CLKCMU_PERIC0_NOC		270
> +=23define DOUT_CLKCMU_PERIC0_IP		271
> +=23define DOUT_CLKCMU_PERIC1_NOC		272
> +=23define DOUT_CLKCMU_PERIC1_IP		273
> +=23define DOUT_CLKCMU_SDMA_NOC		274
> +=23define DOUT_CLKCMU_SNW_NOC		275
> +=23define DOUT_CLKCMU_SSP_NOC		276
> +=23define DOUT_CLKCMU_TAA_NOC		277
> +
> +/* CMU_PERIC0 */
> +=23define CLK_MOUT_PERIC0_IP_USER		1
> +=23define CLK_MOUT_PERIC0_NOC_USER	2
> +=23define CLK_MOUT_PERIC0_USI00_USI	3
> +=23define CLK_MOUT_PERIC0_USI01_USI	4
> +=23define CLK_MOUT_PERIC0_USI02_USI	5
> +=23define CLK_MOUT_PERIC0_USI03_USI	6
> +=23define CLK_MOUT_PERIC0_USI04_USI	7
> +=23define CLK_MOUT_PERIC0_USI05_USI	8
> +=23define CLK_MOUT_PERIC0_USI06_USI	9
> +=23define CLK_MOUT_PERIC0_USI07_USI	10
> +=23define CLK_MOUT_PERIC0_USI08_USI	11
> +=23define CLK_MOUT_PERIC0_USI_I2C		12
> +=23define CLK_MOUT_PERIC0_I3C		13
> +
> +=23define CLK_DOUT_PERIC0_USI00_USI	14
> +=23define CLK_DOUT_PERIC0_USI01_USI	15
> +=23define CLK_DOUT_PERIC0_USI02_USI	16
> +=23define CLK_DOUT_PERIC0_USI03_USI	17
> +=23define CLK_DOUT_PERIC0_USI04_USI	18
> +=23define CLK_DOUT_PERIC0_USI05_USI	19
> +=23define CLK_DOUT_PERIC0_USI06_USI	20
> +=23define CLK_DOUT_PERIC0_USI07_USI	21
> +=23define CLK_DOUT_PERIC0_USI08_USI	22
> +=23define CLK_DOUT_PERIC0_USI_I2C		23
> +=23define CLK_DOUT_PERIC0_I3C		24
> +
> +=23endif /* _DT_BINDINGS_CLOCK_EXYNOSAUTOV920_H */
> --
> 2.45.2


