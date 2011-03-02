From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH V4] ARM: EXYNOS4: Implement kernel timers using MCT
Date: Wed, 02 Mar 2011 16:29:19 +0900
Message-ID: <010b01cbd8ab$8d575830$a8060890$%kim@samsung.com>
References: <1298870207-1850-1-git-send-email-kgene.kim@samsung.com>
	<1298870207-1850-3-git-send-email-kgene.kim@samsung.com>
	<AANLkTim9XMD=x5dbm0vOcrCcrL0TRKvdb7CuXBv3r_qX@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <AANLkTim9XMD=x5dbm0vOcrCcrL0TRKvdb7CuXBv3r_qX@mail.gmail.com>
Content-language: ko
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: 'Kyungmin Park' <kmpark@infradead.org>
Cc: linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, 'Russell King' <rmk+kernel@arm.linux.org.uk>, 'Changhwan Youn' <chaos.youn@samsung.com>, linux-arm-kernel@lists.infradead.org, 'Marek Szyprowski' <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Kyungmin Park wrote:
> =

> Hi,
> =

> MCT is only possible from EVT1.0 or later. The current universal_c210
> used the EVT0 version.
> So can you remove the ifdef and board can select which timer is used?
> Please refer the omap implementation and how to use it.
> =

Basically, "CONFIG_EXYNOS4_MCT" can be selected in kernel menuconfig.
It means default one is using local timer which is included in every
Exynos4210.

> If we use the same configuration, It will be boot failed at
> universal_c210 board.
> =

No, see as above.

One more basically, each machine specific CONFIGs should be selected in
kernel menuconfig after "make exynos4_defconfig". Because each machine
supports different components on each one now.

As a note, however, I don't want to add each machine's defconfig. Maybe
Russell also.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

> Thank you,
> Kyungmin Park
> =

