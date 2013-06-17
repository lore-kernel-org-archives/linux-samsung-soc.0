From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC PATCH 00/11] ARM: s3c64xx: Let amba-pl08x
	driver handle DMA
Date: Mon, 17 Jun 2013 16:06:25 +0200
Message-ID: <CACRpkdbS3YvwSjpMQbJvSNty=sBrx20vUHKYG44OaWowcN6b0g@mail.gmail.com>
References: <1371416058-22047-1-git-send-email-tomasz.figa@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <1371416058-22047-1-git-send-email-tomasz.figa@gmail.com>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>, Padmavathi Venna <padma.v@samsung.com>, Takashi Iwai <tiwai@suse.de>, Alessandro Rubini <rubini@gnudd.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Giancarlo Asnaghi <giancarlo.asnaghi@st.com>, Kukjin Kim <kgene.kim@samsung.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Vinod Koul <vinod.koul@intel.com>, Thomas Abraham <thomas.abraham@linaro.org>, Grant Likely <grant.likely@linaro.org>, Arnd Bergmann <arnd@arndb.de>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, linux-spi@vger.kernel.org, Mark Brown <broonie@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Sun, Jun 16, 2013 at 10:54 PM, Tomasz Figa <tomasz.figa@gmail.com> wrote:

> One of the biggest roadblocks on the way of S3C64xx to DeviceTree support
> is its DMA driver, which is completely platform-specific and provides
> private API (s3c-dma), not even saying that its design is completely
> against multiplatform-awareness.
>
> The DMA controller present on this SoC series is a custom variant
> of ARM PrimeCell PL080 modified by Samsung to add some extra features.
> It is mostly compatible with original PL080, except:
>  - CH_CONTROL2 register is added between CH_CONTROL and CH_CONFIG,
>  - offset of CH_CONFIG register is different,
>  - transfer size field is moved from CH_CONTROL to CH_CONTROL2,
>  - transfer size field is extended to 24 bits, allowing much bigger
>      single transfer,
>  - LLI consists of one more word, to account for CH_CONTROL2 register.
>
> Since all the rest is fully compatible with standard PL080 there is no
> point in having separate driver just for this single variant, so I decided
> to look into adding support for it to the amba-pl08x driver.
>
> There was already some attempt to achieve this before, but this was before
> Russel's big rework of the driver to use virtual channels, making the old
> patches being not much of use.
>
> This RFC series is a proof of concept that I managed to make during last
> days of hacking. Except one patch adding clkdev lookup to clock driver
> (which is being replaced with a CCF-compliant driver ATM), this is enough
> to get memcpy and slave transfers to work on S3C64xx.
>
> I have tested this on Mini6410 and SMDK6410 boards using dmatest for
> memcpy and Samsung I2S with madplay/aplay for slave transfers.
> Unfortunately I do not have access to other platforms with PL08x so
> I could not test for any regressions introduced on them.
>
> Credits for two patches go to Alban Bedel, who made a series fixing this
> driver to make it usable with audio drivers. I rebased his patches on top
> of mine and corrected coding style a bit.
>
> OK, that's all. Any comments are welcome. Feel free to start throwing eggs
> and tomatoes if you find this awful, but I won't be upset if I get some
> Tested-by or Acked-by as well. ;)

I've waited for a long time for this to happen, thank you very much for
doing this.

Yours,
Linus Walleij
