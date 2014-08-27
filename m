From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Subject: Re: [PATCH 0/2 v2] Fix Exynos peach USB on kernels with USB Gadget
 support
Date: Wed, 27 Aug 2014 04:08:23 +0200
Message-ID: <53FD3D97.3010002@suse.de>
References: <1409038230-7242-1-git-send-email-sjoerd.simons@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:54334 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753836AbaH0CI2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 26 Aug 2014 22:08:28 -0400
In-Reply-To: <1409038230-7242-1-git-send-email-sjoerd.simons@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sjoerd Simons <sjoerd.simons@collabora.co.uk>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Hi,

Am 26.08.2014 09:30, schrieb Sjoerd Simons:
> I suspect other boards base using exynos5420/5800 might need the simi=
lar fixes
> (Arndale Octa and Samsung SMDK5420) to their dts files, so would be g=
reat if
> folks with those board could verify this.

usbdrd_dwc3_1 is indeed required for the Arndale Octa. Not sure about 0=
=2E

I tested my attaching a USB 3.0 disk - is there an easier way to tell?

Regards,
Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrn=
berg
