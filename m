From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4 19/19] irqchip: Move ARM vic.h to include/linux/irqchip/arm-vic.h
Date: Thu, 10 Jan 2013 11:58:42 +0100
Message-ID: <CACRpkdZdR5YC7WEqQhxeNGbwreSnA2QmyRHFfeO1CncZSK6YVA@mail.gmail.com>
References: <1357235668-9450-1-git-send-email-robherring2@gmail.com>
	<1357235668-9450-20-git-send-email-robherring2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ie0-f170.google.com ([209.85.223.170]:46185 "EHLO
	mail-ie0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753378Ab3AJK6m (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 10 Jan 2013 05:58:42 -0500
Received: by mail-ie0-f170.google.com with SMTP id k10so522992iea.29
        for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Jan 2013 02:58:42 -0800 (PST)
In-Reply-To: <1357235668-9450-20-git-send-email-robherring2@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, Russell King <linux@arm.linux.org.uk>, Olof Johansson <olof@lixom.net>, thomas.petazzoni@free-electrons.com, Rob Herring <rob.herring@calxeda.com>, Thomas Gleixner <tglx@linutronix.de>, Hartley Sweeten <hsweeten@visionengravers.com>, Ryan Mallon <rmallon@gmail.com>, Alessandro Rubini <rubini@unipv.it>, STEricsson <STEricsson_nomadik_linux@list.st.com>, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org

On Thu, Jan 3, 2013 at 6:54 PM, Rob Herring <robherring2@gmail.com> wrote:

> From: Rob Herring <rob.herring@calxeda.com>
>
> Now that we have VIC moved to drivers/irqchip and all VIC DT init for
> platforms using irqchip_init, move gic.h and update the remaining
> includes.

This will need to be rebased on fixes merged for -rc3.

Apart from that, Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
