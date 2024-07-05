Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB9B1448E9
	for <linux-samsung-soc@vger.kernel.org>; Fri,  5 Jul 2024 09:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720172840; cv=none; b=VCP/8RRV1UDoEgbYPZbxe2pfABWwY6QonorRbxnqAo/NhFBclK9hMEGVtOuHI2DQBt2pEMmOT1xLfcu2+OGhRs68zIl0IlUE8dCtWPgkSWbrLRulHLihSjtlmoXqJOfHn+6H1T3ytVyPzRj1K4ChVxZ0rjbsmQk91Q4bao0JPjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720172840; c=relaxed/simple;
	bh=SNVIq8IzEq/+ixojpoOnQcqrIQtEdZaAPkEwmaEt8/Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=LqcpKOiZTptz5DfRHS8aGmuBSSWWf2aomVsbEAAVoWzUtyoxM8q0WBOOI3wezGnEpMSORz1tyfZI5uy5GeSDvgAvGNaGgIFruU/FnE8aZJj5Wm8mrSrLUdmss/8rpcJ3yBKqHV0nVPWnKNzKQcOzXF1C2r2ic/I0Zp5ZhV8epdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=ZE0Jjlel; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="ZE0Jjlel"
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20240705094715epoutp0292f8ce0c9949ec9121ca6fe241e441ec~fSBRu5SB50589705897epoutp02j
	for <linux-samsung-soc@vger.kernel.org>; Fri,  5 Jul 2024 09:47:15 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20240705094715epoutp0292f8ce0c9949ec9121ca6fe241e441ec~fSBRu5SB50589705897epoutp02j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1720172835;
	bh=7hc5/Ebz+qisnzZvFIi0bERvrPY/X5FNJfe7LrCQvt0=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=ZE0JjlelrQGOXDOc0N6mOpV4Cq5SLI8Eo5LnUvrfzMZPQ/rP283wrT9VCdyqJwH0V
	 okC4QM2bCWDHvhBdom9H8Cl2s3+/9ZtfuXH0eT8WLC0/tSugWbQvY7rwhuKKXAZCsR
	 CxivUyG9xGroWRsZywQbSSKGC6WFawcuPziXTtkY=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTP id
	20240705094714epcas2p35ee03825b0f502c44fd0949d3ca05a08~fSBRCaKql2339523395epcas2p3F;
	Fri,  5 Jul 2024 09:47:14 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.36.92]) by
	epsnrtp3.localdomain (Postfix) with ESMTP id 4WFpZn6v0gz4x9Q1; Fri,  5 Jul
	2024 09:47:13 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
	epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
	9C.F0.09485.121C7866; Fri,  5 Jul 2024 18:47:13 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20240705094713epcas2p332450ad4dae04cd2fa599994c7956c29~fSBPzzBco1873818738epcas2p3p;
	Fri,  5 Jul 2024 09:47:13 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20240705094713epsmtrp23c0002a7d4d994b458bbdffd07d94add~fSBPyzKuO0969009690epsmtrp2k;
	Fri,  5 Jul 2024 09:47:13 +0000 (GMT)
