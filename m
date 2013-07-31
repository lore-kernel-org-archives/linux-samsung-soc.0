From: Rahul Sharma <r.sh.open@gmail.com>
Subject: Re: [PATCH v4 0/6] clk/exynos5250: add clocks for hdmi subsystem
Date: Wed, 31 Jul 2013 10:55:44 +0530
Message-ID: <CAPdUM4OQLAZaVrsR3TMQbwWihdh+rMZ6JJPt-L32KQethXhUwg@mail.gmail.com>
References: <1374728857-4208-1-git-send-email-rahul.sharma@samsung.com>
	<20130730210814.5270.44742@quantum>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f50.google.com ([74.125.82.50]:43091 "EHLO
	mail-wg0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754374Ab3GaFZq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 31 Jul 2013 01:25:46 -0400
Received: by mail-wg0-f50.google.com with SMTP id m15so195595wgh.29
        for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Jul 2013 22:25:44 -0700 (PDT)
In-Reply-To: <20130730210814.5270.44742@quantum>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mike Turquette <mturquette@linaro.org>
Cc: Rahul Sharma <rahul.sharma@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, inki.dae@samsung.com, s.nawrocki@samsung.com, thomas.abraham@linaro.org, joshi@samsung.com, Cho KyongHo <pullip.cho@samsung.com>

On Wed, Jul 31, 2013 at 2:38 AM, Mike Turquette <mturquette@linaro.org> wrote:
> Quoting Rahul Sharma (2013-07-24 22:07:31)
>> Add clock changes for hdmi subsystem for exynos5250 SoC. These
>> include addition of new clocks like mout_hdmi and smmu_tv, associating
>> ID to clk_hdmiphy and some essential corrections.
>>
>> This set is based on kukjin's for-next branch at
>> http://git.kernel.org/cgit/linux/kernel/git/kgene/linux-samsung.git.
>
> I've taken patches 2-4 into the clk-next branch. Patch #1 can be
> dropped.
>
> Patches 5 & 6 need to be rebased onto clk-next as the g2d clock has
> reserved mapping 345.  Also I've cc'd Cho KyongHo who is rebasing his
> system mmu clock patch[1] onto clk-next. Can the two of your coordinate
> your changes to avoid mapping conflicts in the binding? Perhaps Rahul
> can carry Cho's patch in his next version when he rebases patches 5 & 6.
>
> Thanks,
> Mike
>

Thanks Mike,

I will rebase and post 5, 6 on top of Cho's patches (based on  clk-next) .

regards,
Rahul Sharma.

> [1] https://lkml.org/lkml/2013/7/30/51
>
>>
>> V4:
>> 1) Added Arun's patch hdmi clock number correction in this series.
>> 2) Corrected clock number for smmu_mixer
>>
>> V3:
>> 1) Rebase to kgene for-next based on 3.11-rc1.
>> 2) Added Tushar's patch in the series.
>>
>> V2:
>> 1) Dropped "clk/exynos5250: Fix HDMI clock number in documentation" as
>> it already get merged.
>>
>> Arun Kumar K (1):
>>   clk/exynos5250: Fix HDMI clock number in documentation
>>
>> Rahul Sharma (4):
>>   clk/exynos5250: add mout_hdmi mux clock for hdmi
>>   clk/exynos5250: add sclk_hdmiphy in the list of special clocks
>>   clk/exynos5250: add clock for mixer sysmmu
>>   clk/exynos5250: change parent to aclk200_disp1 for hdmi subsystem
>>
>> Tushar Behera (1):
>>   Documentation: exynos5250-clock: Add div_i2s1 and div_i2s2
>>
>>  .../devicetree/bindings/clock/exynos5250-clock.txt |   14 +++++++++++++-
>>  drivers/clk/samsung/clk-exynos5250.c               |   20 ++++++++++++++------
>>  2 files changed, 27 insertions(+), 7 deletions(-)
>>
>> --
>> 1.7.10.4
