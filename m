From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Subject: Re: kgene's for-next branch broken, and boot regressions
Date: Sun, 27 Jul 2014 17:49:02 +0200
Message-ID: <53D51F6E.20803@suse.de>
References: <53D46D2F.3000202@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:37428 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751738AbaG0PtH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 27 Jul 2014 11:49:07 -0400
In-Reply-To: <53D46D2F.3000202@suse.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Doug Anderson <dianders@chromium.org>, Kevin Hilman <khilman@linaro.org>, Ajay Kumar <ajaykumar.rs@samsung.com>

Am 27.07.2014 05:08, schrieb Andreas F=E4rber:
> On the Arndale Octa (5420) I see an asynchronous external abort on
> serial console when systemd gets started.
>=20
> http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg3468=
0.html

This turned out to be somehow caused by MCPM driver. Disabling MCPM and
ARM_BIG_LITTLE_CPUIDLE worked around it.

> On the Spring Chromebook (5250) the screen goes dark after a few line=
s,
> and USB is not initialized. Thus unclear to me why.

Using boot_delay=3D1000 I tracked this down to the DRM initialization.
Reverting the previously working DRM bridge series v4 and commenting ou=
t
spring's dp-controller node worked around this.

Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrn=
berg
