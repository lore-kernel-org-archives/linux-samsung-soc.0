From: Abhilash Kesavan <kesavan.abhilash@gmail.com>
Subject: Re: [RFC PATCH v3 2/2] clk: exynos5420: Make sure MDMA0 clock is
 enabled during suspend
Date: Wed, 8 Apr 2015 07:20:26 +0530
Message-ID: <CAM4voa=4+EjNAqNjC5PupnN0eXyQjxOxn_ABtnZb6HToai1k_Q@mail.gmail.com>
References: <1427730803-28635-1-git-send-email-javier.martinez@collabora.co.uk>
	<1427730803-28635-3-git-send-email-javier.martinez@collabora.co.uk>
	<CA+Ln22FBpuzR06qCsVc7SXtLX2mhf901vDE5D-mT1+ijZ2G3sg@mail.gmail.com>
	<551976F1.1000605@collabora.co.uk>
	<CAM4voanL3A=dS8Z-ovi_-EDi9ctyaxZkvjajp+3ZjyNAnqR1aQ@mail.gmail.com>
	<551AFCCE.4050404@collabora.co.uk>
	<551BD07E.2090506@samsung.com>
	<551BDA0A.7010704@collabora.co.uk>
	<551C2B6D.4010001@samsung.com>
	<551C71A5.1070903@collabora.co.uk>
	<CAM4voakS8PnatqRTW5gkD0NNKD9gW9Tuv5p-ekxFhKN5NcuBCQ@mail.gmail.com>
	<5523B878.8040304@collabora.co.uk>
	<5523C5F5.6000604@collabora.co.uk>
	<CA+Ln22FrvQQ_pX7ELG-jYriGkQHmtX3aUHYqsc_-CRXcc4zxbg@mail.gmail.com>
	<5523E5A9.4080302@collabora.co.uk>
	<CAM4voamV-TcyqXSu7_HeQvd2aEUXpkjbJ14Otb_MLFMEO_1Vbg@mail.gmail.com>
	<5523F10D.20801@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qk0-f177.google.com ([209.85.220.177]:35177 "EHLO
	mail-qk0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753213AbbDHBu1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 7 Apr 2015 21:50:27 -0400
In-Reply-To: <5523F10D.20801@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Stephen Boyd <sboyd@codeaurora.org>, Mike Turquette <mturquette@linaro.org>, Kukjin Kim <kgene@kernel.org>, Olof Johansson <olof@lixom.net>, Doug Anderson <dianders@chromium.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Kevin Hilman <khilman@linaro.org>, Tyler Baker <tyler.baker@linaro.org>, Chanwoo Choi <cw00.choi@samsung.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>

Hi Javier,

On Tue, Apr 7, 2015 at 8:30 PM, Javier Martinez Canillas
<javier.martinez@collabora.co.uk> wrote:
> Hello Abhilash,
>
> On 04/07/2015 04:38 PM, Abhilash Kesavan wrote:
>>>
>>> [0]
>>> From 78aa551ebcb9a4a7ae9d5581c33e0c0f19fe5ad6 Mon Sep 17 00:00:00 2001
>>> From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
>>> Date: Tue, 7 Apr 2015 15:53:27 +0200
>>> Subject: [RFC PATCH] clk: exynos5420: Restore GATE_BUS_TOP on suspend
>>>
>>> Commit ae43b3289186 ("ARM: 8202/1: dmaengine: pl330: Add runtime Power
>>> Management support v12") added pm support for the pl330 dma driver but
>>> it makes the clock for the Exynos5420 MDMA0 DMA controller to be gated
>>> during suspend and this in turn makes its parent clock aclk266_g2d to
>>> be gated. But the clock needs to be ungated prior suspend to allow the
>>> system to be suspend and resumed correctly.
>>>
>>> Add GATE_BUS_TOP register to the list of registers to be restored when
>>> the system enters into a suspend state so aclk266_g2d will be ungated.
>>>
>>> Thanks to Abhilash Kesavan for figuring out that this was the issue.
>>>
>>> Fixes: ae43b32 ("ARM: 8202/1: dmaengine: pl330: Add runtime Power Management support v12")
>>> Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
>>> ---
>>>  drivers/clk/samsung/clk-exynos5420.c | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
>>> index 07d666cc6a29..bea4a173eef5 100644
>>> --- a/drivers/clk/samsung/clk-exynos5420.c
>>> +++ b/drivers/clk/samsung/clk-exynos5420.c
>>> @@ -271,6 +271,7 @@ static const struct samsung_clk_reg_dump exynos5420_set_clksrc[] = {
>>>         { .offset = SRC_MASK_PERIC0,            .value = 0x11111110, },
>>>         { .offset = SRC_MASK_PERIC1,            .value = 0x11111100, },
>>>         { .offset = SRC_MASK_ISP,               .value = 0x11111000, },
>>> +       { .offset = GATE_BUS_TOP,               .value = 0xffffffff, },
>>>         { .offset = GATE_BUS_DISP1,             .value = 0xffffffff, },
>>>         { .offset = GATE_IP_PERIC,              .value = 0xffffffff, },
>>>  };
>>
>> While there could be a concern that we are ungating all the clocks in
>
> Yes, I mentioned that but OTOH it will be even more dangerous to gate
> clocks that should remain enabled so I used the register default values.
>
>> BUS_TOP, this looks like the least intrusive fix for the issue. Tested
>> this on Peach Pi, S2R works fine.
>>
>
> Thanks a lot for testing, does it mean I can add your Tested-by then when
> posting it as a proper patch? I'll wait for Tomasz to comment before though.

Tested-by: Abhilash Kesavan <a.kesavan@samsung.com>.

Abhilash
