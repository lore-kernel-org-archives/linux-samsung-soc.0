From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: S3C64XX: Slow down mic detection rate for wm5102
Date: Mon, 11 Mar 2013 10:31:43 +0900
Message-ID: <04e501ce1df8$3054c5c0$90fe5140$%kim@samsung.com>
References: <1361534564-2082-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <20130222121007.GB19796@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:18259 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753425Ab3CKBbp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 10 Mar 2013 21:31:45 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MJH007IW2WW7FH0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 11 Mar 2013 10:31:44 +0900 (KST)
In-reply-to: <20130222121007.GB19796@opensource.wolfsonmicro.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Mark Brown' <broonie@opensource.wolfsonmicro.com>, 'Charles Keepax' <ckeepax@opensource.wolfsonmicro.com>
Cc: ben-linux@fluff.org, patches@opensource.wolfsonmicro.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Mark Brown wrote:
> 
> On Fri, Feb 22, 2013 at 12:02:44PM +0000, Charles Keepax wrote:
> 
> > switch: arizona: Support microphone detection rate configuration
> > commit 2e033db5ddf299de2ae568919d78b0258a5a6423
> 
> The commit ID is correct there, the commit log is (as you'd expect)
> extcon:
> 
> Acked-by: Mark Brown <broonie@opensource.wolfsonmicro.com>

Applied, thanks.

- Kukjin
