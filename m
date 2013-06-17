From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC PATCH 08/11] dmaengine: PL08x: Add cyclic
	transfer support
Date: Mon, 17 Jun 2013 15:57:38 +0200
Message-ID: <CACRpkdbW3GW4-UL2Qhv+3Vcpv84d3sT+-7t+d3ZPJ4_0KEkNmg@mail.gmail.com>
References: <1371416058-22047-1-git-send-email-tomasz.figa@gmail.com>
 <1371416058-22047-9-git-send-email-tomasz.figa@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <1371416058-22047-9-git-send-email-tomasz.figa@gmail.com>
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

> From: Alban Bedel <alban.bedel@avionic-design.de>
>
> Many audio interface drivers require support of cyclic transfers to work
> correctly, for example Samsung ASoC DMA driver. This patch adds support
> for cyclic transfers to the amba-pl08x driver.
>
> Signed-off-by: Alban Bedel <alban.bedel@avionic-design.de>
> Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>

Nice! This is useful for others as well.

> @@ -198,6 +199,8 @@ struct pl08x_txd {
>          */
>         u32 ccfg;
>         bool done;
> +
> +       bool cyclic;
>  };

You can never have enough whitespace right?

>  /**
> @@ -561,9 +564,9 @@ static u32 pl08x_getbytes_chan(struct pl08x_dma_chan *plchan)
>                         bytes += get_bytes_in_cctl(llis_va[index].cctl);
>
>                 /*
> -                * A LLI pointer of 0 terminates the LLI list
> ++               * A LLI pointer going backward terminates the LLI list

++? Really?

This looks like a merge leftover being merged in.

> -               if (!llis_va[index].lli)
> +               if (llis_va[index].lli <= clli)

This was clever.

The rest of the code looks nice.

Yours,
Linus Walleij
