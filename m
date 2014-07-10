From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 2/3] regulator: s2mpa01: Optimize the regulator
 description macro
Date: Thu, 10 Jul 2014 08:35:10 +0100
Message-ID: <20140710073510.GO2635@lee--X1>
References: <1404822480-31525-1-git-send-email-amit.daniel@samsung.com>
 <1404822480-31525-2-git-send-email-amit.daniel@samsung.com>
 <CADGdYn74xRxznqHxHOjRHe9bGv1-KPjRF0UAS=OyxWCg-iXBbw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CADGdYn74xRxznqHxHOjRHe9bGv1-KPjRF0UAS=OyxWCg-iXBbw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: amit daniel kachhap <amit.daniel@samsung.com>
Cc: Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Samuel Ortiz <sameo@linux.intel.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, 10 Jul 2014, amit daniel kachhap wrote:
> Adding MFD maintainers.

Why, what for?

> On Tue, Jul 8, 2014 at 5:57 PM, Amit Daniel Kachhap
> <amit.daniel@samsung.com> wrote:
> > This patch makes the regulator description macro take minimum and
> > steps voltage as parameter. In this way many repeated macros can be
> > removed. Now these macros are repeated only if the the LDO/BUCK ctr=
l
> > registers have non-linear positions. The good thing is these ctrl r=
egisters
> > are mostly linear so they are not passed as parameters.
> >
> > This patch reduces the code size and also allow easy addition of mo=
re
> > s2mpxxx PMIC drivers which differs a lot in minimum/step voltages.
> >
> > Signed-off-by: Amit Daniel Kachhap <amit.daniel@samsung.com>
> > ---
> >  drivers/regulator/s2mpa01.c | 136 ++++++++++++--------------------=
------------
> >  1 file changed, 37 insertions(+), 99 deletions(-)
> >
> > diff --git a/drivers/regulator/s2mpa01.c b/drivers/regulator/s2mpa0=
1.c
> > index 962c5f1..8073466 100644
> > --- a/drivers/regulator/s2mpa01.c
> > +++ b/drivers/regulator/s2mpa01.c
> > @@ -235,28 +235,14 @@ static struct regulator_ops s2mpa01_buck_ops =
=3D {
> >         .set_ramp_delay         =3D s2mpa01_set_ramp_delay,
> >  };
> >
> > -#define regulator_desc_ldo1(num)       {               \
> > +#define regulator_desc_ldo(num, min, step)     {       \
> >         .name           =3D "LDO"#num,                    \
> >         .id             =3D S2MPA01_LDO##num,             \
> >         .ops            =3D &s2mpa01_ldo_ops,             \
> >         .type           =3D REGULATOR_VOLTAGE,            \
> >         .owner          =3D THIS_MODULE,                  \
> > -       .min_uV         =3D MIN_800_MV,                   \
> > -       .uV_step        =3D STEP_50_MV,                   \
> > -       .n_voltages     =3D S2MPA01_LDO_N_VOLTAGES,       \
> > -       .vsel_reg       =3D S2MPA01_REG_L1CTRL + num - 1, \
> > -       .vsel_mask      =3D S2MPA01_LDO_VSEL_MASK,        \
> > -       .enable_reg     =3D S2MPA01_REG_L1CTRL + num - 1, \
> > -       .enable_mask    =3D S2MPA01_ENABLE_MASK           \
> > -}
> > -#define regulator_desc_ldo2(num)       {               \
> > -       .name           =3D "LDO"#num,                    \
> > -       .id             =3D S2MPA01_LDO##num,             \
> > -       .ops            =3D &s2mpa01_ldo_ops,             \
> > -       .type           =3D REGULATOR_VOLTAGE,            \
> > -       .owner          =3D THIS_MODULE,                  \
> > -       .min_uV         =3D MIN_800_MV,                   \
> > -       .uV_step        =3D STEP_25_MV,                   \
> > +       .min_uV         =3D min,                          \
> > +       .uV_step        =3D step,                         \
> >         .n_voltages     =3D S2MPA01_LDO_N_VOLTAGES,       \
> >         .vsel_reg       =3D S2MPA01_REG_L1CTRL + num - 1, \
> >         .vsel_mask      =3D S2MPA01_LDO_VSEL_MASK,        \
> > @@ -296,14 +282,14 @@ static struct regulator_ops s2mpa01_buck_ops =
=3D {
> >         .enable_mask    =3D S2MPA01_ENABLE_MASK                   \
> >  }
> >
> > -#define regulator_desc_buck6_7(num)    {                       \
> > +#define regulator_desc_buck6_10(num, min, step)        {          =
     \
