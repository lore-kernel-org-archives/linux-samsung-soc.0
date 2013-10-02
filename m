From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/5] gpio: samsung: Use CONFIG_ARCH_S3C64XX to check for
 S3C64xx support
Date: Wed, 2 Oct 2013 12:46:51 +0200
Message-ID: <CACRpkdZXOGpTspPucd=d0=Ws9Ccx19h4UYTTdgZceoofhuq0Kw@mail.gmail.com>
References: <1380392497-27406-1-git-send-email-tomasz.figa@gmail.com>
	<1380392497-27406-2-git-send-email-tomasz.figa@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1380392497-27406-2-git-send-email-tomasz.figa@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Ben Dooks <ben-linux@fluff.org>, Mauro Carvalho Chehab <m.chehab@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Martin
List-Id: linux-samsung-soc@vger.kernel.org

On Sat, Sep 28, 2013 at 8:21 PM, Tomasz Figa <tomasz.figa@gmail.com> wrote:

> Since CONFIG_PLAT_S3C64XX is going to be removed, this patch modifies
> the gpio-samsung driver to use the proper way of checking for S3C64xx
> support - CONFIG_ARCH_S3C64XX.
>
> Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

I assume that this will go through ARM SoC?

Yours,
Linus Walleij
