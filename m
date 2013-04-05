From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH v4 04/14] mfd: Add Samsung PWM/timer master driver
Date: Fri, 05 Apr 2013 18:53:31 +0200
Message-ID: <5507947.WEhmSUi7vd@amdc1227>
References: <1365093431-30621-1-git-send-email-t.figa@samsung.com>
 <1365093431-30621-5-git-send-email-t.figa@samsung.com>
 <20130405163958.GP17363@zurbaran>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <20130405163958.GP17363@zurbaran>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Samuel Ortiz <sameo@linux.intel.com>
Cc: mark.rutland@arm.com, heiko@sntech.de, tomasz.figa@gmail.com, buserror@gmail.com, jacmet@sunsite.dk, augulis.darius@gmail.com, christer@weinigel.se, sylvester.nawrocki@gmail.com, m.szyprowski@samsung.com, kgene.kim@samsung.com, linux@arm.linux.org.uk, kwangwoo.lee@gmail.com, mcuelenaere@gmail.com, arnd@arndb.de, devicetree-discuss@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org, john.stultz@linaro.org, ghcstop@gmail.com, linux@simtec.co.uk, linux-arm-kernel@lists.infradead.org, broonie@opensource.wolfsonmicro.com, jekhor@gmail.com, kyungmin.park@samsung.com, tglx@linutronix.de
List-Id: linux-samsung-soc@vger.kernel.org

Hi Samuel,

On Friday 05 of April 2013 18:39:58 Samuel Ortiz wrote:
> Hi Tomasz,
> 
> On Thu, Apr 04, 2013 at 06:37:01PM +0200, Tomasz Figa wrote:
> > This patch adds master driver for PWM/timer block available on many
> > Samsung SoCs providing clocksource and PWM output capabilities.
> > 
> > Signed-off-by: Tomasz Figa <t.figa@samsung.com>
> > Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> > ---
> > 
> >  .../devicetree/bindings/pwm/pwm-samsung.txt        |  37 ++
> >  drivers/clocksource/Kconfig                        |   1 +
> >  drivers/mfd/Kconfig                                |   3 +
> >  drivers/mfd/Makefile                               |   1 +
> >  drivers/mfd/samsung-pwm.c                          | 439
> >  +++++++++++++++++++++ drivers/pwm/Kconfig                               
> >  |   1 +
> >  include/linux/mfd/samsung-pwm.h                    |  49 +++
> >  include/linux/platform_data/samsung-pwm.h          |  28 ++
> >  8 files changed, 559 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/pwm/pwm-samsung.txt
> >  create mode 100644 drivers/mfd/samsung-pwm.c
> >  create mode 100644 include/linux/mfd/samsung-pwm.h
> >  create mode 100644 include/linux/platform_data/samsung-pwm.h
> 
> Why is that an MFD driver, and why aren't you using the PWM APIs for it ?
> Also, you probably want to look at using the regmap APIs for your IO.

The case of Samsung PWM timers is rather complicated. It is a hardware block 
that can be used at the same time to generate PWM signal and as a system 
clocksource.

There was a discussion on how to solve the problem of sharing the hardware:
http://thread.gmane.org/gmane.linux.kernel.samsung-soc/16480/focus=16500
(see the linked post and replies to it).

Best regards,
-- 
Tomasz Figa
Samsung Poland R&D Center
SW Solution Development, Kernel and System Framework
