From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 3/4] ARM: dts: exynos5250-snow: add tps65090 power regulator
Date: Tue, 15 Apr 2014 13:21:43 -0700
Message-ID: <CAD=FV=UBzHhBud9Vfo7_burrPr1PUZ_Wo2qerwwNvFT81cY7eg@mail.gmail.com>
References: <1397481367-12652-1-git-send-email-sachin.kamat@linaro.org>
	<1397481367-12652-3-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f172.google.com ([209.85.220.172]:61128 "EHLO
	mail-vc0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753892AbaDOUVo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 Apr 2014 16:21:44 -0400
Received: by mail-vc0-f172.google.com with SMTP id la4so9939551vcb.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 15 Apr 2014 13:21:44 -0700 (PDT)
In-Reply-To: <1397481367-12652-3-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, sunil joshi <joshi@samsung.com>, AJAY KUMAR RAMAKRISHNA SHYMALAMMA <ajaykumar.rs@samsung.com>

Sachin,

On Mon, Apr 14, 2014 at 6:16 AM, Sachin Kamat <sachin.kamat@linaro.org> wrote:
> From: Doug Anderson <dianders@chromium.org>
>
> Added TPS65090 regulator related nodes to Snow board.
>
> Signed-off-by: Doug Anderson <dianders@chromium.org>
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
>  arch/arm/boot/dts/exynos5250-snow.dts |   90 +++++++++++++++++++++++++++++++++
>  1 file changed, 90 insertions(+)

I've now sent up the relevant patches:
* https://patchwork.kernel.org/patch/3995361/
* https://patchwork.kernel.org/patch/3995401/
* https://patchwork.kernel.org/patch/3995411/

So assuming those land then I think we're all good with this one.
I've also done basic testing with it.

Reviewed-by: Doug Anderson <dianders@chromium.org>
Tested-by: Doug Anderson <dianders@chromium.org>
