From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH v4 04/14] mfd: Add Samsung PWM/timer master driver
Date: Fri, 05 Apr 2013 19:35:41 +0200
Message-ID: <19231120.yHlZtTPUMd@amdc1227>
References: <1365093431-30621-1-git-send-email-t.figa@samsung.com>
 <5507947.WEhmSUi7vd@amdc1227> <201304051905.24644.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <201304051905.24644.arnd@arndb.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: mark.rutland@arm.com, heiko@sntech.de, tomasz.figa@gmail.com, buserror@gmail.com, jacmet@sunsite.dk, augulis.darius@gmail.com, christer@weinigel.se, sylvester.nawrocki@gmail.com, m.szyprowski@samsung.com, kgene.kim@samsung.com, linux@arm.linux.org.uk, Samuel Ortiz <sameo@linux.intel.com>, kwangwoo.lee@gmail.com, mcuelenaere@gmail.com, devicetree-discuss@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org, john.stultz@linaro.org, ghcstop@gmail.com, linux@simtec.co.uk, linux-arm-kernel@lists.infradead.org, broonie@opensource.wolfsonmicro.com, jekhor@gmail.com, kyungmin.park@samsung.com, tglx@linutronix.de
List-Id: linux-samsung-soc@vger.kernel.org

On Friday 05 of April 2013 19:05:24 Arnd Bergmann wrote:
> On Friday 05 April 2013, Tomasz Figa wrote:
> > On Friday 05 of April 2013 18:39:58 Samuel Ortiz wrote:
> > > Hi Tomasz,
> > > 
> > > On Thu, Apr 04, 2013 at 06:37:01PM +0200, Tomasz Figa wrote:
> > > > This patch adds master driver for PWM/timer block available on many
> > > > Samsung SoCs providing clocksource and PWM output capabilities.
> > > 
> > > Why is that an MFD driver, and why aren't you using the PWM APIs for it
> > > ?
> > > Also, you probably want to look at using the regmap APIs for your IO.
> > 
> > The case of Samsung PWM timers is rather complicated. It is a hardware
> > block that can be used at the same time to generate PWM signal and as a
> > system clocksource.
> > 
> > There was a discussion on how to solve the problem of sharing the
> > hardware:
> > http://thread.gmane.org/gmane.linux.kernel.samsung-soc/16480/focus=16500
> > (see the linked post and replies to it).
> 
> I don't think anyone ever suggested using a private API though.

I must have gotten the last paragraph of
http://article.gmane.org/gmane.linux.kernel.samsung-soc/16638
wrong then. For me it seemed like the timer driver would expose a private API 
to the PWM driver.

> I think
> it's ok if the driver lives in drivers/mfd when it doesn't fit anywhere
> else easily, but you should really register it to the pwm subsystem to
> expose that functionality, not export functions that can be used by
> a pwm shim driver, which even seems to be missing from the series.

Anyway, using PWM API in a clocksource driver that needs to be running very 
early (before any initcalls get called) seems a bit weird for me, especially 
when PWM API doesn't provide such fine grained control over PWM timers that is 
required in the clocksource drivers.

Best regards,
-- 
Tomasz Figa
Samsung Poland R&D Center
SW Solution Development, Kernel and System Framework
