From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 04/18] dmaengine: PL08x: Move LLI dumping code into
 separate function
Date: Wed, 28 Aug 2013 08:50:30 +0200
Message-ID: <CACRpkdY_fjdoR06=uhLpuF+LZ8rQ7h_+i2XQdsbAm-uy4wh0MQ@mail.gmail.com>
References: <1376243970-6489-1-git-send-email-tomasz.figa@gmail.com>
	<1376243970-6489-5-git-send-email-tomasz.figa@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1376243970-6489-5-git-send-email-tomasz.figa@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-spi@vger.kernel.org, Dan Williams <djbw@fb.com>, Jaroslav Kysela <perex@perex.cz>, Kukjin Kim <kgene.kim@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Mike Turquette <mturquette@linaro.org>, Padmavathi Venna <padma.v@samsung.com>, Russell King <linux@arm.linux.org.uk>, Sangbeom Kim <sbkim73@samsung.com>, Takashi Iwai <tiwai@suse.de>, Vinod Koul <vinod.koul@intel.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Sun, Aug 11, 2013 at 7:59 PM, Tomasz Figa <tomasz.figa@gmail.com> wrote:

> This patch refactors debugging code that dumps LLI entries by moving it
> into separate function, which is stubbed when VERBOSE_DEBUG is not
> selected. This allows us to get rid of the ugly ifdef from the body of
> pl08x_fill_llis_for_desc().
>
> No functional change is introduced by this patch.
>
> Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
