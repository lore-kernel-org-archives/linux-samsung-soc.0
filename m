From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: Cleanup Samsung stuff
Date: Tue, 19 Apr 2011 11:23:14 +0900
Message-ID: <BANLkTimTuQ1YE8Xu04NyMZxF42KGDr_XBQ@mail.gmail.com>
References: <012801cbfe33$a76fa490$f64eedb0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ey0-f174.google.com ([209.85.215.174]:55137 "EHLO
	mail-ey0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753926Ab1DSCXP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 18 Apr 2011 22:23:15 -0400
Received: by eyx24 with SMTP id 24so1561344eyx.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 18 Apr 2011 19:23:14 -0700 (PDT)
In-Reply-To: <012801cbfe33$a76fa490$f64eedb0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: LAK <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>, Russell King <rmk+kernel@arm.linux.org.uk>, Marek Szyprowski <m.szyprowski@samsung.com>, =?UTF-8?B?7ZWo66qF7KO8?= <myungjoo.ham@samsung.com>, =?UTF-8?B?64yA7J246riw?= <inki.dae@samsung.com>

On Tue, Apr 19, 2011 at 10:46 AM, Kukjin Kim <kgene.kim@samsung.com> wrote:
> Hi all,
>
> I think, you know about current situation of Linux ARM world.
>
> So...
>
> As Russell suggested, I also will focus on consolidations and bug fixes for
> Samsung stuff for a while so don't complain about missing new stuff. In my
> opinion, we can keep going it later...
>
> As a note, I'm doing(or preparing) following at the moment.
>
> - Removing some "mach-s5pxxxx"s
Why not mach-s3c series? don't you think too much plat-{s3c, s5p,
samsung}? how about to use the plat-samsung only?
> - Removing useless header files in include/{mach,plat} of Samsung
> - Samsung GPIO stuff cleanup/consolidation
> - Samsung DMA stuff consolidation?
   -> Move to dmaengine and use it.
> - Device tree (with Linaro)
> - and so on...

   - Strange Samsung Clock and names consolidation.
   - IRQ stuff (some parts are done by tglx but need to use the
generic IRQ base instead of odd +32 magic)
   - generic IOMMU consolidation.

BTW, who works on this at LSI?

Thank you,
Kyungmin Park
