From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC PATCH v2 03/12] dmaengine: PL08x: Rework LLI
 handling to be less fragile
Date: Tue, 25 Jun 2013 00:23:09 +0200
Message-ID: <CACRpkdYm7gFVLzRpQ2J97M+-zQAug_ftJhyi_kniTgCk=GT_bQ@mail.gmail.com>
References: <1371933764-24875-1-git-send-email-tomasz.figa@gmail.com>
 <1371933764-24875-4-git-send-email-tomasz.figa@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <1371933764-24875-4-git-send-email-tomasz.figa@gmail.com>
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

On Sat, Jun 22, 2013 at 10:42 PM, Tomasz Figa <tomasz.figa@gmail.com> wrote:

> +enum {
> +       PL080_LLI_SRC,
> +       PL080_LLI_DST,
> +       PL080_LLI_LLI,
> +       PL080_LLI_CCTL,
> +
> +       PL080_LLI_WORDS
> +};

I usually don't like it when enums are not given names, and are
implicitly cast to integers.

I think it'd be better to just use #define for these so we know what
is going on.

> @@ -181,7 +177,7 @@ struct pl08x_txd {
>         struct virt_dma_desc vd;
>         struct list_head dsg_list;
>         dma_addr_t llis_bus;
> -       struct pl08x_lli *llis_va;
> +       u32 *llis_va;

It's nice that you use the u32 * here for proper indexing into an
array.

> -/* Size (bytes) of each LLI buffer allocated for one transfer */
> -# define PL08X_LLI_TSFR_SIZE   0x2000
> -
> -/* Maximum times we call dma_pool_alloc on this pool without freeing */
> -#define MAX_NUM_TSFR_LLIS      (PL08X_LLI_TSFR_SIZE/sizeof(struct pl08x_lli))
> +/*
> + * Number of LLIs in each LLI buffer allocated for one transfer
> + * (maximum times we call dma_pool_alloc on this pool without freeing)
> + */
> +#define MAX_NUM_TSFR_LLIS      512

And I like this nice side effect that we allocate a number of LLIs rather
than a fixed-size buffer.

> +static void pl08x_write_lli(struct pl08x_driver_data *pl08x,
> +               struct pl08x_phy_chan *phychan, const u32 *lli, u32 ccfg)
> +{
> +       dev_vdbg(&pl08x->adev->dev,
> +               "WRITE channel %d: csrc=0x%08x, cdst=0x%08x, "
> +               "clli=0x%08x, cctl=0x%08x, ccfg=0x%08x\n",
> +               phychan->id, lli[PL080_LLI_SRC], lli[PL080_LLI_DST],
> +               lli[PL080_LLI_LLI], lli[PL080_LLI_CCTL], ccfg);
> +
> +       writel(lli[PL080_LLI_SRC], phychan->base + PL080_CH_SRC_ADDR);
> +       writel(lli[PL080_LLI_DST], phychan->base + PL080_CH_DST_ADDR);
> +       writel(lli[PL080_LLI_LLI], phychan->base + PL080_CH_LLI);
> +       writel(lli[PL080_LLI_CCTL], phychan->base + PL080_CH_CONTROL);
> +
> +       writel(ccfg, phychan->reg_config);

Take this opportunity to replace the first four writel() with writel_relaxed(),
keep the last one to make sure all hit the hardware.

Apart from that this looks nice!

Yours,
Linus Walleij
