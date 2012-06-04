From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH] gpio/samsung: fix the typo 'exynos5_xxx' instead of 'exonys5_xxx'
Date: Sun, 3 Jun 2012 21:20:40 -0700
Message-ID: <CA+55aFx7jTBGDDrda5ww8KF6WDdCRS2Uf4p17HvM-65KRT=CHQ@mail.gmail.com>
References: <088d01cd4207$823ecb10$86bc6130$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f174.google.com ([74.125.82.174]:55447 "EHLO
	mail-we0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751977Ab2FDEVC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 4 Jun 2012 00:21:02 -0400
Received: by weyu7 with SMTP id u7so2580720wey.19
        for <linux-samsung-soc@vger.kernel.org>; Sun, 03 Jun 2012 21:21:01 -0700 (PDT)
In-Reply-To: <088d01cd4207$823ecb10$86bc6130$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, grant.likely@secretlab.ca, Linus Walleij <linus.walleij@linaro.org>

On Sun, Jun 3, 2012 at 9:07 PM, Kukjin Kim <kgene.kim@samsung.com> wrote:
>
> Should be 'exynos5_xxx' instead of 'exonys5_xxx'.

Oops, my bad. I did that typo in the commit message too.

       Linus
