From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 2/3] arm: s5pv210: Aquila: add support for MAX8998 PMIC
Date: Thu, 1 Jul 2010 15:05:11 +0100
Message-ID: <20100701140510.GB8742@rakim.wolfsonmicro.main>
References: <1277964466-23891-1-git-send-email-m.szyprowski@samsung.com>
	<1277964466-23891-3-git-send-email-m.szyprowski@samsung.com>
	<20100701122451.GA17698@sirena.org.uk>
	<000001cb1921$d75de060$8619a120$%szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <000001cb1921$d75de060$8619a120$%szyprowski@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: kgene.kim@samsung.com, kyungmin.park@samsung.com, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, Jul 01, 2010 at 03:32:17PM +0200, Marek Szyprowski wrote:

> One more question - should I enable the regulators in the driver itself
> or in the platform callback (like a "poweron()" callback)?

I don't understand what you mean by "platform callback".  Normally the
driver would unconditionally use the regulators.

> If I put regulator enabling into the driver how can one make it working
> on a board without regulators (chip powered all the time)? Should the
> driver ignore errors from regulator_get()?

No, check the errors.  The regulator API will stub itself out if it's
not enabled in Kconfig (which will happen on boards where it's not being
used at all), boards using a mixed configuration can use fixed voltage
regulators for static supplies and REGULATOR_DUMMY can also be used.

> What if one regulator needs enabling other to operate properly 
> (parent-child hierarchy)?

Set up supplies for the child regulators in their constraints.  This
isn't heavily tested at the minute but it should do the right thing for
you automatically in the core; if it doesn't work we can fix it up.
