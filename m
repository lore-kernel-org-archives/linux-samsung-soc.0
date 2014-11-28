From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Subject: Re: [PATCH] ARM: exynos_defconfig: Enable CONFIG_FHANDLE
Date: Fri, 28 Nov 2014 13:08:27 +0100
Message-ID: <547865BB.1010604@suse.de>
References: <1417176414-21558-1-git-send-email-sjoerd.simons@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:55964 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751017AbaK1MI3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 28 Nov 2014 07:08:29 -0500
In-Reply-To: <1417176414-21558-1-git-send-email-sjoerd.simons@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sjoerd Simons <sjoerd.simons@collabora.co.uk>
Cc: Kukjin Kim <kgene@kernel.org>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Javier Martinez Canillas <javier.martinez@collabora.co.uk>

Am 28.11.2014 um 13:06 schrieb Sjoerd Simons:
> CONFIG_FHANDLE is required by systemd, which is the default init syst=
em
> in more and more distributions. So lets enable it for Exynos as well
> (it's already enabled in multi_v7_defconfig)
>=20
> Signed-off-by: Sjoerd Simons <sjoerd.simons@collabora.co.uk>

Reviewed-by: Andreas F=E4rber <afaerber@suse.de>

Thanks,
Andreas

--=20
SUSE LINUX GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 21284 AG N=FCrn=
berg
