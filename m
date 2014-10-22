From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 11/18] iommu: exynos: remove useless device_add/remove callbacks
Date: Wed, 22 Oct 2014 11:26:53 +0200
Message-ID: <2779319.yKiT9EDCse@wuerfel>
References: <1410868485-4143-1-git-send-email-m.szyprowski@samsung.com> <1410868485-4143-12-git-send-email-m.szyprowski@samsung.com> <1413969300.31696.10.camel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.24]:61854 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753961AbaJVJ1Y convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 22 Oct 2014 05:27:24 -0400
In-Reply-To: <1413969300.31696.10.camel@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Alban Browaeys <alban.browaeys@gmail.com>, Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org

On Wednesday 22 October 2014 11:15:00 Alban Browaeys wrote:
> Le mardi 16 septembre 2014 =E0 13:54 +0200, Marek Szyprowski a =E9cri=
t :
> > The driver doesn't need to do anything important in device add/remo=
ve
> > callbacks, because initialization will be done from device-tree spe=
cific
> > callbacks added later. IOMMU groups created by current code were ne=
ver
> > used.
> >=20
> > Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>=20
>=20
> The exyons iommu init fails if those are removed, that is it never re=
ach
> init_done:
> 1. exynos_iommu_setup
> 2. - exynos_iommu_init
> 3. ---bus_set_iommu
> 4. ------ add_iommu_group
>=20
> that is (4) add_iommu_group returns ENODEV to bus_set_iommu, the latt=
er
> doing so to exynos_iommu_init. Which thus error out before the init_d=
one
> is set to true.

On a related note, I found that the exynos iommu driver does not check
for the presence of an exynos iommu before calling bus_set_iommu,
and this breaks multiplatform kernels.

Please fix.

	Arnd
