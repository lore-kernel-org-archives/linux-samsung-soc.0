From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH] ARM: dts: remove display power domain for exynos5420
Date: Wed, 18 Jun 2014 08:16:03 +0200
Message-ID: <53A12EA3.5010007@samsung.com>
References: <1402313299-18885-1-git-send-email-rahul.sharma@samsung.com>
 <CAPdUM4OVjRSqVdQDUJZR7vGm1uUEYr31s-tx7Oxs8tM_xc2v7g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:29406 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756579AbaFRGQP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 18 Jun 2014 02:16:15 -0400
In-reply-to: <CAPdUM4OVjRSqVdQDUJZR7vGm1uUEYr31s-tx7Oxs8tM_xc2v7g@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rahul Sharma <rahul.sharma@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Inki Dae <inki.dae@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, sunil joshi <joshi@samsung.com>, Rahul Sharma <r.sh.open@gmail.com>

On 06/17/2014 07:49 AM, Rahul Sharma wrote:
> Hi All,
> 
> Please review this patch.
> 
> Regards,
> Rahul Sharma
> 
> On 9 June 2014 16:58, Rahul Sharma <rahul.sharma@samsung.com> wrote:
>> Display domain is removed due to instability issues. Explaining
>> the problem below:
>>
>> exynos_init_late triggers the pm_genpd_poweroff_unused which
>> powers off the unused power domains. This call hits before
>> the trigger to deferred probes.
>>
>> DRM DP Panel defers the probe due to supply get failure. By the
>> time, deferred probe is scheduled again, Display Power Domain is
>> powered off by pm_genpd_poweroff_unused.
>>
>> FIMD and DP drivers are accessing registers during Probe and Bind
>> callbacks. If display domain is enabled/disabled around register
>> accesses, display domain gets unstable and we are getting Power
>> Domain Disable fail notification. Increasing the Timeout also
>> didn't help.

As I understand the problem is that fimd and dp drivers access hw
registers without enabling power domain. So the proper solution is to
fix these drivers.

Btw. there are already patches removing hw access from probe/bind of
fimd. I guess removing also hw access from dp probe/bind could be a good
solution.

Regards
Andrzej

>>
>> Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
>> ---
>> based on Kukjin's for-next branch.
>>
>>  arch/arm/boot/dts/exynos5420.dtsi |    6 ------
>>  1 file changed, 6 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
>> index e385322..3d528cf 100644
>> --- a/arch/arm/boot/dts/exynos5420.dtsi
>> +++ b/arch/arm/boot/dts/exynos5420.dtsi
>> @@ -262,11 +262,6 @@
>>                 reg = <0x10044060 0x20>;
>>         };
>>
>> -       disp_pd: power-domain@100440C0 {
>> -               compatible = "samsung,exynos4210-pd";
>> -               reg = <0x100440C0 0x20>;
>> -       };
>> -
>>         msc_pd: power-domain@10044120 {
>>                 compatible = "samsung,exynos4210-pd";
>>                 reg = <0x10044120 0x20>;
>> @@ -518,7 +513,6 @@
>>         };
>>
>>         fimd: fimd@14400000 {
>> -               samsung,power-domain = <&disp_pd>;
>>                 clocks = <&clock CLK_SCLK_FIMD1>, <&clock CLK_FIMD1>;
>>                 clock-names = "sclk_fimd", "fimd";
>>         };
>> --
>> 1.7.9.5
>>
