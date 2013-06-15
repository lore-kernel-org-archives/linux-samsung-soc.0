From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] clocksource: samsung_pwm_timer: Do not request PWM mem
 region
Date: Sat, 15 Jun 2013 11:25:30 +0900
Message-ID: <172601ce696f$9b4db310$d1e91930$%kim@samsung.com>
References: <1371151364-8121-1-git-send-email-tomasz.figa@gmail.com>
 <20130614215134.GG17326@quad.lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:31013 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751512Ab3FOCZc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 14 Jun 2013 22:25:32 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MOE002Z5XEH4E10@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 15 Jun 2013 11:25:31 +0900 (KST)
In-reply-to: <20130614215134.GG17326@quad.lixom.net>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Olof Johansson' <olof@lixom.net>, 'Tomasz Figa' <tomasz.figa@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 'Arnd Bergmann' <arnd@arndb.de>, john.stultz@linaro.org, tglx@linutronix.de

Olof Johansson wrote:
> 
> On Thu, Jun 13, 2013 at 09:22:44PM +0200, Tomasz Figa wrote:
> > PWM registers are shared between clocksource and PWM drivers and so can
> > not be claimed for exclusive use.
> >
> > Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>
> 
> Acked-by: Olof Johansson <olof@lixom.net>

Thanks, applied.

- Kukjin
