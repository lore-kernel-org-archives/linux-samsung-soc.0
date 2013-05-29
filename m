From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: Booting mainline kernels on Samsung ARM-based Chromebooks
Date: Wed, 29 May 2013 09:41:28 +0900
Message-ID: <180101ce5c05$41d82800$c5887800$%kim@samsung.com>
References: <CAOesGMgrT8fCRcnJYP=tcr4Szp5B6NtQxsQeb6pEv24edHLYFw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:15585 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932990Ab3E2Alp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 28 May 2013 20:41:45 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MNJ000KKB95C550@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 29 May 2013 09:41:29 +0900 (KST)
In-reply-to: <CAOesGMgrT8fCRcnJYP=tcr4Szp5B6NtQxsQeb6pEv24edHLYFw@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Olof Johansson' <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Olof Johansson wrote:
> 
> Just a quick note that as of v3.10-rc4 (or -rc3 + arm-soc fixes
> branch) there should be enough pieces in mainline to boot a Chromebook
> to a useful state without out-of-tree patches.
> 
Sounds great. Yeah, we wanted to support mass product without any other
patches and its first product using Samsung SoC is Samsung ARM-based
Chromebook.

Thanks for many guys' effort and time.

- Kukjin

> For more info, see:
> 
> https://plus.google.com/u/0/109993695638569781190/posts/bQpzEGG15G8
> 
> There's plenty of stuff not working yet, but it'll come up with
> simplefb, keyboard, trackpad and USB 2.0 for now.
