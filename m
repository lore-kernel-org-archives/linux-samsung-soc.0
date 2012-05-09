From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 00/33] Use common macro to define resources
Date: Wed, 09 May 2012 21:55:23 +0900
Message-ID: <01b201cd2de2$ffa5d7d0$fef18770$%kim@samsung.com>
References: <1335327163-11794-1-git-send-email-tushar.behera@linaro.org>
 <201204250938.58397.heiko@sntech.de> <20120425101007.GM9142@game.jcrosoft.org>
 <201204251121.47358.arnd@arndb.de>
 <20120425113521.GW24211@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:47271 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752931Ab2EIMzZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 9 May 2012 08:55:25 -0400
Received: from epcpsbgm2.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M3R00MAUAKCFA40@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 09 May 2012 21:55:24 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M3R005NJAKBTD20@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 09 May 2012 21:55:24 +0900 (KST)
In-reply-to: <20120425113521.GW24211@n2100.arm.linux.org.uk>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Russell King - ARM Linux' <linux@arm.linux.org.uk>, 'Arnd Bergmann' <arnd@arndb.de>
Cc: 'Jean-Christophe PLAGNIOL-VILLARD' <plagnioj@jcrosoft.com>, =?ISO-8859-1?Q?'Heiko_St=FCbner'?= <heiko@sntech.de>, 'Tushar Behera' <tushar.behera@linaro.org>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, patches@linaro.org

Russell King - ARM Linux wrote:
> 
> On Wed, Apr 25, 2012 at 11:21:47AM +0000, Arnd Bergmann wrote:
> > Note that the point of the DEFINE_RES_*() macros is really to prevent
> > people from coming up with new silly macros to do the same thing, as
> > we've had in the past.
> 
> One of the other reaons was to stop the stream of resources with wrong
> endings (because people kept thinking it was exclusive rather than
> inclusive) - and the resulting stream of additional patches to fix those
> errors.
> 
> The legacy platforms do have those kinds of errors - when I converted
> SA11x0 as part of a previous patch set, I found a number suffering from
> this error.  (Were any found in this patch set?  I've not read through
> it.)
> 
> I think if this becomes a small %age of the change to Samsung stuff,
> and Kukjin is happy with it, it should go in.

Yes, agree. I will apply this whole series.
Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
