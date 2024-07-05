Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 025121442F0
	for <linux-samsung-soc@vger.kernel.org>; Fri,  5 Jul 2024 07:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720165949; cv=none; b=G2mP5C4XFA1BN9mMyRye8P6t4ROWcz9wA+o4htGHSV4I4oytZysLAihSnaPr0EI5HQ9XQtpu4BRl/x2YjN39N6hSwiIgyYN+Hzmnr1JToekt+rEXLrgr63MWJEPeAlJZIbyJSeAbnWU2ODw5fdWMJgtZwlq5sS8UtvEsnrUZYcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720165949; c=relaxed/simple;
	bh=pM5uUeJ3dfboPneouC0NXzdDC3MRLutfwGWUIN0uN0Y=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=mUNhuEXVchNzcmqDkZqK+WUBdtxYS0/GAV9CuV9c44uMZxBOjxKCZ7UqcWF9NkXR/2M0i9+boNRCZMLNfExonKwB2j8EA9wHJi5F27aFK04NS7/92K5SHrZ1j9GKtIdMgmwOxyjN+J3yWN9REu/cnV56cTJikL0IprLfTFIOpRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=WRvWBJSH; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="WRvWBJSH"
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20240705075225epoutp0199c3850648f7ecf1033e289816d72870~fQdBBTEvp2620326203epoutp01S
	for <linux-samsung-soc@vger.kernel.org>; Fri,  5 Jul 2024 07:52:25 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20240705075225epoutp0199c3850648f7ecf1033e289816d72870~fQdBBTEvp2620326203epoutp01S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1720165945;
	bh=NPp9N15PoWUAmeFeYJxtrU5fxLGusgobdDj9yHnBeS0=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=WRvWBJSHvmAz1eP07iN8g0naFL0JRoHCxJzoWhm3TJAkeE6xQr/cOouBb/0eHTq4m
	 QDaqxNoFasDDEgTJL2RxKSN2az3a4s736OKlr3NBsOQdptd/+P6C/JGPTvmXDBpOqO
	 /BhUBQIFt1SHVKtvgb75exziA7Z75zZdnqiZqGyM=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTP id
	20240705075224epcas2p44cd71de667180a912d5d4f5ae48b1cc1~fQdAYcvGj0286302863epcas2p4C;
	Fri,  5 Jul 2024 07:52:24 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.36.68]) by
	epsnrtp2.localdomain (Postfix) with ESMTP id 4WFm2J0Zhwz4x9Py; Fri,  5 Jul
	2024 07:52:24 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
	epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
	34.3E.09848.736A7866; Fri,  5 Jul 2024 16:52:23 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20240705075223epcas2p34f8fd5ca31da3afa27a28618dc939527~fQc-UWzCc1709517095epcas2p3L;
	Fri,  5 Jul 2024 07:52:23 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20240705075223epsmtrp24c2d756a97c12f325f56d7914908dc7d~fQc-ThDhO0947909479epsmtrp2O;
	Fri,  5 Jul 2024 07:52:23 +0000 (GMT)
