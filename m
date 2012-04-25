From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Subject: Re: [PATCH 00/33] Use common macro to define resources
Date: Wed, 25 Apr 2012 12:10:07 +0200
Message-ID: <20120425101007.GM9142@game.jcrosoft.org>
References: <1335327163-11794-1-git-send-email-tushar.behera@linaro.org>
 <20120425041939.GL9142@game.jcrosoft.org>
 <201204250938.58397.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from 8.mo4.mail-out.ovh.net ([188.165.33.112]:47231 "EHLO
	mo4.mail-out.ovh.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1757866Ab2DYKaX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 25 Apr 2012 06:30:23 -0400
Received: from mail97.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo4.mail-out.ovh.net (Postfix) with SMTP id 5B9601050624
	for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Apr 2012 12:31:31 +0200 (CEST)
Content-Disposition: inline
In-Reply-To: <201204250938.58397.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: Tushar Behera <tushar.behera@linaro.org>, Arnd Bergmann <arnd@arndb.de>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, linux@arm.linux.org.uk, patches@linaro.org

On 09:38 Wed 25 Apr     , Heiko St=FCbner wrote:
> Hi,
>=20
> Am Mittwoch, 25. April 2012, 06:19:39 schrieb Jean-Christophe PLAGNIO=
L-
> VILLARD:
> > On 09:42 Wed 25 Apr     , Tushar Behera wrote:
> > > There are some helper macros (DEFINE_RES_XXX) for defining resour=
ce
> > > structures. This patchset migrates all the earlier resource
> > > definitions (within Samsung specific code base) to use these macr=
os.
> > >=20
> > > In some cases, it was not possible to use DEFINE_RES_IRQ() macro =
because
> > > of usage of additional flags. In those cases, DEFINE_RES_NAMED() =
macro
> > > is used instead.
> > >=20
> > > The patches are rebased on top of Kukjin's for-next branch at thi=
s
> > > commit.
> > >=20
> > > d0ee53a Merge branch 'next/board-samsung' into for-next
> >=20
> > is this really necessary as we switch to DT this code will be drope=
d
>=20
> As far as I know legacy SoCs are allowed to keep being non-DT and I d=
on't see=20
> the older Samsung SoCs (especially the S3C24XX ones) changing to DT a=
nytime=20
> soon, as they don't see any new development but only bug fixes curren=
tly.
>=20
>=20
> > for my point of view it's cosmetics change
> it is, but it also makes the code more readable
we get comment from Linus to do not do cosmetic changes

so if it work well I'll not touch it

Best Regards,
J.
