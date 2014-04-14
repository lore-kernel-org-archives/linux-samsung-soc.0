From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 2/4] ARM: dts: exynos5250-snow: add pinctrl for EC irq
Date: Mon, 14 Apr 2014 15:33:58 -0700
Message-ID: <CAD=FV=WZPTgp_yaq=-nswYv_VkrK+RGoDKv9_hNEwpBVDD5UzQ@mail.gmail.com>
References: <1397481367-12652-1-git-send-email-sachin.kamat@linaro.org>
	<1397481367-12652-2-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ve0-f177.google.com ([209.85.128.177]:35945 "EHLO
	mail-ve0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751120AbaDNWd7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 Apr 2014 18:33:59 -0400
Received: by mail-ve0-f177.google.com with SMTP id sa20so8091690veb.36
        for <linux-samsung-soc@vger.kernel.org>; Mon, 14 Apr 2014 15:33:58 -0700 (PDT)
In-Reply-To: <1397481367-12652-2-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>, Olof Johansson <olof@lixom.net>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, sunil joshi <joshi@samsung.com>, AJAY KUMAR RAMAKRISHNA SHYMALAMMA <ajaykumar.rs@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>

Sachin,

On Mon, Apr 14, 2014 at 6:16 AM, Sachin Kamat <sachin.kamat@linaro.org> wrote:
> From: Doug Anderson <dianders@chromium.org>
>
> Added pinctrl node for embedded controller (EC) IRQ
> on Snow board.
>
> Signed-off-by: Doug Anderson <dianders@chromium.org>
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
>  arch/arm/boot/dts/exynos5250-snow.dts |    9 +++++++++
>  1 file changed, 9 insertions(+)

Reviewed-by: Doug Anderson <dianders@chromium.org>
