From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH] ARM: dts: Update vdd_arm regulator
Date: Thu, 20 Jun 2013 16:40:16 +0530
Message-ID: <51C2E318.7020806@linaro.org>
References: <1370516572-313-1-git-send-email-tushar.behera@linaro.org> <1975506.ECnduUFuut@flatron> <51B54BA8.9020104@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f47.google.com ([209.85.160.47]:35352 "EHLO
	mail-pb0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965184Ab3FTLKW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Jun 2013 07:10:22 -0400
Received: by mail-pb0-f47.google.com with SMTP id rr13so6086528pbb.6
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Jun 2013 04:10:22 -0700 (PDT)
In-Reply-To: <51B54BA8.9020104@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com
Cc: Tomasz Figa <tomasz.figa@gmail.com>, linux-samsung-soc@vger.kernel.org, patches@linaro.org, broonie@kernel.org, swarren@wwwdotorg.org, grant.likely@linaro.org, rob.herring@calxeda.com, l.majewski@samsung.com, s.nawrocki@samsung.com, devicetree-discuss@lists.ozlabs.org

On 06/10/2013 09:14 AM, Tushar Behera wrote:
> On 06/08/2013 05:22 PM, Tomasz Figa wrote:
>> Hi Tushar,
>>
>> On Thursday 06 of June 2013 16:32:52 Tushar Behera wrote:
>>> Cpufreq driver for EXYNOS4210 is not a platform driver, hence it is not
>>> possible to provide the regulator supply name through DT bindings.
>>> Since the cpufreq driver requires the regulator to be named as
>>> 'vdd_arm', the related regulator name should be kept same.
>>>
>>> Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
>>> ---
>>>  arch/arm/boot/dts/exynos4210-origen.dts |    2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/arch/arm/boot/dts/exynos4210-origen.dts
>>> b/arch/arm/boot/dts/exynos4210-origen.dts index bcf8079..bd5f589 100644
>>> --- a/arch/arm/boot/dts/exynos4210-origen.dts
>>> +++ b/arch/arm/boot/dts/exynos4210-origen.dts
>>> @@ -192,7 +192,7 @@
>>>  				};
>>>
>>>  				buck1_reg: BUCK1 {
>>> -					regulator-name = "VDD_ARM_1.2V";
>>> +					regulator-name = "vdd_arm";
>>
>> Yes, this is the hack I mentioned in my review of
>> [PATCH 0/2] Clock update for EXYNOS4210-CPUFREQ driver
>>
> 
> We can hold this patch till we get to a conclusion for the above
> mentioned patch set.
> 
Kukjin,

We have agreed to go ahead with this approach till the cpufreq driver
has not been modified.

Can you please take this patch now?

-- 
Tushar Behera
