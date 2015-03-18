From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH v2] ARM: EXYNOS: Fix failed second suspend on Exynos4
Date: Wed, 18 Mar 2015 11:29:39 +0100
Message-ID: <1949810.qILnBKuAJP@amdc1032>
References: <1426069206-13667-1-git-send-email-k.kozlowski@samsung.com>
 <55086CE0.6080905@kernel.org> <1426669047.29565.9.camel@AMDC1943>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <stable-owner@vger.kernel.org>
In-reply-to: <1426669047.29565.9.camel@AMDC1943>
Sender: stable-owner@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>, stable@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org


Hi,

On Wednesday, March 18, 2015 09:57:27 AM Krzysztof Kozlowski wrote:
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
> > >=20
> > > Dear Kukjin,
> > >=20
> > > This patch was first sent on 3rd of February. It could enter befo=
re
> > > opening 4.0 merge window. I did not receive any response from you=
 in
> > > that time.
> > >=20
> > > So let me point next steps:
> > > 1. The Exynos4412 suspend on 4.0 is broken and now this patch app=
lies as
> > > a fix.
> > > 2. I resent it on 18th of February.
> > > 3. I received tested-by from Bartlomiej and Chanwoo.
> > > 4. Bartlomiej pinged you on 3rd March.
> > >=20
> > > Still no response. If the patch does not look good then please sh=
are
> > > your comments. I'll fix it.
> > > If this patch looks good, why does it take so much time?
> > >=20
> >=20
> > Please use another way something like check ARM core rather than us=
e
> > 'soc_is_xxx()', as you know it is not acceptable now even it is jus=
t
> > moving/modifying exist function though.

Kukjin, could you please explain why 'soc_is_xxx()' usage inside
arch/arm/mach-exynos/ code is not acceptable?  I know that it should
not be used outisde of this directory because of multiplatform support
but what is wrong with using it for arch/arm/mach-exynos/ code?

I'm also not sure if -rc4 is a desirable time to be doing such changes
(especially given that the patch in question is moving an existing code=
,
not adding new 'soc_is_xxx()' users).

[ Moreover of_machine_is_compatible() can be sometimes harmful as could
  have been seen in commit ca489c58ef0b81 ("ARM: EXYNOS: Don't use LDRE=
X
  and STREX after disabling cache coherency" fix. ]

> Probably of_machine_is_compatible() could be used here but such chang=
e
> should be done in separate patch. This is fix for wrong usage of
> use_delayed_assertion so it should not mix with other changes in the
> code. This fixes one thing at a time. Fixing many things in one patch
> often leads to new errors or difficulties in debugging.
>=20
> I can prepare a separate patch for changing this to
> of_machine_is_compatible().

IMHO this would be the best solution if there is an agreement on
'soc_is_xxx()' removal.

> >=20
> > And please make sure your updates don't hurt other exynos5 stuff. A=
ny
> > tests on exynos5 platforms would be helpful.

The patch is quite obvious and only affects Exynos4 SoCs.  Extra testin=
g
on Exynos5 SoCs won't hurt but they should not be required for merge.

> > And I don't think the fix should be sent to 'stable' because I can'=
t see
> > the 'add node for L2$ controller' in v3.19...looks applied from v4.=
0-rc...
>=20
> You're right. git-describe gave me 3.19-rc1 but this was tag for the
> specific commit, not for merge-commit. The stable can be removed if t=
his
> comes during this RC-cycle.

Yes, the stable tag was a mistake and should be removed.

> > One more if you have any doubts, I'd like to ask you to contact S.L=
SI
> > guys who have created the vendor codes not assume with the code bec=
ause
> > maybe the vendor code you mentioned cannot cover all exynos stuff I
> > think. Then we could make more clear pm codes in mainline. To be ho=
nest
> > I'm not a Power Management hardware guy so I don't know every regar=
ding
> > PM stuff in exynos SoCs, I can contact them easier though...I mean
> > please don't assume any hardware behavior with just vendor code. Pl=
ease
> > ask, you have an access in Samsung intranet before posting somethin=
g
> > like this...Hope let's make a better fix together during -rc.

=46WIW I think that -rc4 is too late to be doing 'perfect patch' (we've=
 waited
for 6 weeks on any feedback on this patch from you).  The current solut=
ion is
quite simple and has been tested to fix the regression without introduc=
ing
other problems.

> As you probably know I work in completely different company within
> Samsung Electronics than System LSI. I don't have access to the LSI
> intranet. I don't have access to guys from LSI. I'll try contacting t=
hem
> through my HQ partners.
>=20
> Thanks for feedback!
>=20
> Best regards,
> Krzysztof

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics
