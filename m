From: Rahul Sharma <r.sh.open@gmail.com>
Subject: Re: [PATCH] clk/exynos5250: change parent to aclk200_disp1 for hdmi subsystem
Date: Thu, 29 Aug 2013 08:51:44 +0530
Message-ID: <CAPdUM4NhW6v5KTk13V7nN+3LM1SUyuXxA5rvos8Z_dhsR8D2JA@mail.gmail.com>
References: <1377242219-30831-1-git-send-email-rahul.sharma@samsung.com>
	<20130829022407.8231.37926@quantum>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f182.google.com ([74.125.82.182]:40531 "EHLO
	mail-we0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752086Ab3H2DVp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 28 Aug 2013 23:21:45 -0400
Received: by mail-we0-f182.google.com with SMTP id q59so6028551wes.13
        for <linux-samsung-soc@vger.kernel.org>; Wed, 28 Aug 2013 20:21:44 -0700 (PDT)
In-Reply-To: <20130829022407.8231.37926@quantum>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mike Turquette <mturquette@linaro.org>
Cc: Rahul Sharma <rahul.sharma@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Kukjin Kim <kgene.kim@samsung.com>, Inki Dae <inki.dae@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, sunil joshi <joshi@samsung.com>

Thanks Mike.

On 29 August 2013 07:54, Mike Turquette <mturquette@linaro.org> wrote:
> Quoting Rahul Sharma (2013-08-23 00:16:59)
>> parent of hdmi and mixer block is mentioned as aclk200 which is
>> not correct. It is clocked by the ouput of aclk200_disp1. Hence
>> parent for mixer and hdmi clocks is changed to aclk200_disp1.
>>
>> Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
>
> Taken into clk-next.
>
> Thanks,
> Mike
>
>> ---
>> This set is based on Mike's clk-next branch at
>> https://git.linaro.org/gitweb?p=people/mturquette/linux.git
>>
>>  drivers/clk/samsung/clk-exynos5250.c |    4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/clk/samsung/clk-exynos5250.c b/drivers/clk/samsung/clk-exynos5250.c
>> index a9916a4..d90e593 100644
>> --- a/drivers/clk/samsung/clk-exynos5250.c
>> +++ b/drivers/clk/samsung/clk-exynos5250.c
>> @@ -489,8 +489,8 @@ static struct samsung_gate_clock exynos5250_gate_clks[] __initdata = {
>>         GATE(mie1, "mie1", "aclk200", GATE_IP_DISP1, 1, 0, 0),
>>         GATE(dsim0, "dsim0", "aclk200", GATE_IP_DISP1, 3, 0, 0),
>>         GATE(dp, "dp", "aclk200", GATE_IP_DISP1, 4, 0, 0),
>> -       GATE(mixer, "mixer", "aclk200", GATE_IP_DISP1, 5, 0, 0),
>> -       GATE(hdmi, "hdmi", "aclk200", GATE_IP_DISP1, 6, 0, 0),
>> +       GATE(mixer, "mixer", "mout_aclk200_disp1", GATE_IP_DISP1, 5, 0, 0),
>> +       GATE(hdmi, "hdmi", "mout_aclk200_disp1", GATE_IP_DISP1, 6, 0, 0),
>>         GATE(g2d, "g2d", "aclk200", GATE_IP_ACP, 3, 0, 0),
>>  };
>>
>> --
>> 1.7.10.4
