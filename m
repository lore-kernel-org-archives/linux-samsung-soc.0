From: Olof Johansson <olof@lixom.net>
Subject: Re: linux-next: origen build failed at drivers/pinctrl/pinctrl-exynos.c
Date: Tue, 18 Jun 2013 10:03:52 -0700
Message-ID: <CAOesGMhL7P350yPkxEKAZ+FS9X6QMFL+4gv5dCRBCW8rwQBB0g@mail.gmail.com>
References: <CA+G9fYu3_-RZxFyRENuqJvzsM=YToT7PG+5fUytMzhsFu3=z7g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qc0-f175.google.com ([209.85.216.175]:65229 "EHLO
	mail-qc0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756153Ab3FRRDx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 18 Jun 2013 13:03:53 -0400
Received: by mail-qc0-f175.google.com with SMTP id k14so2434814qcv.20
        for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Jun 2013 10:03:52 -0700 (PDT)
In-Reply-To: <CA+G9fYu3_-RZxFyRENuqJvzsM=YToT7PG+5fUytMzhsFu3=z7g@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: Tomasz Figa <t.figa@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, Arnd Bergmann <arnd.bergmann@linaro.org>, Doug Anderson <dianders@chromium.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Milosz Wasilewski <milosz.wasilewski@linaro.org>

Hi,


On Tue, Jun 18, 2013 at 9:19 AM, Naresh Kamboju
<naresh.kamboju@linaro.org> wrote:
> Hi,
>
> linux-next branch failed to build origen build
>
> defconfig: exynos_defconfig

This was broken yesterday and fixed today. Getting linux-next build
error reports that are 24+ hours old isn't very useful, unfortunately.

It'd also be convenient if you supplied the "git describe" version
number of the source tree in these reports, so it'd be trivial to find
out by glancing at the report, instead of going to the build log.

(Besides that, thanks for the bug report!)


-Olof
