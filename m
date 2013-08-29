From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [alsa-devel] [PATCH 09/18] ASoC: Samsung: Do not queue cyclic
 buffers multiple times
Date: Thu, 29 Aug 2013 19:36:38 +0200
Message-ID: <CACRpkdavSeiraVhjdaitLxBg+RE8h+N33uvddaCQGRcoui7=5Q@mail.gmail.com>
References: <1376243970-6489-1-git-send-email-tomasz.figa@gmail.com>
	<1376243970-6489-10-git-send-email-tomasz.figa@gmail.com>
	<20130829163611.GL10783@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20130829163611.GL10783@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, Vinod Koul <vinod.koul@intel.com>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, Kukjin Kim <kgene.kim@samsung.com>, Mike Turquette <mturquette@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Sangbeom Kim <sbkim73@samsung.com>, Padmavathi Venna <padma.v@samsung.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.de>, Dan Williams <djbw@fb.com>, Russell King <linux@arm.linux.org.uk>, linux-spi@vger.kernel.org, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, Aug 29, 2013 at 6:36 PM, Mark Brown <broonie@kernel.org> wrote:
> On Sun, Aug 11, 2013 at 07:59:21PM +0200, Tomasz Figa wrote:
>> The legacy S3C-DMA API required every period of a cyclic buffer to be
>> queued separately. After conversion of Samsung ASoC to Samsung DMA
>> wrappers somebody made an assumption that the same is needed for DMA
>> engine API, which is not true.
>
> Applied, thanks.

OK Vinod can you take in patch 1 thru 8?

Yours,
Linus Walleij
