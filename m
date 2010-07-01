From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: RE: [PATCH 2/3] arm: s5pv210: Aquila: add support for MAX8998 PMIC
Date: Thu, 01 Jul 2010 15:32:17 +0200
Message-ID: <000001cb1921$d75de060$8619a120$%szyprowski@samsung.com>
References: <1277964466-23891-1-git-send-email-m.szyprowski@samsung.com>
	<1277964466-23891-3-git-send-email-m.szyprowski@samsung.com>
	<20100701122451.GA17698@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <20100701122451.GA17698@sirena.org.uk>
Content-language: pl
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: 'Mark Brown' <broonie@opensource.wolfsonmicro.com>
Cc: kgene.kim@samsung.com, kyungmin.park@samsung.com, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

Hello,

On Thursday, July 01, 2010 2:25 PM Mark Brown wrote:

> On Thu, Jul 01, 2010 at 08:07:45AM +0200, Marek Szyprowski wrote:
> 
> > +static struct regulator_consumer_supply aquila_ldo3_consumers[] = {
> > +	{	.supply	= "VMIPI_1.1V",	},
> > +};
> 
> > +static struct regulator_consumer_supply aquila_ldo8_consumers[] = {
> > +	{	.supply	= "VADC_3.3V", },
> > +};
> 
> Almost all of these regulator supplies should be removed.  Except in
> some exceptional cases all supplies should specify a struct device (the
> only one that really exists at the minute is CPU core due to lack of
> devices for CPUfreq).  In general if you're defining a supply name that
> is the same as the rail on the board rather than a pin on a chip you're
> not using the API correctly.

Ok. I will remove them now and add later with the appropriate devices.

One more question - should I enable the regulators in the driver itself
or in the platform callback (like a "poweron()" callback)?

If I put regulator enabling into the driver how can one make it working
on a board without regulators (chip powered all the time)? Should the
driver ignore errors from regulator_get()?

What if one regulator needs enabling other to operate properly 
(parent-child hierarchy)?

Best regards
--
Marek Szyprowski
Samsung Poland R&D Center
