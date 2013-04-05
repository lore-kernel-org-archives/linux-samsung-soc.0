From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v4 04/14] mfd: Add Samsung PWM/timer master driver
Date: Fri, 5 Apr 2013 19:05:24 +0200
Message-ID: <201304051905.24644.arnd@arndb.de>
References: <1365093431-30621-1-git-send-email-t.figa@samsung.com>
 <20130405163958.GP17363@zurbaran> <5507947.WEhmSUi7vd@amdc1227>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <5507947.WEhmSUi7vd@amdc1227>
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
Cc: mark.rutland@arm.com, heiko@sntech.de, tomasz.figa@gmail.com, buserror@gmail.com, jacmet@sunsite.dk, augulis.darius@gmail.com, christer@weinigel.se, sylvester.nawrocki@gmail.com, m.szyprowski@samsung.com, kgene.kim@samsung.com, linux@arm.linux.org.uk, Samuel Ortiz <sameo@linux.intel.com>, kwangwoo.lee@gmail.com, mcuelenaere@gmail.com, devicetree-discuss@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org, john.stultz@linaro.org, ghcstop@gmail.com, linux@simtec.co.uk, linux-arm-kernel@lists.infradead.org, broonie@opensource.wolfsonmicro.com, jekhor@gmail.com, kyungmin.park@samsung.com, tglx@linutronix.de
List-Id: linux-samsung-soc@vger.kernel.org

On Friday 05 April 2013, Tomasz Figa wrote:
> On Friday 05 of April 2013 18:39:58 Samuel Ortiz wrote:
> > Hi Tomasz,
> > 
> > On Thu, Apr 04, 2013 at 06:37:01PM +0200, Tomasz Figa wrote:
> > > This patch adds master driver for PWM/timer block available on many
> > > Samsung SoCs providing clocksource and PWM output capabilities.
>
> > Why is that an MFD driver, and why aren't you using the PWM APIs for it ?
> > Also, you probably want to look at using the regmap APIs for your IO.
> 
> The case of Samsung PWM timers is rather complicated. It is a hardware block 
> that can be used at the same time to generate PWM signal and as a system 
> clocksource.
> 
> There was a discussion on how to solve the problem of sharing the hardware:
> http://thread.gmane.org/gmane.linux.kernel.samsung-soc/16480/focus=16500
> (see the linked post and replies to it).
> 

I don't think anyone ever suggested using a private API though. I think
it's ok if the driver lives in drivers/mfd when it doesn't fit anywhere
else easily, but you should really register it to the pwm subsystem to
expose that functionality, not export functions that can be used by
a pwm shim driver, which even seems to be missing from the series.

	Arnd
