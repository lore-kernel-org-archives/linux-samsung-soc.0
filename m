From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL] cleanup samsung plat-s3c24xx and s5p for v3.5
Date: Mon, 14 May 2012 19:17:35 +0000
Message-ID: <201205141917.35692.arnd@arndb.de>
References: <4FAEEFD3.9040907@samsung.com> <CAOesGMgk+-cqmDmhsjM9fhRpwxV4jNf4y+z1AKWpu8a=6wqkCw@mail.gmail.com> <064c01cd31a4$9ddd5c60$d9981520$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.8]:51234 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932172Ab2ENTRn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 May 2012 15:17:43 -0400
In-Reply-To: <064c01cd31a4$9ddd5c60$d9981520$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Olof Johansson' <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On Monday 14 May 2012, Kukjin Kim wrote:
> It is next/cleanup-samsung-iommu branch and already included in
> next/cleanup-plat-s3c24xx branch as a base because as I said, that is needed
> to remove plat-s5p directory.
> So in this case, would be better if you could pull following branch before
> pulling next/cleanup-plat-s3c24xx-s5p and sorry for missing pull request it.
> 
> git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> next/cleanup-samsung-iommu
> 
> If any problems, please let me know.

I've pulled the next/cleanup-samsung-iommu into next/drivers and the 
next/cleanup-plat-s3c24xx-s5p branch into next/cleanup2, which creates
a new dependency between our two branches in arm-soc.

	Arnd
