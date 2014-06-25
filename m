From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: Re: [PATCH] clk/exynos5250: fix bit number for tv sysmmu clock
Date: Wed, 25 Jun 2014 16:52:41 +0530
Message-ID: <CAPdUM4Nx1g=aicFYAYEd1d2VVWPdbJXCZxFAmqRK0ooR8+E=9g@mail.gmail.com>
References: <1403156836-24421-1-git-send-email-rahul.sharma@samsung.com>
	<CAK5sBcHOCPvr2Kr0GDOyYCEAjaXcUKKPsEWKYDK9BFKtPioc4Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f175.google.com ([74.125.82.175]:43351 "EHLO
	mail-we0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753952AbaFYLWp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 25 Jun 2014 07:22:45 -0400
In-Reply-To: <CAK5sBcHOCPvr2Kr0GDOyYCEAjaXcUKKPsEWKYDK9BFKtPioc4Q@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Mike Turquette <mturquette@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>, Kukjin Kim <kgene.kim@samsung.com>, sunil joshi <joshi@samsung.com>

Hi Kukjin,

Please take this fix in your tree.

Regards,
Rahul Sharma

On 19 June 2014 11:35, Sachin Kamat <sachin.kamat@samsung.com> wrote:
> On Thu, Jun 19, 2014 at 11:17 AM, Rahul Sharma <rahul.sharma@samsung.com> wrote:
>> Change bit from 2 to 9 for tv (mixer) sysmmu clock.
>>
>> Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
>> ---
>> Based on Kukjin's for-next branch.
>>
>>  drivers/clk/samsung/clk-exynos5250.c |    2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/clk/samsung/clk-exynos5250.c b/drivers/clk/samsung/clk-exynos5250.c
>> index 1fad4c5..184f642 100644
>> --- a/drivers/clk/samsung/clk-exynos5250.c
>> +++ b/drivers/clk/samsung/clk-exynos5250.c
>> @@ -661,7 +661,7 @@ static struct samsung_gate_clock exynos5250_gate_clks[] __initdata = {
>>         GATE(CLK_RTC, "rtc", "div_aclk66", GATE_IP_PERIS, 20, 0, 0),
>>         GATE(CLK_TMU, "tmu", "div_aclk66", GATE_IP_PERIS, 21, 0, 0),
>>         GATE(CLK_SMMU_TV, "smmu_tv", "mout_aclk200_disp1_sub",
>> -                       GATE_IP_DISP1, 2, 0, 0),
>> +                       GATE_IP_DISP1, 9, 0, 0),
>
> SysMMU TV corresponds to bit 9 as per user manual of 5250.
> Reviewed-by: Sachin Kamat <sachin.kamat@samsung.com>
