From: Jingoo Han <jg1.han@samsung.com>
Subject: Re: Booting mainline kernels on Samsung ARM-based Chromebooks
Date: Wed, 29 May 2013 10:07:16 +0900
Message-ID: <001901ce5c08$dc248e00$946daa00$@samsung.com>
References: <CAOesGMgrT8fCRcnJYP=tcr4Szp5B6NtQxsQeb6pEv24edHLYFw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:21536 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932863Ab3E2BHS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 28 May 2013 21:07:18 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MNJ000A6CF1C570@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 29 May 2013 10:07:17 +0900 (KST)
In-reply-to: <CAOesGMgrT8fCRcnJYP=tcr4Szp5B6NtQxsQeb6pEv24edHLYFw@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Olof Johansson' <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Jingoo Han <jg1.han@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, 'Doug Anderson' <dianders@chromium.org>, 'Simon Glass' <sjg@chromium.org>

On Wednesday, May 29, 2013 9:35 AM, Olof Johansson wrote:
> 
> Just a quick note that as of v3.10-rc4 (or -rc3 + arm-soc fixes
> branch) there should be enough pieces in mainline to boot a Chromebook
> to a useful state without out-of-tree patches.
> 
> For more info, see:
> 
> https://plus.google.com/u/0/109993695638569781190/posts/bQpzEGG15G8

Oh, great!

As Kukjin Kim mentioned, we have wanted to support mass product
without out-of-tree patches. Also, I have gone the extra mile
to do this.

> 
> There's plenty of stuff not working yet, but it'll come up with
> simplefb, keyboard, trackpad and USB 2.0 for now.

I will look at the patches about simplefb, USB 2.0, and so on.
If possible, I will review it.
Good luck.

Best regards,
Jingoo Han

> 
> 
> -Olof
> --
