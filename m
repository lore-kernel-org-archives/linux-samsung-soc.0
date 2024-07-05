Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76AA113A24D
	for <linux-samsung-soc@vger.kernel.org>; Fri,  5 Jul 2024 04:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720154540; cv=none; b=M1zMnl00nj1p5cRH2g81NkhBbj4Bbi1PSOxbiwKeA6OIZ47KCUCD0EXxLyqUP5rqA9fr5rUB/jWt4xbMH2dSG+iHVWVJpVVsB9q+2vCgrbvR+DLoQ7yThHVhjpssy2yC/Pa+44TZSUBKM4MeQZ/KIuBJUK1tE77tXC6BYx79rXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720154540; c=relaxed/simple;
	bh=E6Xe8odyO9uwNBbWgmQEsel+IwoXCFV6ivzwPIjoZ0g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=Aa527V+r/IYBrf3xNqpeopclgRSkPaPwOLcSdLfvJExBb55Os0/Ex+UwmKgymygh9XE7Zi61z/BSfQF2aylfVsqpWeXbPpl8SDGOmTqQ9LVDl8woz6yajV+RSNHkEH968/knfjMq2fiyt5cb825+/qjyHRz1pR98jMJjiBn0pco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=Ch7LrKfQ; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Ch7LrKfQ"
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20240705044215epoutp031ade78ceb8e1632724c500b7270498b1~fN2_87drx2837928379epoutp03T
	for <linux-samsung-soc@vger.kernel.org>; Fri,  5 Jul 2024 04:42:15 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20240705044215epoutp031ade78ceb8e1632724c500b7270498b1~fN2_87drx2837928379epoutp03T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1720154535;
	bh=iT2LYSmHr7hAnZonc/K+mtRa73bNTB7yrF0e6PtAh2Q=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=Ch7LrKfQw/GtimOXT6davMdKVOSpX52FDBDaRaC9rk6LqN/fyrX8FNm2lMOddBqCF
	 O4hSNP5RDlEw9xeQNPv5nsUgcEgJFObB+BxYRtM0HUHkK5E+H0dRhnSI0qkcQ8E6W4
	 LbX4MgS6cfRaNXPnmgLoCqy/OauHl0+deXccv42s=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTP id
	20240705044215epcas2p497083bf1d9121cefdcfacc9fb3eedc89~fN2_cjWH71289412894epcas2p4o;
	Fri,  5 Jul 2024 04:42:15 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.36.102]) by
	epsnrtp4.localdomain (Postfix) with ESMTP id 4WFgpt48Htz4x9QH; Fri,  5 Jul
	2024 04:42:14 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
	epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
	93.9A.09848.6A977866; Fri,  5 Jul 2024 13:42:14 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20240705044214epcas2p4265b3a19c9117548d04786cce7ee3de0~fN29Z7Oi91730417304epcas2p4K;
	Fri,  5 Jul 2024 04:42:14 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20240705044214epsmtrp1d001e6ad800ca57dfd416248842f2865~fN29ZMOvY2699826998epsmtrp1b;
	Fri,  5 Jul 2024 04:42:14 +0000 (GMT)
