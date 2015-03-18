From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH v2] ARM: EXYNOS: Fix failed second suspend on Exynos4
Date: Wed, 18 Mar 2015 11:47:51 +0100
Message-ID: <17192323.C79bdPNvX5@amdc1032>
References: <1426069206-13667-1-git-send-email-k.kozlowski@samsung.com>
 <1426669047.29565.9.camel@AMDC1943> <1426672064.30793.3.camel@AMDC1943>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:35350 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755854AbbCRKr7 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 18 Mar 2015 06:47:59 -0400
In-reply-to: <1426672064.30793.3.camel@AMDC1943>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Kukjin Kim <kgene@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>, stable@vger.kernel.org


Hi,

On Wednesday, March 18, 2015 10:47:44 AM Krzysztof Kozlowski wrote:
> On =C5=9Bro, 2015-03-18 at 09:57 +0100, Krzysztof Kozlowski wrote:
> > On =C5=9Bro, 2015-03-18 at 03:05 +0900, Kukjin Kim wrote:
> > > On 03/11/15 19:29, Krzysztof Kozlowski wrote:
> > > > On =C5=9Bro, 2015-03-11 at 11:20 +0100, Krzysztof Kozlowski wro=
te:
> > > >> On Exynos4412 boards (Trats2, Odroid U3) after enabling L2 cac=
he in
> > > >> 56b60b8bce4a ("ARM: 8265/1: dts: exynos4: Add nodes for L2 cac=
he
> > > >> controller") the second suspend to RAM failed. First suspend w=
orked fine
> > > >> but the next one hang just after powering down of secondary CP=
Us (system
> > > >> consumed energy as it would be running but was not responsive)=
=2E
> > > >>
> > > >> The issue was caused by enabling delayed reset assertion for C=
PU0 just
> > > >> after issuing power down of cores. This was introduced for Exy=
nos4 in
> > > >> 13cfa6c4f7fa ("ARM: EXYNOS: Fix CPU idle clock down after CPU =
off").
> > > >>
> > > >> The whole behavior is not well documented but after checking w=
ith vendor
> > > >> code this should be done like this (on Exynos4):
> > > >> 1. Enable delayed reset assertion when system is running (for =
all CPUs).
> > > >> 2. Disable delayed reset assertion before suspending the syste=
m.
> > > >>    This can be done after powering off secondary CPUs.
> > > >> 3. Re-enable the delayed reset assertion when system is resume=
d.
> > > >>
> > > >> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> > > >> Fixes: 13cfa6c4f7fa ("ARM: EXYNOS: Fix CPU idle clock down aft=
er CPU off")
> > > >> Cc: <stable@vger.kernel.org>
> > > >> Tested-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com=
>
> > > >> Tested-by: Chanwoo Choi <cw00.choi@samsung.com>
>=20
> (...)
>=20
> >=20
> > >=20
> > > And please make sure your updates don't hurt other exynos5 stuff.=
 Any
> > > tests on exynos5 platforms would be helpful.
> > >=20
> > > And I don't think the fix should be sent to 'stable' because I ca=
n't see
> > > the 'add node for L2$ controller' in v3.19...looks applied from v=
4.0-rc...
> >=20
> > You're right. git-describe gave me 3.19-rc1 but this was tag for th=
e
> > specific commit, not for merge-commit. The stable can be removed if=
 this
> > comes during this RC-cycle.
>=20
> Actually the "fixes" tag is for commit introducing wrong usage of
> "use_delayed_reset_assertion" which was merged for 3.19. Although
> mentioned bug (failed second to RAM) is observable only after enablin=
g
> L2 cache, the fix is for original commit.

IMHO "fixes" tag should be for "L2 cache" commit not for "use delayed r=
eset
assertion" one.  Without L2 cache being enabled the delayed reset asser=
tion
code worked fine (even though in theory it was wrong).

> I have also other proposal: what about reverting the commit 13cfa6c4f=
7fa
> ("ARM: EXYNOS: Fix CPU idle clock down after CPU off")? It will
> introduce minor issue (CPU idle clock down will stop to work after CP=
U
> hot unplug) but the main problem with suspend to RAM will be fixed.

Please don't do that.  We should not replace one regression with the
other one.  If you want to revert something it would be better to rever=
t
the patch adding L2 cache nodes for Exynos4 SoCs for now.  However we
should not be reverting anything IMO.

The regression fix patch is simple and is working.  I would really pref=
er
to have it applied now (to fix suspend and cpuidle v4.0-rc1 regressions
finally and not keep code broken for months as we do now).  We can alwa=
ys
revisit it to something more 'perfect' later when we have more data.

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics
