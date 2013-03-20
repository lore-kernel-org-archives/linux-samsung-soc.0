From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: RE: [PATCH v6 00/16] clk: exynos4/5: migrate to common clock
 framework
Date: Wed, 20 Mar 2013 13:50:05 +0900
Message-ID: <11af01ce2526$63b0a8f0$2b11fad0$%kim@samsung.com>
References: <1361175686-19400-1-git-send-email-thomas.abraham@linaro.org>
 <20130319184938.8663.18115@quantum> <201303192212.16877.heiko@sntech.de>
 <20130319215038.8663.83548@quantum>
 <116a01ce24fd$e32658b0$a9730a10$%kim@samsung.com>
 <20130320025656.11073.90469@quantum>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:51290 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752352Ab3CTEuH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 20 Mar 2013 00:50:07 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MJY00BL103C4W90@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 20 Mar 2013 13:50:05 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.199])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MJY00KJJ03H5PL0@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 20 Mar 2013 13:50:05 +0900 (KST)
In-reply-to: <20130320025656.11073.90469@quantum>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Mike Turquette' <mturquette@linaro.org>, =?utf-8?Q?'Heiko_St=C3=BCbner'?= <heiko@sntech.de>
Cc: 'Thomas Abraham' <thomas.abraham@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, t.figa@samsung.com, sylvester.nawrocki@gmail.com

Mike Turquette wrote:
> 
> Quoting Kukjin Kim (2013-03-19 17:00:09)
> > Mike Turquette wrote:
> > >
> >
> > [...]
> >
> > > > > Thomas,
> > > > >
> > > > > Are you planning a V7 series which includes the clock alias bits from
> > > > > patch #1?
> > > >
> > > > Kukjin has already applied this series into the linux-samsung tree [0].
> > > >
> > Thanks, Heiko.
> >
> > Mike, yes I did, as we discussed before. Since I missed in last window for
> v3.9, so I merged every common clock stuff for exynos into samsung tree in the
> early 3.9-rc time for v3.10.
> > >
> > > That really is too much code to go into drivers/clk without my ACK.  I
> > > have not made much noise about this in the past but there has been more
> > > and more "bonus" code slipping into drivers/clk each merge window.
> > > Let's not do that any more.
> > >
> >
> > Hmm, I remember you already agreed on previous version, and I thought if any
> further codes are required, we could do it on top of that.
> > http://lists.infradead.org/pipermail/linux-arm-kernel/2013-
> January/143429.html
> >
> 
> In the email you linked to my use of the word "merged" did not imply an
> ACK.  I was asking about merging the two separate exynos4 and exynos5
> ccf development efforts together.
> 
OK, I see.

> Furthermore if I *had* agreed on the previous version it would still
> have been appropriate to put my Acked-by on those patches, which is
> clearly missing today.
> 
BTW, how about following?

http://www.spinics.net/lists/arm-kernel/msg210266.html

In my understanding, it should be your agreement, it cannot be 'ack' though.

> > However, if you don't want current codes to be sent to upstream, let me know,
> but I don't think it would be better to us though.
> 
> No, I am not asking you to revert/drop the patches, but I am using this
> as a public example.
> 
What's the 'public example'?

As I linked, you already said 'sounds good to me' on my asking.

- Kukjin
