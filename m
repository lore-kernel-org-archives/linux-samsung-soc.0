From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: samsung: adc: fix race in s3c_adc_start
Date: Fri, 13 Jul 2012 20:28:10 +0900
Message-ID: <117d01cd60ea$9544a4d0$bfcdee70$%kim@samsung.com>
References: <1342059131-31251-1-git-send-email-toddpoynor@google.com>
 <20120712123125.GJ18513@trinity.fluff.org> <4FFF5287.8000608@samsung.com>
 <20120713013529.GA16856@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:32954 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754938Ab2GML2M (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 13 Jul 2012 07:28:12 -0400
Received: from epcpsbgm2.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M73008R5JUZJYO0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 13 Jul 2012 20:28:11 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M73002BCJUZEH80@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 13 Jul 2012 20:28:11 +0900 (KST)
In-reply-to: <20120713013529.GA16856@google.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Todd Poynor' <toddpoynor@google.com>
Cc: 'Ben Dooks' <ben@trinity.fluff.org>, eunki_kim@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 'Ben Dooks' <ben-linux@fluff.org>

Todd Poynor wrote:
> 
> On Fri, Jul 13, 2012 at 07:41:11AM +0900, Kukjin Kim wrote:
> > BTW, Todd, do you want to keep the 'Change-Id' in mainline?
> > If you don't mind, I'd like to remove it...
> 
> Oops, I forgot to take it out, please do remove it, thanks.
> 
Sure, will remove when I apply this into -fixes.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
