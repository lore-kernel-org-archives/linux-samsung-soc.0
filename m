From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL 6/8] arm64: dts: exynos: DTS for v4.8
Date: Mon, 13 Jun 2016 14:48:47 -0700
Message-ID: <20160613214847.GD20845@localhost>
References: <1465215933-22709-1-git-send-email-k.kozlowski@samsung.com>
 <1465215933-22709-7-git-send-email-k.kozlowski@samsung.com>
 <57566A77.6080104@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f66.google.com ([209.85.220.66]:35361 "EHLO
	mail-pa0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752574AbcFNQxW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 14 Jun 2016 12:53:22 -0400
Received: by mail-pa0-f66.google.com with SMTP id hf6so5175980pac.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 14 Jun 2016 09:53:22 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <57566A77.6080104@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@kernel.org>, arm@kernel.org, Javier Martinez Canillas <javier@osg.samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>

On Tue, Jun 07, 2016 at 08:32:23AM +0200, Krzysztof Kozlowski wrote:
> On 06/06/2016 02:25 PM, Krzysztof Kozlowski wrote:
> > The following changes since commit 1a695a905c18548062509178b98bc91e67510864:
> > 
> >   Linux 4.7-rc1 (2016-05-29 09:29:24 -0700)
> > 
> > are available in the git repository at:
> > 
> >   git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt64-4.8
> > 
> > for you to fetch changes up to 8b77005c40376816885b100bcd358887d29e323f:
> > 
> >   arm64: dts: exynos: Use human-friendly symbols for timer interrupt flags (2016-05-30 08:45:34 +0200)
> > 
> > ----------------------------------------------------------------
> > Samsung DeviceTree arm64 update for v4.8:
> > 1. Minor cleanup.
> > 
> > ----------------------------------------------------------------
> > Krzysztof Kozlowski (1):
> >       arm64: dts: exynos: Use human-friendly symbols for timer interrupt flags
> 
> Please drop this pull request.
> 
> The patch should be rebased on top of Marc Zyngier's fix:
>  - arm64: dts: Fix broken architected timer interrupt trigger
>    http://www.spinics.net/lists/arm-kernel/msg508809.html
> 
> I will resend when Marc's patch hits current release.

Ok, not merged.


-Olof
