From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC PATCH 11/11] ARM: s3c64xx: Add support for
 DMA using generic amba-pl08x driver
Date: Mon, 17 Jun 2013 16:04:47 +0200
Message-ID: <CACRpkdbQ7+FDJh235vERbCcQcnW1Mzar9r5jgLaXAT5n6CiCFQ@mail.gmail.com>
References: <1371416058-22047-1-git-send-email-tomasz.figa@gmail.com>
 <1371416058-22047-12-git-send-email-tomasz.figa@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <1371416058-22047-12-git-send-email-tomasz.figa@gmail.com>
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

> This patch adds all required platform-specific data and initialization
> code to support the generic amba-pl08x driver on S3C64xx SoCs.
>
> Also some compatibility definitions are added to make the transition from
> legacy API to DMA engine easier. The biggest hack here is passing const
> char * pointers through DMA resource, casted to unsigned long, but this
> is how Samsung DMA wrappers (used to support both s3c-dma and DMA engine
> in drivers) is designed.
>
> Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>

Patch looks like an OK stepping stone.

> +static AMBA_AHB_DEVICE(s3c64xx_dma0, "dma-pl080s.0", 0x0a141080,
> +                       0x75000000, {IRQ_DMA0}, &s3c64xx_dma0_plat_data);
(...)
> +static AMBA_AHB_DEVICE(s3c64xx_dma1, "dma-pl080s.1", 0x0a141080,
> +                       0x75100000, {IRQ_DMA1}, &s3c64xx_dma1_plat_data);

Ah, does this mean the device does not have any AMBA PrimeCell ID
contents?

Then use the ID 0x00053080 instead of 0x0a141080

0x53 is "S" for Samsung. Variant 0.

Yours,
Linus Walleij