> >         .name           =3D "BUCK"#num,                           \
> >         .id             =3D S2MPA01_BUCK##num,                    \
> >         .ops            =3D &s2mpa01_buck_ops,                    \
> >         .type           =3D REGULATOR_VOLTAGE,                    \
> >         .owner          =3D THIS_MODULE,                          \
> > -       .min_uV         =3D MIN_600_MV,                           \
> > -       .uV_step        =3D STEP_6_25_MV,                         \
> > +       .min_uV         =3D min,                                  \
> > +       .uV_step        =3D step,                                 \
> >         .n_voltages     =3D S2MPA01_BUCK_N_VOLTAGES,              \
> >         .ramp_delay     =3D S2MPA01_RAMP_DELAY,                   \
> >         .vsel_reg       =3D S2MPA01_REG_B6CTRL2 + (num - 6) * 2,  \
> > @@ -312,91 +298,43 @@ static struct regulator_ops s2mpa01_buck_ops =
=3D {
> >         .enable_mask    =3D S2MPA01_ENABLE_MASK                   \
> >  }
> >
> > -#define regulator_desc_buck8   {                               \
> > -       .name           =3D "BUCK8",                              \
> > -       .id             =3D S2MPA01_BUCK8,                        \
> > -       .ops            =3D &s2mpa01_buck_ops,                    \
> > -       .type           =3D REGULATOR_VOLTAGE,                    \
> > -       .owner          =3D THIS_MODULE,                          \
> > -       .min_uV         =3D MIN_800_MV,                           \
> > -       .uV_step        =3D STEP_12_5_MV,                         \
> > -       .n_voltages     =3D S2MPA01_BUCK_N_VOLTAGES,              \
> > -       .ramp_delay     =3D S2MPA01_RAMP_DELAY,                   \
> > -       .vsel_reg       =3D S2MPA01_REG_B8CTRL2,                  \
> > -       .vsel_mask      =3D S2MPA01_BUCK_VSEL_MASK,               \
> > -       .enable_reg     =3D S2MPA01_REG_B8CTRL1,                  \
> > -       .enable_mask    =3D S2MPA01_ENABLE_MASK                   \
> > -}
> > -
> > -#define regulator_desc_buck9   {                               \
> > -       .name           =3D "BUCK9",                              \
> > -       .id             =3D S2MPA01_BUCK9,                        \
> > -       .ops            =3D &s2mpa01_buck_ops,                    \
> > -       .type           =3D REGULATOR_VOLTAGE,                    \
> > -       .owner          =3D THIS_MODULE,                          \
> > -       .min_uV         =3D MIN_1500_MV,                          \
> > -       .uV_step        =3D STEP_12_5_MV,                         \
> > -       .n_voltages     =3D S2MPA01_BUCK_N_VOLTAGES,              \
> > -       .ramp_delay     =3D S2MPA01_RAMP_DELAY,                   \
> > -       .vsel_reg       =3D S2MPA01_REG_B9CTRL2,                  \
> > -       .vsel_mask      =3D S2MPA01_BUCK_VSEL_MASK,               \
> > -       .enable_reg     =3D S2MPA01_REG_B9CTRL1,                  \
> > -       .enable_mask    =3D S2MPA01_ENABLE_MASK                   \
> > -}
> > -
> > -#define regulator_desc_buck10  {                               \
> > -       .name           =3D "BUCK10",                             \
> > -       .id             =3D S2MPA01_BUCK10,                       \
> > -       .ops            =3D &s2mpa01_buck_ops,                    \
> > -       .type           =3D REGULATOR_VOLTAGE,                    \
> > -       .owner          =3D THIS_MODULE,                          \
> > -       .min_uV         =3D MIN_1000_MV,                          \
> > -       .uV_step        =3D STEP_12_5_MV,                         \
> > -       .n_voltages     =3D S2MPA01_BUCK_N_VOLTAGES,              \
> > -       .ramp_delay     =3D S2MPA01_RAMP_DELAY,                   \
> > -       .vsel_reg       =3D S2MPA01_REG_B10CTRL2,                 \
> > -       .vsel_mask      =3D S2MPA01_BUCK_VSEL_MASK,               \
> > -       .enable_reg     =3D S2MPA01_REG_B10CTRL1,                 \
> > -       .enable_mask    =3D S2MPA01_ENABLE_MASK                   \
> > -}
> > -
> >  static struct regulator_desc regulators[] =3D {
> > -       regulator_desc_ldo2(1),
> > -       regulator_desc_ldo1(2),
> > -       regulator_desc_ldo1(3),
> > -       regulator_desc_ldo1(4),
> > -       regulator_desc_ldo1(5),
> > -       regulator_desc_ldo2(6),
> > -       regulator_desc_ldo1(7),
> > -       regulator_desc_ldo1(8),
> > -       regulator_desc_ldo1(9),
> > -       regulator_desc_ldo1(10),
> > -       regulator_desc_ldo2(11),
> > -       regulator_desc_ldo1(12),
> > -       regulator_desc_ldo1(13),
> > -       regulator_desc_ldo1(14),
> > -       regulator_desc_ldo1(15),
> > -       regulator_desc_ldo1(16),
> > -       regulator_desc_ldo1(17),
> > -       regulator_desc_ldo1(18),
> > -       regulator_desc_ldo1(19),
> > -       regulator_desc_ldo1(20),
> > -       regulator_desc_ldo1(21),
> > -       regulator_desc_ldo2(22),
> > -       regulator_desc_ldo2(23),
> > -       regulator_desc_ldo1(24),
> > -       regulator_desc_ldo1(25),
> > -       regulator_desc_ldo1(26),
> > +       regulator_desc_ldo(1, MIN_800_MV, STEP_25_MV),
> > +       regulator_desc_ldo(2, MIN_800_MV, STEP_50_MV),
> > +       regulator_desc_ldo(3, MIN_800_MV, STEP_50_MV),
> > +       regulator_desc_ldo(4, MIN_800_MV, STEP_50_MV),
> > +       regulator_desc_ldo(5, MIN_800_MV, STEP_50_MV),
> > +       regulator_desc_ldo(6, MIN_800_MV, STEP_25_MV),
> > +       regulator_desc_ldo(7, MIN_800_MV, STEP_50_MV),
> > +       regulator_desc_ldo(8, MIN_800_MV, STEP_50_MV),
> > +       regulator_desc_ldo(9, MIN_800_MV, STEP_50_MV),
> > +       regulator_desc_ldo(10, MIN_800_MV, STEP_50_MV),
> > +       regulator_desc_ldo(11, MIN_800_MV, STEP_25_MV),
> > +       regulator_desc_ldo(12, MIN_800_MV, STEP_50_MV),
> > +       regulator_desc_ldo(13, MIN_800_MV, STEP_50_MV),
> > +       regulator_desc_ldo(14, MIN_800_MV, STEP_50_MV),
> > +       regulator_desc_ldo(15, MIN_800_MV, STEP_50_MV),
> > +       regulator_desc_ldo(16, MIN_800_MV, STEP_50_MV),
> > +       regulator_desc_ldo(17, MIN_800_MV, STEP_50_MV),
> > +       regulator_desc_ldo(18, MIN_800_MV, STEP_50_MV),
> > +       regulator_desc_ldo(19, MIN_800_MV, STEP_50_MV),
> > +       regulator_desc_ldo(20, MIN_800_MV, STEP_50_MV),
> > +       regulator_desc_ldo(21, MIN_800_MV, STEP_50_MV),
> > +       regulator_desc_ldo(22, MIN_800_MV, STEP_25_MV),
> > +       regulator_desc_ldo(23, MIN_800_MV, STEP_25_MV),
> > +       regulator_desc_ldo(24, MIN_800_MV, STEP_50_MV),
> > +       regulator_desc_ldo(25, MIN_800_MV, STEP_50_MV),
> > +       regulator_desc_ldo(26, MIN_800_MV, STEP_50_MV),
> >         regulator_desc_buck1_4(1),
> >         regulator_desc_buck1_4(2),
> >         regulator_desc_buck1_4(3),
> >         regulator_desc_buck1_4(4),
> >         regulator_desc_buck5,
> > -       regulator_desc_buck6_7(6),
> > -       regulator_desc_buck6_7(7),
> > -       regulator_desc_buck8,
> > -       regulator_desc_buck9,
> > -       regulator_desc_buck10,
> > +       regulator_desc_buck6_10(6, MIN_600_MV, STEP_6_25_MV),
> > +       regulator_desc_buck6_10(7, MIN_600_MV, STEP_6_25_MV),
> > +       regulator_desc_buck6_10(8, MIN_800_MV, STEP_12_5_MV),
> > +       regulator_desc_buck6_10(9, MIN_1500_MV, STEP_12_5_MV),
> > +       regulator_desc_buck6_10(10, MIN_1000_MV, STEP_12_5_MV),
> >  };
> >
> >  static int s2mpa01_pmic_probe(struct platform_device *pdev)
> >

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
