From: Vikas Sajjan <vikas.sajjan@linaro.org>
Subject: Re: [PATCH v2 5/7] ARM: dts: Update DP controller DT Node for Exynos5
 based SoCs
Date: Mon, 26 Aug 2013 11:35:18 +0530
Message-ID: <CAD025yQ62VW4ou67GEi5=WwQy+j5r80haBp--ioPiw9U0o-e=Q@mail.gmail.com>
References: <1375183178-8201-1-git-send-email-vikas.sajjan@linaro.org>
 <1375183178-8201-6-git-send-email-vikas.sajjan@linaro.org> <002d01cea207$ff2c57d0$fd850770$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lb0-f180.google.com ([209.85.217.180]:59319 "EHLO
	mail-lb0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755892Ab3HZGFk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 26 Aug 2013 02:05:40 -0400
Received: by mail-lb0-f180.google.com with SMTP id q8so1062093lbi.39
        for <linux-samsung-soc@vger.kernel.org>; Sun, 25 Aug 2013 23:05:38 -0700 (PDT)
In-Reply-To: <002d01cea207$ff2c57d0$fd850770$%han@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jingoo Han <jg1.han@samsung.com>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "kgene.kim" <kgene.kim@samsung.com>, Tomasz Figa <t.figa@samsung.com>, devicetree <devicetree@vger.kernel.org>, InKi Dae <inki.dae@samsung.com>, Ajay kumar <ajaynumb@gmail.com>, Patch Tracking <patches@linaro.org>, linaro-kernel@lists.linaro.org

Hi Mr. Jingoo Han,

On 26 August 2013 08:27, Jingoo Han <jg1.han@samsung.com> wrote:
> On Tuesday, July 30, 2013 8:20 PM, Vikas Sajjan wrote:
>>
>> Moves the properties of DP controller to exynos5.dtsi which are common
>> across exynos5 SoCs like Exynos5250 and Exynos5420.
>>
>> The PHY DP Node is based on Jingoo Han's <jg1.han@samsung.com> patch at
>> https://patchwork.linuxtv.org/patch/19189/
>>
>> Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
>> ---
>>  arch/arm/boot/dts/exynos5.dtsi            |   11 +++++++++++
>>  arch/arm/boot/dts/exynos5250-arndale.dts  |    3 ++-
>>  arch/arm/boot/dts/exynos5250-smdk5250.dts |    3 ++-
>>  arch/arm/boot/dts/exynos5250.dtsi         |   21 +++++++++------------
>>  4 files changed, 24 insertions(+), 14 deletions(-)
>>
>
> [....]
>
>> diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
>> index 238bdb2..1c017dc 100644
>> --- a/arch/arm/boot/dts/exynos5250.dtsi
>> +++ b/arch/arm/boot/dts/exynos5250.dtsi
>> @@ -614,20 +614,17 @@
>>               interrupts = <0 94 0>;
>>       };
>>
>> -     dp-controller {
>> -             compatible = "samsung,exynos5-dp";
>> -             reg = <0x145b0000 0x1000>;
>> -             interrupts = <10 3>;
>> -             interrupt-parent = <&combiner>;
>> +     dp_phy: video-phy@10040720 {
>> +             compatible = "samsung,exynos5250-dp-video-phy";
>> +             reg = <0x10040720 4>;
>> +             #phy-cells = <0>;
>> +     };
>
> Oops!!!
>
> This patch should be reverted.
> Or, fix patch should be re-sent.
> 'dp phy' driver is not yet merged to mainline kernel.
>

As you suggest, since the DP-PHY driver is NOT yet in mainline, we may
have to keep this patch reverted till your patch series gets merged to
have DP working on exynos5 .

>
>> +
>> +     dp-controller@145b0000 {
>>               clocks = <&clock 342>;
>>               clock-names = "dp";
>> -             #address-cells = <1>;
>> -             #size-cells = <0>;
>> -
>> -             dptx-phy {
>> -                     reg = <0x10040720>;
>> -                     samsung,enable-mask = <1>;
>> -             };
>> +             phys = <&dp_phy>;
>> +             phy-names = "dp";
>>       };
>
> Thus, 'dptx-phy' node should be used until dp phy driver is merged.
>
> Vikas Sajjan,
> Please test your patch on real boards when you send your patch.
>

I tested the patch before sending on Exynos5250-SMDK5250 using  Kishon
Vijay Abraham's series at http://lwn.net/Articles/559487/
 which contains DP-PHY driver posted by you
 1.  phy: Add driver for Exynos DP PHY
 2.  video: exynos_dp: remove non-DT support for Exynos Display Port
 3.  video: exynos_dp: Use the generic PHY driver


 >
> Best regards,
> Jingoo Han
>
>
>



-- 
Thanks and Regards
 Vikas Sajjan
