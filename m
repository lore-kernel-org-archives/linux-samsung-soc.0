From: MyungJoo Ham <myungjoo.ham@gmail.com>
Subject: Re: [PATCH 10/14] ARM: S5PV310: Adds uart clocks
Date: Thu, 19 Aug 2010 17:40:13 +0900
Message-ID: <AANLkTi=LexGc0WfjLUOdV9PFJciTckus81=j62zmDzEE@mail.gmail.com>
References: <1282140084-10265-1-git-send-email-kgene.kim@samsung.com>
	<1282140084-10265-11-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-gy0-f174.google.com ([209.85.160.174]:44510 "EHLO
	mail-gy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750927Ab0HSIkP convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 19 Aug 2010 04:40:15 -0400
Received: by mail-gy0-f174.google.com with SMTP id 8so585602gyd.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Aug 2010 01:40:15 -0700 (PDT)
In-Reply-To: <1282140084-10265-11-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Jongpill Lee <boyko.lee@samsung.com>, ben-linux@fluff.org

Hello,

Did you intentionally omit uart:0? Then, why uart:0 clock is not being
registered while other uart clocks are?

On Wed, Aug 18, 2010 at 11:01 PM, Kukjin Kim <kgene.kim@samsung.com> wr=
ote:
> From: Jongpill Lee <boyko.lee@samsung.com>
>
> This patch adds uart clocks for S5PV310/S5PC210.
>
> Signed-off-by: Jongpill Lee <boyko.lee@samsung.com>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
> =A0arch/arm/mach-s5pv310/clock.c | =A0 37 +++++++++++++++++++++++++++=
++++------
> =A01 files changed, 31 insertions(+), 6 deletions(-)
>
> diff --git a/arch/arm/mach-s5pv310/clock.c b/arch/arm/mach-s5pv310/cl=
ock.c
> index 8728504..843f4d0 100644
> --- a/arch/arm/mach-s5pv310/clock.c
> +++ b/arch/arm/mach-s5pv310/clock.c
> @@ -61,6 +61,11 @@ static int s5pv310_clk_ip_fsys_ctrl(struct clk *cl=
k, int enable)
> =A0 =A0 =A0 =A0return s5p_gatectrl(S5P_CLKGATE_IP_FSYS, clk, enable);
> =A0}
>
> +static int s5pv310_clk_ip_peril_ctrl(struct clk *clk, int enable)
> +{
> + =A0 =A0 =A0 return s5p_gatectrl(S5P_CLKGATE_IP_PERIL, clk, enable);
> +}
> +
> =A0/* Core list of CMU_CPU side */
>
> =A0static struct clksrc_clk clk_mout_apll =3D {
> @@ -257,11 +262,6 @@ static struct clksrc_clk clk_sclk_vpll =3D {
> =A0 =A0 =A0 =A0.reg_src =A0 =A0 =A0 =A0=3D { .reg =3D S5P_CLKSRC_TOP0=
, .shift =3D 8, .size =3D 1 },
> =A0};
>
> -static int s5pv310_clk_ip_peril_ctrl(struct clk *clk, int enable)
> -{
> - =A0 =A0 =A0 return s5p_gatectrl(S5P_CLKGATE_IP_PERIL, clk, enable);
> -}
> -
> =A0static struct clk init_clocks_disable[] =3D {
> =A0 =A0 =A0 =A0{
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.name =A0 =A0 =A0 =A0 =A0 =3D "timers"=
,
> @@ -303,7 +303,32 @@ static struct clk init_clocks_disable[] =3D {
> =A0};
>
> =A0static struct clk init_clocks[] =3D {
> - =A0 =A0 =A0 /* Nothing here yet */
> + =A0 =A0 =A0 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "uart",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .id =A0 =A0 =A0 =A0 =A0 =A0 =3D 1,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .enable =A0 =A0 =A0 =A0 =3D s5pv310_clk=
_ip_peril_ctrl,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ctrlbit =A0 =A0 =A0 =A0=3D (1 << 1),
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "uart",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .id =A0 =A0 =A0 =A0 =A0 =A0 =3D 2,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .enable =A0 =A0 =A0 =A0 =3D s5pv310_clk=
_ip_peril_ctrl,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ctrlbit =A0 =A0 =A0 =A0=3D (1 << 2),
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "uart",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .id =A0 =A0 =A0 =A0 =A0 =A0 =3D 3,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .enable =A0 =A0 =A0 =A0 =3D s5pv310_clk=
_ip_peril_ctrl,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ctrlbit =A0 =A0 =A0 =A0=3D (1 << 3),
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "uart",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .id =A0 =A0 =A0 =A0 =A0 =A0 =3D 4,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .enable =A0 =A0 =A0 =A0 =3D s5pv310_clk=
_ip_peril_ctrl,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ctrlbit =A0 =A0 =A0 =A0=3D (1 << 4),
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "uart",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .id =A0 =A0 =A0 =A0 =A0 =A0 =3D 5,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .enable =A0 =A0 =A0 =A0 =3D s5pv310_clk=
_ip_peril_ctrl,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ctrlbit =A0 =A0 =A0 =A0=3D (1 << 5),
> + =A0 =A0 =A0 }
> =A0};
>
> =A0static struct clk *clkset_group_list[] =3D {
> --
> 1.6.2.5
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>



--=20
MyungJoo Ham, Ph.D.
Mobile Software Platform Lab,
Digital Media and Communications (DMC) Business
Samsung Electronics
cell: 82-10-6714-2858
