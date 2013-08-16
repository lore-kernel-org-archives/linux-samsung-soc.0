From: Mike Turquette <mturquette@linaro.org>
Subject: Re: [PATCH v2 0/8] Common Clock Framework support for Samsung S3C64xx
Date: Fri, 16 Aug 2013 14:02:03 -0700
Message-ID: <20130816210203.4443.43511@quantum>
References: <1374536965-3545-1-git-send-email-tomasz.figa@gmail.com>
 <51FFDA70.7080900@samsung.com> <20130805180625.5348.79570@quantum>
 <2956608.dyLtqySMuJ@amdc1227>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <2956608.dyLtqySMuJ@amdc1227>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, Arnd Bergmann <arnd@arndb.de>, Thomas Abraham <thomas.abraham@linaro.org>, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, Tomasz Figa <tomasz.figa@gmail.com>, Mark Brown <broonie@kernel.org>, stern@rowland.harvard.edu, Olof Johansson <olof@lixom.net>, Kukjin Kim <kgene.kim@samsung.com>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

Quoting Tomasz Figa (2013-08-16 03:44:44)
> Hi Mike,
> 
> On Monday 05 of August 2013 11:06:25 Mike Turquette wrote:
> > Quoting Kukjin Kim (2013-08-05 10:01:36)
> > 
> > > On 07/23/13 08:49, Tomasz Figa wrote:
> > > > This series is an attempt to move clock support on Samsung S3C64xx
> > > > SoCs
> > > > to Common Clock Framework.
> > > > 
> > > > First, support for PLL types present on S3C64xx SoCs is added to
> > > > Samsung
> > > > Common Clock Framework driver. Then the main clock driver for
> > > > mentioned
> > > > SoCs is introduced. Further patches contain fixes for drivers to make
> > > > them compliant with CCF semantics, migration of platform code to use
> > > > the new clock driver and removal of old clock management code.
> > > > 
> > > > Depends on:
> > > >   - [PATCH v4 00/20] Samsung PWM support cleanup
> > > >   
> > > >     http://thread.gmane.org/gmane.linux.kernel.samsung-soc/20856
> > > > 
> > > > On S3C6410-based Tiny6410 board (Mini6410-compatible):
> > > > 
> > > > Tested-by: Tomasz Figa<tomasz.figa@gmail.com>
> > > > 
> > > > For v1:
> > > > 
> > > > Acked-by: Mike Turquette<mturquette@linaro.org>
> > > > 
> > > > Changes since v1:
> > > >   - added patch for read-only muxes,
> > > >   - exported configurable muxes and dividers,
> > > >   - defined mout_syncmux as read-only mux,
> > > >   - in DT-enabled case fixed-clock binding is used to define external
> > > >   clocks.> > 
> > > > Tomasz Figa (8):
> > > >    clk: mux: Add support for read-only muxes.
> > > >    clk: samsung: pll: Add support for PLL6552 and PLL6553
> > > >    clk: samsung: Add clock driver for S3C64xx SoCs
> > > >    ARM: SAMSUNG: Add soc_is_s3c6400/s3c6410 macros
> > > >    ARM: s3c64xx: dma: Use clk_prepare_enable/clk_disable_unprepare
> > > >    usb: host: ohci-s3c2410 Use
> > > >    clk_prepare_enable/clk_disable_unprepare
> > > >    ARM: s3c64xx: Migrate clock handling to Common Clock Framework
> > > >    ARM: s3c64xx: Remove old clock management code
> > > >   
> > > >   .../bindings/clock/samsung,s3c64xx-clock.txt       |   77 ++
> > > >   arch/arm/Kconfig                                   |    2 +-
> > > >   arch/arm/mach-s3c64xx/Makefile                     |    2 +-
> > > >   arch/arm/mach-s3c64xx/clock.c                      | 1007
> > > >   -------------------- arch/arm/mach-s3c64xx/common.c               
> > > >        |   21 +-
> > > >   arch/arm/mach-s3c64xx/common.h                     |   12 +-
> > > >   arch/arm/mach-s3c64xx/dma.c                        |    4 +-
> > > >   arch/arm/mach-s3c64xx/include/mach/regs-clock.h    |  132 +--
> > > >   arch/arm/mach-s3c64xx/mach-anw6410.c               |    2 +-
> > > >   arch/arm/mach-s3c64xx/mach-crag6410.c              |    2 +-
> > > >   arch/arm/mach-s3c64xx/mach-hmt.c                   |    2 +-
> > > >   arch/arm/mach-s3c64xx/mach-mini6410.c              |    2 +-
> > > >   arch/arm/mach-s3c64xx/mach-ncp.c                   |    2 +-
> > > >   arch/arm/mach-s3c64xx/mach-smartq.c                |   11 +-
> > > >   arch/arm/mach-s3c64xx/mach-smdk6400.c              |    2 +-
> > > >   arch/arm/mach-s3c64xx/mach-smdk6410.c              |    2 +-
> > > >   arch/arm/mach-s3c64xx/pm.c                         |   21 -
> > > >   arch/arm/mach-s3c64xx/s3c6400.c                    |    6 -
> > > >   arch/arm/mach-s3c64xx/s3c6410.c                    |    7 -
> > > >   arch/arm/plat-samsung/include/plat/cpu.h           |    4 +
> > > >   drivers/clk/clk-mux.c                              |   10 +-
> > > >   drivers/clk/samsung/Makefile                       |    1 +
> > > >   drivers/clk/samsung/clk-pll.c                      |  160 ++++
> > > >   drivers/clk/samsung/clk-pll.h                      |    4 +
> > > >   drivers/clk/samsung/clk-s3c64xx.c                  |  465 +++++++++
> > > >   drivers/usb/host/ohci-s3c2410.c                    |    8 +-
> > > >   include/dt-bindings/clock/samsung,s3c64xx-clock.h  |  178 ++++
> > > >   include/linux/clk-provider.h                       |    2 +
> > > >   28 files changed, 943 insertions(+), 1205 deletions(-)
> > > >   create mode 100644
> > > >   Documentation/devicetree/bindings/clock/samsung,s3c64xx-clock.txt
> > > >   delete mode 100644 arch/arm/mach-s3c64xx/clock.c
> > > >   create mode 100644 drivers/clk/samsung/clk-s3c64xx.c
> > > >   create mode 100644
> > > >   include/dt-bindings/clock/samsung,s3c64xx-clock.h
> > > 
> > > Basically, this series looks good to me, but I'm not sure how this
> > > should be handled because of dependency with PWM cleanup and clk stuff
> > > in clk tree now...
> > 
> > Patches 1-3 can go into the clk tree. 4-6 should go through their
> > respective trees.
> 
> It looks like version 2 of patch 2/8 has been applied by mistake, breaking 
> compilation (and operation) of the clock driver added in patch 3/8.
> 

Ugh. My mistake.

> Could you please fix this up? Thanks in advance.

This is a little tricky since I published the clk-next-s3c64xx branch as
a stable branch for Samsung which I think has been merged to the Samsung
tree already. So what are the options?

One option is to create a fixup patch that just manages the delta
between V2 and V3. I can then add this to the top of clk-next-s3c64xx
and re-merge it into clk-next. Then the Samsung tree will need to
re-merge that dependency branch.

Do you have a better idea?

Regards,
Mike

> 
> Best regards,
> Tomasz
> 
> > If you want I can take 7 & 8 through the clk tree.
> > 
> > Alternatively I can provide patches 1-3 in a separate stable topic
> > branch for you to pull in as a dependency. We'll both merge that stable
> > topic branch into our trees and you can make a note of it for the
> > arm-soc folks.
> > 
> > Regards,
> > Mike
> > 
> > > - Kukjin
> > 
> > --
> > To unsubscribe from this list: send the line "unsubscribe
> > linux-samsung-soc" in the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
