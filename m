From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [RFC 2/2] soc: samsung: pmu: Add the PMU data of exynos4412 to
 support low-power state
Date: Fri, 15 Feb 2019 08:33:17 +0100
Message-ID: <CAJKOXPdo8cVwL8kb4NzvvDUDaVgAgDf3OM=aJqVdkyPminPG2A@mail.gmail.com>
References: <20190213214052.2427-1-linux.amoon@gmail.com> <20190213214052.2427-3-linux.amoon@gmail.com>
 <CAJKOXPcor0PC-H73nTyVnPYSk+1raL5Q0WSdH-MLvzVz2+u+pA@mail.gmail.com> <CANAwSgQfarF9VAJwPuGgaM3T5WFPqSdxDU8OP_OLMb_GWCB=XQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CANAwSgQfarF9VAJwPuGgaM3T5WFPqSdxDU8OP_OLMb_GWCB=XQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anand Moon <linux.amoon@gmail.com>
Cc: devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Kukjin Kim <kgene@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>, Pankaj Dubey <pankaj.dubey@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, 14 Feb 2019 at 19:37, Anand Moon <linux.amoon@gmail.com> wrote:
>
> Hi Krzysztof,
>
> Thanks for your review comments.
>
> On Thu, 14 Feb 2019 at 18:29, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >
> > On Wed, 13 Feb 2019 at 22:41, Anand Moon <linux.amoon@gmail.com> wrote:
> > >
> > > This patch adds configration for PMU (Power Management Unit) state
> > > tuning for exynos4412 SoC in order to enter low-power mode during
> > > suspend power modes and help resume from suspend state.
> >
> > The U3 and Trats2 already enter STOP/S2R so please describe what
> > exactly you change.
> >
> > > Fixes: bfce552d0b1 ("drivers: soc: Add support for Exynos PMU driver")
> >
> > How it fixes it? What was broken in that commit?
>
> * I was not aware on their is common framework for suspend and resume
> other than setting this here.I only look in to some the other exynos
> pmu architecture
> and referring 3.10.x kernel to model my changes.*

Suspend in general should be working already so adding this code just
because is not a valid reason. Please specify what is not working
first.

