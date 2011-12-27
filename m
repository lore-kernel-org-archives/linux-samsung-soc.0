From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [rtc-linux] Re: [PATCH v2 0/4] Implement RTC support for
 S3C2443/S3C2416/S3C2450
Date: Tue, 27 Dec 2011 09:44:52 +0900
Message-ID: <08e301ccc430$beb4dc60$3c1e9520$%kim@samsung.com>
References: <201112121543.42299.heiko@sntech.de>
 <064801ccbfb1$c5d48e60$517dab20$%kim@samsung.com>
 <201112210922.12300.heiko@sntech.de> <20111223114300.GA13175@sirena.org.uk>
 <20111226020119.2c57a26e@linux.lan.towertech.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:57039 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753147Ab1L0Ao4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 26 Dec 2011 19:44:56 -0500
Received: from epcpsbgm1.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LWU00FKH7EUUM90@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 27 Dec 2011 09:44:54 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.114])
 by mmp2.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LWU005K17ES2F00@mmp2.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Tue, 27 Dec 2011 09:44:54 +0900 (KST)
In-reply-to: <20111226020119.2c57a26e@linux.lan.towertech.it>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Alessandro Zummo' <a.zummo@towertech.it>, rtc-linux@googlegroups.com
Cc: broonie@opensource.wolfsonmicro.com, 'Heiko St?bner' <heiko@sntech.de>, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Alessandro Zummo wrote:
> 
> On Fri, 23 Dec 2011 11:43:00 +0000
> Mark Brown <broonie@opensource.wolfsonmicro.com> wrote:
> 
> > > Who is Andrew and should I include him in the recipients? I only found
> > > Alessandro Zummo in the MAINTAINERS file for rtc stuff and am lacking
> any
> > > comment from the rtc-side until now.
> >
> > Andrew Morton.  Alessandro hasn't been terribly active for a while now.
> 
>  But I'm still keeping an eye on the patches ;)
> 
Hi Alessandro,

Good to see you again :)

Please check next-samsung-devel-rtc branch in my tree,
git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git

And if you're ok to send to upstream via samsung tree, please let me know so
that I can add your ack on rtc patches. Of course, if any problems, let me
revert them and they should be re-worked.

As a note, it depends on next-samsung-devel-dt1 which includes support
device tree for Samsung stuff, so I rebased on it.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
