From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 2/4] clk: exynos-audss: allow input clocks to be specified
 in device tree
Date: Mon, 22 Jul 2013 18:28:47 +0200
Message-ID: <1610421.OFFn8rqlxt@amdc1227>
References: <1373458313-18970-1-git-send-email-padma.v@samsung.com>
 <1373458313-18970-3-git-send-email-padma.v@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:40528 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932101Ab3GVQ2x (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 22 Jul 2013 12:28:53 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MQC00I4GJ1ST960@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 22 Jul 2013 17:28:50 +0100 (BST)
In-reply-to: <1373458313-18970-3-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Padmavathi Venna <padma.v@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org, padma.kvr@gmail.com, sbkim73@samsung.com, broonie@kernel.org, kgene.kim@samsung.com, mturquette@linaro.org, dianders@chromium.org, abrestic@chromium.org

Hi Padmavathi, Andrew,

On Wednesday 10 of July 2013 17:41:51 Padmavathi Venna wrote:
> From: Andrew Bresticker <abrestic@chromium.org>
> 
> This allows the input clocks to the Exynos AudioSS block to be specified
> via device-tree bindings.  Default names will be used when an input clock
> is not given.  This will be useful when adding support for the
> Exynos5420 where the audio bus clock is called "sclk_maudio0" instead of
> "sclk_audio0".
> 
> Signed-off-by: Andrew Bresticker <abrestic@chromium.org>
> Reviewed-on: https://gerrit.chromium.org/gerrit/57833
> Reviewed-by: Simon Glass <sjg@chromium.org>
> ---
>  .../devicetree/bindings/clock/clk-exynos-audss.txt |   31
> ++++++++++++++++++- drivers/clk/samsung/clk-exynos-audss.c             |
>   28 +++++++++++++++-- 2 files changed, 53 insertions(+), 6 deletions(-)

Well, this is basically how it should be done, but in current state of 
clock core I can see a problem: can we really rely on the order of clock 
initialization? I mean, we can't defer initialization of particular clock 
controller until all external clocks it needs are available, because there 
is no probing involved here.

Best regards,
Tomasz
