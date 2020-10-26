Return-Path: <SRS0=YeST=EB=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D24D0C4363A
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 26 Oct 2020 21:02:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5AC3020773
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 26 Oct 2020 21:02:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="UKmL4K6W"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729360AbgJZVCd (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 26 Oct 2020 17:02:33 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:48057 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729359AbgJZVCd (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 26 Oct 2020 17:02:33 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20201026210221euoutp01f6a03c71008d74f9a1469eabefef29d4~Bpp5s4k5J2266822668euoutp01F
        for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Oct 2020 21:02:21 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20201026210221euoutp01f6a03c71008d74f9a1469eabefef29d4~Bpp5s4k5J2266822668euoutp01F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1603746141;
        bh=7OWS+PYKKfHyI+SvTeQCwPN4+VdMSSBxGKv5skSZcA4=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=UKmL4K6WvT2dYcVK+/aygwMf8wbwy4YUVbBnV8uw3nsrVAbJ1X5rTmj5mCmiHmrFF
         +LdXU2yc5pYc99kLYN6ewmcFtHEignub12sozyjFF3076tNsPWmDJX9vY59Ydd5DJ6
         uPyCCewWxqNPaKHB2L7ZYdcT4itrGNHfvVtbXiB8=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20201026210210eucas1p1310c441bebfee60b33663d2022a4a803~BppvwGq7n1795517955eucas1p1m;
        Mon, 26 Oct 2020 21:02:10 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 64.1A.06456.259379F5; Mon, 26
        Oct 2020 21:02:10 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20201026210210eucas1p146aa91763070b383193f061b24f235cb~BppvYXVab2626026260eucas1p1H;
        Mon, 26 Oct 2020 21:02:10 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20201026210210eusmtrp1d2376b89c4119c1074c10908a3b5e26a~BppvXrtkH2665726657eusmtrp19;
        Mon, 26 Oct 2020 21:02:10 +0000 (GMT)
X-AuditID: cbfec7f2-7efff70000001938-b6-5f9739523b42
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 28.EC.06314.259379F5; Mon, 26
        Oct 2020 21:02:10 +0000 (GMT)
Received: from [106.210.88.143] (unknown [106.210.88.143]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20201026210209eusmtip1fa6917250d954800bacb0662e0a40641~BppuyyUPR3104031040eusmtip1a;
        Mon, 26 Oct 2020 21:02:09 +0000 (GMT)
Subject: Re: [PATCH 04/12] ARM: dts: exynos: adjust node names to DT spec in
 Exynos4412 boards
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <7832e031-81b0-c77e-57fa-cf122cd989d4@samsung.com>
Date:   Mon, 26 Oct 2020 22:02:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
        Gecko/20100101 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201026181528.163143-5-krzk@kernel.org>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrDKsWRmVeSWpSXmKPExsWy7djP87pBltPjDeb8N7d4MG8bm8XGGetZ
        La5/ec5qMf/IOVaL/sevmS3On9/AbrHp8TVWi8u75rBZzDi/j8mide8Rdov2py+ZHbg9Nq3q
        ZPPYvKTeo2/LKkaPz5vkAliiuGxSUnMyy1KL9O0SuDJmzHjPXvAxoKKjZzp7A+N3my5GTg4J
        AROJFw/3s3YxcnEICaxglFh2fy4jhPOFUaL7STcbhPOZUWLbvh52mJYbHd+hqpYzSkxafhGq
        /z2jRGPDYkaQKmGBBInDb08xgSREQNovT77GDOIwC2xhlJj4ZRobSBWbgKFE19suMJtXwE5i
        6tdNYDtYBFQl3m97ChYXFUiS+Pv5DzNEjaDEyZlPWEBsTgEzifUrfoPZzALyEtvfzmGGsMUl
        bj2ZD7ZZQuAUu0TztjfMEIe7SPw8fwHKFpZ4dXwL1EMyEqcn97BANDQzSjw8t5YdwukBurtp
        BiNElbXEnXO/gE7iAFqhKbF+lz5E2FFi6s8uZpCwhACfxI23ghBH8ElM2jYdKswr0dEmBFGt
        JjHr+Dq4tQcvXGKewKg0C8lrs5C8MwvJO7MQ9i5gZFnFKJ5aWpybnlpsmJdarlecmFtcmpeu
        l5yfu4kRmKZO/zv+aQfj10tJhxgFOBiVeHgvvJ0WL8SaWFZcmXuIUYKDWUmE1+ns6Tgh3pTE
        yqrUovz4otKc1OJDjNIcLErivMaLXsYKCaQnlqRmp6YWpBbBZJk4OKUaGP0Omj83Ut8f8kHz
        /1ndhTuXL4o++W3SCydR4211+R9sE6sZzCZYFegkTSkqOa6Uut1JPvtOwekjTlz9XU2cfg+z
        G3rXHijSKZRVkzp06tRDxsp4d965q2qkE5liPl1c8ND9+4YAm4iyh+83vzn77cg/bjf2xc4C
        RkLck2b+qUyUf30h03/nXyWW4oxEQy3mouJEAJLC2HJPAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrHIsWRmVeSWpSXmKPExsVy+t/xu7pBltPjDSZtVbR4MG8bm8XGGetZ
        La5/ec5qMf/IOVaL/sevmS3On9/AbrHp8TVWi8u75rBZzDi/j8mide8Rdov2py+ZHbg9Nq3q
        ZPPYvKTeo2/LKkaPz5vkAlii9GyK8ktLUhUy8otLbJWiDS2M9AwtLfSMTCz1DI3NY62MTJX0
        7WxSUnMyy1KL9O0S9DJmzHjPXvAxoKKjZzp7A+N3my5GTg4JAROJGx3fGbsYuTiEBJYySnS8
        O8AOkZCRODmtgRXCFpb4c62LDaLoLaPEwunrGUESwgIJEoffnmICSYgIfGaUeNa4iRnEYRbY
        wihxZ9I2FoiWrYwSax/PZQZpYRMwlOh6CzKLk4NXwE5i6tdNYPtYBFQl3m97ChYXFUiSeHlh
        KhNEjaDEyZlPWEBsTgEzifUrfoPZzED2vM0PmSFseYntb+dA2eISt57MZ5rAKDQLSfssJC2z
        kLTMQtKygJFlFaNIamlxbnpusaFecWJucWleul5yfu4mRmBcbjv2c/MOxksbgw8xCnAwKvHw
        Xng7LV6INbGsuDL3EKMEB7OSCK/T2dNxQrwpiZVVqUX58UWlOanFhxhNgZ6byCwlmpwPTBl5
        JfGGpobmFpaG5sbmxmYWSuK8HQIHY4QE0hNLUrNTUwtSi2D6mDg4pRoYWdI9bpa3b7gkf0H8
        p/p18xSB5f/lu94taChu4m6V9pI4Wfv+T9bNf3em3rrRIzv3beCF20yOYY0db3d93/fnWuGE
        Jwxqm8xWTMw0PrvqEbeIxG5VTfMHz9hW+xzhvCa60ytWj9Hy4eGg+J/tlsWKgQFcuU0BXUuY
        FRi3xgrPfPbia+mmK6tYlFiKMxINtZiLihMBgHPid+ECAAA=
X-CMS-MailID: 20201026210210eucas1p146aa91763070b383193f061b24f235cb
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20201026181555eucas1p265c52e647f7cd28d410135ccbd236b70
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20201026181555eucas1p265c52e647f7cd28d410135ccbd236b70
References: <20201026181528.163143-1-krzk@kernel.org>
        <CGME20201026181555eucas1p265c52e647f7cd28d410135ccbd236b70@eucas1p2.samsung.com>
        <20201026181528.163143-5-krzk@kernel.org>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org


On 26.10.2020 19:15, Krzysztof Kozlowski wrote:
> The Devicetree specification expects device node names to have a generic
> name, representing the class of a device.  Also the convention for node
> names is to use hyphens, not underscores.
>
> No functional changes.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>   arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi   |  8 ++++----
>   arch/arm/boot/dts/exynos4412-itop-elite.dts   |  2 +-
>   .../boot/dts/exynos4412-itop-scp-core.dtsi    |  2 +-
>   arch/arm/boot/dts/exynos4412-midas.dtsi       | 12 +++++------
>   arch/arm/boot/dts/exynos4412-n710x.dts        |  2 +-
>   .../boot/dts/exynos4412-odroid-common.dtsi    |  8 ++++----
>   arch/arm/boot/dts/exynos4412-odroidx.dts      |  4 ++--
>   arch/arm/boot/dts/exynos4412-origen.dts       | 14 ++++++-------
>   arch/arm/boot/dts/exynos4412-smdk4412.dts     | 20 +++++++++----------
>   9 files changed, 36 insertions(+), 36 deletions(-)
>
> diff --git a/arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi b/arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi
> index 89ed81fb348d..db91678f5648 100644
> --- a/arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi
> +++ b/arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi
> @@ -15,7 +15,7 @@ aliases {
>   		i2c10 = &i2c_cm36651;
>   	};
>   
> -	aat1290 {
> +	led-controller {
>   		compatible = "skyworks,aat1290";
>   		flen-gpios = <&gpj1 1 GPIO_ACTIVE_HIGH>;
>   		enset-gpios = <&gpj1 2 GPIO_ACTIVE_HIGH>;
> @@ -60,7 +60,7 @@ i2c_ak8975: i2c-gpio-0 {
>   		#size-cells = <0>;
>   		status = "okay";
>   
> -		ak8975@c {
> +		magnetometer@c {
>   			compatible = "asahi-kasei,ak8975";
>   			reg = <0x0c>;
>   			gpios = <&gpj0 7 GPIO_ACTIVE_HIGH>;
> @@ -75,7 +75,7 @@ i2c_cm36651: i2c-gpio-2 {
>   		#address-cells = <1>;
>   		#size-cells = <0>;
>   
> -		cm36651@18 {
> +		sensor@18 {
light-sensor?
>   			compatible = "capella,cm36651";
>   			reg = <0x18>;
>   			interrupt-parent = <&gpx0>;
> @@ -133,7 +133,7 @@ timing-0 {
>   };
>   
>   &i2c_3 {
> -	mms114-touchscreen@48 {
> +	touchscreen@48 {
>   		compatible = "melfas,mms114";
>   		reg = <0x48>;
>   		interrupt-parent = <&gpm2>;
> diff --git a/arch/arm/boot/dts/exynos4412-itop-elite.dts b/arch/arm/boot/dts/exynos4412-itop-elite.dts
> index f6d0a5f5d339..3063e44fcbcc 100644
> --- a/arch/arm/boot/dts/exynos4412-itop-elite.dts
> +++ b/arch/arm/boot/dts/exynos4412-itop-elite.dts
> @@ -175,7 +175,7 @@ &i2c_4 {
>   	pinctrl-names = "default";
>   	status = "okay";
>   
> -	codec: wm8960@1a {
> +	codec: codec@1a {
audio-codec?
>   		compatible = "wlf,wm8960";
>   		reg = <0x1a>;
>   		clocks = <&pmu_system_controller 0>;
> diff --git a/arch/arm/boot/dts/exynos4412-itop-scp-core.dtsi b/arch/arm/boot/dts/exynos4412-itop-scp-core.dtsi
> index dfceb155b3a7..4583d342af39 100644
> --- a/arch/arm/boot/dts/exynos4412-itop-scp-core.dtsi
> +++ b/arch/arm/boot/dts/exynos4412-itop-scp-core.dtsi
> @@ -134,7 +134,7 @@ &i2c_1 {
>   	pinctrl-names = "default";
>   	status = "okay";
>   
> -	s5m8767: s5m8767-pmic@66 {
> +	s5m8767: pmic@66 {
>   		compatible = "samsung,s5m8767-pmic";
>   		reg = <0x66>;
>   
> diff --git a/arch/arm/boot/dts/exynos4412-midas.dtsi b/arch/arm/boot/dts/exynos4412-midas.dtsi
> index 7e7c243ff196..52a4f6e6c7f2 100644
> --- a/arch/arm/boot/dts/exynos4412-midas.dtsi
> +++ b/arch/arm/boot/dts/exynos4412-midas.dtsi
> @@ -220,7 +220,7 @@ i2c_max77693_fuel: i2c-gpio-3 {
>   		#size-cells = <0>;
>   		status = "okay";
>   
> -		max77693-fuel-gauge@36 {
> +		fuel-gauge@36 {
>   			compatible = "maxim,max17047";
>   			interrupt-parent = <&gpx2>;
>   			interrupts = <3 IRQ_TYPE_EDGE_FALLING>;
> @@ -550,7 +550,7 @@ &i2c_0 {
>   	pinctrl-names = "default";
>   	status = "okay";
>   
> -	s5c73m3: s5c73m3@3c {
> +	s5c73m3: sensor@3c {
image-sensor?
>   		compatible = "samsung,s5c73m3";
>   		reg = <0x3c>;
>   		xshutdown-gpios = <&gpf1 3 GPIO_ACTIVE_LOW>; /* ISP_RESET */
> @@ -577,7 +577,7 @@ &i2c1_isp {
>   	pinctrl-0 = <&fimc_is_i2c1>;
>   	pinctrl-names = "default";
>   
> -	s5k6a3@10 {
> +	sensor@10 {
image-sensor?
>   		compatible = "samsung,s5k6a3";
>   		reg = <0x10>;
>   		svdda-supply = <&cam_io_reg>;
> @@ -616,7 +616,7 @@ &i2c_4 {
>   	pinctrl-names = "default";
>   	status = "okay";
>   
> -	wm1811: wm1811@1a {
> +	wm1811: codec@1a {
audio-codec?
>   		compatible = "wlf,wm1811";
>   		reg = <0x1a>;
>   		clocks = <&pmu_system_controller 0>,
> @@ -665,7 +665,7 @@ &i2c_7 {
>   	pinctrl-names = "default";
>   	status = "okay";
>   
> -	max77686: max77686_pmic@9 {
> +	max77686: pmic@9 {
>   		compatible = "maxim,max77686";
>   		interrupt-parent = <&gpx0>;
>   		interrupts = <7 IRQ_TYPE_NONE>;
> @@ -1407,7 +1407,7 @@ &spi_1 {
>   	cs-gpios = <&gpb 5 GPIO_ACTIVE_HIGH>;
>   	status = "okay";
>   
> -	s5c73m3_spi: s5c73m3@0 {
> +	s5c73m3_spi: sensor@0 {
image-sensor?
>   		compatible = "samsung,s5c73m3";
>   		spi-max-frequency = <50000000>;
>   		reg = <0>;
> diff --git a/arch/arm/boot/dts/exynos4412-n710x.dts b/arch/arm/boot/dts/exynos4412-n710x.dts
> index a47b7f35fc80..c49dbb7847b8 100644
> --- a/arch/arm/boot/dts/exynos4412-n710x.dts
> +++ b/arch/arm/boot/dts/exynos4412-n710x.dts
> @@ -45,7 +45,7 @@ &i2c_3 {
>   	pinctrl-names = "default";
>   	status = "okay";
>   
> -	mms152-touchscreen@48 {
> +	touchscreen@48 {
>   		compatible = "melfas,mms152";
>   		reg = <0x48>;
>   		interrupt-parent = <&gpm2>;
> diff --git a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
> index c3b6e6d367ab..3dcd7f7f10f3 100644
> --- a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
> +++ b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
> @@ -27,7 +27,7 @@ gpio_keys: gpio-keys {
>   		pinctrl-names = "default";
>   		pinctrl-0 = <&gpio_power_key>;
>   
> -		power_key {
> +		power-key {
>   			gpios = <&gpx1 3 GPIO_ACTIVE_LOW>;
>   			linux,code = <KEY_POWER>;
>   			label = "power key";
> @@ -171,7 +171,7 @@ cooling_map1: map1 {
>   };
>   
>   &pinctrl_1 {
> -	gpio_power_key: power_key {
> +	gpio_power_key: power-key {
>   		samsung,pins = "gpx1-3";
>   		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
>   	};
> @@ -266,7 +266,7 @@ &i2c_0 {
>   	samsung,i2c-max-bus-freq = <400000>;
>   	status = "okay";
>   
> -	usb3503: usb3503@8 {
> +	usb3503: usb-hub@8 {
>   		compatible = "smsc,usb3503";
>   		reg = <0x08>;
>   
> @@ -492,7 +492,7 @@ buck8_reg: BUCK8 {
>   
>   &i2c_1 {
>   	status = "okay";
> -	max98090: max98090@10 {
> +	max98090: codec@10 {
audio-codec?
>   		compatible = "maxim,max98090";
>   		reg = <0x10>;
>   		interrupt-parent = <&gpx0>;
> diff --git a/arch/arm/boot/dts/exynos4412-odroidx.dts b/arch/arm/boot/dts/exynos4412-odroidx.dts
> index 68fe88074d1d..46381e9097f4 100644
> --- a/arch/arm/boot/dts/exynos4412-odroidx.dts
> +++ b/arch/arm/boot/dts/exynos4412-odroidx.dts
> @@ -36,7 +36,7 @@ led2 {
>   		};
>   	};
>   
> -	regulator_p3v3 {
> +	regulator-1 {
>   		compatible = "regulator-fixed";
>   		regulator-name = "p3v3_en";
>   		regulator-min-microvolt = <3300000>;
> @@ -81,7 +81,7 @@ &mshc_0 {
>   };
>   
>   &pinctrl_1 {
> -	gpio_home_key: home_key {
> +	gpio_home_key: home-key {
>   		samsung,pins = "gpx2-2";
>   		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
>   	};
> diff --git a/arch/arm/boot/dts/exynos4412-origen.dts b/arch/arm/boot/dts/exynos4412-origen.dts
> index c2e793b69e7d..e1f6de53e20e 100644
> --- a/arch/arm/boot/dts/exynos4412-origen.dts
> +++ b/arch/arm/boot/dts/exynos4412-origen.dts
> @@ -116,7 +116,7 @@ &i2c_0 {
>   	pinctrl-names = "default";
>   	status = "okay";
>   
> -	s5m8767_pmic@66 {
> +	pmic@66 {
>   		compatible = "samsung,s5m8767-pmic";
>   		reg = <0x66>;
>   
> @@ -453,37 +453,37 @@ &keypad {
>   	pinctrl-names = "default";
>   	status = "okay";
>   
> -	key_home {
> +	key-home {
>   		keypad,row = <0>;
>   		keypad,column = <0>;
>   		linux,code = <KEY_HOME>;
>   	};
>   
> -	key_down {
> +	key-down {
>   		keypad,row = <0>;
>   		keypad,column = <1>;
>   		linux,code = <KEY_DOWN>;
>   	};
>   
> -	key_up {
> +	key-up {
>   		keypad,row = <1>;
>   		keypad,column = <0>;
>   		linux,code = <KEY_UP>;
>   	};
>   
> -	key_menu {
> +	key-menu {
>   		keypad,row = <1>;
>   		keypad,column = <1>;
>   		linux,code = <KEY_MENU>;
>   	};
>   
> -	key_back {
> +	key-back {
>   		keypad,row = <2>;
>   		keypad,column = <0>;
>   		linux,code = <KEY_BACK>;
>   	};
>   
> -	key_enter {
> +	key-enter {
>   		keypad,row = <2>;
>   		keypad,column = <1>;
>   		linux,code = <KEY_ENTER>;
> diff --git a/arch/arm/boot/dts/exynos4412-smdk4412.dts b/arch/arm/boot/dts/exynos4412-smdk4412.dts
> index 49971203a8aa..cc99b955af0c 100644
> --- a/arch/arm/boot/dts/exynos4412-smdk4412.dts
> +++ b/arch/arm/boot/dts/exynos4412-smdk4412.dts
> @@ -71,61 +71,61 @@ &keypad {
>   	pinctrl-names = "default";
>   	status = "okay";
>   
> -	key_1 {
> +	key-1 {
>   		keypad,row = <1>;
>   		keypad,column = <3>;
>   		linux,code = <2>;
>   	};
>   
> -	key_2 {
> +	key-2 {
>   		keypad,row = <1>;
>   		keypad,column = <4>;
>   		linux,code = <3>;
>   	};
>   
> -	key_3 {
> +	key-3 {
>   		keypad,row = <1>;
>   		keypad,column = <5>;
>   		linux,code = <4>;
>   	};
>   
> -	key_4 {
> +	key-4 {
>   		keypad,row = <1>;
>   		keypad,column = <6>;
>   		linux,code = <5>;
>   	};
>   
> -	key_5 {
> +	key-5 {
>   		keypad,row = <1>;
>   		keypad,column = <7>;
>   		linux,code = <6>;
>   	};
>   
> -	key_A {
> +	key-A {
>   		keypad,row = <2>;
>   		keypad,column = <6>;
>   		linux,code = <30>;
>   	};
>   
> -	key_B {
> +	key-B {
>   		keypad,row = <2>;
>   		keypad,column = <7>;
>   		linux,code = <48>;
>   	};
>   
> -	key_C {
> +	key-C {
>   		keypad,row = <0>;
>   		keypad,column = <5>;
>   		linux,code = <46>;
>   	};
>   
> -	key_D {
> +	key-D {
>   		keypad,row = <2>;
>   		keypad,column = <5>;
>   		linux,code = <32>;
>   	};
>   
> -	key_E {
> +	key-E {
>   		keypad,row = <0>;
>   		keypad,column = <7>;
>   		linux,code = <18>;

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

