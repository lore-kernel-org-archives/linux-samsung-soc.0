From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH] ARM: dts: Update vdd_arm regulator
Date: Mon, 10 Jun 2013 09:14:40 +0530
Message-ID: <51B54BA8.9020104@linaro.org>
References: <1370516572-313-1-git-send-email-tushar.behera@linaro.org> <1975506.ECnduUFuut@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f42.google.com ([209.85.220.42]:42346 "EHLO
	mail-pa0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751459Ab3FJDoq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 9 Jun 2013 23:44:46 -0400
Received: by mail-pa0-f42.google.com with SMTP id rl6so4036734pac.29
        for <linux-samsung-soc@vger.kernel.org>; Sun, 09 Jun 2013 20:44:45 -0700 (PDT)
In-Reply-To: <1975506.ECnduUFuut@flatron>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, patches@linaro.org, broonie@kernel.org, swarren@wwwdotorg.org, grant.likely@linaro.org, rob.herring@calxeda.com, l.majewski@samsung.com, s.nawrocki@samsung.com, devicetree-discuss@lists.ozlabs.org

On 06/08/2013 05:22 PM, Tomasz Figa wrote:
> Hi Tushar,
> 
> On Thursday 06 of June 2013 16:32:52 Tushar Behera wrote:
>> Cpufreq driver for EXYNOS4210 is not a platform driver, hence it is not
>> possible to provide the regulator supply name through DT bindings.
>> Since the cpufreq driver requires the regulator to be named as
>> 'vdd_arm', the related regulator name should be kept same.
>>
>> Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
>> ---
>>  arch/arm/boot/dts/exynos4210-origen.dts |    2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/boot/dts/exynos4210-origen.dts
>> b/arch/arm/boot/dts/exynos4210-origen.dts index bcf8079..bd5f589 100644
>> --- a/arch/arm/boot/dts/exynos4210-origen.dts
>> +++ b/arch/arm/boot/dts/exynos4210-origen.dts
>> @@ -192,7 +192,7 @@
>>  				};
>>
>>  				buck1_reg: BUCK1 {
>> -					regulator-name = "VDD_ARM_1.2V";
>> +					regulator-name = "vdd_arm";
> 
> Yes, this is the hack I mentioned in my review of
> [PATCH 0/2] Clock update for EXYNOS4210-CPUFREQ driver
> 

We can hold this patch till we get to a conclusion for the above
mentioned patch set.


> Best regards,
> Tomasz
> 
>>  					regulator-min-microvolt = 
> <950000>;
>>  					regulator-max-microvolt	= 
> <1350000>;
>>  					regulator-always-on;


-- 
Tushar Behera
