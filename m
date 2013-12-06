From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH V12 2/3] watchdog: s3c2410_wdt: use syscon regmap
 interface to configure pmu register
Date: Fri, 6 Dec 2013 08:41:06 -0800
Message-ID: <CAD=FV=XL9Vpg9hVZR_rdoP8im1RJ6FMs2eiAaF_4rJxVydbWAw@mail.gmail.com>
References: <1386308868-30264-1-git-send-email-l.krishna@samsung.com>
	<1386308868-30264-3-git-send-email-l.krishna@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ve0-f173.google.com ([209.85.128.173]:36265 "EHLO
	mail-ve0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752886Ab3LFQlG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 6 Dec 2013 11:41:06 -0500
Received: by mail-ve0-f173.google.com with SMTP id oz11so1040450veb.18
        for <linux-samsung-soc@vger.kernel.org>; Fri, 06 Dec 2013 08:41:06 -0800 (PST)
In-Reply-To: <1386308868-30264-3-git-send-email-l.krishna@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Leela Krishna Amudala <l.krishna@samsung.com>, Guenter Roeck <linux@roeck-us.net>, Tomasz Figa <t.figa@samsung.com>, Olof Johansson <olof@lixom.net>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Wim Van Sebroeck <wim@iguana.be>, Kukjin Kim <kgene.kim@samsung.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>, "cpgs ." <cpgs@samsung.com>

Leela Krishna,

On Thu, Dec 5, 2013 at 9:47 PM, Leela Krishna Amudala
<l.krishna@samsung.com> wrote:
> Add device tree support for exynos5250 and 5420 SoCs and use syscon regmap interface
> to configure AUTOMATIC_WDT_RESET_DISABLE and MASK_WDT_RESET_REQUEST registers of PMU
> to mask/unmask enable/disable of watchdog in probe and s2r scenarios.
>
> Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
> Signed-off-by: Doug Anderson <dianders@chromium.org>
> ---
>  .../devicetree/bindings/watchdog/samsung-wdt.txt   |   21 ++-
>  drivers/watchdog/Kconfig                           |    1 +
>  drivers/watchdog/s3c2410_wdt.c                     |  154 ++++++++++++++++++--
>  3 files changed, 166 insertions(+), 10 deletions(-)

Thank you for incorporating the fixups.

Reviewed-by: Doug Anderson <dianders@chromium.org>
Tested-by: Doug Anderson <dianders@chromium.org>
