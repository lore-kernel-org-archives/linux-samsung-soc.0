From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v2] ARM: dts: disable MDMA1 node for Exynos5420
Date: Wed, 23 Apr 2014 07:41:34 +0900
Message-ID: <00ff01cf5e7c$0395ac50$0ac104f0$@samsung.com>
References: <000a01cf5e2b$87601760$96204620$%jun@samsung.com>
 <20140422134554.GA6991@e102654-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:58628 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751463AbaDVWlg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 22 Apr 2014 18:41:36 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N4G0074IF1ABW60@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 23 Apr 2014 07:41:34 +0900 (KST)
In-reply-to: <20140422134554.GA6991@e102654-lin.cambridge.arm.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Javi Merino' <javi.merino@arm.com>, 'Seungwon Jeon' <tgih.jun@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 'Tushar Behera' <tushar.behera@linaro.org>

Javi Merino wrote:
> 
> On Tue, Apr 22, 2014 at 02:05:26PM +0100, Seungwon Jeon wrote:
> > This change places MDMA1 in disabled node for Exynos5420.
> > If MDMA1 region is configured with secure mode, it makes
> > the boot failure with the following on smdk5420 board.
> > ("Unhandled fault: imprecise external abort (0x1406) at 0x00000000")
> > Thus, arndale-octa board don't need to do the same thing anymore.
> >
> > Signed-off-by: Seungwon Jeon <tgih.jun@samsung.com>
> 
> I've had some problem applying it (wrong EOL?).  Not sure if it's my

Probably, it is due to Seungwon's e-mail client ;-)

> email client.  In any case, I've manually fixed the rejects and tested
> it in my Arndale Octa.  It works for me so
> 
> Tested-by: Javi Merino <javi.merino@arm.com>

Anyway, thanks for your test.

I will apply but I'm not sure this is critical bug or not for smdk5420...

Thanks,
Kukjin
