From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL] cleanup samsung plat-s3c24xx and s5p for v3.5
Date: Tue, 15 May 2012 14:45:50 +0000
Message-ID: <201205151445.50516.arnd@arndb.de>
References: <4FAEEFD3.9040907@samsung.com> <201205141917.35692.arnd@arndb.de> <07f201cd3272$595ba050$0c12e0f0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.9]:63463 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932729Ab2EOOpx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 May 2012 10:45:53 -0400
In-Reply-To: <07f201cd3272$595ba050$0c12e0f0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Olof Johansson' <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On Tuesday 15 May 2012, Kukjin Kim wrote:
> > I've pulled the next/cleanup-samsung-iommu into next/drivers and th=
e
>=20
> But I think would be better if you could pull the next/devel-samsung-=
iommu into next/drivers instead of next/cleanup-samsung-iommu.
> Because actual iommu driver is included in next/devel-samsung-iommu b=
ranch and the next/cleanup-samsung-iommu branch includes just
> cleanup current Samsung iommu driver.

Ah, right. I though this was going through J=F6rg's IOMMU tree, but I s=
aw now
that he agreed to having the new driver merged through arm-soc.

I've pulled both branches into next/drivers now.

	Arnd
