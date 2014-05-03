From: Arun Kumar K <arun.kk@samsung.com>
Subject: Re: [PATCH 1/3] clk: exynos5420: Add 5800 specific clocks
Date: Sat, 3 May 2014 17:42:25 +0530
Message-ID: <CALt3h7_sLG6hYOQnYO6KtBoKEPNbx1RU-QxRST3wm6Dy4Ju0Rg@mail.gmail.com>
References: <1399035821-25096-1-git-send-email-arun.kk@samsung.com>
	<1399035821-25096-2-git-send-email-arun.kk@samsung.com>
	<CAL1qeaHTuQ1Br=WLt0xd5a-rA0MjzKez0esgKYTpKs9Y8Gnsxw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ve0-f172.google.com ([209.85.128.172]:37695 "EHLO
	mail-ve0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751050AbaECMM0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 3 May 2014 08:12:26 -0400
In-Reply-To: <CAL1qeaHTuQ1Br=WLt0xd5a-rA0MjzKez0esgKYTpKs9Y8Gnsxw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrew Bresticker <abrestic@google.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Douglas Anderson <dianders@chromium.org>, Olof Johansson <olofj@google.com>, Tomasz Figa <t.figa@samsung.com>, Sachin Kamat <sachin.kamat@linaro.org>, Tushar Behera <tushar.behera@linaro.org>

Hi Andrew,

On Fri, May 2, 2014 at 11:21 PM, Andrew Bresticker <abrestic@google.com> wrote:
> Hi Arun,
>
> On Fri, May 2, 2014 at 6:03 AM, Arun Kumar K <arun.kk@samsung.com> wrote:
>> From: Alim Akhtar <alim.akhtar@samsung.com>
>>
>> Exynos5800 clock structure is mostly similar to 5420 with only
>> a small delta changes. So the 5420 clock file is re-used for
>> 5800 also. The common clocks for both are seggreagated and few
>> clocks which are different for both are separately initialized.
>
> As Tomasz mentioned, this will certainly conflict with Shaik and
> Rahul's 5420 clock cleanup series.  That series adds/fixes the MAU,
> WCORE, and ISP blocks which also have differences from 5420 to 5800.
>

Yes I will rebase on that series. I dropped many of the changes
in 5800 as it doesnt have the common terminating GATES as of now.
If rebased on Shaik/Rahul cleanup series, I can put all of them
back again.

>>
>> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
>> Signed-off-by: Arun Kumar K <arun.kk@samsung.com>
>> ---
>>  .../devicetree/bindings/clock/exynos5420-clock.txt |    3 +-
>>  drivers/clk/samsung/clk-exynos5420.c               |  192 +++++++++++++++-----
>>  include/dt-bindings/clock/exynos5420.h             |    1 +
>>  3 files changed, 150 insertions(+), 46 deletions(-)
>>

[snip]

>> +struct samsung_mux_clock exynos5800_mux_clks[] __initdata = {
>> +       MUX(0, "mout_aclk400_mscl", mout_group3_5800_p, SRC_TOP0, 4, 3),
>> +
>> +       MUX(0, "mout_aclk333_432_gscl", mout_group6_5800_p, SRC_TOP1, 0, 2),
>> +       MUX(0, "mout_aclk266", mout_group5_5800_p, SRC_TOP1, 20, 2),
>> +       MUX(0, "mout_aclk333", mout_group1_5800_p, SRC_TOP1, 28, 2),
>> +
>> +       MUX(0, "mout_aclk333_g2d", mout_group5_5800_p, SRC_TOP2, 8, 2),
>> +       MUX(0, "mout_aclk266_g2d", mout_group5_5800_p, SRC_TOP2, 12, 2),
>> +       MUX(0, "mout_aclk300_jpeg", mout_group5_5800_p, SRC_TOP2, 20, 2),
>> +       MUX(0, "mout_aclk300_disp1", mout_group5_5800_p, SRC_TOP2, 24, 2),
>> +       MUX(0, "mout_aclk300_gscl", mout_group5_5800_p, SRC_TOP2, 28, 2),
>> +
>> +       MUX(0, "sclk_bpll", bpll_p, SRC_TOP7, 24, 1),
>> +       MUX(0, "mout_epll2", mout_epll2_5800_p, SRC_TOP7, 28, 1),
>> +
>> +       MUX(0, "mout_user_aclk432_scaler", mout_group9_5800_p,
>> +                                                       SRC_TOP9, 28, 1),
>>
>> +       MUX(0, "mout_sw_aclk432_scaler", mout_group8_5800_p,
>> +                                                       SRC_TOP13, 28, 1),
>
> The aclk432_scaler tree is incomplete - you're missing
> mout_aclk432_scaler and dout_aclk432_scaler.  The rest of the CAM
> block (aclk432_cam, aclkfl1_550_cam, and aclk550_cam) is also missing,
> though I suppose that could go in a later patch.
>

The CAM gates you mentioned are omitted as I found that there
are some issues caused by it during S2R sequences and I have
to leave it as CLK_IGNORE_UNUSED for proper functionality.

[snip]

Regards
Arun
