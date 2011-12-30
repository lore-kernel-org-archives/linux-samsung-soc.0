From: Dron Gus <dron0gus@gmail.com>
Subject: Re: [RFC] cpufreq: Add S3C2416/S3C2450 cpufreq driver
Date: Fri, 30 Dec 2011 10:48:30 +0300
Message-ID: <CAA11ShBk=HFt6qaZex+VK=DfZtTvrf9bhyLKW0Gk2g_E5D44PA@mail.gmail.com>
References: <201112292058.07448.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <201112292058.07448.heiko@sntech.de>
Sender: cpufreq-owner@vger.kernel.org
To: =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>
Cc: davej@redhat.com, Kukjin Kim <kgene.kim@samsung.com>, cpufreq@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi.

On Thu, Dec 29, 2011 at 11:58 PM, Heiko St=FCbner <heiko@sntech.de> wro=
te:
=2E..
> +static int __init s3c2416_cpufreq_driver_init(struct cpufreq_policy =
*policy)
=2E..
> + =A0 =A0 =A0 s3c_freq->armdiv =3D clk_get(NULL, "armdiv");
> + =A0 =A0 =A0 if (IS_ERR(s3c_freq->armdiv)) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pr_err("cpufreq: Unable to obtain ARMDI=
V: %ld\n",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0PTR_ERR(s3c_freq->armdiv=
));
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return PTR_ERR(s3c_freq->armdiv);
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 s3c_freq->hclk =3D clk_get(NULL, "hclk");
> + =A0 =A0 =A0 if (IS_ERR(s3c_freq->hclk)) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pr_warn("cpufreq: Unable to obtain HCLK=
: %ld\n",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0PTR_ERR(s3c_freq->hclk))=
;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_freq->hclk =3D NULL; /*we can live =
without hclk */
> + =A0 =A0 =A0 }
clk_put allready obtained "armdiv"?

> +
> + =A0 =A0 =A0 s3c_freq->armclk =3D clk_get(NULL, "armclk");
> + =A0 =A0 =A0 if (IS_ERR(s3c_freq->armclk)) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pr_err("cpufreq: Unable to obtain ARMCL=
K: %ld\n",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0PTR_ERR(s3c_freq->armclk=
));
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return PTR_ERR(s3c_freq->armclk);
> + =A0 =A0 =A0 }
Same for "hclk" and "armclk"?
