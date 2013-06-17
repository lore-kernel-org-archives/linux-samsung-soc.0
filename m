From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [RFC PATCH 04/11] dma: amba-pl08x: Add support for PL080S variant
Date: Mon, 17 Jun 2013 20:22:41 +0200
Message-ID: <3074496.mvNejQEAbP@flatron>
References: <1371416058-22047-1-git-send-email-tomasz.figa@gmail.com>
 <1371416058-22047-5-git-send-email-tomasz.figa@gmail.com>
 <CACRpkdZ+g-_AC=2WBs3nruyTMX16Ona99g_wcS=PqOuZ6xVpog@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CACRpkdZ+g-_AC=2WBs3nruyTMX16Ona99g_wcS=PqOuZ6xVpog@mail.gmail.com>
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

On Monday 17 of June 2013 15:39:34 Linus Walleij wrote:
> On Sun, Jun 16, 2013 at 10:54 PM, Tomasz Figa <tomasz.figa@gmail.com> 
wrote:
> > PL080S is a modified version of PL080 that can be found on Samsung
> > SoCs, such as S3C6400 and S3C6410.
> > 
> > It has different offset of CONFIG register, separate CONTROL1 register
> > that holds transfer size and larger maximum transfer size.
> > 
> > Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>
> 
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> 
> (I would have done some smallish things differently but it
> is only a matter of taste.)
> 
> >  static struct amba_id pl08x_ids[] = {
> > 
> > +       /* Samsung PL080S variant */
> > +       {
> > +               .id     = 0x0a141080,
> > +               .mask   = 0xffffffff,
> > +               .data   = &vendor_pl080s,
> > +       },
> 
> Interesting that Samsung claim to be vendor 0x41
> (ARM).

Yeah, I had identical thought when I saw it first time.

> Well ARM never made revision no 0x0a so
> this works.

Good, this is exactly what I wanted to read! ;)

I was afraid that this ID might conflict with some revision of normal 
PL080, but fortunately it is not the case.

Best refards,
Tomasz
