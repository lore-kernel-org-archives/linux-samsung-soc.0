From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: SAMSUNG: Add plat-samsung as starting point for
	plat-s3c* moves
Date: Tue, 10 Nov 2009 10:33:14 +0900
Message-ID: <000a01ca61a5$c573d000$505b7000$%kim@samsung.com>
References: <1257812406-17360-1-git-send-email-ben-linux@fluff.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:61565 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751799AbZKJBb0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 9 Nov 2009 20:31:26 -0500
Received: from epmmp2 (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0KSV0045CDKHQD@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 10 Nov 2009 10:31:30 +0900 (KST)
Received: from kgenekim ([12.23.109.129])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0KSV00I4WDKHTH@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 10 Nov 2009 10:31:29 +0900 (KST)
In-reply-to: <1257812406-17360-1-git-send-email-ben-linux@fluff.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Ben Dooks' <ben-linux@fluff.org>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org


Hi, everyone

On Tue, Nov 10, 2009 at 9:20PM +0900, Ben Dooks wrote:

> We inted to re-organise the plat-s3c/plat-s3c24xx/plat-s3c64xx into a
> more generic plat-samsung with less code in the other plat- directories
> to make it easier to port new devices and try and clear up some of the
> naming issues with newer devices.
> 
> Start by creating a small arch/arm/plat-samsung with no actuall code in
> so we can move items in as we process them.
(snip)

Ok, good.

We will be creating plat-s5p following to plat-samsung and will be submitted
soon.

Thanks.
Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
System LSI Division, SAMSUNG ELECTRONICS CO., LTD.
