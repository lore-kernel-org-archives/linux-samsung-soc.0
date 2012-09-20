From: Leela Krishna Amudala <l.krishna@samsung.com>
Subject: Re: [PATCH 1/3] ARM: EXYNOS5: Add fimd node to the exynos5250 dtsi file
Date: Thu, 20 Sep 2012 14:58:16 +0530
Message-ID: <CAL1wa8f=HN=VBou4RSPa635dPzpq1hOTtCjgXthH6dz7G-FZWg@mail.gmail.com>
References: <1347992531-27279-1-git-send-email-l.krishna@samsung.com>
 <1347992531-27279-2-git-send-email-l.krishna@samsung.com> <008201cd9706$60e7e2e0$22b7a8a0$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:54851 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751450Ab2ITJ2g (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Sep 2012 05:28:36 -0400
Received: by pbbrr13 with SMTP id rr13so4661629pbb.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Sep 2012 02:28:36 -0700 (PDT)
In-Reply-To: <008201cd9706$60e7e2e0$22b7a8a0$%han@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jingoo Han <jg1.han@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, inki.dae@samsung.com, Thomas Abraham <thomas.abraham@linaro.org>

Hello,

On Thu, Sep 20, 2012 at 1:33 PM, Jingoo Han <jg1.han@samsung.com> wrote:
> On Wednesday, September 19, 2012 3:22 AM Leela Krishna Amudala wrote
>>
>> This patch adds the fimd node with compatibility string, hardware address,
>> interrupt line numbers to the exynos5250 dtsi file.
>>
>> Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
>> ---
>>  arch/arm/boot/dts/exynos5250.dtsi |    7 +++++++
>>  1 files changed, 7 insertions(+), 0 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
>> index b55794b..6d27ca4 100644
>> --- a/arch/arm/boot/dts/exynos5250.dtsi
>> +++ b/arch/arm/boot/dts/exynos5250.dtsi
>> @@ -488,4 +488,11 @@
>>               reg = <0x13e30000 0x1000>;
>>               interrupts = <0 88 0>;
>>       };
>> +
>> +     fimd {
>> +             compatible = "samsung,exynos5-drm";
>
> Should it be "samsung,exynos5-fimd"?
>
>

Yes, It is my typo error, it should be "samsung,exynos5-fimd".
Will correct it in next version.

>> +             interrupt-parent = <&combiner>;
>> +             reg = <0x14400000 0x40000>;
>> +             interrupts = <18 5>, <18 4>, <18 6>;
>> +     };
>>  };
>> --
>> 1.7.0.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
