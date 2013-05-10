From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [GIT PULL] Late Exynos stuff for v3.10
Date: Fri, 10 May 2013 09:31:11 +0900
Message-ID: <046301ce4d15$ac1592b0$0440b810$%kim@samsung.com>
References: <5176B499.1000208@samsung.com> <51770697.7080504@samsung.com>
 <20130424000638.GA9067@quad.lixom.net> <51794E10.1010205@samsung.com>
 <CAOesGMjA5_XUXMcCL3roZiLC1S=ypMoVHn2tF7bzUuKr+eLw2A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:38245 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756854Ab3EJAbZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 9 May 2013 20:31:25 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MMK00DKT43LXI30@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 10 May 2013 09:31:12 +0900 (KST)
In-reply-to: <CAOesGMjA5_XUXMcCL3roZiLC1S=ypMoVHn2tF7bzUuKr+eLw2A@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Olof Johansson' <olof@lixom.net>
Cc: 'Arnd Bergmann' <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Olof Johansson wrote:
> 
> Kukjin,
> 
Hi Olof,

[...]

> > And let me send pull-request again for fix and late dt branch with
> separated
> > branches in a couple of hours not including usb stuff...
> 
> Refresh my memory here, what was the reason for dropping the USB DTS
> updates? (Yes, I am aware it might because I asked you not to send
> them in but I don't remember :-).
> 
Hmm...let me see, yeah, the USB DTS updates dropped because of late
pull-request stuff as you concerned.
http://www.spinics.net/lists/arm-kernel/msg240105.html

Since I didn't want to make a noise at that time, so I dropped for v3.10, it
has been included in my tree for some time though.

> Also, when you drop stuff, please, please don't keep it in your own

Ooops, it's my mistake. I didn't updated my tree not in my local :-(

> for-next branch. The end result is that we'll keep testing something
> on linux-next with the anticipation that it will work when it lands in
> the merge window, when that's not the truth if you're not going to
> send the pull requests up.
> 
> So, if you decide to keep code like this out of the merge window (or
> if we push back at it and say no to it), then remove it from your
> for-next branch as well.
> 
Perfectly right and I agree.

> In particular, the usb phy node for usb2 would ber very good to get in
> for 3.10, since it's a critical piece to get usb2 working on the
> Chromebook.
> 
Yes, I think so, let me sort them out.

Thanks.

- Kukjin
