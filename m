From: Gustavo Padovan <gustavo@padovan.org>
Subject: Re: [PATCH v2 00/11] drm/exynos: remove exynos_drm_display and
 exynos_drm_encoder
Date: Thu, 6 Aug 2015 10:27:41 -0300
Message-ID: <20150806132741.GD8125@joana>
References: <1438817060-22164-1-git-send-email-gustavo@padovan.org>
 <55C34B30.4030904@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yk0-f173.google.com ([209.85.160.173]:35284 "EHLO
	mail-yk0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750758AbbHFN1p convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 6 Aug 2015 09:27:45 -0400
Received: by ykcq64 with SMTP id q64so57022227ykc.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 06 Aug 2015 06:27:45 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <55C34B30.4030904@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, jy0922.shim@samsung.com, tjakobi@math.uni-bielefeld.de, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

Hi Inki,

2015-08-06 Inki Dae <inki.dae@samsung.com>:

> On 2015=EB=85=84 08=EC=9B=94 06=EC=9D=BC 08:24, Gustavo Padovan wrote=
:
> > From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> >
> > Hi,
> >
> > This patchset is another important step in the exynos clean up, it =
removes
> > two exynos internal structs in favor of wider use of struct drm_enc=
oder.
> >
> > Structs exynos_drm_display and exynos_drm_encoder were doing exactl=
y what
> > struct drm_encoder does so remove them makes the code cleaner, easi=
er
> > to understand and less error prone.
> >
> > Please review,
> >
> >        Gustavo
> >
> > ---
> > v2:  - check ret value of hdmi_create_connector()
> >      - set dp->dpms_mode after enable/disable
>=20
> I don't see patch v2 10/11 and 11/11 in my mailbox. Did you miss them=
?

Hmm, yeah. I've used 000* to send my patches, which excluded 10 and 11.
I'll append them here.

	Gustavo
