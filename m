From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] exynos: drm: use monotonic timestamps
Date: Wed, 17 Jan 2018 17:54:32 +0100
Message-ID: <CAK8P3a0881PmcN4vga-oMWvHkWytvvu96Psr3PR2thNti5KQ5w@mail.gmail.com>
References: <20171102114415.1811842-1-arnd@arndb.de> <f6a26bf4-e3b6-97c1-3a92-00ffe97ae293@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oi0-f68.google.com ([209.85.218.68]:39544 "EHLO
        mail-oi0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753572AbeAQQye (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 17 Jan 2018 11:54:34 -0500
In-Reply-To: <f6a26bf4-e3b6-97c1-3a92-00ffe97ae293@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Cc: Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@linux.ie>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>

On Fri, Nov 3, 2017 at 3:04 PM, Tobias Jakobi
<tjakobi@math.uni-bielefeld.de> wrote:
> Hello Arnd,
>
> I guess you could coordinate the IPP changes with Marek, who is rewriting the
> IPP subsystem anyway (added Marek to Cc).
>
> Here is the most recent IPPv2 series:
> https://www.spinics.net/lists/linux-samsung-soc/msg61066.html
>
> Concerning the G2D changes, I don't think anything in userspace uses the
> timestamps (e.g. for synchronisation).

I'm cleaning out older patches that didn't make it in yet now, and got to this
one. I looked at the current state and found that the ipp specific half of my
patch is obsolete now, and we won't need to patch anything there with
Marek's new version.

For the G2D half, I'll just resubmit the patch I had here, let's discuss
further from there, if you think we should just drop the timestamp.

Thanks!

       Arnd
