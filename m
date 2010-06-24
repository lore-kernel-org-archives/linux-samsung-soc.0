From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 2/3] ARM: S5P: Add System define for arch_reset()
Date: Thu, 24 Jun 2010 22:11:36 +0900
Message-ID: <012e01cb139e$c9ac8bc0$5d05a340$%kim@samsung.com>
References: <1277332317-30192-1-git-send-email-kgene.kim@samsung.com>
 <1277332317-30192-3-git-send-email-kgene.kim@samsung.com>
 <AANLkTim2s6syCjpl5v_qVloktrzz27JsSrR6kgWqNHUm@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:28870 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755255Ab0FXNLg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 24 Jun 2010 09:11:36 -0400
Received: from epmmp2 (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L4I0091GSNBAZ20@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 24 Jun 2010 22:11:35 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L4I00C3ASNAD4@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 24 Jun 2010 22:11:35 +0900 (KST)
In-reply-to: <AANLkTim2s6syCjpl5v_qVloktrzz27JsSrR6kgWqNHUm@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kyungmin Park' <kmpark@infradead.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, 'Jongpill Lee' <boyko.lee@samsung.com>

Kyungmin Park wrote:
> 
> On Thu, Jun 24, 2010 at 7:31 AM, Kukjin Kim <kgene.kim@samsung.com> wrote:
> > From: Jongpill Lee <boyko.lee@samsung.com>
> >
> > This patch adds system define for arch_reset() using Watchdog reset.
> > And adds IO mapping for using WDT.
> 
> Are there any reason to use the WDT to system reset?

Yeah, I already commented about that.
Now Samsung SoC hardware engineer recommends to use the reset of watchdog
instead of software reset by restriction of hardware environment.

> As original purpose of WDT. doesn't it better to use system reset?

Original purpose? I think, WDT can be used as software reset.

> Since we use the WDT reset at other purpose. but if you add the WDT
> reset to system reset.
> then we can't control it. bootloader check the reset reason then
> report something wrong at previous operation.

Yeah, I know your needs. If watchdog reset used as software reset, can't
distinguish who call watchdog reset.
And actually, need to check/debug about abnormal reset status when called
watchdog reset.

> 
> So I want to use system reset as original purpose.
> 
Yes, I think so, if can be used SWRESET, will add that functionality.
But right now...no.

(snip)

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