> >
> > > Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> > > Cc: Krzysztof Kozlowski <krzk@kernel.org>
> > > Cc: Chanwoo Choi <cw00.choi@samsung.com>
> > > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > > ---
> > >
> > > Changes from previous patch.
> > > New patch to this series to support suspend and resume state
> > >
> > > Changes have been tested on microSD card but fails to resume on cMMC.
> > > It need to be investigated and more debuging
> > > ---
> > >  drivers/soc/samsung/exynos4-pmu.c           | 83 +++++++++++++++++++++
> > >  include/linux/soc/samsung/exynos-regs-pmu.h | 21 ++++++
> > >  2 files changed, 104 insertions(+)
> > >
> > > diff --git a/drivers/soc/samsung/exynos4-pmu.c b/drivers/soc/samsung/exynos4-pmu.c
> > > index a7cdbf1aac0c..d261a0d2371e 100644
> > > --- a/drivers/soc/samsung/exynos4-pmu.c
> > > +++ b/drivers/soc/samsung/exynos4-pmu.c
> > > @@ -200,10 +200,93 @@ static const struct exynos_pmu_conf exynos4412_pmu_config[] = {
> > >         { PMU_TABLE_END,},
> > >  };
> > >
> > > +static unsigned int const exynos4412_list_feed[] = {
> > > +       EXYNOS4_ARM_CORE0_OPTION,
> > > +       EXYNOS4_ARM_CORE1_OPTION,
> > > +       EXYNOS4_ARM_CORE2_OPTION,
> > > +       EXYNOS4_ARM_CORE3_OPTION,
> > > +       EXYNOS4_ARM_COMMON_OPTION,
> > > +       EXYNOS4_CAM_OPTION,
> > > +       EXYNOS4_TV_OPTION,
> > > +       EXYNOS4_MFC_OPTION,
> > > +       EXYNOS4_G3D_OPTION,
> > > +       EXYNOS4_LCD0_OPTION,
> > > +       EXYNOS4_ISP_OPTION,
> > > +       EXYNOS4_MAUDIO_OPTION,
> > > +       EXYNOS4_GPS_OPTION,
> > > +       EXYNOS4_GPS_ALIVE_OPTION,
> > > +};
> > > +
> > > +static void exynos4412_pmu_central_seq(bool enable)
> >
> > You name the argument as "enable"  but during initialization and
> > system running you pass here false. It confuses me. What do you enable
> > here?
> >
>
> Yep your are correct need to drop this function as already done in
> common frame work.
>
> > > +{
> > > +       unsigned int value;
> > > +
> > > +       value = pmu_raw_readl(S5P_CENTRAL_SEQ_CONFIGURATION);
> > > +       if (enable)
> > > +               value &= ~S5P_CENTRAL_LOWPWR_CFG;
> > > +       else
> > > +               value |= S5P_CENTRAL_LOWPWR_CFG;
> > > +       pmu_raw_writel(value, S5P_CENTRAL_SEQ_CONFIGURATION);
> >
> > You duplicate exynos_pm_central_suspend() without removing the original code.
> >
> > > +
> > > +       value = pmu_raw_readl(S5P_CENTRAL_SEQ_CONFIGURATION_COREBLK);
> > > +       if (enable)
> > > +               value &= ~S5P_CENTRAL_LOWPWR_CFG;
> > > +       else
> > > +               value |= S5P_CENTRAL_LOWPWR_CFG;
> >
> > As manual says - set this register only if you disable C2C. Our entire
> > low power configuration for STOP mode is for C2C enabled case so you
> > add inconsistent configuration.
>
> Ok Sorry I overlook this code change.
>
> Enable system power down. Set only CENTRAL_SEQ_CONFIGURATION register
> if you disable C2C.
> Set both CENTRAL_SEQ_CONFIGURATION and
> CENTRAL_SEQ_CONFIGURATION_COREBLK registers if you enable C2C.
>
> > > +       pmu_raw_writel(value, S5P_CENTRAL_SEQ_CONFIGURATION_COREBLK);
> > > +}
> > > +
> > > +static void exynos4412_pmu_init(void)
> > > +{
> > > +       unsigned int value;
> > > +       int i;
> > > +
> > > +       /* Enable USE_STANDBY_WFI for all CORE */
> > > +       pmu_raw_writel(S5P_USE_STANDBY_WFI_ALL, S5P_CENTRAL_SEQ_OPTION);
> >
> > This does not look related to improving suspend... it looks unrelated.
> >
>
> Ok  yes your are correct all ready done in comment frame work.
>
> "Execute WFI/WFE for all CPU cores. As soon as all the CPU cores in
> Exynos 4412 SCP enter STANDBY mode"
> > > +
> > > +       /* Decides whether to use retention capability */
> > > +       value  = pmu_raw_readl(S5P_ARM_L2_0_OPTION);
> > > +       value &= ~EXYNOS_L2_USE_RETENTION;
> > > +       pmu_raw_writel(value, S5P_ARM_L2_0_OPTION);
> > > +
> > > +       value = pmu_raw_readl(S5P_ARM_L2_1_OPTION);
> > > +       value &= ~EXYNOS_L2_USE_RETENTION;
> > > +       pmu_raw_writel(value, S5P_ARM_L2_1_OPTION);
> > > +
> > > +       /* Set PSHOLD port for output high */
> > > +       value = pmu_raw_readl(S5P_PS_HOLD_CONTROL);
> > > +       value |= S5P_PS_HOLD_OUTPUT_HIGH;
> > > +       pmu_raw_writel(value, S5P_PS_HOLD_CONTROL);
> > > +
> > > +       /* Enable signal for PSHOLD port */
> > > +       value = pmu_raw_readl(S5P_PS_HOLD_CONTROL);
> > > +       value |= S5P_PS_HOLD_EN;
> > > +       pmu_raw_writel(value, S5P_PS_HOLD_CONTROL);
> > > +
> >
> > The same - not related.
>
> PS_HOLD_CONTROL need to be set under following set
> Hardware reset                             Reset
> Watchdog timer reset                   Keep its value
> Software reset                              Keep its value
> Warm reset                                   Keep its value
> Wakeup reset                               Keep its value

Which is not related to suspend...

>
> >
> > > +       /* Enable only SC_FEEDBACK */
> > > +       for (i = 0; i < ARRAY_SIZE(exynos4412_list_feed); i++) {
> > > +               value =  pmu_raw_readl(exynos4412_list_feed[i]);
> > > +               value &= ~(EXYNOS_USE_SC_COUNTER);
> > > +               value |= EXYNOS_USE_SC_FEEDBACK;
> > > +               pmu_raw_writel(value, exynos4412_list_feed[i]);
> >
> > Why do you prefer to use feedback instead of counter?
> >
>
> Their is a note below if we use this setting.
> NOTE: Either one of USE_SC_FEEDBACK and USE_SC_COUNTER should be activated.

This is not the answer to my question at all.

Best regards,
Krzysztof
