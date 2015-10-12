From: Jaehoon Chung <jh80.chung@samsung.com>
Subject: Re: [PATCH 1/3] ARM: dts: exynos5422-odroidxu3: use cd-gpio method to
 detect sd-card
Date: Mon, 12 Oct 2015 13:43:47 +0900
Message-ID: <561B3A83.6090607@samsung.com>
References: <1444578364-1384-1-git-send-email-linux.amoon@gmail.com>
 <561B3739.4040701@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:46677 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751068AbbJLEnu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 12 Oct 2015 00:43:50 -0400
In-reply-to: <561B3739.4040701@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Anand Moon <linux.amoon@gmail.com>, Kukjin Kim <kgene@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Lukasz Majewski <l.majewski@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

Hi,

On 10/12/2015 01:29 PM, Krzysztof Kozlowski wrote:
> On 12.10.2015 00:46, Anand Moon wrote:
>> From: Jaehoon Chung <jh80.chung@samsung.com>
>>
>> To detect sd-card use the cd-gpio method.
>> It can decrease the interrupt for detecting sd-card.
>>
>> Signed-off-by: Jaehoon Chung <jh80.chung@samsung.com>
>> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
>>
>> ---
>> Changes based on git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git v4.4-next/dt-samsung branch
>> ---
>>  arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
>> index 1af5bdc..26decbd 100644
>> --- a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
>> +++ b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
>> @@ -352,8 +352,10 @@
>>  	samsung,dw-mshc-ciu-div = <3>;
>>  	samsung,dw-mshc-sdr-timing = <0 4>;
>>  	samsung,dw-mshc-ddr-timing = <0 2>;
>> +	cd-gpios = <&gpc2 2 GPIO_ACTIVE_HIGH>;
>> +	cd-inverted;
>>  	pinctrl-names = "default";
>> -	pinctrl-0 = <&sd2_clk &sd2_cmd &sd2_cd &sd2_bus1 &sd2_bus4>;
>> +	pinctrl-0 = <&sd2_clk &sd2_cmd &sd2_cd &sd2_bus4>;

Don't do change this.

> 
> Anand,
> 
> You essentially reverted here af6ad88acbd6 ("ARM: dts: Mux XMMCnDATA[0]
> pad correctly for Exynos5420 boards"). Why? There is no explanation in
> the commit message about this.

I don't remember to send the patch relevant to this. Hmm...
Well, Is this patch really signed-off by me?

Best Regards,
Jaehoon Chung
> 
> Best regards,
> Krzysztof
> 
> 
