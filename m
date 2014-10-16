From: Kukjin Kim <kgene@kernel.org>
Subject: RE: [GIT PULL 2/2] Samsung defconfig updates for v3.18
Date: Thu, 16 Oct 2014 10:01:06 +0900
Message-ID: <00e601cfe8dc$abf25bb0$03d71310$@kernel.org>
References: <543DB158.7030303@samsung.com>
 <CAOesGMgRBq93diDmA-21UYkFQTZu+LiF9gV+A==GS5uGW9n-Vg@mail.gmail.com>
 <1413380267.4565.1.camel@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:10222 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751001AbaJPBBL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 15 Oct 2014 21:01:11 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NDI006HVITXWE40@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 16 Oct 2014 10:01:09 +0900 (KST)
In-reply-to: <1413380267.4565.1.camel@collabora.co.uk>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sjoerd Simons' <sjoerd.simons@collabora.co.uk>, 'Olof Johansson' <olof@lixom.net>
Cc: 'Arnd Bergmann' <arnd@arndb.de>, 'Kevin Hilman' <khilman@linaro.org>, arm@kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Sjoerd Simons wrote:
> > On Tue, 2014-10-14 at 23:32 -0700, Olof Johansson wrote:
> > On Tue, Oct 14, 2014 at 4:27 PM, Kukjin Kim <kgene.kim@samsung.com> wrote:
> > >   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> > > tags/samsung-defconfig
> > >
> > > for you to fetch changes up to 508423bebcda29eb0ba7c627f895387dad7cdcd6:
> > >
> > >   ARM: exynos_defconfig: enable USB gadget support (2014-09-25 18:20:18
> > > +0900)
> >
> > Merged, thanks.
> 
> Hrm, enabling USB gadget support will actually regress USB on Exynos
> peach boards and Arndale Octa without some of the DT fixes that landed
> in armsoc next/late branch. Specifically:
> 
> 5c42acdbffff9bab595482b966b22ab5e2f6f359
> dbb62ef9ade6e92737d3fac199665b8b7c455959
> 
Yeah...I've missed it. Sorry.

> Might be good to cherry-pick those into for-next at this point (they're
> rather trivial)
> 
So...Olof, can you please cherry pick them into arm-soc/fixes? Or shall I send
pull-request for them again?

- Kukjin
