From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 11/18] iommu: exynos: remove useless device_add/remove callbacks
Date: Thu, 23 Oct 2014 16:02:06 +0200
Message-ID: <1987006.J2W7PED0yz@wuerfel>
References: <1410868485-4143-1-git-send-email-m.szyprowski@samsung.com> <2779319.yKiT9EDCse@wuerfel> <54477EDA.3060104@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.24]:57267 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751674AbaJWOCl convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 23 Oct 2014 10:02:41 -0400
In-Reply-To: <54477EDA.3060104@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, Alban Browaeys <alban.browaeys@gmail.com>, linux-samsung-soc@vger.kernel.org

On Wednesday 22 October 2014 11:54:34 Marek Szyprowski wrote:
> On 2014-10-22 11:26, Arnd Bergmann wrote:
> > On Wednesday 22 October 2014 11:15:00 Alban Browaeys wrote:
> >> Le mardi 16 septembre 2014 =E0 13:54 +0200, Marek Szyprowski a =E9=
crit :
> >>> The driver doesn't need to do anything important in device add/re=
move
> >>> callbacks, because initialization will be done from device-tree s=
pecific
> >>> callbacks added later. IOMMU groups created by current code were =
never
> >>> used.
> >>>
> >>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> >>
> >> The exyons iommu init fails if those are removed, that is it never=
 reach
> >> init_done:
> >> 1. exynos_iommu_setup
> >> 2. - exynos_iommu_init
> >> 3. ---bus_set_iommu
> >> 4. ------ add_iommu_group
> >>
> >> that is (4) add_iommu_group returns ENODEV to bus_set_iommu, the l=
atter
> >> doing so to exynos_iommu_init. Which thus error out before the ini=
t_done
> >> is set to true.
> > On a related note, I found that the exynos iommu driver does not ch=
eck
> > for the presence of an exynos iommu before calling bus_set_iommu,
> > and this breaks multiplatform kernels.
> >
> > Please fix.
>=20
> For the time being please apply this patch:=20
> https://lkml.org/lkml/2014/8/5/163
>=20
> The proper solution will be applied when driver will be adapted to co=
mmon of
> iommu support, which is still under discussion.
>=20

The patch looks good.

Acked-by: Arnd Bergmann <arnd@arndb.de>

Can you send it to the iommu maintainer please?

	Arnd
