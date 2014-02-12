From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 08/14] mfd: sec: Add support for S2MPS14
Date: Wed, 12 Feb 2014 11:03:37 +0100
Message-ID: <1392199417.22265.12.camel@AMDC1943>
References: <1392123837-5517-1-git-send-email-k.kozlowski@samsung.com>
 <1392123837-5517-9-git-send-email-k.kozlowski@samsung.com>
 <20140212091724.GS15081@lee--X1>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20140212091724.GS15081@lee--X1>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Sangbeom Kim <sbkim73@samsung.com>, Samuel Ortiz <sameo@linux.intel.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, 2014-02-12 at 09:17 +0000, Lee Jones wrote:
> > Add support for S2MPS14 PMIC device to the MFD sec-core driver.
> > The S2MPS14 is similar to S2MPS11 but it has fewer regulators, two
> > clocks instead of three and a little different registers layout.
> > 
> > Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> > ---
> >  drivers/mfd/sec-core.c              |   48 +++++++++--
> >  drivers/mfd/sec-irq.c               |   89 +++++++++++++++++++-
> >  include/linux/mfd/samsung/core.h    |    1 +
> >  include/linux/mfd/samsung/irq.h     |   27 +++++++
> >  include/linux/mfd/samsung/rtc.h     |   56 +++++++++++--
> >  include/linux/mfd/samsung/s2mps14.h |  152 +++++++++++++++++++++++++++++++++++
> >  6 files changed, 361 insertions(+), 12 deletions(-)
> >  create mode 100644 include/linux/mfd/samsung/s2mps14.h
> > 
> > diff --git a/drivers/mfd/sec-core.c b/drivers/mfd/sec-core.c
> 
> <snip>
> 
> > +static const struct mfd_cell s2mps14_devs[] = {
> > +	{
> > +		.name = "s2mps14-pmic",
> > +	}, {
> > +		.name = "s2mps14-rtc",
> > +	}, {
> > +		.name = "s2mps14-clk",
> > +	}
> > +};
> 
> No device tree support for the children?

There aren't any compatibles also for other devices (s2mps11, s5m876X)
so I didn't want to introduce different behavior for S2MPS14. If you
want of_compatible here then it should be added for all devices.

> 
> <Snip>
> 
> > +#define S2MPS14_LDO_VSEL_MASK	0x3F
> > +#define S2MPS14_BUCK_VSEL_MASK	0xFF
> > +#define S2MPS14_ENABLE_MASK	(0x03 << S2MPS14_ENABLE_SHIFT)
> > +#define S2MPS14_ENABLE_SHIFT	6
> > +#define S2MPS14_LDO_N_VOLTAGES	(S2MPS14_LDO_VSEL_MASK + 1)
> > +#define S2MPS14_BUCK_N_VOLTAGES (S2MPS14_BUCK_VSEL_MASK + 1)
> 
> Nit: Can you line these up using tabs please?
> 

Sure.
