From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: Samsung-clk patches for 3.15
Date: Tue, 28 Jan 2014 09:09:29 +0900
Message-ID: <251c01cf1bbd$36802390$a3806ab0$@samsung.com>
References: <52E27AE9.7040501@samsung.com> <52E6EDC1.9080003@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:59113 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751508AbaA1AJc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 27 Jan 2014 19:09:32 -0500
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N0300DSL4FVYC50@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 28 Jan 2014 09:09:31 +0900 (KST)
In-reply-to: <52E6EDC1.9080003@gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Tomasz Figa' <tomasz.figa@gmail.com>, 'Tomasz Figa' <t.figa@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: a.hajda@samsung.com, 'Naveen Krishna Chatradhi' <ch.naveen@samsung.com>, thomas.ab@samsung.com, 'Rahul Sharma' <rahul.sharma@samsung.com>, 'Mike Turquette' <mturquette@linaro.org>

Tomasz Figa wrote:
> 
> [Forgot to Cc Mike...]
> 
> On 24.01.2014 15:38, Tomasz Figa wrote:
> > Hi,
> >

Hi,

> > Linux 3.14 is going to include Andrzej Hajda's patches converting
> > Samsung clock drivers to use clock ID defines in include/dt-bindings,
> > instead of local enums, but to avoid unnecessary merge conflicts we
> > have converted only the clock driver, leaving DTS files unchanged yet.
> >
> > We intend to complete the conversion in 3.15, by replacing magic
> > numbers in DTS files with respective preprocessor macros, but to
> > reduce potential conflicts we need help of you, Samsung clock patches
> authors :).
> >
> > I'd like to ask anybody who already has patches for DTS files adding
> > any clock-related contents still using numeric IDs, e.g. clock
> > properties in nodes or full nodes containing clock properties, to make
> > sure that the patches are merged before Andrzej sends the conversion
> > patches. Then Andrzej's script will generate patches updating all
> > clock properties, leaving no numeric IDs in DTS files.
> >

There are several DTS patches in v3.14-drop/soc-exynos-2 branch of my tree
for 3.15 and it will be merged after done of multiplatform, I need to rebase
them based on v3.14-rc1 though...So I think, would be better if we could
update DTS with using Andrzej's script after merging it into arm-soc...

> > If you are just starting your work on a patch that introduces changes
> > as mentioned above, please make sure to already use clock macros, not
> > numeric IDs. Otherwise you risk having needless rebases with a lot of
> > conflicts. You have been warned ;).
> >

Thanks,
Kukjin
