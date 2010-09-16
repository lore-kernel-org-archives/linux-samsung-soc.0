From: MyungJoo Ham <myungjoo.ham@samsung.com>
Subject: Re: [PATCH 4/5] ARM: S5PV210: Add support CPUFREQ
Date: Thu, 16 Sep 2010 09:36:08 +0900
Message-ID: <AANLkTinq0m7fJCaSZ0Gbq-kEE-P8SojO1x7Lgof-6umB@mail.gmail.com>
References: <1284537162-3129-1-git-send-email-jc.lee@samsung.com>
	<1284537162-3129-5-git-send-email-jc.lee@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ew0-f46.google.com ([209.85.215.46]:57046 "EHLO
	mail-ew0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752948Ab0IPAgK convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 15 Sep 2010 20:36:10 -0400
Received: by ewy23 with SMTP id 23so416003ewy.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 15 Sep 2010 17:36:09 -0700 (PDT)
In-Reply-To: <1284537162-3129-5-git-send-email-jc.lee@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jaecheol Lee <jc.lee@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, ben-linux@fluff.org

Hello,

On Wed, Sep 15, 2010 at 4:52 PM, Jaecheol Lee <jc.lee@samsung.com> wrot=
e:
> This patch adds CPUFREQ driver for supporting DFS(Dynamic Frequency S=
caling).
>
> Signed-off-by: Jaecheol Lee <jc.lee@samsung.com>
> ---
> =A0arch/arm/mach-s5pv210/cpufreq.c | =A0415 +++++++++++++++++++++++++=
++++++++++++++
> =A01 files changed, 415 insertions(+), 0 deletions(-)
> =A0create mode 100644 arch/arm/mach-s5pv210/cpufreq.c
>
> diff --git a/arch/arm/mach-s5pv210/cpufreq.c b/arch/arm/mach-s5pv210/=
cpufreq.c
> new file mode 100644
> index 0000000..aa39c2e

(snip)

> +static int s5pv210_target(struct cpufreq_policy *policy,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 unsigned int target=
_freq,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 unsigned int relati=
on)
> +{
> + =A0 =A0 =A0 unsigned long reg;
> + =A0 =A0 =A0 unsigned int index, priv_index;
> + =A0 =A0 =A0 unsigned int pll_changing =3D 0;
> + =A0 =A0 =A0 unsigned int bus_speed_changing =3D 0;
> +
> + =A0 =A0 =A0 freqs.old =3D s5pv210_getspeed(0);
> +
> + =A0 =A0 =A0 if (cpufreq_frequency_table_target(policy, s5pv210_freq=
_table,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0target_freq, relation, &index))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
> +
> + =A0 =A0 =A0 freqs.new =3D s5pv210_freq_table[index].frequency;
> + =A0 =A0 =A0 freqs.cpu =3D 0;
> +
> + =A0 =A0 =A0 if (freqs.new =3D=3D freqs.old)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 0;
> +
> + =A0 =A0 =A0 /* Finding current running level index */
> + =A0 =A0 =A0 if (cpufreq_frequency_table_target(policy, s5pv210_freq=
_table,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0freqs.old, relation, &priv_index))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
> +
> + =A0 =A0 =A0 cpufreq_notify_transition(&freqs, CPUFREQ_PRECHANGE);
> +
> + =A0 =A0 =A0 if (freqs.new > freqs.old) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Voltage up: will be implemented */

This could be crucial to the system stability. It is usually not option=
al.

> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 /* Check if there need to change PLL */
> + =A0 =A0 =A0 if ((index =3D=3D L0) || (priv_index =3D=3D L0))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pll_changing =3D 1;
> +
> + =A0 =A0 =A0 /* Check if there need to change System bus clock */
> + =A0 =A0 =A0 if ((index =3D=3D L4) || (priv_index =3D=3D L4))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 bus_speed_changing =3D 1;
> +
> + =A0 =A0 =A0 if (bus_speed_changing) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /*
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* Reconfigure DRAM refresh counter v=
alue for minimum
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* temporary clock while changing div=
ider.
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* expected clock is 83Mhz : 7.8usec/=
(1/83Mhz) =3D 0x287
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*/
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (pll_changing)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 __raw_writel(0x287, S5P=
_VA_DMC1 + 0x30);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 else
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 __raw_writel(0x30c, S5P=
_VA_DMC1 + 0x30);
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 __raw_writel(0x287, S5P_VA_DMC0 + 0x30)=
;

It'd be better to set values based on the real MPLL, APLL clock
speeds, not hard-coding them.

> + =A0 =A0 =A0 }
> +

(snip)

> +
> + =A0 =A0 =A0 /*
> + =A0 =A0 =A0 =A0* L4 level need to change memory bus speed, hence on=
edram clock divier
> + =A0 =A0 =A0 =A0* and memory refresh parameter should be changed
> + =A0 =A0 =A0 =A0*/
> + =A0 =A0 =A0 if (bus_speed_changing) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D __raw_readl(S5P_CLK_DIV6);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg &=3D ~S5P_CLKDIV6_ONEDRAM_MASK;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg |=3D (clkdiv_val[index][8] << S5P_C=
LKDIV6_ONEDRAM_SHIFT);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 __raw_writel(reg, S5P_CLK_DIV6);
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 do {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D __raw_readl(S5P=
_CLKDIV_STAT1);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 } while (reg & (1 << 15));
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Reconfigure DRAM refresh counter val=
ue */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (index !=3D L4) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /*
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* DMC0 : 166Mhz
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* DMC1 : 200Mhz
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*/
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 __raw_writel(0x618, S5P=
_VA_DMC1 + 0x30);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 __raw_writel(0x50e, S5P=
_VA_DMC0 + 0x30);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 } else {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /*
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* DMC0 : 83Mhz
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* DMC1 : 100Mhz
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*/
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 __raw_writel(0x30c, S5P=
_VA_DMC1 + 0x30);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 __raw_writel(0x287, S5P=
_VA_DMC0 + 0x30);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }

Same here. It'd better not be hard coded. We can't sure about the
clock speeds for different boards.

> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 if (freqs.new < freqs.old) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Voltage down: will be implemented */
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 cpufreq_notify_transition(&freqs, CPUFREQ_POSTCHANGE);
> +
> + =A0 =A0 =A0 printk(KERN_INFO "Perf changed[L%d]\n", index);

This may incur too many clutters.

> +
> + =A0 =A0 =A0 return 0;
> +}
> +
(snip)

>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>

Overall, this patch appears to be subset of the previous "[PATCH v7
6/6] ARM: S5PV210: Initial CPUFREQ Support" and things omitted (and
should be added) are already implemented there.



--=20
MyungJoo Ham, Ph.D.
Mobile Software Platform Lab,
Digital Media and Communications (DMC) Business
Samsung Electronics
cell: 82-10-6714-2858
