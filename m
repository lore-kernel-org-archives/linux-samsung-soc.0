From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] ARM: S3C[24|64]xx: move includes back under <mach/> scope
Date: Wed, 15 Jan 2014 13:51:09 +0100
Message-ID: <CACRpkdbTdAS_iGOrVmsCZ_ggYMuk13LkE3oJ-YzHT3cUB+m5Lg@mail.gmail.com>
References: <1389707618-17011-1-git-send-email-linus.walleij@linaro.org>
	<CAHbNUh29qGSt-isqOAdVVO3x0w2mDTVnKeH+Sc_rkfkOiXc_mA@mail.gmail.com>
	<6144980.CZru2D3yJB@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f54.google.com ([209.85.219.54]:44383 "EHLO
	mail-oa0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751286AbaAOMvK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 15 Jan 2014 07:51:10 -0500
Received: by mail-oa0-f54.google.com with SMTP id o6so1127640oag.13
        for <linux-samsung-soc@vger.kernel.org>; Wed, 15 Jan 2014 04:51:10 -0800 (PST)
In-Reply-To: <6144980.CZru2D3yJB@wuerfel>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Tushar Behera <tushar.behera@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, Heiko Stuebner <heiko@sntech.de>, Mark Brown <broonie@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Ben Dooks <ben-linux@fluff.org>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>

On Wed, Jan 15, 2014 at 10:43 AM, Arnd Bergmann <arnd@arndb.de> wrote:
> On Wednesday 15 January 2014 14:41:01 Tushar Behera wrote:
>>
>> This inclusion should be protected by a check for CONFIG_ARCH_S3C24XX
>> || CONFIG_ARCH_S3C64XX. Currently generating build errors for
>> s5p64x0_defconfig, s5pc100_defconfig and s5pv210_defconfig on
>> next-20140115.
>
> I noticed the same problem, but I think a better solution would
> be to do the same change for s5p that Linus has done for s3c,
> which is to move the nonstandard contents of mach/gpio.h to
> mach/gpio-samsung.h.

Hm I just applied a fixup from Sachin adding #ifdefs back in
but maybe I should try to fix it up like that instead. Just a minute...

Yours,
Linus Walleij
