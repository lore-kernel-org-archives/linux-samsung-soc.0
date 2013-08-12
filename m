From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [GIT PULL] Samsung PWM support cleanup
Date: Mon, 12 Aug 2013 19:05:17 +0900
Message-ID: <0bcb01ce9743$72337120$569a5360$%kim@samsung.com>
References: <3573853.gDiLaTfgOu@flatron> <520173EF.1040808@samsung.com>
 <2197909.dzUDYPGiF0@flatron> <20130811231707.GF26757@quad.lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:62755 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756027Ab3HLKFT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 12 Aug 2013 06:05:19 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MRE007MGXCTHZK0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 12 Aug 2013 19:05:17 +0900 (KST)
In-reply-to: <20130811231707.GF26757@quad.lixom.net>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Olof Johansson' <olof@lixom.net>, 'Tomasz Figa' <tomasz.figa@gmail.com>
Cc: 'Arnd Bergmann' <arnd@arndb.de>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 'Andrew Bresticker' <abrestic@chromium.org>

Olof Johansson wrote:
> 

[...]

> > > Just note that I also have pulled into samsung tree because of
> > > dependency with others, this will be pulled directly by Olof though.
> >
> > Have you already pulled this into your tree? There was a patch[1] that
> was
> > posted for 3.11 at the time this series was merged in your for-next
> > branch, before it got dropped, that fixed one found build issue that I
> > missed.
> >
> > In the end the series got dropped, that patch was not applied and I
> forgot
> > about this issue. This was caught by Andrew Bresticker after I already
> > sent my pull request.
> >
> > According to Olof, he hasn't pulled this yet and you don't seem to have
> it
> > in your public tree either, so we could either drop this pull request
> and
> > send another one with the fixup patch squashed or apply the fixup patch
> > separately on top of this. What do you think?
> 
> I have not pulled anything from Kukjin yet, so please respin your branch
> as
> needed, Tomasz. Also, see the reply about making a signed tag.
> 
OK, I see. Let me drop this in my local and will wait for Tomasz' new pull
request.

Thanks,
Kukjin
