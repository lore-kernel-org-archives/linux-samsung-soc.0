From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH CRITICAL] ARM: s3c64xx: dt: Fix boot failure due to double
 clock initialization
Date: Fri, 13 Dec 2013 21:52:11 -0800
Message-ID: <CAOesGMifjnTDUcsweOwsw9fFgsE7b4q3wsASfP8YL-uMH5KiPA@mail.gmail.com>
References: <1386964779-29457-1-git-send-email-tomasz.figa@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qa0-f42.google.com ([209.85.216.42]:61912 "EHLO
	mail-qa0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751088Ab3LNFwM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 14 Dec 2013 00:52:12 -0500
Received: by mail-qa0-f42.google.com with SMTP id k4so138885qaq.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 13 Dec 2013 21:52:11 -0800 (PST)
In-Reply-To: <1386964779-29457-1-git-send-email-tomasz.figa@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>

On Fri, Dec 13, 2013 at 11:59 AM, Tomasz Figa <tomasz.figa@gmail.com> wrote:
> Commit
>
> 4178bac ARM: call of_clk_init from default time_init handler
>
> added implicit call to of_clk_init() from default time_init callback,
> but it did not change platforms calling it from other callbacks, despite
> of not having custom time_init callbacks. This caused double clock
> initialization on such platforms, leading to boot failures. An example
> of such platform is mach-s3c64xx.
>
> This patch fixes boot failure on s3c64xx by dropping custom init_irq
> callback, which had a call to of_clk_init() and moving system reset
> initialization to init_machine callback. This allows us to have
> clocks initialized properly without a need to have custom init_time or
> init_irq callbacks.
>
> Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>
> ---
>  arch/arm/mach-s3c64xx/mach-s3c64xx-dt.c | 11 +----------
>  1 file changed, 1 insertion(+), 10 deletions(-)
>
> NOTE: This is a critical boot regression fix for mach-s3c64xx that
> should be merged for next 3.13-rc release.

Applied to fixes. We sent a batch of fixes just the other day so this
will likely go in sometime next week, but it'll be in linux-next as of
the next release.

Hm, it'd be nice to get better coverage of 64xx as well as exynos 4.
Are there any cheap 64xx development boards out there?


-Olof
