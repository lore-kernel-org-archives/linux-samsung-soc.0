From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 1/5] clk: samsung: exynos5250: Add CLK_IGNORE_UNUSED flag
 for the sysreg clock
Date: Thu, 12 Dec 2013 01:13:48 +0100
Message-ID: <CA+Ln22EQnpLfjcCOAY7U-tpc--XFy=dnwUr7K577x_ker4KuHw@mail.gmail.com>
References: <1386763029-8516-1-git-send-email-a.kesavan@samsung.com>
	<1386763029-8516-2-git-send-email-a.kesavan@samsung.com>
	<CAD=FV=WK-zgcNvF6qtnsRky3RbEvBOW+1uNiUR-fyp2257gPPw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f177.google.com ([209.85.212.177]:54115 "EHLO
	mail-wi0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751276Ab3LLANt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 11 Dec 2013 19:13:49 -0500
Received: by mail-wi0-f177.google.com with SMTP id cc10so1720727wib.4
        for <linux-samsung-soc@vger.kernel.org>; Wed, 11 Dec 2013 16:13:48 -0800 (PST)
In-Reply-To: <CAD=FV=WK-zgcNvF6qtnsRky3RbEvBOW+1uNiUR-fyp2257gPPw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Abhilash Kesavan <a.kesavan@samsung.com>, Olof Johansson <olof@lixom.net>, Kukjin Kim <kgene.kim@samsung.com>, jonghwa3.lee@samsung.com, Yadwinder Singh Brar <yadi.brar@samsung.com>, Mike Turquette <mturquette@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>

2013/12/12 Doug Anderson <dianders@chromium.org>:
> Abhilash,
>
> On Wed, Dec 11, 2013 at 3:57 AM, Abhilash Kesavan <a.kesavan@samsung.com> wrote:
>> The sysreg (system register) generates control signals for various blocks
>> like disp1blk, i2c, mipi etc. However, it gets disabled as an unused clock
>> at boot-up.
>>
>> Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
>> ---
>>  drivers/clk/samsung/clk-exynos5250.c |    3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/clk/samsung/clk-exynos5250.c b/drivers/clk/samsung/clk-exynos5250.c
>> index adf3234..0833501 100644
>> --- a/drivers/clk/samsung/clk-exynos5250.c
>> +++ b/drivers/clk/samsung/clk-exynos5250.c
>> @@ -406,7 +406,8 @@ static struct samsung_gate_clock exynos5250_gate_clks[] __initdata = {
>>         GATE(hsi2c2, "hsi2c2", "aclk66", GATE_IP_PERIC, 30, 0, 0),
>>         GATE(hsi2c3, "hsi2c3", "aclk66", GATE_IP_PERIC, 31, 0, 0),
>>         GATE(chipid, "chipid", "aclk66", GATE_IP_PERIS, 0, 0, 0),
>> -       GATE(sysreg, "sysreg", "aclk66", GATE_IP_PERIS, 1, 0, 0),
>> +       GATE(sysreg, "sysreg", "aclk66",
>> +                       GATE_IP_PERIS, 1, CLK_IGNORE_UNUSED, 0),
>>         GATE(pmu, "pmu", "aclk66", GATE_IP_PERIS, 2, CLK_IGNORE_UNUSED, 0),
>>         GATE(tzpc0, "tzpc0", "aclk66", GATE_IP_PERIS, 6, 0, 0),
>>         GATE(tzpc1, "tzpc1", "aclk66", GATE_IP_PERIS, 7, 0, 0),
>
> This does match what's done in exynos4 and exynos5420 and it's not
> terrible.  I'm always a fan of actually specifying clocks properly and
> that's more possible now using the syscon stuff (see Leela Krishna's
> watchdog patches).  You'd have to extend that to add a clock, but that
> wouldn't be too hard.

Leela's patches are about PMU, not sysreg, but that's not an issue, I guess,
as it's about adding a clock to the generic syscon driver.

Still, I discussed about such cases as this with Sylwester a bit today and
maybe a bit different approach would be better. There is a number of clocks
that need to be always on, such as PMU (but also a lot of currently undefined
ones). IMHO it would be nice to make sure they are enabled at boot time
and do one of following:
1) claim and enable them directly from the clock controller driver
2) define them with CLK_IGNORE_UNUSED flag and enable them directly from
   the clock controller driver (without increasing the refcount, so users could
   possibly disable them later),
3) add a generic flag, such as CLK_BOOT_ENABLE (or something), that would
   make the CCF enable such clock at bootup (in addition to implying
   CLK_IGNORE_UNUSED).

For me, the most sensible option would be 2) as it doesn't bloat the CCF with
yet another flag and doesn't encourage people to leave clocks always on
just because of laziness stopping them from implementing proper clock
support in drivers.

Still, for now, it's an OK from me, as we don't have the infrastructure yet.

Reviewed-by: Tomasz Figa <t.figa@samsung.com>

Best regards,
Tomasz
