From: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Subject: Re: [PATCH 2/2] ARM: EXYNOS5: Add gscalar device from DT
Date: Wed, 11 Jul 2012 20:12:44 +0200
Message-ID: <4FFDC21C.2030806@gmail.com>
References: <24338044.529411342011985196.JavaMail.weblogic@epml01>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bk0-f46.google.com ([209.85.214.46]:57406 "EHLO
	mail-bk0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754754Ab2GKSMu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 11 Jul 2012 14:12:50 -0400
Received: by bkwj10 with SMTP id j10so1427919bkw.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 11 Jul 2012 11:12:48 -0700 (PDT)
In-Reply-To: <24338044.529411342011985196.JavaMail.weblogic@epml01>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: shaik.ameer@samsung.com
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, "olofj@google.com" <olofj@google.com>, PRASHANTH GODREHAL <prashanth.g@samsung.com>, SUNIL JOSHI <joshi@samsung.com>, "ameersk@gmail.com" <ameersk@gmail.com>, Thomas P Abraham <thomas.ab@samsung.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>

Hi Shaik,

On 07/11/2012 03:06 PM, AMEER BASHA SHAIK wrote:
>>> diff --git a/arch/arm/boot/dts/exynos5250.dtsi
>>> b/arch/arm/boot/dts/exynos5250.dtsi
>>> index 4272b29..b945c00 100644
>>> --- a/arch/arm/boot/dts/exynos5250.dtsi
>>> +++ b/arch/arm/boot/dts/exynos5250.dtsi
>>> @@ -23,6 +23,13 @@
>>>          compatible = "samsung,exynos5250";
>>>          interrupt-parent =<&gic>;
>>>
>>> +       aliases {
>>> +               gsc0 =&gsc_0;
>>> +               gsc1 =&gsc_1;
>>> +               gsc2 =&gsc_2;
>>> +               gsc3 =&gsc_3;
>>> +       };
>>> +
>>
>>
>> What are these aliases useful for ?
> 
> GScaler driver uses the "of_alias_get_id()" call to retrieve the device IDs, which
> internally uses these aliases...

Yeah, just figured it out already... I didn't know then it was a preferred
way to represent device IDs in DT. I looked at the driver's code and it
seemed slightly incorrect to me. Let me comment on the relevant patch shortly.

Would be good to have things like this documented in the GScaler bindings
documentation. These aliases seem quite essential for the driver to work.

>> Also I think all DT related patches should be posted to
>> devicetree-discuss@lists.ozlabs.org as well.
>>
> 
> I will post the v2 version of this patch to the specified mailing list.
> 
>>
>>>          gic:interrupt-controller@10481000 {
>>>                  compatible = "arm,cortex-a9-gic";
>>>                  #interrupt-cells =<3>;
>>> @@ -424,4 +431,28 @@
>>>                          #gpio-cells =<4>;
>>>                  };
>>>          };
>>> +
>>> +       gsc_0:  gsc@0x13e00000 {
>>> +               compatible = "samsung,exynos-gsc";
>>> +               reg =<0x13e00000 0x1000>;
>>> +               interrupts =<0 85 0>;
>>> +       };
>>> +
>>> +       gsc_1:  gsc@0x13e10000 {
>>> +               compatible = "samsung,exynos-gsc";
>>> +               reg =<0x13e10000 0x1000>;
>>> +               interrupts =<0 86 0>;
>>> +       };
>>> +
>>> +       gsc_2:  gsc@0x13e20000 {
>>> +               compatible = "samsung,exynos-gsc";
>>> +               reg =<0x13e20000 0x1000>;
>>> +               interrupts =<0 87 0>;
>>> +       };
>>> +
>>> +       gsc_3:  gsc@0x13e30000 {
>>> +               compatible = "samsung,exynos-gsc";
>>> +               reg =<0x13e30000 0x1000>;
>>> +               interrupts =<0 88 0>;
>>> +       };
>>>    };
>>> diff --git a/arch/arm/mach-exynos/mach-exynos5-dt.c
>>> b/arch/arm/mach-exynos/mach-exynos5-dt.c
>>> index 7b1e11a..76b081c 100644
>>> --- a/arch/arm/mach-exynos/mach-exynos5-dt.c
>>> +++ b/arch/arm/mach-exynos/mach-exynos5-dt.c
>>> @@ -50,6 +50,14 @@ static const struct of_dev_auxdata
>>> exynos5250_auxdata_lookup[] __initconst = {
>>>          OF_DEV_AUXDATA("arm,pl330", EXYNOS5_PA_PDMA0, "dma-pl330.0",
>>> NULL),
>>>          OF_DEV_AUXDATA("arm,pl330", EXYNOS5_PA_PDMA1, "dma-pl330.1",
>>> NULL),
>>>          OF_DEV_AUXDATA("arm,pl330", EXYNOS5_PA_MDMA1, "dma-pl330.2",
>>> NULL),
>>> +       OF_DEV_AUXDATA("samsung,exynos-gsc", 0x13E00000,
>>> +                               "exynos-gsc.0", NULL),
>>> +       OF_DEV_AUXDATA("samsung,exynos-gsc", 0x13E10000,
>>> +                               "exynos-gsc.1", NULL),
>>> +       OF_DEV_AUXDATA("samsung,exynos-gsc", 0x13E20000,
>>> +                               "exynos-gsc.2", NULL),
>>> +       OF_DEV_AUXDATA("samsung,exynos-gsc", 0x13E30000,
>>> +                               "exynos-gsc.3", NULL),
>>
>>
>> It's probably better to add relevant entry at
>> arch/arm/mach-exynos/include/mach/map. It's just a one line, e.g.
>>
>> /* x = 0...3 */
>> #define EXYNOS5_PA_GSC(x)       (0x13e00000 + ((x) * 0x10000))
>>
>> And use it here instead of plain numbers.
> 
> OK. will address these comments in v2.

Thanks.

--
Regards,
Sylwester
