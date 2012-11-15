From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: Build failure: OMAP4430 failed due to exynos4 pinctrl
Date: Thu, 15 Nov 2012 11:59:51 +0100
Message-ID: <CACRpkdaUN0r9tbjRXyXYqRtzgd1jS8RFsomtH64ja6GfNoeomw@mail.gmail.com>
References: <007b01cdc0bf$50c9ee70$f25dcb50$%kim@samsung.com>
	<201211121440.13980.arnd@arndb.de>
	<01a601cdc15d$5a4c46c0$0ee4d440$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f46.google.com ([74.125.83.46]:47268 "EHLO
	mail-ee0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S2993220Ab2KOK7w (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 15 Nov 2012 05:59:52 -0500
Received: by mail-ee0-f46.google.com with SMTP id b15so876384eek.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 15 Nov 2012 02:59:51 -0800 (PST)
In-Reply-To: <01a601cdc15d$5a4c46c0$0ee4d440$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Russell King - ARM Linux <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, arm@kernel.org, linux-samsung-soc@vger.kernel.org

On Tue, Nov 13, 2012 at 6:11 AM, Kukjin Kim <kgene.kim@samsung.com> wrote:

>> From: Arnd Bergmann <arnd@arndb.de>
>> Date: Wed, 10 Oct 2012 13:31:45 +0000
>> Subject: [PATCH] pinctrl: samsung: don't allow enabling pinctrl-samsung
>>  standalone
>>
>> The main samsung pinctrl module references the specific exynos4210
>> pinctrl driver, which selects the main driver in Kconfig.
>>
>> Making the main driver a silent "bool" option avoid this potential
>> build error if CONFIG_PINCTRL_SAMSUNG=y && CONFIG_PINCTRL_EXYNOS4=n:
>>
>> drivers/built-in.o:(.rodata+0x4e4): undefined reference to
>> `exynos4210_pin_ctrl'
>>
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>> Cc: Tomasz Figa <t.figa@samsung.com>
>> Cc: Kyungmin Park <kyungmin.park@samsung.com>
>> Cc: Linus Walleij <linus.walleij@linaro.org>
>> Cc: Kukjin Kim <kgene.kim@samsung.com>
>
> Acked-by: Kukjin Kim <kgene.kim@samsung.com>
>
> Linus, can you pick this up in your pinctrl/fixes ree?

OK done.

Yours,
Linus Walleij
