From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 5/9] ARM: EXYNOS: add board file for SMDK5250
Date: Thu, 9 Feb 2012 23:36:00 +0000
Message-ID: <201202092336.00524.arnd@arndb.de>
References: <1328024354-4277-1-git-send-email-kgene.kim@samsung.com> <20120201093423.GA3002@mudshark.cambridge.arm.com> <069401cce71e$56bffe80$043ffb80$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.187]:65170 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758677Ab2BIXgQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 9 Feb 2012 18:36:16 -0500
In-Reply-To: <069401cce71e$56bffe80$043ffb80$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Will Deacon' <will.deacon@arm.com>, 'Olof Johansson' <olof@lixom.net>, 'Kyungmin Park' <kmpark@infradead.org>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, rmk+kernel@arm.linux.org.uk

On Thursday 09 February 2012, Kukjin Kim wrote:
> Will Deacon wrote:
> > 
> > On Wed, Feb 01, 2012 at 08:50:23AM +0000, Olof Johansson wrote:
> > > On Tue, Jan 31, 2012 at 8:20 PM, Kyungmin Park <kmpark@infradead.org>
> > wrote:
> > > > As I remember only DT based board file is acceptable for mainline?
> > >
> > > For a new SoC family like 5250 it would be much preferred to only add
> > > device-tree enabled boards.
> > 
> As I commented, I'd like to support both dt and non-dt for EXYNOS5250 and
> I'm saying EXYNOS5250 DT patches will be submitted next time again.

I think it would be much better to start with just the DT based platform
for exynos5 and leave out the atag based platform.

	Arnd
