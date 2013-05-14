From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [GIT PULL] Late Exynos stuff for v3.10
Date: Tue, 14 May 2013 21:31:09 +0900
Message-ID: <093801ce509e$e98b2bf0$bca183d0$%kim@samsung.com>
References: <5176B499.1000208@samsung.com> <51770697.7080504@samsung.com>
 <20130424000638.GA9067@quad.lixom.net> <51794E10.1010205@samsung.com>
 <CAOesGMjA5_XUXMcCL3roZiLC1S=ypMoVHn2tF7bzUuKr+eLw2A@mail.gmail.com>
 <046301ce4d15$ac1592b0$0440b810$%kim@samsung.com> <5191CE53.5050902@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:20798 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757258Ab3ENMbK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 14 May 2013 08:31:10 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MMS00GI1G3X6OA0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 14 May 2013 21:31:09 +0900 (KST)
In-reply-to: <5191CE53.5050902@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Tushar Behera' <tushar.behera@linaro.org>
Cc: 'Olof Johansson' <olof@lixom.net>, 'Arnd Bergmann' <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Tushar Behera wrote:
> 
> >> Refresh my memory here, what was the reason for dropping the USB DTS
> >> updates? (Yes, I am aware it might because I asked you not to send
> >> them in but I don't remember :-).
> >>
> > Hmm...let me see, yeah, the USB DTS updates dropped because of late
> > pull-request stuff as you concerned.
> > http://www.spinics.net/lists/arm-kernel/msg240105.html
> >
> > Since I didn't want to make a noise at that time, so I dropped for
v3.10,
> it
> > has been included in my tree for some time though.
> >
> 
> Will it be possible to queue them up for one of the RC releases? They
> are only DTS entries, the drivers have already been merged.
> 
Well, I think, it's possible to send the usb phy node for usb2 for v3.10
because it's critical at this moment.

Others should be queued for v3.11.

Thanks.

- Kukjin
