From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: Peach Pi/Pit boot failures in linux-next  (was Re: [RFC PATCH 1/1]
 drm/exynos: Move platform drivers registration to module init)
Date: Mon, 24 Nov 2014 10:51:23 +0100
Message-ID: <1416822683.5023.4.camel@AMDC1943>
References: <1416318821-7925-1-git-send-email-javier.martinez@collabora.co.uk>
 <7hh9xwxsev.fsf@deeprootsystems.com> <546CCAB8.9050402@collabora.co.uk>
 <CAFp+6iFbxWoh4h0ZpY=JQO4rjLss2kpj-nZM7KGiJ_F4AZ2W=g@mail.gmail.com>
 <7hppchsu29.fsf@deeprootsystems.com> <546E293D.9000300@collabora.co.uk>
 <7hbno1spdt.fsf@deeprootsystems.com> <546F3837.5020706@collabora.co.uk>
 <7hzjbko6eb.fsf@deeprootsystems.com> <546FA53D.2060807@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:18573 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751978AbaKXJv1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 24 Nov 2014 04:51:27 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NFJ006JMFIH0L10@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 24 Nov 2014 09:54:17 +0000 (GMT)
In-reply-to: <546FA53D.2060807@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Kevin Hilman <khilman@kernel.org>, Kukjin Kim <kgene@kernel.org>, Vivek Gautam <gautamvivek1987@gmail.com>, Inki Dae <inki.dae@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Paolo Pisati <p.pisati@gmail.com>, Vivek Gautam <gautam.vivek@samsung.com>

On pi=C4=85, 2014-11-21 at 21:49 +0100, Javier Martinez Canillas wrote:
> Hello Kevin,
>=20
> On 11/21/2014 05:38 PM, Kevin Hilman wrote:
> >> So, I see two different boot failures on the Peach Pi[t] Chromeboo=
ks:
> >>
> >> 1) next20141121 boot fails due snd-soc-snow
> >>
> >> Disabling CONFIG_SND_SOC_SNOW makes the boot to got a little furth=
er
> >> but still fails with the second issue:
> >>
> >> 2) next20141121 boot hangs if unused clocks are disabled.
> >>
> >> I tried to root cause these two issues but didn't see anything evi=
dent
> >> so I'll find a last known good commit and bisect. If anyone has an
> >> idea of the possible causes for these issues that would be appreci=
ated.
> >=20
> > FWIW, in addition to the failures on 5800/peach-pi, I'm also seeing=
 boot
> > failures in next-20141121 on the exynos5420-arndale-octa[1].  Addin=
g
> > clk_ignore_unused gets things booting there as well.
> >=20
> > What's interesting is that my exynos5422-odroid-xu3 is booting fine=
 as
> > well as the exynos5420-arndale and the exynos5410-odroid-xu (shown =
as
> > exynos5410-smdk5410)
> >=20
> > Whatever the issue, it definietly seems like a problem that was cam=
e
> > through a driver/subsystem tree because that these boards are all
> > booting fine with Kukjin's for-next, arm-soc/for-next and
> > mainline/v3.18-rc5 (all with just plain exynos_defconfig, and witho=
ut
> > clk_ignore_unused.)  For example, just looking at peach-pi across a=
ll
> > these trees[2], you can see that it's only failing in linux-next.
> >
>=20
> By bisecting I found that the commit introducing both regressions is:
>=20
> ae43b32 ("ARM: 8202/1: dmaengine: pl330: Add runtime Power Management=
 support v12")
>=20
> By reverting ae43b32, next-20141121 boots with both CONFIG_SND_SOC_SN=
OW=3Dy
> and *without* clk_ignore_unused.
>=20
> Krzysztof,
>=20
> I see you are the author of the patch, maybe you can take a look why =
this
> is causing regressions in some Exynos boards?
>=20

OK, I got some ideas (no need to run tests mentioned in my previous
email). Apparently the mout_audss clock (or one of its parents up to
EPLL clock) must be enabled. Configuration like this works:
$ cat /sys/kernel/debug/clk/clk_summary
    fout_epll                             1            1   100000000   =
       0 0
       mout_sclk_epll                     1            1   100000000   =
       0 0
          mout_mau_epll_clk               1            1   100000000   =
       0 0
             mau_epll                     1            1   100000000   =
       0 0
                mout_audss                1            2   100000000   =
       0 0
                   dout_srp               0            1   100000000   =
       0 0
                      adma                0            1   100000000   =
       0 0
                      srp_clk             0            0   100000000   =
       0 0
                      dout_aud_bus           0            0   100000000=
          0 0
                         i2s_bus           0            0   100000000  =
        0 0
                   mout_i2s               0            0   100000000   =
       0 0
                      dout_i2s            0            0   100000000   =
       0 0
                         sclk_i2s           0            0   100000000 =
         0 0


Reverting my patch enables the adma clock which effectively enables mou=
t_audss.

Now I have to find the answer which driver uses epll/audss without enab=
ling it explicitly...

Best regards,
Krzysztof
