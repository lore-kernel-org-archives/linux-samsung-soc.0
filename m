From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 3/6] ARM: SAMSUNG: pm: Adjust for pinctrl- and DT-enabled
 platforms
Date: Tue, 21 May 2013 19:06:12 +0200
Message-ID: <5854402.6rszAeKLin@amdc1227>
References: <1368807872-2601-1-git-send-email-t.figa@samsung.com>
 <CACRpkdbVnPhTMKDBtPNAka_V8H-2w2gK7prw9LVPRk_P7NMt7w@mail.gmail.com>
 <1738596.V1D84NEkmc@amdc1227>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:49086 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754751Ab3EURGS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 21 May 2013 13:06:18 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MN500ABARICMT00@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 21 May 2013 18:06:17 +0100 (BST)
In-reply-to: <1738596.V1D84NEkmc@amdc1227>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Doug Anderson <dianders@chromium.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>, Stephen Warren <swarren@wwwdotorg.org>, Thomas Abraham <thomas.abraham@linaro.org>, Prathyush K <prathyush.k@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

Just posted updated version of patch 6/6.

Best regards,
-- 
Tomasz Figa
Linux Kernel Developer
Samsung R&D Institute Poland
Samsung Electronics

On Tuesday 21 of May 2013 15:15:45 Tomasz Figa wrote:
> Hi Linus,
> 
> On Tuesday 21 of May 2013 13:29:23 Linus Walleij wrote:
> > On Fri, May 17, 2013 at 11:07 PM, Tomasz Figa <tomasz.figa@gmail.com> 
wrote:
> > > On Friday 17 of May 2013 13:56:39 Doug Anderson wrote:
> > >> I wouldn't be opposed to a re-spin to address some of the above, but I
> > >> also won't object to this landing and remaining issues being addressed
> > >> in future patches.  This patch definitely does make things better and
> > >> no worse.  :)
> > > 
> > > Let's see. If nobody takes this until Monday, which is very likely, I
> > > will
> > > send new version.
> > 
> > I applied 1 & 2 so pls repost your updated patches 3,4,5,6 on
> > monday and let's continue fixing.
> 
> Thanks.
> 
> Feel free to apply current version of patches 3, 4 and 5 as well. I will
> post updated patch 6 in a while.
> 
> Best regards,
> 
> > Yours,
> > Linus Walleij
> > --
> > To unsubscribe from this list: send the line "unsubscribe
> > linux-samsung-soc" in the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc"
> in the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
