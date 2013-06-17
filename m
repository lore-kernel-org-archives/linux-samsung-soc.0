From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [RFC PATCH 08/11] dmaengine: PL08x: Add cyclic transfer support
Date: Mon, 17 Jun 2013 20:52:56 +0200
Message-ID: <1469066.0V8nhZHHN8@flatron>
References: <1371416058-22047-1-git-send-email-tomasz.figa@gmail.com>
 <1371416058-22047-9-git-send-email-tomasz.figa@gmail.com>
 <CACRpkdbW3GW4-UL2Qhv+3Vcpv84d3sT+-7t+d3ZPJ4_0KEkNmg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CACRpkdbW3GW4-UL2Qhv+3Vcpv84d3sT+-7t+d3ZPJ4_0KEkNmg@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>, Padmavathi Venna <padma.v@samsung.com>, Takashi Iwai <tiwai@suse.de>, Alessandro Rubini <rubini@gnudd.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Giancarlo Asnaghi <giancarlo.asnaghi@st.com>, Kukjin Kim <kgene.kim@samsung.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Vinod Koul <vinod.koul@intel.com>, Thomas Abraham <thomas.abraham@linaro.org>, Grant Likely <grant.likely@linaro.org>, Arnd Bergmann <arnd@arndb.de>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, Jaroslav Kysela <perex@perex.cz>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, linux-spi@vger.kernel.
List-Id: linux-samsung-soc@vger.kernel.org

On Monday 17 of June 2013 15:57:38 Linus Walleij wrote:
> On Sun, Jun 16, 2013 at 10:54 PM, Tomasz Figa <tomasz.figa@gmail.com> 
wrote:
> > From: Alban Bedel <alban.bedel@avionic-design.de>
> > 
> > Many audio interface drivers require support of cyclic transfers to
> > work correctly, for example Samsung ASoC DMA driver. This patch adds
> > support for cyclic transfers to the amba-pl08x driver.
> > 
> > Signed-off-by: Alban Bedel <alban.bedel@avionic-design.de>
> > Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>
> 
> Nice! This is useful for others as well.
> 
> > @@ -198,6 +199,8 @@ struct pl08x_txd {
> > 
> >          */
> >         
> >         u32 ccfg;
> >         bool done;
> > 
> > +
> > +       bool cyclic;
> > 
> >  };
> 
> You can never have enough whitespace right?
> 
> >  /**
> > 
> > @@ -561,9 +564,9 @@ static u32 pl08x_getbytes_chan(struct
> > pl08x_dma_chan *plchan)> 
> >                         bytes +=
> >                         get_bytes_in_cctl(llis_va[index].cctl);
> >                 
> >                 /*
> > 
> > -                * A LLI pointer of 0 terminates the LLI list
> > ++               * A LLI pointer going backward terminates the LLI
> > list
> 
> ++? Really?
> 
> This looks like a merge leftover being merged in.

I think it's a copy/paste error when applying some hunks of the original 
patch manually.

> > -               if (!llis_va[index].lli)
> > +               if (llis_va[index].lli <= clli)
> 
> This was clever.
> 
> The rest of the code looks nice.

OK. I will fix the issues you mentioned in next version.

Best regards,
Tomasz
