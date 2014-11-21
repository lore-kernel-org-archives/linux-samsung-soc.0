From: =?windows-1252?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Subject: Re: [RFC PATCH 1/1] drm/exynos: Move platform drivers registration
 to module init
Date: Fri, 21 Nov 2014 12:33:04 +0100
Message-ID: <546F22F0.5060204@suse.de>
References: <1416318821-7925-1-git-send-email-javier.martinez@collabora.co.uk> <7hh9xwxsev.fsf@deeprootsystems.com> <546CCAB8.9050402@collabora.co.uk> <CAFp+6iFbxWoh4h0ZpY=JQO4rjLss2kpj-nZM7KGiJ_F4AZ2W=g@mail.gmail.com> <7hppchsu29.fsf@deeprootsystems.com> <546E293D.9000300@collabora.co.uk> <7hbno1spdt.fsf@deeprootsystems.com> <20141120234953.GA4010@luxor.wired.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:49677 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755473AbaKULdH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 21 Nov 2014 06:33:07 -0500
In-Reply-To: <20141120234953.GA4010@luxor.wired.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Paolo Pisati <p.pisati@gmail.com>
Cc: Kevin Hilman <khilman@kernel.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Vivek Gautam <gautamvivek1987@gmail.com>, Inki Dae <inki.dae@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Vivek Gautam <gautam.vivek@samsung.com>

Am 21.11.2014 um 00:49 schrieb Paolo Pisati:
> vanilla kgene/for-next as of today:
>=20
> 7552917 Revert "ARM: exynos_defconfig: Enable options for display pan=
el support"
> ff0391a Merge branch 'v3.19-samsung-defconfig' into for-next
> 26c6283 Merge branch 'v3.18-samsung-fixes' into for-next
> cf864fd Merge branch 'v3.18-samsung-defconfig' into for-next
> 98b6380 ARM: exynos_defconfig: Enable max77802 rtc and clock drivers
> 839275c ARM: exynos_defconfig: Use 16 minors per MMC block device
> 0526f27 ARM: dts: Explicitly set dr_mode on exynos5250-snow
> fc14f9c Linux 3.18-rc5
> ...
>=20
> plus
>=20
> 5e1e068 arm: dts: Exynos5: Use pmu_system_controller phandle for dp p=
hy
> 36d908e drm/exynos: dp: Remove support for unused dptx-phy
> 624bff2 POSTED: mfd: syscon: Decouple syscon interface from syscon de=
vices
> 68944e3 Revert "Revert "ARM: exynos_defconfig: Enable options for dis=
play panel
> support""
>=20
> vanilla exynos_defconfig with SND_SOC_SNOW disabled.
>=20
> I should probably try linux-next at this point, but i wonder if peopl=
e who
> reported kgene/for-next working were testing with a vanilla exynos_de=
fconfig on
> a peach pi.

On Spring, I am able to boot my kgene/for-next based queue with just:

mfd: syscon: Decouple syscon interface from platform devices
arm: dts: Exynos5: Use pmu_system_controller phandle for dp phy

with DRM_EXYNOS*=3Dy (except IOMMU) and SND_SOC_SNOW=3Dm enabled in the
config, while using simplefb rather than the Exynos DRM and thus
clk_ignore_unused.

Regarding SND_SOC_SNOW: Note that I recently submitted a patch to enabl=
e
module-loading, which is missing in kgene/for-next and -rc5 but is in
linux-next.git - it might uncover problems that previously went
unnoticed: https://patchwork.kernel.org/patch/5235951/
exynos_defconfig has SND_SOC_SNOW=3Dy, whereas multi_v7_defconfig doesn=
't
have it.

Regards,
Andreas

--=20
SUSE LINUX GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 21284 AG N=FCrn=
berg
