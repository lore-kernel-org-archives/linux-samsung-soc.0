From: Gustavo Padovan <gustavo@padovan.org>
Subject: Re: [PATCH v10 17/17] drm/exynos: split exynos_crtc->dpms in
 enable() and disable()
Date: Tue, 2 Jun 2015 11:06:23 -0300
Message-ID: <20150602140623.GF20774@joana>
References: <1433171095-23773-1-git-send-email-gustavo@padovan.org>
 <1433171095-23773-18-git-send-email-gustavo@padovan.org>
 <556D9D0D.6010408@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vn0-f46.google.com ([209.85.216.46]:37682 "EHLO
	mail-vn0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756203AbbFBOG2 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 2 Jun 2015 10:06:28 -0400
Received: by vnbg190 with SMTP id g190so20655323vnb.4
        for <linux-samsung-soc@vger.kernel.org>; Tue, 02 Jun 2015 07:06:27 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <556D9D0D.6010408@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, jy0922.shim@samsung.com, tjakobi@math.uni-bielefeld.de, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

Hi Inki,

2015-06-02 Inki Dae <inki.dae@samsung.com>:

> Hi,
>=20
> On 2015=EB=85=84 06=EC=9B=94 02=EC=9D=BC 00:04, Gustavo Padovan wrote=
:
> > From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> >
> > To follow more closely the new atomic API we split the dpms()
> > helper into the enable() and disable() helper to get exactly the
> > same semantics.
>=20
> Below is the result from checkpatch.pl. Please fix all errors and che=
ck
> your patch with checkpatch.pl before posting it.
>=20
> Thanks,
> Inki Dae
>=20
> total: 62 errors, 0 warnings, 410 lines checked

I think you did something wrong when checking, for me it looks like
this:

0016-drm-exynos-split-exynos_crtc-dpms-in-enable-and-disa.patch has no
obvious style problems and is ready for submission.
WARNING: Do not use whitespace before Signed-off-by:
#12:=20
    Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

total: 0 errors, 1 warnings, 594 lines checked

	Gustavo
