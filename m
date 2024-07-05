Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB76149DF8
	for <linux-samsung-soc@vger.kernel.org>; Fri,  5 Jul 2024 09:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720173340; cv=none; b=EpU96jb20X8+R91NtLArVDhl//rKslCfJGuq+fsx3U7CnRfCvMWwThWxo/Fz1QSFADUG4DVbBf7mrVDVP+FbhdHZ1WEvW9Evz7NsmQX8sHv0M68bZNBL5eqT4CkpLhgWOykz+OL85Xk116QdIRaBHUAPF6klEOrCbtwbwR69NDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720173340; c=relaxed/simple;
	bh=A4dX+iyf8xNKh6KHSOJHSw0HqkOHnO40iRlV/cZUWys=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=X77rpPmZjyDtI6E214suWyw6k/oT083yS/5fCdxWQd5GJhdZlbY0Gd5OnW53GTN/zXmkuhLCZ8wYbOEd8nBet+G7y+03+aAyBj/YITZ4lAcjXHcpr+0bGBIesmBT82ElEVjeiYf8jos94lwEhUMOxTyyQmzAnSyMBWLsFde02H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=oVRDVQf7; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="oVRDVQf7"
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20240705095536epoutp031619c83a2474a6989704153fe93ad7f9~fSIk1HuGA0736307363epoutp03D
	for <linux-samsung-soc@vger.kernel.org>; Fri,  5 Jul 2024 09:55:36 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20240705095536epoutp031619c83a2474a6989704153fe93ad7f9~fSIk1HuGA0736307363epoutp03D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1720173336;
	bh=NsZRtcvlI1uMrEnOE4vvRqbLBMUGn/ZRIqkG3mFKNAU=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=oVRDVQf7/ggnYWIOyXg0jys42iF1tp46ws+sb94Z4JT+eFRdS2nwHNcHuaLThqmCc
	 qNfajsMwb1jMi5errHOq0xe8qbQwJdRjj4ZBQ93arx1h904cNj90lBcdtcSXUD9WFi
	 vRlSnOxOS/P4qNaMJH3mLmB0SPjaqboIxDweVAoU=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTP id
	20240705095536epcas2p14ffe425bb719d4c251ecca9e907fbde4~fSIkTCrtn2203722037epcas2p1D;
	Fri,  5 Jul 2024 09:55:36 +0000 (GMT)
Received: from epsmgec2p1.samsung.com (unknown [182.195.36.68]) by
	epsnrtp2.localdomain (Postfix) with ESMTP id 4WFpmR5C0Wz4x9Pt; Fri,  5 Jul
	2024 09:55:35 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
	epsmgec2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
	2F.6B.56241.713C7866; Fri,  5 Jul 2024 18:55:35 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
	20240705095535epcas2p1fc2cc05264d4b3db19bfe9001694dd4d~fSIjOBjBS0807508075epcas2p1h;
	Fri,  5 Jul 2024 09:55:35 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20240705095534epsmtrp2ecca4db3b5dc4782c7316c8248a2f6b6~fSIjIAAUS1477014770epsmtrp2j;
	Fri,  5 Jul 2024 09:55:34 +0000 (GMT)
