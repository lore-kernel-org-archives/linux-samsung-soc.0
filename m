From: Gustavo Padovan <gustavo@padovan.org>
Subject: Re: [PATCH] drm/atomic: only run atomic_check() if crtc is active
Date: Fri, 13 Nov 2015 15:33:46 -0200
Message-ID: <20151113173346.GM2264@joana>
References: <1447422358-18891-1-git-send-email-gustavo@padovan.org>
 <20151113143445.GW4437@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yk0-f177.google.com ([209.85.160.177]:34169 "EHLO
	mail-yk0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933009AbbKMRdv convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 13 Nov 2015 12:33:51 -0500
Received: by ykfs79 with SMTP id s79so158819600ykf.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 13 Nov 2015 09:33:50 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20151113143445.GW4437@intel.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Cc: linux-samsung-soc@vger.kernel.org, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, dri-devel@lists.freedesktop.org

Hi Ville,

2015-11-13 Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>:

> On Fri, Nov 13, 2015 at 11:45:58AM -0200, Gustavo Padovan wrote:
> > From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> >=20
> > Fixes an regression added by 3ae2436 (drm/exynos/mixer: replace
> > direct cross-driver call with drm mode) and while this regression w=
as
> > caused by a change in the exynos driver it makes sense to add the
> > check on atomic core to benefit other drivers as well.
> >=20
> > The whole atomic update fails if the exynos hdmi display is not
> > present/active.  Add a test to only run atomic_check() if the CRTC =
is
> > active.
>=20
> The check must be performed even when the crtc is not active.
>=20
> Especially important for the (enabled && !active) case (ie. DPMS off)
> since "DPMS on" must not fail, so any state change while in DPMS off
> must be checked as if the crtc was active.
>=20
> But even for the !enabled case we want to do the check so that
> everything gets properly recomputed when fully disabling a crtc.

You are right. I'll fix this locally in exynos for now.

	Gustavo
