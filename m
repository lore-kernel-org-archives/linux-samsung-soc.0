From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH V2] ARM: dts: Enable RTC node for Arndale
Date: Mon, 17 Jun 2013 07:55:46 -0700
Message-ID: <CAD=FV=XAeLQ8DfcskRRE_h1AKu-CPA3jEGwNThJOmKm6LEiegQ@mail.gmail.com>
References: <CAHbNUh2byimQ_ep0j9XkUjRFaU3K6YZE_ANcch5UhP4QsuZxPw@mail.gmail.com>
	<1371442179-23597-1-git-send-email-tushar.behera@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-la0-f53.google.com ([209.85.215.53]:51275 "EHLO
	mail-la0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751452Ab3FQOzs (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 17 Jun 2013 10:55:48 -0400
Received: by mail-la0-f53.google.com with SMTP id fs12so2549756lab.12
        for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Jun 2013 07:55:47 -0700 (PDT)
In-Reply-To: <1371442179-23597-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tushar Behera <tushar.behera@linaro.org>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Kukjin Kim <kgene.kim@samsung.com>, Patch Tracking <patches@linaro.org>

Tushar,

On Sun, Jun 16, 2013 at 9:09 PM, Tushar Behera <tushar.behera@linaro.org> wrote:
> The issues reported in commit 522ccdb6fd0e ("ARM: dts: Disable the RTC
> by default on exynos5") are no longer reproduced on EXYNOS5250 based
> Arndale board. Hence re-enabling RTC support for Arndale board.
>
> This is helpful for testing S2R on Arndale board.
>
> Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
> ---
> Changes for V2:
> * RTC node is enabled only for Arndale board. Earlier it was enabled
> in exynos5250.dtsi.
>
>  arch/arm/boot/dts/exynos5250-arndale.dts |    4 ++++
>  1 file changed, 4 insertions(+)

Looks good!  I'll send up one for snow too.

Reviewed-by: Doug Anderson <dianders@chromium.org>
