From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [RFC] cpufreq: Add S3C2416/S3C2450 cpufreq driver
Date: Fri, 30 Dec 2011 13:07:42 +0100
Message-ID: <201112301307.43109.heiko@sntech.de>
References: <201112292058.07448.heiko@sntech.de> <CAA11ShBk=HFt6qaZex+VK=DfZtTvrf9bhyLKW0Gk2g_E5D44PA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from s15407518.onlinehome-server.info ([82.165.136.167]:48260 "EHLO
	s15407518.onlinehome-server.info" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753063Ab1L3MHu convert rfc822-to-8bit
	(ORCPT <rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 30 Dec 2011 07:07:50 -0500
In-Reply-To: <CAA11ShBk=HFt6qaZex+VK=DfZtTvrf9bhyLKW0Gk2g_E5D44PA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Dron Gus <dron0gus@gmail.com>
Cc: davej@redhat.com, Kukjin Kim <kgene.kim@samsung.com>, cpufreq@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Am Freitag 30 Dezember 2011, 08:48:30 schrieb Dron Gus:
> Hi.
>=20
> On Thu, Dec 29, 2011 at 11:58 PM, Heiko St=FCbner <heiko@sntech.de> w=
rote:
> ...
>=20
> > +static int __init s3c2416_cpufreq_driver_init(struct cpufreq_polic=
y
> > *policy)
>=20
> ...
>=20
> > +       s3c_freq->armdiv =3D clk_get(NULL, "armdiv");
> > +       if (IS_ERR(s3c_freq->armdiv)) {
> > +               pr_err("cpufreq: Unable to obtain ARMDIV: %ld\n",
> > +                      PTR_ERR(s3c_freq->armdiv));
> > +               return PTR_ERR(s3c_freq->armdiv);
> > +       }
> > +
> > +       s3c_freq->hclk =3D clk_get(NULL, "hclk");
> > +       if (IS_ERR(s3c_freq->hclk)) {
> > +               pr_warn("cpufreq: Unable to obtain HCLK: %ld\n",
> > +                      PTR_ERR(s3c_freq->hclk));
> > +               s3c_freq->hclk =3D NULL; /*we can live without hclk=
 */
> > +       }
>=20
> clk_put allready obtained "armdiv"?
>=20
> > +
> > +       s3c_freq->armclk =3D clk_get(NULL, "armclk");
> > +       if (IS_ERR(s3c_freq->armclk)) {
> > +               pr_err("cpufreq: Unable to obtain ARMCLK: %ld\n",
> > +                      PTR_ERR(s3c_freq->armclk));
> > +               return PTR_ERR(s3c_freq->armclk);
> > +       }
>=20
> Same for "hclk" and "armclk"?
thanks for finding those, it seems probe also needs a lot more love.

As you were also working on S3C2416 stuff, could you possibly test the =
driver=20
and see if it still hangs for you?

After I introduced the switch from hclk to armdiv using a forced armdiv=
=3Dhclk=20
frequency the hangs stopped for me and the devices ran hours with varyi=
ng=20
workloads without hangs. (also including voltage scaling)

Heiko
