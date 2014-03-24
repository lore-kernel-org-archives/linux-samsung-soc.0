From: Rahul Sharma <r.sh.open@gmail.com>
Subject: Re: [PATCH v6 0/2] clk: exynos: add support for exynos5260 SoC
Date: Mon, 24 Mar 2014 08:58:27 +0530
Message-ID: <CAPdUM4NC+8Sw-gC2anb56oemOtqu9-Dy3PopGHY7oqcwmp-Jig@mail.gmail.com>
References: <1395607554-21373-1-git-send-email-rahul.sharma@samsung.com>
	<532F5E29.3040507@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f175.google.com ([209.85.220.175]:59001 "EHLO
	mail-vc0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751725AbaCXD22 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 23 Mar 2014 23:28:28 -0400
In-Reply-To: <532F5E29.3040507@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Rahul Sharma <rahul.sharma@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Mike Turquette <mturquette@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, sunil joshi <joshi@samsung.com>

Thanks Tomasz,

Please let me know if any concern.
Meanwhile I will post dt patches with "clock" and "clock-names" properties
added for each controller node.

Regards,
Rahul Sharma.


On 24 March 2014 03:50, Tomasz Figa <tomasz.figa@gmail.com> wrote:
> Hi Rahul,
>
>
> On 23.03.2014 21:45, Rahul Sharma wrote:
>>
>> From: Rahul Sharma <Rahul.Sharma@samsung.com>
>>
>> Add clock support for exynos5260 SoC.
>>
>> This series is based on Tomasz Figa's samsung-next branch.
>>
>> V6:
>>    1) Listed external Clocks in documentation file.
>>    2) Listed Input Clocks for each clock controller in
>> exynos5260-clock.txt.
>>    3) Added Clock and Clock-names properties.
>>    4) Assigned IDs to all clocks in the clock file.
>>    5) Moved all PHY clocks as fixed rate to the driver file.
>>    6) Reorder clocks to maintain acscending order on the basis of clock
>>    register offset and bit numer.
>>
>> V5:
>>    1) Include S3c2412 and S3c2443 in clock provider patch.
>>    2) Added SCLK_TOP_FIMD with CLK_IGNORE_UNUSED due to Suspend
>>    failure.
>>    3) Moved exynos5260-clk.h to include/dt-bindings/clock.
>>    4) Fix exynos5260_clk_sleep_init protoype for PM disabled.W
>>    5) Moved fixed clock registeration to DT.
>>    6) Removed CLK_IGNORE_UNUSED flags from UART clocks. Earlier
>>    facing issues because of RFS probing all TTYs.
>>
>> V4:
>>    1) Rework clock file as per Tomasz review comments at
>>          http://www.spinics.net/lists/arm-kernel/msg310116.html.
>>
>> V3:
>>    1) Removed "samsung,exynos5260-clock" property from clock files.
>>    2) Replaced "__SPIN_LOCK_UNLOCKED(lock)" with spin_lock_init.
>>    3) Removed '(' and ')' around numeric constants in macros.
>>
>> V2:
>>    1) Move suspend resume handling to Exynos5410 Clock file.
>>    2) Removed Unused Macros and Condition checks for Exynos5260.
>>    3) Add spin lock to clock provider context.
>>    4) Add clock provider context for Exynos5410.
>>    5) Uniform implementation for callbacks for PLL2550xx.
>>    6) Split Exynos5260 clock file patch to bring it under 100 Kb limit.
>>    7) Replace aclk/pclk/hclk gates with combined gates.
>>    8) Remove CLK_IGNORE_UNUSED flag for gate clocks.
>>
>> Rahul Sharma (2):
>>    clk/exynos5260: add macros and documentation for exynos5260
>>    clk/exynos5260: add clock file for exynos5260
>>
>>   .../devicetree/bindings/clock/exynos5260-clock.txt |  190 ++
>>   drivers/clk/samsung/Makefile                       |    1 +
>>   drivers/clk/samsung/clk-exynos5260.c               | 1980
>> ++++++++++++++++++++
>>   drivers/clk/samsung/clk-exynos5260.h               |  459 +++++
>>   include/dt-bindings/clock/exynos5260-clk.h         |  469 +++++
>>   5 files changed, 3099 insertions(+)
>>   create mode 100644
>> Documentation/devicetree/bindings/clock/exynos5260-clock.txt
>>   create mode 100644 drivers/clk/samsung/clk-exynos5260.c
>>   create mode 100644 drivers/clk/samsung/clk-exynos5260.h
>>   create mode 100644 include/dt-bindings/clock/exynos5260-clk.h
>>
>
> Looks good to me, will apply if no comments show up for few more days.
>
> Best regards,
> Tomasz