X-AuditID: b6c32a46-f3bff7000000250d-86-6687c121bfdc
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	36.2C.18846.021C7866; Fri,  5 Jul 2024 18:47:13 +0900 (KST)
Received: from [10.229.8.168] (unknown [10.229.8.168]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20240705094712epsmtip1d0be6d4a507a0b0d376e8e996576570c~fSBPjTUmS2580925809epsmtip1T;
	Fri,  5 Jul 2024 09:47:12 +0000 (GMT)
Message-ID: <c1891fb7-748b-62ad-a115-ee143fd05784@samsung.com>
Date: Fri, 5 Jul 2024 18:46:55 +0900
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
	Thunderbird/102.11.0
Subject: Re: [PATCH 1/5] dt-bindings: clock: add Exynos Auto v920 SoC CMU
 bindings
To: Sunyeal Hong <sunyeal.hong@samsung.com>, Krzysztof Kozlowski
	<krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi
	<cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, Michael
	Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Content-Language: en-US
From: Jaewon Kim <jaewon02.kim@samsung.com>
In-Reply-To: <20240705021110.2495344-2-sunyeal.hong@samsung.com>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprPJsWRmVeSWpSXmKPExsWy7bCmua7iwfY0g4ltZhYP5m1js7j+5Tmr
	xfnzG9gtPvbcY7W4vGsOm8WM8/uYLC6ecrU4/Kad1eLftY0sFk3L1jM5cHm8v9HK7rFpVSeb
	R9+WVYwenzfJBbBEZdtkpCampBYppOYl56dk5qXbKnkHxzvHm5oZGOoaWlqYKynkJeam2iq5
	+AToumXmAN2jpFCWmFMKFApILC5W0rezKcovLUlVyMgvLrFVSi1IySkwL9ArTswtLs1L18tL
	LbEyNDAwMgUqTMjOmDP/P3PBOdWK+U1NzA2MW2W6GDk5JARMJGZcXsfexcjFISSwg1HiydQd
	UM4nRonzXV+YQarAnLvr5boYOcA63nzXhqjZySjR2nyZCcJ5zSix9P9CFpAGXgE7iT9rXzOB
	2CwCKhILZj1jhIgLSpyc+QSsRlQgWqJ12X02EFtYIETiwIufjCCDRAQWMEmc37WXFSTBLJAg
	seTwBzYIW1zi1pP5YEPZBLQlvq9fDFbDKeAgcfTeMqh6eYntb+cwgwySEJjKIdGyZwszxKMu
	Ek3XPzJB2MISr45vYYewpSQ+v9vLBmHnS7RdOQMVr5HYuOASI4RtL7HozE92kPeZBTQl1u/S
	h4SEssSRWywQa/kkOg7/ZYcI80p0tAlBNKpJ3J96Dmq4jMSkIyuhDvCQmL53AesERsVZSKEy
	C8mTs5A8Mwth7wJGllWMYqkFxbnpqcVGBUbwuE7Oz93ECE6pWm47GKe8/aB3iJGJg/EQowQH
	s5IIr9T75jQh3pTEyqrUovz4otKc1OJDjKbAuJnILCWanA9M6nkl8YYmlgYmZmaG5kamBuZK
	4rz3WuemCAmkJ5akZqemFqQWwfQxcXBKNTDpd4r2i159kOByvz7njuhPtvPz8q+s8lh6nS1t
	3WufW7kVjdU1VkVS34REY5neZ7hMutZ1Njdqe3/LYY+Fa3U+duZyle1wnrR65rKgiA/cFb1P
	J33ez+j/Pvfnzdr6GMmayUt2u9efUk003jON2efzQu5Xsz7cbKvaGsl0bcnFybu6bPV0W84+
	MD3XIPTX+vD+pqMa2Uz1imwTl937dl+w4fmWbXrJ3nfX1m/onn2KxXvvAuZNua4ZTGlPWnpC
	5DxLwvUj9Hb96Sy/MY/9RfHjI7Ee+m37r15le9H3p+O8xLEYLpZcq5agHqXrdlr/csuWfQ0Q
	D8wy/nlp6t/W7+ZqL51mmIimb5mrV94S36vEUpyRaKjFXFScCACOdnq5MgQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrLLMWRmVeSWpSXmKPExsWy7bCSnK7iwfY0g12zmS0ezNvGZnH9y3NW
	i/PnN7BbfOy5x2pxedccNosZ5/cxWVw85Wpx+E07q8W/axtZLJqWrWdy4PJ4f6OV3WPTqk42
	j74tqxg9Pm+SC2CJ4rJJSc3JLEst0rdL4MqYM/8/c8E51Yr5TU3MDYxbZboYOTgkBEwk3nzX
	7mLk4hAS2M4ocbnrCGMXIydQXEZi+bM+NghbWOJ+yxFWiKKXjBKnZu9lAknwCthJ/Fn7Gsxm
	EVCRWDDrGSNEXFDi5MwnLCC2qEC0xOrPF1hBbGGBEIkDL34yggwSEVjEJDFvSRs7SIJZIEHi
	/tbdbBAbTjJKbJxzgQkiIS5x68l8MJtNQFvi+/rFYJM4BRwkjt5bxgpRYybRtbWLEcKWl9j+
	dg7zBEahWUgOmYVk1CwkLbOQtCxgZFnFKJpaUJybnptcYKhXnJhbXJqXrpecn7uJERxDWkE7
	GJet/6t3iJGJg/EQowQHs5IIr9T75jQh3pTEyqrUovz4otKc1OJDjNIcLErivMo5nSlCAumJ
	JanZqakFqUUwWSYOTqkGpl2NO8tzVhvs4HSyfurKISK35oq6IfMtUY+itetrYoXYAm7sfiWW
	mR15jMFX53WxV2vPzGxdQVP9e9kPj1v2CXc++NQzsaBr//5Lple/GMcq3a/VM4uWXV/ww6Or
	mme5NVNZAX/thcc1k9K0RHK22c9/Grk76vN2ruWVM3KUi32usn65qf6Xs9kpRCX3UG7wplPz
	N/qdUbktbRnIptqTe0v9Y7HwfD4hIcVbfu0arFVMmwq3LeER+p5Qc1ds6o7PpW/qLfM4DZ7e
	vjSRtWT1mp02i8rSdzF+XP/+9pTm+fWP/edWPwtV/PZusYu098KlB6def7HR2TDz6PoPX7MY
	LUv1jmfskzuzYdkO/62zlViKMxINtZiLihMB4HpyxBADAAA=
X-CMS-MailID: 20240705094713epcas2p332450ad4dae04cd2fa599994c7956c29
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240705021148epcas2p2f460d561d647a3f02ee01b3ad8979706
References: <20240705021110.2495344-1-sunyeal.hong@samsung.com>
	<CGME20240705021148epcas2p2f460d561d647a3f02ee01b3ad8979706@epcas2p2.samsung.com>
	<20240705021110.2495344-2-sunyeal.hong@samsung.com>

Hi Sunyeal,


On 7/5/24 11:11, Sunyeal Hong wrote:
> Add dt-schema for Exynos Auto v920 SoC clock controller.
>
> Signed-off-by: Sunyeal Hong <sunyeal.hong@samsung.com>
> ---
>   .../clock/samsung,exynosautov920-clock.yaml   | 115 ++++++++++++++++++
>   1 file changed, 115 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock.yaml
>
> diff --git a/Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock.yaml
> new file mode 100644
> index 000000000000..3e5e408c8336
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock.yaml
> @@ -0,0 +1,115 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: https://protect2.fireeye.com/v1/url?k=804ccde6-e1c7d8c9-804d46a9-74fe485cbfe7-c44fcfa897bd4340&q=1&e=65af0c33-026a-42d4-92cd-09b6c91c9bfb&u=http%3A%2F%2Fdevicetree.org%2Fschemas%2Fclock%2Fsamsung%2Cexynosautov920-clock.yaml%23
> +$schema: https://protect2.fireeye.com/v1/url?k=8a40f68c-ebcbe3a3-8a417dc3-74fe485cbfe7-63f39e48f537ca7e&q=1&e=65af0c33-026a-42d4-92cd-09b6c91c9bfb&u=http%3A%2F%2Fdevicetree.org%2Fmeta-schemas%2Fcore.yaml%23
> +
> +title: Samsung Exynos Auto v920 SoC clock controller
> +
> +maintainers:
> +  - Sunyeal Hong <sunyeal.hong@samsung.com>
> +  - Chanwoo Choi <cw00.choi@samsung.com>
> +  - Krzysztof Kozlowski <krzk@kernel.org>
> +  - Sylwester Nawrocki <s.nawrocki@samsung.com>
> +
> +description: |
> +  Exynos Auto v920 clock controller is comprised of several CMU units, generating
> +  clocks for different domains. Those CMU units are modeled as separate device
> +  tree nodes, and might depend on each other. Root clocks in that clock tree are
> +  two external clocks:: OSCCLK/XTCXO (38.4 MHz) and RTCCLK/XrtcXTI (32768 Hz).
> +  The external OSCCLK must be defined as fixed-rate clock in dts.
> +
> +  CMU_TOP is a top-level CMU, where all base clocks are prepared using PLLs and
> +  dividers; all other clocks of function blocks (other CMUs) are usually
> +  derived from CMU_TOP.
> +
> +  Each clock is assigned an identifier and client nodes can use this identifier
> +  to specify the clock which they consume. All clocks available for usage
> +  in clock consumer nodes are defined as preprocessor macros in
> +  'include/dt-bindings/clock/samsung,exynosautov920.h' header.
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
> +  "#clock-cells":
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
> +            - const: dout_clkcmu_peric0_noc
> +            - const: dout_clkcmu_peric0_ip
> +
> +required:
> +  - compatible
> +  - "#clock-cells"
> +  - clocks
> +  - clock-names
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  # Clock controller node for CMU_PERIC0
> +  - |
> +    #include <dt-bindings/clock/samsung,exynosautov920.h>
> +
> +    cmu_peric0: clock-controller@10800000 {
> +        compatible = "samsung,exynosautov920-cmu-peric0";
> +        reg = <0x10800000 0x8000>;
> +        #clock-cells = <1>;
> +
> +        clocks = <&xtcxo>,
> +                 <&cmu_top DOUT_CLKCMU_PERIC0_NOC>,
> +                 <&cmu_top DOUT_CLKCMU_PERIC0_IP>;
> +        clock-names = "oscclk",
> +                      "dout_clkcmu_peric0_noc",
> +                      "dout_clkcmu_peric0_ip";

There was a review with clock name.
Please consider modifying the clock-name by referring to the review below.
https://lore.kernel.org/linux-samsung-soc/20231220150726.GA223267-robh@kernel.org/

> +    };
> +
> +...

Thanks
Jaewon Kim

