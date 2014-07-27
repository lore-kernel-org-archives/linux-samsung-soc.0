From: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Subject: Re: [PATCH V6 0/8] drm/exynos: few patches to enhance bridge chip
 support
Date: Sun, 27 Jul 2014 20:22:19 +0200
Message-ID: <53D5435B.8030305@suse.de>
References: <1406316130-4744-1-git-send-email-ajaykumar.rs@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:39704 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750865AbaG0SWY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 27 Jul 2014 14:22:24 -0400
In-Reply-To: <1406316130-4744-1-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ajay Kumar <ajaykumar.rs@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: inki.dae@samsung.com, thierry.reding@gmail.com, robdclark@gmail.com, daniel.vetter@ffwll.ch, seanpaul@google.com, ajaynumb@gmail.com, jg1.han@samsung.com, joshi@samsung.com, prashanth.g@samsung.com

Hi Ajay,

Am 25.07.2014 21:22, schrieb Ajay Kumar:
> This series is based on exynos-drm-next branch of Inki Dae's tree at:
> git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git
>=20
> I have tested this after adding few DT changes for exynos5250-snow,
> exynos5420-peach-pit and exynos5800-peach-pi boards.

I'm trying to test this with a modified exynos5250-spring DT based off
kgene's for-next branch due to DT, and I run into the following:

  CC      drivers/gpu/drm/bridge/ptn3460.o
drivers/gpu/drm/bridge/ptn3460.c: In function =E2=80=98ptn3460_post_enc=
oder_init=E2=80=99:
drivers/gpu/drm/bridge/ptn3460.c:275:2: error: implicit declaration of
function =E2=80=98drm_connector_register=E2=80=99 [-Werror=3Dimplicit-f=
unction-declaration]
  drm_connector_register(&ptn_bridge->connector);
  ^
cc1: some warnings being treated as errors
scripts/Makefile.build:257: recipe for target
'drivers/gpu/drm/bridge/ptn3460.o' failed
make[4]: *** [drivers/gpu/drm/bridge/ptn3460.o] Error 1
scripts/Makefile.build:404: recipe for target 'drivers/gpu/drm/bridge'
failed
make[3]: *** [drivers/gpu/drm/bridge] Error 2
make[3]: *** Warte auf noch nicht beendete Prozesse...
scripts/Makefile.build:404: recipe for target 'drivers/gpu/drm' failed
make[2]: *** [drivers/gpu/drm] Error 2
scripts/Makefile.build:404: recipe for target 'drivers/gpu' failed
make[1]: *** [drivers/gpu] Error 2
Makefile:899: recipe for target 'drivers' failed
make: *** [drivers] Error 2

Any hint which prerequisite I'm missing? Didn't spot it in Inki's tree,
and it must be new since v4.

Thanks,
Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 16746 AG N=C3=
=BCrnberg
