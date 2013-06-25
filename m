From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [RFC PATCH v2 00/12] ARM: s3c64xx: Let amba-pl08x driver handle DMA
Date: Tue, 25 Jun 2013 13:22:20 +0200
Message-ID: <6520269.XdaOpEg0Ud@amdc1227>
References: <1371933764-24875-1-git-send-email-tomasz.figa@gmail.com>
 <20130625102818.GA27646@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:17812 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752538Ab3FYLWY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 25 Jun 2013 07:22:24 -0400
In-reply-to: <20130625102818.GA27646@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, alsa-devel@alsa-project.org, Kukjin Kim <kgene.kim@samsung.com>, Vinod Koul <vinod.koul@intel.com>, Dan Williams <djbw@fb.com>, Linus Walleij <linus.walleij@linaro.org>, Alessandro Rubini <rubini@gnudd.com>, Giancarlo Asnaghi <giancarlo.asnaghi@st.com>, Grant Likely <grant.likely@linaro.org>, Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>, Padmavathi Venna <padma.v@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>Russell King - ARM Linux <lin>

Hi Mark,

Thanks for testing this series.

On Tuesday 25 of June 2013 11:28:18 Mark Brown wrote:
> On Sat, Jun 22, 2013 at 10:42:32PM +0200, Tomasz Figa wrote:
> > This is another version of my patches extending support of amba-pl08x
> > DMA engine driver to PL080S DMA engine (PL080 modified by Samsung)
> > found
> > in Samsung S3C64xx SoCs.
> 
> On my non-DT s3c64xx system I get this when trying to use SPI for the
> first time:

Could you clarify first time? Does it work on further retries?

> [    1.739385] s3c64xx-spi s3c6410-spi.0: Failed to get RX DMA channel
> [    1.743437] spi_master spi0: failed to prepare transfer hardware
> 
> though I haven't yet tried your clock patches (there were some conficts
> that I didn't get round to picking up yet).

This shouldn't really matter, as long as the pl080 drivers probes 
correctly.

Best regards,
Tomasz
