From: Padma Venkat <padma.kvr@gmail.com>
Subject: Re: [PATCH V2 0/4] clk: Samsung: audss: Add support for Exynos5420
Date: Tue, 27 Aug 2013 11:48:02 +0530
Message-ID: <CAAgF-BesO-CpNzEdyn=2V1wVzLvcSkV5mimsfqD1ndTfxDNG9A@mail.gmail.com>
References: <1376639378-20707-1-git-send-email-padma.v@samsung.com>
	<CAAgF-Bcb+MfBbBkgta8_WyVf5+_LM0_tqCBhvwxqvniniO6rpw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f47.google.com ([209.85.219.47]:41360 "EHLO
	mail-oa0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752358Ab3H0GSD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 27 Aug 2013 02:18:03 -0400
In-Reply-To: <CAAgF-Bcb+MfBbBkgta8_WyVf5+_LM0_tqCBhvwxqvniniO6rpw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Padmavathi Venna <padma.v@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org, "broonie@kernel.org" <broonie@kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, abrestic@chromium.org, Mike Turquette <mturquette@linaro.org>

Hi Mike,

On Mon, Aug 19, 2013 at 2:18 PM, Padma Venkat <padma.kvr@gmail.com> wrote:
> Hi Mike,
>
> On Fri, Aug 16, 2013 at 1:19 PM, Padmavathi Venna <padma.v@samsung.com> wrote:
>> This patch set adds support for audio subsystem clks on Exynos5420. Exynos5420
>> audio subsystem has a gate bit for ADMA controller and the some of the parent
>> clks for mout_i2s and sclk_pcm are different from Exynos5250. So this patch
>> adds provision for supporting both the platforms by determining the parent clk
>> names based on compatible string.
>>
>> Changes since V1:
>>         - parent clocks are determined by using the compatible string and not
>>           passed via device tree as done in V1 because the probing order of
>>           the clock providers can't be guaranteed.
>>
>> Andrew Bresticker (3):
>>   clk: exynos-audss: add support for Exynos 5420
>>   clk: exynos-audss: set correct parent clocks
>
> Can you apply the above two patches into your tree?
>

If there is no review comment on the above two can you please
acknowledge them? The below patch is dependent on these two patches
and Kukjin is waiting for these patches to be merged.

[V2] ARM: dts: Add DMA controller node info on Exynos5420.
https://patchwork.kernel.org/patch/2844436/

Thanks
Padma
