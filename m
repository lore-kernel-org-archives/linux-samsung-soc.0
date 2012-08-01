From: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Subject: Re: [PATCH v3 2/2] ARM: EXYNOS: Add Gscaler device from DT
Date: Wed, 01 Aug 2012 21:03:02 +0200
Message-ID: <50197D66.1050108@gmail.com>
References: <1342789723-3949-1-git-send-email-shaik.ameer@samsung.com> <1342789723-3949-3-git-send-email-shaik.ameer@samsung.com> <033301cd6fb0$7ac4af90$704e0eb0$%kim@samsung.com> <CAJuYYwTy5zkeM_cJO7HMm+=v=ORPHD26nQYZwXK6v1noWm1EuA@mail.gmail.com> <5018E656.3070803@samsung.com> <036f01cd6fc4$120a9910$361fcb30$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bk0-f46.google.com ([209.85.214.46]:44766 "EHLO
	mail-bk0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754421Ab2HATDG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 1 Aug 2012 15:03:06 -0400
Received: by bkwj10 with SMTP id j10so3926587bkw.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 01 Aug 2012 12:03:05 -0700 (PDT)
In-Reply-To: <036f01cd6fc4$120a9910$361fcb30$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Sylwester Nawrocki' <s.nawrocki@samsung.com>, 'Thomas Abraham' <thomas.abraham@linaro.org>, 'Shaik Ameer Basha' <shaik.ameer@samsung.com>, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, sy0816.kang@samsung.com, olofj@google.com, thomas.ab@samsung.com, sachin.kamat@linaro.org, joshi@samsung.com, shaik.samsung@gmail.com, sungchun.kang@samsung.com, Rob Herring <rob.herring@calxeda.com>

Hi Kgene,

Cc: Rob Herring

On 08/01/2012 11:00 AM, Kukjin Kim wrote:
>>>>> +* Samsung Exynos5 Gscaler device
>>>>> +
>>>>> +Gscaler is used for scaling and color space conversion on EXYNOS5
>> SoCs.
>>>>> +
>>>>> +Required properties:
>>>>> +- compatible: should be "samsung,exynos5250-gsc"
>>>>
>>>> IMO, should be "samsung,exynos5-gsc" because upcoming EXYNOS5 SoCs can
>> use
>>>> same gscaler driver.
>>
>> In addition to the below explanation, perhaps it's obvious, but the driver
>> can claim compatibility with multiple devices, i.e. match with multiple
>> 'compatible' properties.
>>
> 
> The name of exact model is 'gscaler' for EXYNOS5 SoCs not only for
> EXYNOS5250. So the driver which has been submitted is also 'exynos-gsc' not
> 'exynos5250-gsc'. Note that there is no gscaler on EXYNOS4 SoCs now, it can
> be either 'exynos5-gsc' or 'exynos-gsc'. In addition, since some
> peripherals/drivers can be used for multiple SoCs and actually it does, I'm
> still thinking the compatible should be represent its usage. I don't know
> why restricted name is much clearer. And if multiple 'compatible' is
> required, we can add it later.

Sorry, but I cannot agree with that. :) There is no exynos5 SoC, it's just
a common name for the whole series that includes: exynos5250, exynos5450 ones 
and more. We shouldn't use such common name for just a subset of exynos5 chips, 
in case different GScaler versions get deployed in future SoCs.

It wouldn't be clear what specific SoCs the "samsung,exynos5-gsc" compatible 
string applies to, would it ? I believe there are already minor differences
in GScaler parameters on currently available exynos5 SoC. The variant data
structures are used to handle this and the compatible string determines which
variant data structure is selected during driver's initialization.
If you use a wildcard 'compatible' string this won't be possible any more.

Also it would look odd IMO to have two compatible strings like:
compatible = "samsung,exynos5-gsc", "samsung,exynos5400-gsc";

Please also see:
http://devicetree.org/Device_Tree_Usage#Understanding_the_compatible_Property

--

Regards,
Sylwester
