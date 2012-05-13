From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL] cleanup samsung plat-s3c24xx and s5p for v3.5
Date: Sat, 12 May 2012 22:21:53 -0700
Message-ID: <CAOesGMgk+-cqmDmhsjM9fhRpwxV4jNf4y+z1AKWpu8a=6wqkCw@mail.gmail.com>
References: <4FAEEFD3.9040907@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:52726 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750763Ab2EMFVx convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 13 May 2012 01:21:53 -0400
Received: by pbbrp8 with SMTP id rp8so4835541pbb.19
        for <linux-samsung-soc@vger.kernel.org>; Sat, 12 May 2012 22:21:53 -0700 (PDT)
In-Reply-To: <4FAEEFD3.9040907@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Arnd Bergmann <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

Hi,

On Sat, May 12, 2012 at 4:18 PM, Kukjin Kim <kgene.kim@samsung.com> wro=
te:
> Hi Arnd, Olof
>
> Please pull cleanup plat-s3c24xx-s5p for v3.5 Samsung stuff.
>
> =A0git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.=
git
> next/cleanup-plat-s3c24xx-s5p
>
> We can remove plat-s5p directory with this series and I think, the
> plat-s3c24xx can be removed next time for one plat-samsung of Samsung=
 stuff.

Nice!

> Note, this is including cleanup-samsung-iommu which is removing s5p i=
ommu
> stuff in plat-s5p.

What branch is that? I've not seen a pull request for it.


-Olof
