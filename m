From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v3 07/13] ARM: dts: Add AK8975 device node for Exynos4412
 TRATS2 board
Date: Mon, 08 Jul 2013 14:52:51 +0200
Message-ID: <51DAB623.1010404@samsung.com>
References: <1372692155-17653-1-git-send-email-s.nawrocki@samsung.com>
 <1372692155-17653-8-git-send-email-s.nawrocki@samsung.com>
 <1491290.c836bFtNe2@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:60005 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751392Ab3GHMxD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 8 Jul 2013 08:53:03 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MPM004SVBP4U270@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 08 Jul 2013 13:53:00 +0100 (BST)
In-reply-to: <1491290.c836bFtNe2@flatron>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: kgene.kim@samsung.com, t.figa@samsung.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, myungjoo.ham@samsung.com, m.szyprowski@samsung.com, phil.carmody@partner.samsung.com, j.anaszewski@samsung.com, kyungmin.park@samsung.com, devicetree-discuss@lists.ozlabs.org

Hi Tomasz,

On 07/06/2013 01:18 AM, Tomasz Figa wrote:
> On Monday 01 of July 2013 17:22:29 Sylwester Nawrocki wrote:
>> From: Jacek Anaszewski <j.anaszewski@samsung.com>
>>
>> This patch adds AK8975 magnetometer node and corresponding
>> i2c-gpio bus node for TRATS2 board.
>>
>> Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
>> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
>> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
>> ---
>>  arch/arm/boot/dts/exynos4412-trats2.dts |   19 +++++++++++++++++++
>>  1 file changed, 19 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/exynos4412-trats2.dts
>> b/arch/arm/boot/dts/exynos4412-trats2.dts index 056b835..b9de3b5 100644
>> --- a/arch/arm/boot/dts/exynos4412-trats2.dts
>> +++ b/arch/arm/boot/dts/exynos4412-trats2.dts
>> @@ -19,6 +19,10 @@
>>  	model = "Samsung Trats 2 based on Exynos4412";
>>  	compatible = "samsung,trats2", "samsung,exynos4412";
>>
>> +	aliases {
>> +		i2c8 = &i2c_ak8975;
>> +	};
>> +
>>  	memory {
>>  		reg =  <0x40000000 0x40000000>;
>>  	};
>> @@ -453,4 +457,19 @@
>>  	serial@13830000 {
>>  		status = "okay";
>>  	};
>> +
>> +	i2c_ak8975: i2c-gpio@0 {
> 
> I think this @0 is slightly incorrect here, as it seems like there is no 
> reg property present inside the node and so the device isn't located at 
> any address.
> 
> For logical indices like in this case I would rather use i2c-gpio-0 
> instead.

Indeed, using "-<N>" postfix sounds like a better alternative. I'll change
it and repost the series after 3.11-rc1 is released.

>> +		compatible = "i2c-gpio";
>> +		gpios = <&gpy2 4 0>, <&gpy2 5 0>;
>> +		i2c-gpio,delay-us = <2>;
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +		status = "okay";
>> +
>> +		ak8975@0c {
>> +			compatible = "asahi-kasei,ak8975";
>> +			reg = <0x0c>;
>> +			gpios = <&gpj0 7 0>;
>> +		};
>> +	};
>>  };
> 
> Otherwise looks good.
> 
> Reviewed-by: Tomasz Figa <t.figa@samsung.com>

--
Thanks,
Sylwester
