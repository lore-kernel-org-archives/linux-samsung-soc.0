From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH v3 3/3] ARM: dts: Add nodes for dw_mmc controllers for
 Samsung Exynos5250 platforms
Date: Tue, 28 Aug 2012 10:36:45 +0530
Message-ID: <CAJuYYwTHXbWLchv-426hZjkqP9-eS_hg10G4CJuKox96Q2JQXQ@mail.gmail.com>
References: <1345982371-26483-1-git-send-email-thomas.abraham@linaro.org>
	<1345982371-26483-4-git-send-email-thomas.abraham@linaro.org>
	<503BF8D3.9060507@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lpp01m010-f46.google.com ([209.85.215.46]:61347 "EHLO
	mail-lpp01m010-f46.google.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750894Ab2H1FGr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 28 Aug 2012 01:06:47 -0400
Received: by lagy9 with SMTP id y9so3016233lag.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Aug 2012 22:06:46 -0700 (PDT)
In-Reply-To: <503BF8D3.9060507@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, cjb@laptop.org, girish.shivananjappa@linaro.org, jh80.chung@samsung.com, tgih.jun@samsung.com, patches@linaro.org

On 28 August 2012 04:16, Kukjin Kim <kgene.kim@samsung.com> wrote:
> On 08/26/12 04:59, Thomas Abraham wrote:
>>
>> Add device nodes for the four instances of dw_mmc controllers in
>> Exynos5250
>> and enable instance 0 and 2 for the smdk5250 board.
>>
>> Signed-off-by: Thomas Abraham<thomas.abraham@linaro.org>
>> ---
>>   arch/arm/boot/dts/exynos5250-smdk5250.dts |   57
>> ++++++++++++++++++++++++++++-
>>   arch/arm/boot/dts/exynos5250.dtsi         |   32 ++++++++++++++++
>>   2 files changed, 88 insertions(+), 1 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/exynos5250-smdk5250.dts
>> b/arch/arm/boot/dts/exynos5250-smdk5250.dts
>> index 8a5e348..6dc9faf 100644
>> --- a/arch/arm/boot/dts/exynos5250-smdk5250.dts
>> +++ b/arch/arm/boot/dts/exynos5250-smdk5250.dts
>> @@ -16,12 +16,19 @@
>>         model = "SAMSUNG SMDK5250 board based on EXYNOS5250";
>>         compatible = "samsung,smdk5250", "samsung,exynos5250";
>>
>> +       aliases {
>> +               mshc0 =&mshc_0;
>> +               mshc1 =&mshc_1;
>> +               mshc2 =&mshc_2;
>> +               mshc3 =&mshc_3;
>> +       };
>> +
>>         memory {
>>                 reg =<0x40000000 0x80000000>;
>>         };
>>
>>         chosen {
>> -               bootargs = "root=/dev/ram0 rw ramdisk=8192
>> console=ttySAC1,115200";
>> +               bootargs = "root=/dev/ram0 rw ramdisk=8192
>> initrd=0x41000000,8M console=ttySAC2,115200 init=/linuxrc";
>
>
> Yes, we need to sort out the 'bootargs' for using uart2 as a console, but
> you know, this should be separated :-)
>

Sorry, that was never intended to be in this patch. My mistake.

>
>>         };
>>
>>         i2c@12C60000 {
>> @@ -72,6 +79,54 @@
>>                 status = "disabled";
>>         };
>>
>> +       mshc_0: dwmmc0@12200000 {
>
>
> How about to keep the consistent naming? dwmmc or dw_mmc? I think, 'dw_mmc'
> makes more sense?

Ok.

>
>
>> +               num-slots =<1>;
>> +               supports-highspeed;
>> +               broken-cd;
>> +               fifo-depth =<0x80>;
>> +               card-detect-delay =<200>;
>> +               samsung,dw-mshc-sdr-timing =<2 3 3>;
>> +               samsung,dw-mshc-ddr-timing =<1 2 3>;
>
>
> We need to think again the name of dw-mshc-sdr-timing, dw-mshc-ddr-timing?

Synopsis calls this controller "Mobile Storage Host Controller (MSHC)"
in their online data sheets. Hence, all the bindings (which are used
on non-samsung platforms as well) follow the this name. For any
Samsung specific code for this controller, we are free to choose any
name.

>
> [...]
>
>
>> diff --git a/arch/arm/boot/dts/exynos5250.dtsi
>> b/arch/arm/boot/dts/exynos5250.dtsi
>> index 004aaa8..f69e389 100644
>> --- a/arch/arm/boot/dts/exynos5250.dtsi
>> +++ b/arch/arm/boot/dts/exynos5250.dtsi
>> @@ -182,6 +182,38 @@
>>                 #size-cells =<0>;
>>         };
>>
>> +       dwmmc0@12200000 {
>> +               compatible = "samsung,exynos5250-dw-mshc";
>
>
> I'm not sure, 'exynos5250-dw-mshc' is right here. Because it is just dw_mmc
> controller on exynos5250. So...hmm...

There are differences in the implementation of the dw-mmc controller
in Exynos SoC's. So it has to be exynos5250-dw-mshc.

Thanks,
Thomas.
