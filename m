From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v3 08/13] ARM: dts: Add camera device nodes for Exynos4412
 TRATS2 board
Date: Mon, 08 Jul 2013 15:13:27 +0200
Message-ID: <51DABAF7.5000201@samsung.com>
References: <1372692155-17653-1-git-send-email-s.nawrocki@samsung.com>
 <1372692155-17653-9-git-send-email-s.nawrocki@samsung.com>
 <1996184.tcirO0Du7j@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:38902 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751213Ab3GHNNa (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 8 Jul 2013 09:13:30 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MPM00MVYCP3TS40@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 08 Jul 2013 14:13:28 +0100 (BST)
In-reply-to: <1996184.tcirO0Du7j@flatron>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: kgene.kim@samsung.com, t.figa@samsung.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, myungjoo.ham@samsung.com, m.szyprowski@samsung.com, phil.carmody@partner.samsung.com, j.anaszewski@samsung.com, kyungmin.park@samsung.com, devicetree-discuss@lists.ozlabs.org

On 07/06/2013 01:23 AM, Tomasz Figa wrote:
> On Monday 01 of July 2013 17:22:30 Sylwester Nawrocki wrote:
>> This patch enables the front camera using the internal
>> camera ISP (FIMC-IS).
>>
>> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
>> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
>> ---
>>  arch/arm/boot/dts/exynos4412-trats2.dts |   91
>> +++++++++++++++++++++++++++++++ 1 file changed, 91 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/exynos4412-trats2.dts
>> b/arch/arm/boot/dts/exynos4412-trats2.dts index b9de3b5..e9fb3de 100644
>> --- a/arch/arm/boot/dts/exynos4412-trats2.dts
>> +++ b/arch/arm/boot/dts/exynos4412-trats2.dts
>> @@ -62,6 +62,15 @@
>>  			enable-active-high;
>>  		};
>>
>> +		cam_io_reg: voltage-regulator@3 {
> 
> Same comment here as for patch 7/13. This is not an address of this 
> regulator, so I would rather use -3 prefix.

Yes, and this is the convention already used in this 'regulators' node.
I'll rename that node to 'voltage-regulator-1'.

>> +			compatible = "regulator-fixed";
>> +			regulator-name = "CAM_SENSOR_A";
>> +			regulator-min-microvolt = <2800000>;
>> +			regulator-max-microvolt = <2800000>;
>> +			gpio = <&gpm0 2 0>;
>> +			enable-active-high;
>> +		};
>> +
>>  		/* More to come */
>>  	};
>>
>> @@ -472,4 +481,86 @@
>>  			gpios = <&gpj0 7 0>;
>>  		};
>>  	};
>> +
>> +	camera {
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&cam_port_b_clk_active>;
>> +		status = "okay";
>> +
>> +		fimc_0: fimc@11800000 {
>> +			clock-frequency = <160000000>;
>> +			status = "okay";
>> +		};
>> +
>> +		fimc_1: fimc@11810000 {
>> +			clock-frequency = <160000000>;
>> +			status = "okay";
>> +		};
>> +
>> +		fimc_2: fimc@11820000 {
>> +			clock-frequency = <160000000>;
>> +			status = "okay";
>> +		};
>> +
>> +		fimc_3: fimc@11830000 {
>> +			clock-frequency = <160000000>;
>> +			status = "okay";
>> +		};
>> +
>> +		csis_1: csis@11890000 {
>> +			vddcore-supply = <&ldo8_reg>;
>> +			vddio-supply = <&ldo10_reg>;
>> +			clock-frequency = <160000000>;
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
> 
> Hmm. Couldn't the two #properties above be moved to exynos4.dtsi instead?

Normally the port/endpoint nodes are board specific. But since the binding
requires at least one port and endpoint node, these properties will always
need to be specified. Thus it's a good idea to move them to exynos4.dtsi.

--
Thanks,
Sylwester
