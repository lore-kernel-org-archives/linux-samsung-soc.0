From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v2] ARM: exynos_defconfig: Enable CONFIG_LOCKUP_DETECTOR
Date: Wed, 07 Jan 2015 15:23:20 +0100
Message-ID: <1420640600.32552.7.camel@AMDC1943>
References: <1420635542-7202-1-git-send-email-moon.linux@yahoo.com>
 <1420637261.32552.4.camel@AMDC1943>
 <157605903.5809859.1420638996780.JavaMail.yahoo@jws10677.mail.bf1.yahoo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:19244 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752378AbbAGOXZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 7 Jan 2015 09:23:25 -0500
In-reply-to: <157605903.5809859.1420638996780.JavaMail.yahoo@jws10677.mail.bf1.yahoo.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Anand Moon <moon.linux@yahoo.com>
Cc: Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Doug Anderson <dianders@chromium.org>, Kevin Hilman <khilman@linaro.org>, Sachin Kamat <sachin.kamat@samsung.com>, Sjoerd Simons <sjoerd.simons@collabora.co.uk>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Tushar Behera <tushar.behera@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On =C5=9Bro, 2015-01-07 at 13:56 +0000, Anand Moon wrote:
> Hi Kszysztof Kozlowski,
>=20
> I picked up the bellow line from=20
>=20
>=20
> Documentation/locking/lockdep-design.txt  line no 18
>=20
> I understand that by enabling this flag we could detect possible=20
>=20
> deadlock situation with the kernel. Sorry for the noise.

=2E..and lockdep-design.txt describes LOCKDEP. Not LOCKUP. So why you a=
re
enabling lockup?

Best regards,
Krzysztof

>=20
>=20
> -Anand Moon
>=20
>=20
>=20
> On Wednesday, January 7, 2015 6:57 PM, Krzysztof Kozlowski <k.kozlows=
ki@samsung.com> wrote:
> On =C5=9Bro, 2015-01-07 at 18:29 +0530, Anand Moon wrote:
> > Enable CONFIG_LOCKUP_DETECTOR to validate kernel locks state for ex=
ynos SOC.
> >=20
> > Enabling CONFIG_LOCKUP_DETECTOR help validator tracks the 'state' o=
f lock-classes,
> > and it tracks dependencies between different lock-classes.
> > The validator maintains a rolling proof that the state and
> > the dependencies are correct.
>=20
> Unfortunately this is not correct. Lockup detector does something els=
e.
> Please read the help/manual for LOCKUP_DETECTOR. You can find in
> lib/Kconfig.debug (around line 667).
>=20
> Best regards,
> Krzysztof
>=20
> >=20
> > Changes since v2:
> >  * Made commit message more clear
> >  * Corrected grammer in code comment
> >=20
> > Tested on Exynos5422 ODROID XU3 board.
> >=20
> > Signed-off-by: Anand Moon <moon.linux@yahoo.com>
> > Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> > ---
> >  arch/arm/configs/exynos_defconfig | 1 +
> >  1 file changed, 1 insertion(+)
> >=20
> > diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/e=
xynos_defconfig
> > index 5ef14de..ecd9987 100644
> > --- a/arch/arm/configs/exynos_defconfig
> > +++ b/arch/arm/configs/exynos_defconfig
> > @@ -178,6 +178,7 @@ CONFIG_PRINTK_TIME=3Dy
> >  CONFIG_DEBUG_FS=3Dy
> >  CONFIG_MAGIC_SYSRQ=3Dy
> >  CONFIG_DEBUG_KERNEL=3Dy
> > +CONFIG_LOCKUP_DETECTOR=3Dy
> >  CONFIG_DETECT_HUNG_TASK=3Dy
> >  CONFIG_DEBUG_RT_MUTEXES=3Dy
> >  CONFIG_DEBUG_SPINLOCK=3Dy
