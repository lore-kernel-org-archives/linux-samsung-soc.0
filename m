From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: EXYNOS4: Fix wrong constants in the hotplug assembly
	code.
Date: Wed, 23 Feb 2011 17:17:06 +0900
Message-ID: <01e901cbd332$12a09350$37e1b9f0$%kim@samsung.com>
References: <1298444621-3739-1-git-send-email-kgene.kim@samsung.com>
	<AANLkTinpjGwd+pFr1oKQb1jiaih2h81Wp9G7Df8J1LLk@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <AANLkTinpjGwd+pFr1oKQb1jiaih2h81Wp9G7Df8J1LLk@mail.gmail.com>
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
Cc: 'Russell King' <rmk+kernel@arm.linux.org.uk>, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

Kyungmin Park wrote:
> =

> Hi,
> =

Hi :)

> At that time Russell modified the s5cv310, tegra, and realview also. I
> think you also modify it.
> =

Maybe you mean commit 30b99d07 (ARM: fix wrongly patched constants).
It was due to his patch commit e3d9c625 (ARM: CPU hotplug: fix hard-coded
control register constants) but this is different with that.
Firstly this patch fixes wrong constants in the hotplug assembly code.
Then secondly, fixes hard-coded control register constants.

Of course, first reason is more important on this.
And I'm not sure whether need to fix on tegra also.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.


> On Wed, Feb 23, 2011 at 4:03 PM, Kukjin Kim <kgene.kim@samsung.com> wrote:
> > This patch fixes wrong constants in the hotplug assembly code for
> > Exynos4 such as Russell's changing in vexpress hotplug and fixes
> > hard-coded control register constatns also.
> >
> > Reported-by: Changhwan Youn <chaos.youn@samsung.com>
> > Cc: Russell King <rmk+kernel@arm.linux.org.uk>
> > Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> > ---
> > =A0arch/arm/mach-exynos4/hotplug.c | =A0 =A08 ++++----
> > =A01 files changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/arch/arm/mach-exynos4/hotplug.c b/arch/arm/mach-
> exynos4/hotplug.c
> > index 4c42f9c..2b5909e 100644
> > --- a/arch/arm/mach-exynos4/hotplug.c
> > +++ b/arch/arm/mach-exynos4/hotplug.c
> > @@ -30,13 +30,13 @@ static inline void cpu_enter_lowpower(void)
> > =A0 =A0 =A0 =A0 * Turn off coherency
> > =A0 =A0 =A0 =A0 */
> > =A0 =A0 =A0 =A0" =A0 =A0 =A0 mrc =A0 =A0 p15, 0, %0, c1, c0, 1\n"
> > - =A0 =A0 =A0 " =A0 =A0 =A0 bic =A0 =A0 %0, %0, #0x20\n"
> > + =A0 =A0 =A0 " =A0 =A0 =A0 bic =A0 =A0 %0, %0, %3\n"
> > =A0 =A0 =A0 =A0" =A0 =A0 =A0 mcr =A0 =A0 p15, 0, %0, c1, c0, 1\n"
> > =A0 =A0 =A0 =A0" =A0 =A0 =A0 mrc =A0 =A0 p15, 0, %0, c1, c0, 0\n"
> > =A0 =A0 =A0 =A0" =A0 =A0 =A0 bic =A0 =A0 %0, %0, %2\n"
> > =A0 =A0 =A0 =A0" =A0 =A0 =A0 mcr =A0 =A0 p15, 0, %0, c1, c0, 0\n"
> > =A0 =A0 =A0 =A0 =A0: "=3D&r" (v)
> > - =A0 =A0 =A0 =A0 : "r" (0), "Ir" (CR_C)
> > + =A0 =A0 =A0 =A0 : "r" (0), "Ir" (CR_C), "Ir" (0x40)
> > =A0 =A0 =A0 =A0 =A0: "cc");
> > =A0}
> >
> > @@ -49,10 +49,10 @@ static inline void cpu_leave_lowpower(void)
> > =A0 =A0 =A0 =A0" =A0 =A0 =A0 orr =A0 =A0 %0, %0, %1\n"
> > =A0 =A0 =A0 =A0" =A0 =A0 =A0 mcr =A0 =A0 p15, 0, %0, c1, c0, 0\n"
> > =A0 =A0 =A0 =A0" =A0 =A0 =A0 mrc =A0 =A0 p15, 0, %0, c1, c0, 1\n"
> > - =A0 =A0 =A0 " =A0 =A0 =A0 orr =A0 =A0 %0, %0, #0x20\n"
> > + =A0 =A0 =A0 " =A0 =A0 =A0 orr =A0 =A0 %0, %0, %2\n"
> > =A0 =A0 =A0 =A0" =A0 =A0 =A0 mcr =A0 =A0 p15, 0, %0, c1, c0, 1\n"
> > =A0 =A0 =A0 =A0 =A0: "=3D&r" (v)
> > - =A0 =A0 =A0 =A0 : "Ir" (CR_C)
> > + =A0 =A0 =A0 =A0 : "Ir" (CR_C), "Ir" (0x40)
> > =A0 =A0 =A0 =A0 =A0: "cc");
> > =A0}
> >
> > --
> > 1.7.1