X-AuditID: b6c32a43-c03fd7000000dbb1-f2-6687c317d6f3
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	CF.99.29940.613C7866; Fri,  5 Jul 2024 18:55:34 +0900 (KST)
Received: from KORCO118965 (unknown [10.229.18.201]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20240705095534epsmtip1054fbdcaef4a7cb36ad135507e6edc33~fSIi628yd3079730797epsmtip1g;
	Fri,  5 Jul 2024 09:55:34 +0000 (GMT)
From: "sunyeal.hong" <sunyeal.hong@samsung.com>
To: "'Jaewon Kim'" <jaewon02.kim@samsung.com>, "'Krzysztof Kozlowski'"
	<krzk@kernel.org>, "'Sylwester Nawrocki'" <s.nawrocki@samsung.com>,
	"'Chanwoo Choi'" <cw00.choi@samsung.com>, "'Alim Akhtar'"
	<alim.akhtar@samsung.com>, "'Michael	Turquette'" <mturquette@baylibre.com>,
	"'Stephen Boyd'" <sboyd@kernel.org>
Cc: <linux-samsung-soc@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
In-Reply-To: <c1891fb7-748b-62ad-a115-ee143fd05784@samsung.com>
Subject: RE: [PATCH 1/5] dt-bindings: clock: add Exynos Auto v920 SoC CMU
 bindings
Date: Fri, 5 Jul 2024 18:55:34 +0900
Message-ID: <01d601dacec1$7ae292d0$70a7b870$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIPebKt0SL2hL1PGxWEYogtVpy49QNwk6HzAnOJnRgBjeajnbFC/x+g
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprLJsWRmVeSWpSXmKPExsWy7bCmqa744fY0g7eN6hYP5m1js7j+5Tmr
	xY6GI6wW589vYLf42HOP1eLyrjlsFjPO72OyuHjK1eLwm3ZWi3/XNrI4cHm8v9HK7rFpVSeb
	R9+WVYwenzfJBbBEZdtkpCampBYppOYl56dk5qXbKnkHxzvHm5oZGOoaWlqYKynkJeam2iq5
	+AToumXmAN2jpFCWmFMKFApILC5W0rezKcovLUlVyMgvLrFVSi1IySkwL9ArTswtLs1L18tL
	LbEyNDAwMgUqTMjO+DTnJ1PBSr2Kwz25DYyXlLoYOTkkBEwkpi+fztrFyMUhJLCDUWLe6zXs
	EM4nRom5c+8wQzjfGCXWbfrECtNyf9V8RhBbSGAvo8TRaSEQRS8ZJRrO7ANLsAnoS6zuvs0G
	YosI7GGSWPC2HsRmFkiTWHFqCzuIzSlgL3Fx4hawemGBEImpBx8ydTFycLAIqEj03nEBCfMK
	WEqsPtTHCmELSpyc+YQFYoy8xPa3c5gh7lGQ+Pl0GSvEKjeJdfPvsUPUiEjM7myDqlnKITHv
	UzmE7SJx+uBpFghbWOLVcYhzJASkJD6/28sGYedLTL7+lgnkLwmBBkaJa/+6oQbZSyw685Md
	5E5mAU2J9bv0QUwJAWWJI7egTuOT6Dj8lx0izCvR0SYE0agm8enKZaghMhLHTjxjnsCoNAvJ
	Y7OQPDYLyQOzEHYtYGRZxSiWWlCcm56abFRgCI/p5PzcTYzgdKrlvIPxyvx/eocYmTgYDzFK
	cDArifBKvW9OE+JNSaysSi3Kjy8qzUktPsRoCgzpicxSosn5wISeVxJvaGJpYGJmZmhuZGpg
	riTOe691boqQQHpiSWp2ampBahFMHxMHp1QDU3js8atmU+4cPpD1cdPVXZ/2Xtl+rju55g3L
	kusX+u2ue1+MvF/AZCv5bN/yK41u+cVFB89OfZZ99/sXs8W+QlE/NqSpssxfMp//SXeMvNqJ
	+q7dmzwTg05+Sbh8NbTkbMa3KU+4N8ub1059t1Fgb6261XRv+YQykbwt71Y1LJHnDP2yXm/6
	tF0L5BoNKtZ+9T3zycxpfsTZsJ5MPjFJAX4t/ROq9yWeXOnd8LHhkB6z5K7vE1mlA6fck0h9
	JLXj8+NPS07Mm1Ud0Mgmv4/HuIbLp8++OePP8w386grtbwQlWTSNDJnm/r2UUfmtqWxlyQPL
	2wu33hdWmaJ0vp/h6gEFrwytB+fEn/898WzG7SQlluKMREMt5qLiRAAlVkfHMAQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmkeLIzCtJLcpLzFFi42LZdlhJTlfscHuawYqlZhYP5m1js7j+5Tmr
	xY6GI6wW589vYLf42HOP1eLyrjlsFjPO72OyuHjK1eLwm3ZWi3/XNrI4cHm8v9HK7rFpVSeb
	R9+WVYwenzfJBbBEcdmkpOZklqUW6dslcGV8mvOTqWClXsXhntwGxktKXYycHBICJhL3V81n
	BLGFBHYzSnxv9oOIy0hsbPjPDmELS9xvOcLaxcgFVPOcUWJp9yRWkASbgL7E6u7bbCAJEYED
	TBLPzuxlBkkwC2RIHLr2ng2i4wejxM1pC8BGcQrYS1ycuAVsnbBAkMTE8w+A4hwcLAIqEr13
	XEDCvAKWEqsP9bFC2IISJ2c+YYGYqS3x9OZTKFteYvvbOcwQ1ylI/Hy6DKxeRMBNYt38e+wQ
	NSISszvbmCcwCs9CMmoWklGzkIyahaRlASPLKkbJ1ILi3PTcYsMCw7zUcr3ixNzi0rx0veT8
	3E2M4PjS0tzBuH3VB71DjEwcjIcYJTiYlUR4pd43pwnxpiRWVqUW5ccXleakFh9ilOZgURLn
	FX/RmyIkkJ5YkpqdmlqQWgSTZeLglGpg2nbnws+ATB/zE9OV1hZyXEwxDU/+uKnv0x4b2RrV
	eV/evHre8JuHa8d0g7zfD+3XHGoVnf3vw6fWLHaVFXcep7w6fFxgzT3u0vLQCFfVKakPHu4U
	rLxXOumO4+a0F//jWZyE1ETCfnOw7Ta1OTz1402Zcz1GhT77j+1+v/Z8+bL2sMSdy+XXJZjO
	vfgv/Fn8UtWJPmt/zmMIvBFoazTjZpWx+OlyqW2ecleU5Jysb2+5fiPabOXMox53cx6cETo1
	3Wn/zmfxq6+KtmX0zXrDsyoreFv3gcmPb8pOd87Oa3708rLf5HcVZz91rG/jjLYxjjq0eMKp
	MvNlBsFHulNmfGx9v07jXsCNS0Wzbh+599pGiaU4I9FQi7moOBEAx9qWMB4DAAA=
X-CMS-MailID: 20240705095535epcas2p1fc2cc05264d4b3db19bfe9001694dd4d
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
	<c1891fb7-748b-62ad-a115-ee143fd05784@samsung.com>

Hello Jaewon,

> -----Original Message-----
> From: Jaewon Kim <jaewon02.kim@samsung.com>
> Sent: Friday, July 5, 2024 6:47 PM
> To: Sunyeal Hong <sunyeal.hong@samsung.com>; Krzysztof Kozlowski
> <krzk@kernel.org>; Sylwester Nawrocki <s.nawrocki@samsung.com>; Chanwoo
> Choi <cw00.choi@samsung.com>; Alim Akhtar <alim.akhtar@samsung.com>;
> Michael Turquette <mturquette@baylibre.com>; Stephen Boyd
> <sboyd@kernel.org>
> Cc: linux-samsung-soc@vger.kernel.org; linux-clk@vger.kernel.org; linux-
> kernel@vger.kernel.org
> Subject: Re: [PATCH 1/5] dt-bindings: clock: add Exynos Auto v920 SoC CMU
> bindings
> 
> Hi Sunyeal,
> 
> 
> On 7/5/24 11:11, Sunyeal Hong wrote:
> > Add dt-schema for Exynos Auto v920 SoC clock controller.
> >
> > Signed-off-by: Sunyeal Hong <sunyeal.hong@samsung.com>
> > ---
> >   .../clock/samsung,exynosautov920-clock.yaml   | 115 ++++++++++++++++++
> >   1 file changed, 115 insertions(+)
> >   create mode 100644
> > Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock.y
> > aml
> >
> > diff --git
> > a/Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock
> > .yaml
> > b/Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock
> > .yaml
> > new file mode 100644
> > index 000000000000..3e5e408c8336
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/clock/samsung,exynosautov920-c
> > +++ lock.yaml
> > @@ -0,0 +1,115 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
> > +---
> > +$id:
> > +https://protect2.fireeye.com/v1/url?k=804ccde6-e1c7d8c9-804d46a9-74fe
> > +485cbfe7-c44fcfa897bd4340&q=1&e=65af0c33-026a-42d4-92cd-09b6c91c9bfb&
> > +u=http%3A%2F%2Fdevicetree.org%2Fschemas%2Fclock%2Fsamsung%2Cexynosaut
> > +ov920-clock.yaml%23
> > +$schema:
> > +https://protect2.fireeye.com/v1/url?k=8a40f68c-ebcbe3a3-8a417dc3-74fe
> > +485cbfe7-63f39e48f537ca7e&q=1&e=65af0c33-026a-42d4-92cd-09b6c91c9bfb&
> > +u=http%3A%2F%2Fdevicetree.org%2Fmeta-schemas%2Fcore.yaml%23
> > +
> > +title: Samsung Exynos Auto v920 SoC clock controller
> > +
> > +maintainers:
> > +  - Sunyeal Hong <sunyeal.hong@samsung.com>
> > +  - Chanwoo Choi <cw00.choi@samsung.com>
> > +  - Krzysztof Kozlowski <krzk@kernel.org>
> > +  - Sylwester Nawrocki <s.nawrocki@samsung.com>
> > +
> > +description: |
> > +  Exynos Auto v920 clock controller is comprised of several CMU
> > +units, generating
> > +  clocks for different domains. Those CMU units are modeled as
> > +separate device
> > +  tree nodes, and might depend on each other. Root clocks in that
> > +clock tree are
> > +  two external clocks:: OSCCLK/XTCXO (38.4 MHz) and RTCCLK/XrtcXTI
> (32768 Hz).
> > +  The external OSCCLK must be defined as fixed-rate clock in dts.
> > +
> > +  CMU_TOP is a top-level CMU, where all base clocks are prepared
> > + using PLLs and  dividers; all other clocks of function blocks (other
> > + CMUs) are usually  derived from CMU_TOP.
> > +
> > +  Each clock is assigned an identifier and client nodes can use this
> > + identifier  to specify the clock which they consume. All clocks
> > + available for usage  in clock consumer nodes are defined as
> > + preprocessor macros in  'include/dt-
> bindings/clock/samsung,exynosautov920.h' header.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - samsung,exynosautov920-cmu-top
> > +      - samsung,exynosautov920-cmu-peric0
> > +
> > +  clocks:
> > +    minItems: 1
> > +    maxItems: 3
> > +
> > +  clock-names:
> > +    minItems: 1
> > +    maxItems: 3
> > +
> > +  "#clock-cells":
> > +    const: 1
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: samsung,exynosautov920-cmu-top
> > +
> > +    then:
> > +      properties:
> > +        clocks:
> > +          items:
> > +            - description: External reference clock (38.4 MHz)
> > +
> > +        clock-names:
> > +          items:
> > +            - const: oscclk
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: samsung,exynosautov920-cmu-peric0
> > +
> > +    then:
> > +      properties:
> > +        clocks:
> > +          items:
> > +            - description: External reference clock (38.4 MHz)
> > +            - description: CMU_PERIC0 NOC clock (from CMU_TOP)
> > +            - description: CMU_PERIC0 IP clock (from CMU_TOP)
> > +
> > +        clock-names:
> > +          items:
> > +            - const: oscclk
> > +            - const: dout_clkcmu_peric0_noc
> > +            - const: dout_clkcmu_peric0_ip
> > +
> > +required:
> > +  - compatible
> > +  - "#clock-cells"
> > +  - clocks
> > +  - clock-names
> > +  - reg
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  # Clock controller node for CMU_PERIC0
> > +  - |
> > +    #include <dt-bindings/clock/samsung,exynosautov920.h>
> > +
> > +    cmu_peric0: clock-controller@10800000 {
> > +        compatible = "samsung,exynosautov920-cmu-peric0";
> > +        reg = <0x10800000 0x8000>;
> > +        #clock-cells = <1>;
> > +
> > +        clocks = <&xtcxo>,
> > +                 <&cmu_top DOUT_CLKCMU_PERIC0_NOC>,
> > +                 <&cmu_top DOUT_CLKCMU_PERIC0_IP>;
> > +        clock-names = "oscclk",
> > +                      "dout_clkcmu_peric0_noc",
> > +                      "dout_clkcmu_peric0_ip";
> 
> There was a review with clock name.
> Please consider modifying the clock-name by referring to the review below.
> https://lore.kernel.org/linux-samsung-soc/20231220150726.GA223267-
> robh@kernel.org/
> 
> > +    };
> > +
> > +...
> 
> Thanks
> Jaewon Kim
> 

I checked the review you shared and will apply it to my patch.

Thanks,
Sunyeal Hong