> On Mon, Feb 28, 2011 at 2:16 PM, Kukjin Kim <kgene.kim@samsung.com> wrote:
> > From: Changhwan Youn <chaos.youn@samsung.com>
> >
> > The Multi-Core Timer(MCT) of EXYNOS4 is designed for implementing
> > clock source timer and clock event timers. This patch implements
> > 1 clock source timer with 64 bit free running counter of MCT and
> > 2 clock event timers with two of 31-bit tick counters.
> >
> > Signed-off-by: Changhwan Youn <chaos.youn@samsung.com>
> > Cc: Ben Dooks <ben-linux@fluff.org>
> > Cc: Russell King <rmk+kernel@arm.linux.org.uk>
> > Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> > ---
> > Changes since v3:
> > - Re-worked based on exynos4
> > - Changed member of clock_evetn_device like following
> > =A0struct mct_clock_event_device {
> > =A0 =A0 =A0 =A0struct clock_event_device *evt;
> > =A0...
> > - Address comments from Russell King
> > =A0Added static into "irqreturn_t exynos4_mct_comp_isr()"
> > =A0Added .dev_id member into "struct irqaction mct_comp_event_irq"
> >
> > Changes since v2:
> > - Addressed comments from Russell King
> > =A0Added mct_clock_event_device structure
> > - Removed suspend()/resume() which are not used now
> >
> > Changes since v1:
> > - Addressed comments from Russell King
> > =A0(implemented global timer, used local timer and so on)
> > - Fixed small things
> >
> > =A0arch/arm/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0| =A0 =A02 +-
> > =A0arch/arm/mach-exynos4/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =
=A05 +
> > =A0arch/arm/mach-exynos4/Makefile =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =
11 +-
> > =A0arch/arm/mach-exynos4/include/mach/regs-mct.h | =A0 52 +++
> > =A0arch/arm/mach-exynos4/mct.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0421
> +++++++++++++++++++++++++
> > =A05 files changed, 488 insertions(+), 3 deletions(-)
> > =A0create mode 100644 arch/arm/mach-exynos4/include/mach/regs-mct.h
> > =A0create mode 100644 arch/arm/mach-exynos4/mct.c
> >
> > diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> > index ec3bf98..b4db99b 100644
> > --- a/arch/arm/Kconfig
> > +++ b/arch/arm/Kconfig
> > @@ -1366,7 +1366,7 @@ config LOCAL_TIMERS
> > =A0 =A0 =A0 =A0bool "Use local timer interrupts"
> > =A0 =A0 =A0 =A0depends on SMP
> > =A0 =A0 =A0 =A0default y
> > - =A0 =A0 =A0 select HAVE_ARM_TWD if !ARCH_MSM_SCORPIONMP
> > + =A0 =A0 =A0 select HAVE_ARM_TWD if (!ARCH_MSM_SCORPIONMP && !EXYNOS4_=
MCT)
> > =A0 =A0 =A0 =A0help
> > =A0 =A0 =A0 =A0 =A0Enable support for local timers on SMP platforms, ra=
ther then
the
> > =A0 =A0 =A0 =A0 =A0legacy IPI broadcast method. =A0Local timers allows =
the system
> > diff --git a/arch/arm/mach-exynos4/Kconfig
b/arch/arm/mach-exynos4/Kconfig
> > index ad03840..77b5d93 100644
> > --- a/arch/arm/mach-exynos4/Kconfig
> > +++ b/arch/arm/mach-exynos4/Kconfig
> > @@ -15,6 +15,11 @@ config CPU_EXYNOS4210
> > =A0 =A0 =A0 =A0help
> > =A0 =A0 =A0 =A0 =A0Enable EXYNOS4210 CPU support
> >
> > +config EXYNOS4_MCT
> > + =A0 =A0 =A0 bool "Kernel timer support by MCT"
> > + =A0 =A0 =A0 help
> > + =A0 =A0 =A0 =A0 Use MCT (Multi Core Timer) as kernel timers
> > +
> > =A0config EXYNOS4_DEV_PD
> > =A0 =A0 =A0 =A0bool
> > =A0 =A0 =A0 =A0help
> > diff --git a/arch/arm/mach-exynos4/Makefile b/arch/arm/mach-
> exynos4/Makefile
> > index 0558235..de20b91 100644
> > --- a/arch/arm/mach-exynos4/Makefile
> > +++ b/arch/arm/mach-exynos4/Makefile
> > @@ -13,11 +13,18 @@ obj- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0:=3D
> > =A0# Core support for EXYNOS4 system
> >
> > =A0obj-$(CONFIG_CPU_EXYNOS4210) =A0 +=3D cpu.o init.o clock.o irq-combi=
ner.o
> > -obj-$(CONFIG_CPU_EXYNOS4210) =A0 +=3D setup-i2c0.o time.o gpiolib.o
irq-eint.o
> dma.o
> > +obj-$(CONFIG_CPU_EXYNOS4210) =A0 +=3D setup-i2c0.o gpiolib.o irq-eint.o
dma.o
> > =A0obj-$(CONFIG_CPU_FREQ) =A0 =A0 =A0 =A0 +=3D cpufreq.o
> >
> > =A0obj-$(CONFIG_SMP) =A0 =A0 =A0 =A0 =A0 =A0 =A0+=3D platsmp.o headsmp.o
> > -obj-$(CONFIG_LOCAL_TIMERS) =A0 =A0 +=3D localtimer.o
> > +
> > +ifeq ($(CONFIG_EXYNOS4_MCT),y)
> > +obj-y =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0+=3D mct.o
> > +else
> > +obj-y =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0+=3D time.o
> > +obj-$(CONFIG_LOCAL_TIMERS) =A0 =A0 +=3D localtimer.o
> > +endif
> > +
> > =A0obj-$(CONFIG_HOTPLUG_CPU) =A0 =A0 =A0+=3D hotplug.o
> >
> > =A0# machine support

(snip)