X-AuditID: b6c32a45-1c7ff70000002678-57-6687a6378f53
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	A3.1E.19057.736A7866; Fri,  5 Jul 2024 16:52:23 +0900 (KST)
Received: from KORCO118965 (unknown [10.229.18.201]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20240705075223epsmtip1efcfda44501bde88f3ffc6c737136294~fQc__2Pyg2388423884epsmtip1h;
	Fri,  5 Jul 2024 07:52:23 +0000 (GMT)
From: "sunyeal.hong" <sunyeal.hong@samsung.com>
To: "'Jaewon Kim'" <jaewon02.kim@samsung.com>, "'Krzysztof Kozlowski'"
	<krzk@kernel.org>, "'Sylwester Nawrocki'" <s.nawrocki@samsung.com>,
	"'Chanwoo Choi'" <cw00.choi@samsung.com>, "'Alim Akhtar'"
	<alim.akhtar@samsung.com>, "'Michael	Turquette'" <mturquette@baylibre.com>,
	"'Stephen Boyd'" <sboyd@kernel.org>
Cc: <linux-samsung-soc@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
In-Reply-To: <9c105dbb-f443-d96a-3071-6a8ebca0f84d@samsung.com>
Subject: RE: [PATCH 3/5] arm64: dts: exynos: add initial CMU clock nodes in
 Exynos Auto v920
Date: Fri, 5 Jul 2024 16:52:22 +0900
Message-ID: <01c301daceb0$45221b40$cf6651c0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIPebKt0SL2hL1PGxWEYogtVpy49QFNfH76AjeH7oICuocpW7FMcGJA
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrAJsWRmVeSWpSXmKPExsWy7bCmma75svY0g61HzC0ezNvGZnH9y3NW
	ix0NR1gtzp/fwG7xseceq8XlXXPYLGac38dkcfGUq8XhN+2sFv+ubWRx4PJ4f6OV3WPTqk42
	j74tqxg9Pm+SC2CJyrbJSE1MSS1SSM1Lzk/JzEu3VfIOjneONzUzMNQ1tLQwV1LIS8xNtVVy
	8QnQdcvMAbpHSaEsMacUKBSQWFyspG9nU5RfWpKqkJFfXGKrlFqQklNgXqBXnJhbXJqXrpeX
	WmJlaGBgZApUmJCdcerSZNaCVfIV56cvYWlgnCnRxcjJISFgItE/5QRjFyMXh5DADkaJHRsf
	s0I4nxglJhzexQbhfGOUmPT1CyNMy4X/X5lAbCGBvYwSWxo1IIpeMkq8fLkDrIhNQF9idfdt
	NhBbRGAPk8SCt/UgNrNAmsSKU1vYQWxOAXuJT4segtnCAnESX2/eBLNZBFQkHlx5DmbzClhK
	tF9bxgRhC0qcnPmEBWKOvMT2t3OYIQ5SkPj5dBkrxC43iTf3p0PViEjM7mxjBjlOQmAhh8Sc
	1hXsEA0uElceXIBqFpZ4dXwLVFxK4vO7vWwQdr7E5OtvmSCaGxglrv3rhmqwl1h05idQAwfQ
	Bk2J9bv0QUwJAWWJI7eg9vJJdBz+yw4R5pXoaBOCaFST+HTlMtQQGYljJ54xT2BUmoXks1lI
	PpuF5INZCLsWMLKsYhRLLSjOTU8tNiowhEd2cn7uJkZwUtVy3cE4+e0HvUOMTByMhxglOJiV
	RHil3jenCfGmJFZWpRblxxeV5qQWH2I0BYb1RGYp0eR8YFrPK4k3NLE0MDEzMzQ3MjUwVxLn
	vdc6N0VIID2xJDU7NbUgtQimj4mDU6qBKaK+Ldu85823lNDVOyb8WPP6G8PVGIuVW6ys/rDN
	U179tu5cgvCbq0+8NH8wi+w7UflB7KGB181ju+z3x2S5mWkbc8zK5/y7VkHt3Nn/L54kpO1g
	vr3467XYp5eKejOeZXHvl5h7bi7Pqg9zsjO9Ze4f2hPdFPNq0z3VtTUia79vD1kk7hAxI0o4
	tPP23fqJVhYeJ9+Vbt105Cv3lpYulwth1atWc5v9/1D4P1GjxDDm/ffcKd4HX/7dXbhSiCOc
	+eViprOKHy8t1J3y9LqS8+u82uJg04a3+1aJb2HeUDbtWVD4tk/7XlzjLmF5E7b8ZM6vpdfP
	G4upbnvFVx468ROH+U7h5O23eObWRLVdv3lYiaU4I9FQi7moOBEAHdcUnzMEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupjkeLIzCtJLcpLzFFi42LZdlhJTtd8WXuaweTLwhYP5m1js7j+5Tmr
	xY6GI6wW589vYLf42HOP1eLyrjlsFjPO72OyuHjK1eLwm3ZWi3/XNrI4cHm8v9HK7rFpVSeb
	R9+WVYwenzfJBbBEcdmkpOZklqUW6dslcGWcujSZtWCVfMX56UtYGhhnSnQxcnJICJhIXPj/
	lamLkYtDSGA3o8Txl+2sEAkZiY0N/9khbGGJ+y1HWCGKnjNKHFq7mgkkwSagL7G6+zYbSEJE
	4ACTxLMze5lBEswCGRKHrr1ng+j4wSixp7mTESTBKWAv8WnRQ7CxwgIxEs3nPoNNYhFQkXhw
	5TlYnFfAUqL92jImCFtQ4uTMJywQQ7Ulnt58CmXLS2x/O4cZ4jwFiZ9Pl4GdLSLgJvHm/nSo
	GhGJ2Z1tzBMYhWchGTULyahZSEbNQtKygJFlFaNkakFxbnpusWGBUV5quV5xYm5xaV66XnJ+
	7iZGcJRpae1g3LPqg94hRiYOxkOMEhzMSiK8Uu+b04R4UxIrq1KL8uOLSnNSiw8xSnOwKInz
	fnvdmyIkkJ5YkpqdmlqQWgSTZeLglGpgqvrOYfviDPuDDYHLr3778PPQfuFpDwR5BJ21V07s
	LaosPbjAf9Ltoyqm77cJ77C1nKgX/9q+VnTvofiE1PdHNi/M1nvO3Xtr7fqSfTcn7PE4yiBT
	21m5WZx9dnFq0aHVx6afawg1X+4p+S+vdcLpGBULCYcJ15VKt0Sa1BWrNmwzV17qnXnk7kxe
	rt91t3Y+VuJgfx2Yf6/wAsvSueKM69SmLWzV+CcVPcFQ9I7j8fBbHywSN9uzyC94eenGQtkQ
	r8WFX5ZKeZddSvqg8adfpDFhx3NNS474BvHKZputymzVcz1ZtQKUPh3T81qit2OL5pSO62XL
	jlheVRXbpH9+ku2yF5f+G3mx82seuSe2QYmlOCPRUIu5qDgRAJeoo9EhAwAA
X-CMS-MailID: 20240705075223epcas2p34f8fd5ca31da3afa27a28618dc939527
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240705021212epcas2p169cdc84203e007c7a25bb53f41fc61a0
References: <20240705021110.2495344-1-sunyeal.hong@samsung.com>
	<CGME20240705021212epcas2p169cdc84203e007c7a25bb53f41fc61a0@epcas2p1.samsung.com>
	<20240705021110.2495344-4-sunyeal.hong@samsung.com>
	<9c105dbb-f443-d96a-3071-6a8ebca0f84d@samsung.com>

Hello Jaewon,

> -----Original Message-----
> From: Jaewon Kim <jaewon02.kim@samsung.com>
> Sent: Friday, July 5, 2024 1:42 PM
> To: Sunyeal Hong <sunyeal.hong@samsung.com>; Krzysztof Kozlowski
> <krzk@kernel.org>; Sylwester Nawrocki <s.nawrocki@samsung.com>; Chanwoo
> Choi <cw00.choi@samsung.com>; Alim Akhtar <alim.akhtar@samsung.com>;
> Michael Turquette <mturquette@baylibre.com>; Stephen Boyd
> <sboyd@kernel.org>
> Cc: linux-samsung-soc@vger.kernel.org; linux-clk@vger.kernel.org; linux-
> kernel@vger.kernel.org
> Subject: Re: [PATCH 3/5] arm64: dts: exynos: add initial CMU clock nodes
> in Exynos Auto v920
> 
> Hi Sunyeal,
> 
> 
> On 7/5/24 11:11, Sunyeal Hong wrote:
> > Add cmu_top, cmu_peric0 clock nodes and switch USI clocks instead of
> > dummy fixed-rate-clock.
> >
> > Signed-off-by: Sunyeal Hong <sunyeal.hong@samsung.com>
> > ---
> >   .../arm64/boot/dts/exynos/exynosautov920.dtsi | 40 +++++++++++++------
> >   1 file changed, 27 insertions(+), 13 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
> > b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
> > index c1c8566d74f5..1659c0a375c9 100644
> > --- a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
> > +++ b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
> > @@ -6,6 +6,7 @@
> >    *
> >    */
> >
> > +#include <dt-bindings/clock/samsung,exynosautov920.h>
> >   #include <dt-bindings/interrupt-controller/arm-gic.h>
> >   #include <dt-bindings/soc/samsung,exynos-usi.h>
> >
> > @@ -38,17 +39,6 @@ xtcxo: clock {
> >   		clock-output-names = "oscclk";
> >   	};
> >
> > -	/*
> > -	 * FIXME: Keep the stub clock for serial driver, until proper clock
> > -	 * driver is implemented.
> > -	 */
> > -	clock_usi: clock-usi {
> > -		compatible = "fixed-clock";
> > -		#clock-cells = <0>;
> > -		clock-frequency = <200000000>;
> > -		clock-output-names = "usi";
> > -	};
> > -
> >   	cpus: cpus {
> >   		#address-cells = <2>;
> >   		#size-cells = <0>;
> > @@ -182,6 +172,28 @@ chipid@10000000 {
> >   			reg = <0x10000000 0x24>;
> >   		};
> >
> > +		cmu_peric0: clock-controller@10800000 {
> > +			compatible = "samsung,exynosautov920-cmu-peric0";
> > +			reg = <0x10800000 0x8000>;
> > +			#clock-cells = <1>;
> > +
> > +			clocks = <&xtcxo>,
> > +				 <&cmu_top DOUT_CLKCMU_PERIC0_NOC>,
> > +				 <&cmu_top DOUT_CLKCMU_PERIC0_IP>;
> > +			clock-names = "oscclk",
> > +				      "dout_clkcmu_peric0_noc",
> > +				      "dout_clkcmu_peric0_ip";
> > +		};
> > +
> > +		cmu_top: clock-controller@11000000 {
> > +			compatible = "samsung,exynosautov920-cmu-top";
> > +			reg = <0x11000000 0x8000>;
> > +			#clock-cells = <1>;
> > +
> > +			clocks = <&xtcxo>;
> > +			clock-names = "oscclk";
> > +		};
> > +
> >   		gic: interrupt-controller@10400000 {
> >   			compatible = "arm,gic-v3";
> >   			#interrupt-cells = <3>;
> > @@ -213,7 +225,8 @@ usi_0: usi@108800c0 {
> >   			#address-cells = <1>;
> >   			#size-cells = <1>;
> >   			ranges;
> > -			clocks = <&clock_usi>, <&clock_usi>;
> > +			clocks = <&cmu_peric0 CLK_DOUT_PERIC0_USI00_USI>,
> > +				 <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>;
> 
> it seems that the clocks have been switched.
> CLK_DOUT_PERIC0_USI00_USI is ipclk and CLK_MOUT_PERIC0_NOC_USER is pclk of
> USI.
> 
> 
> 
> >   			clock-names = "pclk", "ipclk";
> >   			status = "disabled";
> >
> > @@ -224,7 +237,8 @@ serial_0: serial@10880000 {
> >   				interrupts = <GIC_SPI 764 IRQ_TYPE_LEVEL_HIGH>;
> >   				pinctrl-names = "default";
> >   				pinctrl-0 = <&uart0_bus>;
> > -				clocks = <&clock_usi>, <&clock_usi>;
> > +				clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
> > +					 <&cmu_peric0 CLK_DOUT_PERIC0_USI00_USI>;
> >   				clock-names = "uart", "clk_uart_baud0";
> >   				samsung,uart-fifosize = <256>;
> >   				status = "disabled";
> 
> Thanks
> Jaewon Kim
> 

I will change ipclk and pclk clock node as you requested.

Thanks,
Sunyeal Hong

