From: Mike Turquette <mturquette@linaro.org>
Subject: Re: [PATCH v2 1/8] clk: mux: Add support for read-only muxes.
Date: Fri, 02 Aug 2013 14:46:59 -0700
Message-ID: <20130802214659.6450.88936@quantum>
References: <1374536965-3545-1-git-send-email-tomasz.figa@gmail.com>
 <1374536965-3545-2-git-send-email-tomasz.figa@gmail.com>
 <1460068.oJXN9T0Uhp@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1460068.oJXN9T0Uhp@flatron>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, Arnd Bergmann <arnd@arndb.de>, Thomas Abraham <thomas.abraham@linaro.org>, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, Mark Brown <broonie@kernel.org>, stern@rowland.harvard.edu, Olof Johansson <olof@lixom.net>, Kukjin Kim <kgene.kim@samsung.com>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

Quoting Tomasz Figa (2013-07-27 05:41:05)
> Hi Mike,
> 
> On Tuesday 23 of July 2013 01:49:18 Tomasz Figa wrote:
> > Some platforms have read-only clock muxes that are preconfigured at
> > reset and cannot be changed at runtime. This patch extends mux clock
> > driver to allow handling such read-only muxes by adding new
> > CLK_MUX_READ_ONLY mux flag.
> > 
> > Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>
> > ---
> >  drivers/clk/clk-mux.c        | 10 +++++++++-
> >  include/linux/clk-provider.h |  2 ++
> >  2 files changed, 11 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/clk/clk-mux.c b/drivers/clk/clk-mux.c
> > index 614444c..92f1a1b 100644
> > --- a/drivers/clk/clk-mux.c
> > +++ b/drivers/clk/clk-mux.c
> > @@ -107,6 +107,11 @@ const struct clk_ops clk_mux_ops = {
> >  };
> >  EXPORT_SYMBOL_GPL(clk_mux_ops);
> > 
> > +const struct clk_ops clk_mux_ro_ops = {
> > +     .get_parent = clk_mux_get_parent,
> > +};
> > +EXPORT_SYMBOL_GPL(clk_mux_ro_ops);
> > +
> >  struct clk *clk_register_mux_table(struct device *dev, const char
> > *name, const char **parent_names, u8 num_parents, unsigned long flags,
> > void __iomem *reg, u8 shift, u32 mask,
> > @@ -133,7 +138,10 @@ struct clk *clk_register_mux_table(struct device
> > *dev, const char *name, }
> > 
> >       init.name = name;
> > -     init.ops = &clk_mux_ops;
> > +     if (clk_mux_flags & CLK_MUX_READ_ONLY)
> > +             init.ops = &clk_mux_ro_ops;
> > +     else
> > +             init.ops = &clk_mux_ops;
> >       init.flags = flags | CLK_IS_BASIC;
> >       init.parent_names = parent_names;
> >       init.num_parents = num_parents;
> > diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
> > index 1ec14a7..9487b96 100644
> > --- a/include/linux/clk-provider.h
> > +++ b/include/linux/clk-provider.h
> > @@ -327,8 +327,10 @@ struct clk_mux {
> >  #define CLK_MUX_INDEX_ONE            BIT(0)
> >  #define CLK_MUX_INDEX_BIT            BIT(1)
> >  #define CLK_MUX_HIWORD_MASK          BIT(2)
> > +#define CLK_MUX_READ_ONLY    BIT(3) /* mux setting cannot be changed */
> > 
> >  extern const struct clk_ops clk_mux_ops;
> > +extern const struct clk_ops clk_mux_ro_ops;
> > 
> >  struct clk *clk_register_mux(struct device *dev, const char *name,
> >               const char **parent_names, u8 num_parents, unsigned long 
> flags,
> 
> What do you think about this?

Looks good to me. This makes sense for OMAP's sys_clkin clock, probably
a common pattern.

Acked-by: Mike Turquette <mturquette@linaro.org>

> 
> Best regards,
> Tomasz
