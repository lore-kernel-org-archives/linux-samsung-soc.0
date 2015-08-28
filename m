From: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: use vqmmc-supply of emmc/sd for
 exynos4412-odroid-common
Date: Fri, 28 Aug 2015 10:56:59 +0900
Message-ID: <55DFBFEB.10904@samsung.com>
References: <1440667758-14960-1-git-send-email-jh80.chung@samsung.com>
 <55DF0204.1010604@samsung.com> <55DFBE08.9090603@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <55DFBE08.9090603-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jaehoon Chung <jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On 28.08.2015 10:48, Jaehoon Chung wrote:
> On 08/27/2015 09:26 PM, Krzysztof Kozlowski wrote:
>> W dniu 27.08.2015 o 18:29, Jaehoon Chung pisze:
>>> Currently vmmc's property is wrong.
>>> If it needs to control two supplies, then it has to use vmmc/vqmmc-supply.
>>> (Card supply power and I/O Line supply Power.)
>>>
>>> Signed-off-by: Jaehoon Chung <jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>>> ---
>>>  arch/arm/boot/dts/exynos4412-odroid-common.dtsi | 7 ++++---
>>>  1 file changed, 4 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
>>> index ca7d168..4ddabfd 100644
>>> --- a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
>>> +++ b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
>>> @@ -461,10 +461,10 @@
>>>  &mshc_0 {
>>>  	pinctrl-0 = <&sd4_clk &sd4_cmd &sd4_bus4 &sd4_bus8>;
>>>  	pinctrl-names = "default";
>>> -	vmmc-supply = <&ldo20_reg &buck8_reg>;
>>> +	vmmc-supply = <&ldo20_reg>;
>>> +	vqmmc-supply = <&buck8_reg>;
>>
>> Shouldn't this be reversed? LDO20 has 1.8V and it goes to MMC connector,
>> so it should be VQMMC?
> 
> If my schematics is right thing, buck8 is used LAN card power.
> I will send after removing buck8_reg. how about?
> Anyway, Thanks for pointing out. :)

Removing this regulator from this node would effectively disable it.
That could affect other components like LAN.

Anyway before fixing the order I would prefer to find the right
regulators used by MSHC node.

Best regards,
Krzysztof

> 
> I don't know who this regulator applied. I have guessed that it used for eMMC.
> Sorry for guessing.
> 
> Best Regards,
> Jaehoon Chung
> 
>>
>> In the same time I can't find on schematics where BUCK8 goes...
>>
>> The SDHCI_2 node below looks good.
>>
>> Best regards,
>> Krzysztof
>>
>>>  	mmc-pwrseq = <&emmc_pwrseq>;
>>>  	status = "okay";
>>> -
>>>  	num-slots = <1>;
>>>  	broken-cd;
>>>  	card-detect-delay = <200>;
>>> @@ -485,7 +485,8 @@
>>>  	bus-width = <4>;
>>>  	pinctrl-0 = <&sd2_clk &sd2_cmd &sd2_cd &sd2_bus4>;
>>>  	pinctrl-names = "default";
>>> -	vmmc-supply = <&ldo4_reg &ldo21_reg>;
>>> +	vmmc-supply = <&ldo21_reg>;
>>> +	vqmmc-supply = <&ldo4_reg>;
>>>  	cd-gpios = <&gpk2 2 0>;
>>>  	cd-inverted;
>>>  	status = "okay";
>>>
>>
>>
>>
> 
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
