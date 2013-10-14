From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [GIT PULL] Samsung fixes-1 for v3.12
Date: Mon, 14 Oct 2013 09:24:54 +0900
Message-ID: <16f101cec873$ce47a880$6ad6f980$%kim@samsung.com>
References: <525B1722.5060001@samsung.com>
 <CAOesGMirL+uR0xL9o0oqhfVa4KKsDeaCjkJyarAJr5vmZPg4Eg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:25018 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755399Ab3JNAY4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 13 Oct 2013 20:24:56 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MUM00FTJUHJ0J50@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 14 Oct 2013 09:24:55 +0900 (KST)
In-reply-to: <CAOesGMirL+uR0xL9o0oqhfVa4KKsDeaCjkJyarAJr5vmZPg4Eg@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Olof Johansson' <olof@lixom.net>
Cc: 'Arnd Bergmann' <arnd@arndb.de>, 'Kevin Hilman' <khilman@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, arm@kernel.org, 'Alexander Shiyan' <shc_work@mail.ru>

Olof Johansson wrote:
> 
> Hi,
> 
Hi,

> On Sun, Oct 13, 2013 at 2:56 PM, Kukjin Kim <kgene.kim@samsung.com> wrote:
> > Alexander Shiyan (1):
> >       ARM: SAMSUNG: Fix switching FIFO in arch_enable_uart_fifo function
> 
> What's the regression that this is fixing? As far as I can tell, the
> code has been the same since 2008. Or did something surrounding it
> change?
> 
Yeah, you're right. Actually I has queued it into non-critical before but
missed to sent out. OK, I agree with you and let me sort out again.

> >
> > Bartlomiej Zolnierkiewicz (1):
> >       ARM: dts: fix PL330 MDMA1 address in DT for Universal C210 board
> >
> > Jingoo Han (1):
> >       ARM: dts: Remove DP PHY node from exynos5250.dtsi
> 
> You are sending this in pretty late. Please be careful about conflicts
> due to this late revert, in particular if you plan on re-introducing
> something in 3.13.
> 
As you know, unfortunately, DP PHY node change applied in DTS without
changing driver in 3.12 so current 3.12 kernel cannot support it. I want
3.12 kernel to support it properly and yes, I have a plan to re-introduce DP
PHY node in 3.13. BTW if you have objection, maybe I will send it to stable
3.12 instead...

> > Tomasz Figa (1):
> >       ARM: dts: Work around lack of cpufreq regulator lookup for
> > exynos4210-origen and trats boards
> >
> > Youngmin Nam (1):
> >       ARM: dts: Fix a typo on Exynos5440 DTS files
> 
> This is a bad patch subject, it can be way more specific. Also, this
> is a good reason not to have these elaborate bootargs in the DTS, in
> particular for modern platforms -- the bootargs should come from
> firmware for your platform.
> 
Agreed. The subject should be clear...Anyway current bootargs in DTS is
wrong so I think, it should be fixed, I agree with you about bootargs
though.

Thanks,
Kukjin
