From: MyungJoo Ham <myungjoo.ham@gmail.com>
Subject: Re: [PATCH 5/5] EXYNOS4210: Add support ASV feature
Date: Thu, 3 Nov 2011 14:11:14 +0900
Message-ID: <CAJ0PZbQEHXpRdCkcAwNwtK7AmH=nxG+KjOcw91gwagAvFr_pxA@mail.gmail.com>
References: <005801cc995c$fee5dd60$fcb19820$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <005801cc995c$fee5dd60$fcb19820$%kim@samsung.com>
Sender: cpufreq-owner@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, cpufreq@vger.kernel.org, davej@redhat.com, Jaecheol Lee <jc.lee@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hello,

On Wed, Nov 2, 2011 at 9:43 PM, Kukjin Kim <kgene.kim@samsung.com> wrot=
e:
[]
> +static void __init set_volt_table(void)
> +{
> + =A0 =A0 =A0 unsigned int tmp, i, asv_group =3D 0;
> +
> + =A0 =A0 =A0 tmp =3D __raw_readl(S5P_INFORM2);

As I've mentioned in the ASV patch thread, do we really need to use an
INFORM register simply to save the id of supported voltage ranges?

Why aren't we using an extern variable here? For example, "extern int
asv_group_id;" and define it at "asv.h" or somewhere else.

At reboot, we are going to init ASV driver and will get the ASV value
again; thus, we don't need to use such a preserving register anyway.
At suspend/resume, the value in RAM does not disappear and the IPL
does not care this value; thus, it is meaningless to use INFORM2 for
this value.


> +
> + =A0 =A0 =A0 switch (tmp =A0& (SUPPORT_FREQ_MASK << SUPPORT_FREQ_SHI=
=46T)) {
> + =A0 =A0 =A0 case SUPPORT_1200MHZ:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 asv_group =3D (tmp & 0xF);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> + =A0 =A0 =A0 case SUPPORT_1400MHZ:
> + =A0 =A0 =A0 case SUPPORT_1000MHZ:
> + =A0 =A0 =A0 default:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Not supported and assign typical ASV=
 group */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 asv_group =3D 2;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 printk(KERN_INFO "DVFS: VDD_ARM Voltage table set with =
%d Group\n",
> asv_group);
> +
> + =A0 =A0 =A0 for (i =3D 0 ; i < CPUFREQ_LEVEL_END ; i++)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 exynos4_volt_table[i] =3D asv_voltage[i=
][asv_group];
> +}
> +
> =A0static int __init exynos4_cpufreq_init(void)
> =A0{
> =A0 =A0 =A0 =A0int i;
> =A0 =A0 =A0 =A0unsigned int tmp;
>
> + =A0 =A0 =A0 set_volt_table();
> +
> =A0 =A0 =A0 =A0cpu_clk =3D clk_get(NULL, "armclk");
> =A0 =A0 =A0 =A0if (IS_ERR(cpu_clk))
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return PTR_ERR(cpu_clk);
> --
> 1.7.1
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>



--=20
MyungJoo Ham, Ph.D.
Mobile Software Platform Lab, DMC Business, Samsung Electronics
