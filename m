From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 0/4] s3c-fb: Add support S5PV310 FIMD
Date: Tue, 14 Jun 2011 14:10:31 +0900
Message-ID: <005301cc2a51$675ff040$361fd0c0$%kim@samsung.com>
References: <1307693723-14971-1-git-send-email-anand.kn@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:64625 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750878Ab1FNFKm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 14 Jun 2011 01:10:42 -0400
Received: from epcpsbgm1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LMR00LNIL0SOND0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 14 Jun 2011 14:10:40 +0900 (KST)
Received: from kgenekim ([12.23.119.139])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LMR006L5L1RSE@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 14 Jun 2011 14:10:40 +0900 (KST)
In-reply-to: <1307693723-14971-1-git-send-email-anand.kn@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Anand Kumar N' <anand.kn@samsung.com>, lethal@linux-sh.org, linux-samsung-soc@vger.kernel.org, jg1.han@samsung.com, jonghun.han@samsung.com, thomas.ab@samsung.com

Anand Kumar N wrote:
> 
> This patch series is based on the latest
> git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git for-next
> 
> This was originally submitted by Jonghun Han <jonghun.han@samsung.com>
> http://www.spinics.net/lists/arm-kernel/msg101781.html
> This patchset has been not picked up in the mainline due to the
unavailibility
> of cldev lookup. So it is being re-submitted rebased to 3.0.0-rc1 and
tested
> over the clkdev patches.
> 
> This patch adds support FIMD(Fully Interactive Mobile Display) on S5PV310.
> The 3rd patch is update s3c-fb for it and others are for platform data.
> 
> o To Kukjin Kim
> [RE-SEND][PATCH 1/4] ARM: S5PV310: Add FIMD resource definition
> [RE-SEND][PATCH 2/4] ARM: S5PV310: Add platform device and helper
functions
> for FIMD
> [RE-SEND][PATCH 4/4] ARM: S5PV310: Add platform data for S5PV310 FIMD and
> LTE480WV platform-lcd
> 
> o To Paul Mundt
> [RE-SEND][PATCH 3/4] s3c-fb: Add support S5PV310 FIMD
> 

Hi Anand,

Where is your "Signed-off-by"? It must be added...

In addition, what's the "Change-Id" in 3rd and 4th patches? I know what it
is.
I mean why did you add it here for mainline?...

Please make sure that your patch has no problem before submitting.

Jingoo, Jonghun do you agree with this?

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
