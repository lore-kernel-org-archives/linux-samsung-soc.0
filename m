From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4 14/19] ARM: remove unneeded vic.h includes
Date: Thu, 10 Jan 2013 12:07:25 +0100
Message-ID: <CACRpkdYsO-551KhCN6ZuUjUfFJinphtod8=Cbohpqx9z1dToXw@mail.gmail.com>
References: <1357235668-9450-1-git-send-email-robherring2@gmail.com>
	<1357235668-9450-15-git-send-email-robherring2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ie0-f172.google.com ([209.85.223.172]:57923 "EHLO
	mail-ie0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753707Ab3AJLH0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 10 Jan 2013 06:07:26 -0500
Received: by mail-ie0-f172.google.com with SMTP id c13so527881ieb.31
        for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Jan 2013 03:07:26 -0800 (PST)
In-Reply-To: <1357235668-9450-15-git-send-email-robherring2@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, Russell King <linux@arm.linux.org.uk>, Olof Johansson <olof@lixom.net>, thomas.petazzoni@free-electrons.com, Rob Herring <rob.herring@calxeda.com>, Hartley Sweeten <hsweeten@visionengravers.com>, Ryan Mallon <rmallon@gmail.com>, Hubert Feurstein <hubert.feurstein@contec.at>, Alessandro Rubini <rubini@unipv.it>, STEricsson <STEricsson_nomadik_linux@list.st.com>, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Kyungmin Park <kyungmin.park@samsung.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, linux-samsung-soc@vger.kernel.org, patches@opensource.wolfsonmicro.com

On Thu, Jan 3, 2013 at 6:54 PM, Rob Herring <robherring2@gmail.com> wrote:

> From: Rob Herring <rob.herring@calxeda.com>
>
> Numerous includes of asm/hardware/vic.h aren't needed, so remove them.

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
