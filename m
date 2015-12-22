From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/3] Add support for monitoring gpio switches
Date: Tue, 22 Dec 2015 10:25:06 +0100
Message-ID: <CACRpkdZWXnR0tUbr9KeX3KPEe11pUYC5ZcBkX8jvUx3fREwHgQ@mail.gmail.com>
References: <1449250275-23435-1-git-send-email-martyn.welch@collabora.co.uk>
	<1449250275-23435-3-git-send-email-martyn.welch@collabora.co.uk>
	<CACRpkdb=it+U+3-0mvZ9Pf1cnYT_r1KkFiS=C4YDkqrjoRm+kQ@mail.gmail.com>
	<567138E2.80505@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f173.google.com ([209.85.214.173]:34244 "EHLO
	mail-ob0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751481AbbLVJZI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 22 Dec 2015 04:25:08 -0500
Received: by mail-ob0-f173.google.com with SMTP id iw8so140320871obc.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 22 Dec 2015 01:25:06 -0800 (PST)
In-Reply-To: <567138E2.80505@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Martyn Welch <martyn.welch@collabora.co.uk>
Cc: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Kukjin Kim <kgene@kernel.org>, Kumar Gala <galak@codeaurora.org>, Olof Johansson <olof@lixom.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Wed, Dec 16, 2015 at 11:11 AM, Martyn Welch
<martyn.welch@collabora.co.uk> wrote:

>> Patches like that has however already been suggested, and I have NACKed
>> them because the GPIO sysfs ABI is insane, and that is why I am
>> refactoring
>> the world to create a proper chardev ABI for GPIO instead. See:
>> http://marc.info/?l=linux-gpio&m=144550276512673&w=2
>
> I can certainly understand the rationale for the changes that you are
> proposing, though do worry that it does make it a bit tougher to use from
> scripting languages.

The idea is to provide commandline tools in the kernel tools/gpio subdir
to satisfy the needs of scripting. "lsgpio" today is just one example,
nothing stops us from having a tool called just "gpio-sak"
(GPIO swiss army knife) that will be tailored for scripting.

> I see that the question of how to provide functionality
> equivalent to the above was raised and no answer was forthcoming. Is there a
> plan for supporting the identification of a GPIO line serving a specific
> purpose?

Yes by name.

> What is the status of the mentioned patch series?

They stubled into a few dozen architecture issues in the GPIO
subsystem so I am busy refactoring the whole know universe :D

But I still intend to persue the series.

Yours,
Linus Walleij
