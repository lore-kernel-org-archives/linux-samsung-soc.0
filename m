From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] ARM: s3c24xx: get rid of custom <mach/gpio.h>
Date: Fri, 13 Dec 2013 13:42:03 +0100
Message-ID: <CACRpkdZeMZkodW2yt0px_zAozwci3xB5HMd4vreBME=afQofiA@mail.gmail.com>
References: <1386857210-4944-1-git-send-email-linus.walleij@linaro.org>
	<12061693.IYmMzIp37Y@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f46.google.com ([209.85.219.46]:52758 "EHLO
	mail-oa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751602Ab3LMMmD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 13 Dec 2013 07:42:03 -0500
Received: by mail-oa0-f46.google.com with SMTP id o6so1980390oag.33
        for <linux-samsung-soc@vger.kernel.org>; Fri, 13 Dec 2013 04:42:03 -0800 (PST)
In-Reply-To: <12061693.IYmMzIp37Y@flatron>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Ben Dooks <ben-linux@fluff.org>, Heiko Stuebner <heiko@sntech.de>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>

On Fri, Dec 13, 2013 at 11:30 AM, Tomasz Figa <tomasz.figa@gmail.com> wrote:
> On Thursday 12 of December 2013 15:06:50 Linus Walleij wrote:
> [snip]
>>  arch/arm/mach-s3c64xx/include/mach/gpio.h          |  93 -----------------
>
> Hmm, shouldn't this (and other s3c64xx-related changes) be in patch 2/2?

Hm yes, I wonder how I screwed this up... I'll move this to the other patch.

> Anyway, I've applied both, but unfortunately compilation for mach-s3c64xx
> (using s3c6400_defconfig) fails with following error:

Trying to reproduce and fix this.

Thanks!

Yours,
Linus Walleij
