From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH v3 1/3] ARM: Samsung: Add support for MSHC controller clocks
Date: Tue, 28 Aug 2012 10:29:17 +0530
Message-ID: <CAJuYYwT6L+Nfd_k2f9hCyJTbrqzedgOUcr7F2MbPvmstin=y4g@mail.gmail.com>
References: <1345982371-26483-1-git-send-email-thomas.abraham@linaro.org>
	<1345982371-26483-2-git-send-email-thomas.abraham@linaro.org>
	<503BFF8E.80503@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lb0-f174.google.com ([209.85.217.174]:36535 "EHLO
	mail-lb0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750855Ab2H1E7T (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 28 Aug 2012 00:59:19 -0400
Received: by lbbgj3 with SMTP id gj3so2989212lbb.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Aug 2012 21:59:18 -0700 (PDT)
In-Reply-To: <503BFF8E.80503@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, cjb@laptop.org, girish.shivananjappa@linaro.org, jh80.chung@samsung.com, tgih.jun@samsung.com, patches@linaro.org

On 28 August 2012 04:45, Kukjin Kim <kgene.kim@samsung.com> wrote:
> On 08/26/12 04:59, Thomas Abraham wrote:
>>
>> Add clock instances for bus interface unit clock and card interface unit
>> clock of the all four MSHC controller instances.
>>
>> Signed-off-by: Abhilash Kesavan<a.kesavan@samsung.com>
>> Signed-off-by: Thomas Abraham<thomas.abraham@linaro.org>
>> ---
>>   arch/arm/mach-exynos/clock-exynos5.c |   45
>> ++++++++++++----------------------
>>   1 files changed, 16 insertions(+), 29 deletions(-)
>>
>> diff --git a/arch/arm/mach-exynos/clock-exynos5.c
>> b/arch/arm/mach-exynos/clock-exynos5.c
>> index 3b00e29..16d8bef 100644
>> --- a/arch/arm/mach-exynos/clock-exynos5.c
>> +++ b/arch/arm/mach-exynos/clock-exynos5.c
>> @@ -564,35 +564,30 @@ static struct clk exynos5_init_clocks_off[] = {
>>                 .enable         = exynos5_clk_ip_peris_ctrl,
>>                 .ctrlbit        = (1<<  19),
>>         }, {
>> -               .name           = "hsmmc",
>> -               .devname        = "exynos4-sdhci.0",
>> +               .name           = "biu",
>
>
> I have no idea why we change the clock name to 'biu' (bus interface unit).
> Just let me know.

The dw-mmc controller requires two clocks - bus interface unit and
card interface unit clock. Since this controller driver can be used on
platforms other than exynos, the name of the clock has to be generic.
Hence the name of the clocks used are "biu" and "ciu" as the per the
dw-mmc data sheet.

>
> [...]
>
>
>>   static struct clksrc_clk exynos5_clk_sclk_mmc0 = {
>>         .clk    = {
>> -               .name           = "sclk_mmc",
>> -               .devname        = "exynos4-sdhci.0",
>> +               .name           = "ciu",
>
>
> Same as above.

Thanks,
Thomas.
