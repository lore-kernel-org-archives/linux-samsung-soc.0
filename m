From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [RFC PATCH 2/8] drm: exynos/dp: convert to drm bridge mode
Date: Fri, 7 Aug 2015 13:25:35 +0200
Message-ID: <20150807112535.GK17734@phenom.ffwll.local>
References: <1438868947-22132-1-git-send-email-ykk@rock-chips.com>
 <1438870041-23130-1-git-send-email-ykk@rock-chips.com>
 <000001d0d052$f44fa3a0$dceeeae0$@com>
 <55C36F49.6020207@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f174.google.com ([209.85.212.174]:38686 "EHLO
	mail-wi0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752292AbbHGLZk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 7 Aug 2015 07:25:40 -0400
Received: by wibxm9 with SMTP id xm9so61692977wib.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 07 Aug 2015 04:25:38 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <55C36F49.6020207@rock-chips.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Yakir Yang <ykk@rock-chips.com>
Cc: Jingoo Han <jingoohan1@gmail.com>, 'Heiko Stuebner' <heiko@sntech.de>, 'Russell King' <rmk+kernel@arm.linux.org.uk>, 'Fabio Estevam' <fabio.estevam@freescale.com>, 'Inki Dae' <inki.dae@samsung.com>, 'Krzysztof Kozlowski' <k.kozlowski@samsung.com>, dri-devel@lists.freedesktop.org, 'Andrzej Hajda' <a.hajda@samsung.com>, 'Gustavo Padovan' <gustavo.padovan@collabora.co.uk>, 'Ajay Kumar' <ajaykumar.rs@samsung.com>, linux-samsung-soc@vger.kernel.org, 'Vincent Palatin' <vpalatin@chromium.org>, linux-rockchip@lists.infradead.org, 'Kukjin Kim' <kgene@kernel.org>, 'Thierry Reding' <treding@nvidia.com>, dianders@google.com, linux-arm-kernel@lists.infradead.org, 'Seung-Woo Kim' <sw0312.kim@samsung.com>, linux-kernel@vger.kernel.org, 'Kyungmin Park' <kyungmin.park@samsung.com>, djkurtz@google.com, 'Andy Yan' <andy.yan@rock-chips.com>

On Thu, Aug 06, 2015 at 10:29:29PM +0800, Yakir Yang wrote:
> Hi Jingoo,
>=20
> =E5=9C=A8 2015/8/6 22:19, Jingoo Han =E5=86=99=E9=81=93:
> >On Thursday, August 06, 2015 11:07 PM, Yakir Yang wrote:
> >>In order to move exynos dp code to bridge directory,
> >>we need to convert driver drm bridge mode first. As
> >>dp driver already have a ptn3460 bridge, so we need
> >>to move ptn bridge to the next bridge of dp bridge.
> >>
> >>Signed-off-by: Yakir Yang <ykk@rock-chips.com>
> >>---
> >>  drivers/gpu/drm/exynos/exynos_dp_core.c | 196 +++++++++++++++++++=
+------------
> >>  drivers/gpu/drm/exynos/exynos_dp_core.h |   2 +
> >>  2 files changed, 126 insertions(+), 72 deletions(-)
> >>
> >>diff --git a/drivers/gpu/drm/exynos/exynos_dp_core.c b/drivers/gpu/=
drm/exynos/exynos_dp_core.c
> >>index a8097a4..aa99e23 100644
> >>--- a/drivers/gpu/drm/exynos/exynos_dp_core.c
> >>+++ b/drivers/gpu/drm/exynos/exynos_dp_core.c
> >>@@ -3,6 +3,7 @@
> >>   *
> >>   * Copyright (C) 2012 Samsung Electronics Co., Ltd.
> >>   * Author: Jingoo Han <jg1.han@samsung.com>
> >>+ *         Yakir Yang <ykk@rock-chips.com>
> >Please don't add this.
> >You just fixed some parts of this code. I don't find the reason
> >why you have to be added to author for this file.
> >If you want the title for an author, please send the patch
> >for a new IP, instead of modifying the exiting codes.
>=20
> Okay, thanks for your remind ;)

tbh the author lines are completely irrelevant, git blame/log is the
authoritative source for that. Copyright is a bit a different matter
entirely, but in general we seem to be not too good at updating.

Really if that's all you have to comment and no substantial technical
concerns or questions then just can such a bikeshed mail.
-Daniel
--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
