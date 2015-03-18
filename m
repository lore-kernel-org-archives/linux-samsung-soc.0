From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v2] ARM: EXYNOS: Fix failed second suspend on Exynos4
Date: Wed, 18 Mar 2015 10:47:44 +0100
Message-ID: <1426672064.30793.3.camel@AMDC1943>
References: <1426069206-13667-1-git-send-email-k.kozlowski@samsung.com>
 <1426069765.30407.7.camel@AMDC1943> <55086CE0.6080905@kernel.org>
 <1426669047.29565.9.camel@AMDC1943>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <stable-owner@vger.kernel.org>
In-reply-to: <1426669047.29565.9.camel@AMDC1943>
Sender: stable-owner@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>, stable@vger.kernel.org, BartlomiejZolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On =C5=9Bro, 2015-03-18 at 09:57 +0100, Krzysztof Kozlowski wrote:
> On =C5=9Bro, 2015-03-18 at 03:05 +0900, Kukjin Kim wrote:
> > On 03/11/15 19:29, Krzysztof Kozlowski wrote:
> > > On =C5=9Bro, 2015-03-11 at 11:20 +0100, Krzysztof Kozlowski wrote=
:
> > >> On Exynos4412 boards (Trats2, Odroid U3) after enabling L2 cache=
 in
> > >> 56b60b8bce4a ("ARM: 8265/1: dts: exynos4: Add nodes for L2 cache
> > >> controller") the second suspend to RAM failed. First suspend wor=
ked fine
> > >> but the next one hang just after powering down of secondary CPUs=
 (system
> > >> consumed energy as it would be running but was not responsive).
> > >>
> > >> The issue was caused by enabling delayed reset assertion for CPU=
0 just
> > >> after issuing power down of cores. This was introduced for Exyno=
s4 in
> > >> 13cfa6c4f7fa ("ARM: EXYNOS: Fix CPU idle clock down after CPU of=
f").
> > >>
> > >> The whole behavior is not well documented but after checking wit=
h vendor
> > >> code this should be done like this (on Exynos4):
> > >> 1. Enable delayed reset assertion when system is running (for al=
l CPUs).
> > >> 2. Disable delayed reset assertion before suspending the system.
> > >>    This can be done after powering off secondary CPUs.
> > >> 3. Re-enable the delayed reset assertion when system is resumed.
> > >>
> > >> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> > >> Fixes: 13cfa6c4f7fa ("ARM: EXYNOS: Fix CPU idle clock down after=
 CPU off")
> > >> Cc: <stable@vger.kernel.org>
> > >> Tested-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> > >> Tested-by: Chanwoo Choi <cw00.choi@samsung.com>

(...)

>=20
> >=20
> > And please make sure your updates don't hurt other exynos5 stuff. A=
ny
> > tests on exynos5 platforms would be helpful.
> >=20
> > And I don't think the fix should be sent to 'stable' because I can'=
t see
> > the 'add node for L2$ controller' in v3.19...looks applied from v4.=
0-rc...
>=20
> You're right. git-describe gave me 3.19-rc1 but this was tag for the
> specific commit, not for merge-commit. The stable can be removed if t=
his
> comes during this RC-cycle.

Actually the "fixes" tag is for commit introducing wrong usage of
"use_delayed_reset_assertion" which was merged for 3.19. Although
mentioned bug (failed second to RAM) is observable only after enabling
L2 cache, the fix is for original commit.

I have also other proposal: what about reverting the commit 13cfa6c4f7f=
a
("ARM: EXYNOS: Fix CPU idle clock down after CPU off")? It will
introduce minor issue (CPU idle clock down will stop to work after CPU
hot unplug) but the main problem with suspend to RAM will be fixed.

Best regards,
Krzysztof