X-AuditID: b6c32a45-1c7ff70000002678-87-668779a63fac
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	91.3D.07412.5A977866; Fri,  5 Jul 2024 13:42:13 +0900 (KST)
Received: from [10.229.8.168] (unknown [10.229.8.168]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20240705044213epsmtip265734f2011839f859d206a31182dcdc0~fN29GCDy92509025090epsmtip2V;
	Fri,  5 Jul 2024 04:42:13 +0000 (GMT)
Message-ID: <9c105dbb-f443-d96a-3071-6a8ebca0f84d@samsung.com>
Date: Fri, 5 Jul 2024 13:41:56 +0900
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
	Thunderbird/102.11.0
Subject: Re: [PATCH 3/5] arm64: dts: exynos: add initial CMU clock nodes in
 Exynos Auto v920
To: Sunyeal Hong <sunyeal.hong@samsung.com>, Krzysztof Kozlowski
	<krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi
	<cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, Michael
	Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Content-Language: en-US
From: Jaewon Kim <jaewon02.kim@samsung.com>
In-Reply-To: <20240705021110.2495344-4-sunyeal.hong@samsung.com>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprHJsWRmVeSWpSXmKPExsWy7bCmqe6yyvY0g9ZmWYsH87axWVz/8pzV
	4vz5DewWH3vusVpc3jWHzWLG+X1MFhdPuVocftPOavHv2kYWi6Zl65kcuDze32hl99i0qpPN
	o2/LKkaPz5vkAliism0yUhNTUosUUvOS81My89JtlbyD453jTc0MDHUNLS3MlRTyEnNTbZVc
	fAJ03TJzgO5RUihLzCkFCgUkFhcr6dvZFOWXlqQqZOQXl9gqpRak5BSYF+gVJ+YWl+al6+Wl
	llgZGhgYmQIVJmRntMxZxFYwTaLi54sZLA2MZ4W6GDk5JARMJP7+ucfWxcjFISSwg1Hi+o2v
	jCAJIYFPjBKfmlghEt8YJU5M+sYE07Hywj8miMReRonbv5axQnS8ZpS4+csCxOYVsJO41LKG
	BcRmEVCR+DfzGjtEXFDi5MwnYHFRgWiJ1mX32UBsYYE4iRtLNzKCDBURWMAkcX7XXrChzAIJ
	EksOf2CDsMUlbj2ZD3YFm4C2xPf1i8FqOAUcJA60HWGHqJGX2P52DjPIIAmBqRwSy2/vAJrK
	AeS4SCw/LQPxgbDEq+Nb2CFsKYmX/W1Qdr5E25UzUHaNxMYFlxghbHuJRWd+soOMYRbQlFi/
	Sx9iorLEkVssEFv5JDoO/2WHCPNKdLRBA1dN4v7Uc2wQtozEpCMroUHoIbFjyizmCYyKs5AC
	ZRaSH2ch+WUWwt4FjCyrGMVSC4pz01OLjQoM4VGdnJ+7iRGcULVcdzBOfvtB7xAjEwfjIUYJ
	DmYlEV6p981pQrwpiZVVqUX58UWlOanFhxhNgVEzkVlKNDkfmNLzSuINTSwNTMzMDM2NTA3M
	lcR577XOTRESSE8sSc1OTS1ILYLpY+LglGpgYmxgPSBvEP9r4bmtwVfyhUVN3RfE3IrVVSvb
	o9TAnLaDt0ZFN6b1mNy7gqjwn62CXpcSY1J3b/RKC7F43iPpGfd2TlrxYwH3Fb+/7NX/ePv+
	M+/Vm/7r/F50Lq3z1g/lqBu731iskq45u5bv0WWXeR9ZVBNXys5dPZk1i+PRUl6n4wo2+8wu
	dC/eEf5O59iE5NMiJ8MtpuhFNj0vUFE+e9z/u2agX0ZktahOclZ+TLW8a+4abz55u8OyTvtM
	JKyk7houn7SzSPYbe+s519fvRF9N3vboqut9/69b/xlNb5dh3ei191Hg9uLQr64rkrQZ5j3/
	zrRpip7Zlasiq0Kz3nP6Lp33q8PeX8zghqqhEktxRqKhFnNRcSIAUbYejTEEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpgkeLIzCtJLcpLzFFi42LZdlhJXndpZXuawclr5hYP5m1js7j+5Tmr
	xfnzG9gtPvbcY7W4vGsOm8WM8/uYLC6ecrU4/Kad1eLftY0sFk3L1jM5cHm8v9HK7rFpVSeb
	R9+WVYwenzfJBbBEcdmkpOZklqUW6dslcGW0zFnEVjBNouLnixksDYxnhboYOTkkBEwkVl74
	x9TFyMUhJLCbUaJhxg9GiISMxPJnfWwQtrDE/ZYjrCC2kMBLRomTh5xAbF4BO4lLLWtYQGwW
	ARWJfzOvsUPEBSVOznwCFhcViJZY/fkCWK+wQJzEjaUbGUGWiQgsYpKYt6QNrIFZIEHi/tbd
	bBALTjJK9B6QgIiLS9x6Mp8JxGYT0Jb4vn4x2CBOAQeJA21HoHrNJLq2djFC2PIS29/OYZ7A
	KDQLyR2zkIyahaRlFpKWBYwsqxglUwuKc9Nzkw0LDPNSy/WKE3OLS/PS9ZLzczcxgiNJS2MH
	4735//QOMTJxMB5ilOBgVhLhlXrfnCbEm5JYWZValB9fVJqTWnyIUZqDRUmc13DG7BQhgfTE
	ktTs1NSC1CKYLBMHp1QDE8fGrCk75tyPEzu6OcGBsd/hVpVPSctKXZMjijwrFJvfH147nSV2
	+rSVZ6Oak6JO2155vNszVX/vp6irm7JOT2/3rTl0KlQsUnqnyJn2CZOZdvauj2X5uLlWxep6
	o8ZB/jxXV4G3S2YLXl4fs0B34/2uW3HXzdfreB84U7/NMiBL6e0K416js2/Vf1vdd5/XL5l+
	rbg3bYvUS/UQ5ua1XyfIGj4VcVLQf6nIG+YTL7BuxralIjxaDiyLX/dkTjR4tLLX+tGE7ycT
	VK2W/7vFu4lf4uip0zMrU0yvCaXwn5b6LLwz2i/uWm7vCbFtaYmXg6cErVEvP6rOy/B0MyNn
	9fSDpnG7q1enrY+St+cXVWIpzkg01GIuKk4EAGxo1mETAwAA
X-CMS-MailID: 20240705044214epcas2p4265b3a19c9117548d04786cce7ee3de0
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

Hi Sunyeal,


On 7/5/24 11:11, Sunyeal Hong wrote:
> Add cmu_top, cmu_peric0 clock nodes and
> switch USI clocks instead of dummy fixed-rate-clock.
>
> Signed-off-by: Sunyeal Hong <sunyeal.hong@samsung.com>
> ---
>   .../arm64/boot/dts/exynos/exynosautov920.dtsi | 40 +++++++++++++------
>   1 file changed, 27 insertions(+), 13 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
> index c1c8566d74f5..1659c0a375c9 100644
> --- a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
> @@ -6,6 +6,7 @@
>    *
>    */
>   
> +#include <dt-bindings/clock/samsung,exynosautov920.h>
>   #include <dt-bindings/interrupt-controller/arm-gic.h>
>   #include <dt-bindings/soc/samsung,exynos-usi.h>
>   
> @@ -38,17 +39,6 @@ xtcxo: clock {
>   		clock-output-names = "oscclk";
>   	};
>   
> -	/*
> -	 * FIXME: Keep the stub clock for serial driver, until proper clock
> -	 * driver is implemented.
> -	 */
> -	clock_usi: clock-usi {
> -		compatible = "fixed-clock";
> -		#clock-cells = <0>;
> -		clock-frequency = <200000000>;
> -		clock-output-names = "usi";
> -	};
> -
>   	cpus: cpus {
>   		#address-cells = <2>;
>   		#size-cells = <0>;
> @@ -182,6 +172,28 @@ chipid@10000000 {
>   			reg = <0x10000000 0x24>;
>   		};
>   
> +		cmu_peric0: clock-controller@10800000 {
> +			compatible = "samsung,exynosautov920-cmu-peric0";
> +			reg = <0x10800000 0x8000>;
> +			#clock-cells = <1>;
> +
> +			clocks = <&xtcxo>,
> +				 <&cmu_top DOUT_CLKCMU_PERIC0_NOC>,
> +				 <&cmu_top DOUT_CLKCMU_PERIC0_IP>;
> +			clock-names = "oscclk",
> +				      "dout_clkcmu_peric0_noc",
> +				      "dout_clkcmu_peric0_ip";
> +		};
> +
> +		cmu_top: clock-controller@11000000 {
> +			compatible = "samsung,exynosautov920-cmu-top";
> +			reg = <0x11000000 0x8000>;
> +			#clock-cells = <1>;
> +
> +			clocks = <&xtcxo>;
> +			clock-names = "oscclk";
> +		};
> +
>   		gic: interrupt-controller@10400000 {
>   			compatible = "arm,gic-v3";
>   			#interrupt-cells = <3>;
> @@ -213,7 +225,8 @@ usi_0: usi@108800c0 {
>   			#address-cells = <1>;
>   			#size-cells = <1>;
>   			ranges;
> -			clocks = <&clock_usi>, <&clock_usi>;
> +			clocks = <&cmu_peric0 CLK_DOUT_PERIC0_USI00_USI>,
> +				 <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>;

it seems that the clocks have been switched.
CLK_DOUT_PERIC0_USI00_USI is ipclk and CLK_MOUT_PERIC0_NOC_USER is pclk of USI.

  

>   			clock-names = "pclk", "ipclk";
>   			status = "disabled";
>   
> @@ -224,7 +237,8 @@ serial_0: serial@10880000 {
>   				interrupts = <GIC_SPI 764 IRQ_TYPE_LEVEL_HIGH>;
>   				pinctrl-names = "default";
>   				pinctrl-0 = <&uart0_bus>;
> -				clocks = <&clock_usi>, <&clock_usi>;
> +				clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
> +					 <&cmu_peric0 CLK_DOUT_PERIC0_USI00_USI>;
>   				clock-names = "uart", "clk_uart_baud0";
>   				samsung,uart-fifosize = <256>;
>   				status = "disabled";

Thanks
Jaewon Kim

