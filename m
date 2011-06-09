From: Sangbeom Kim <sbkim73@samsung.com>
Subject: RE: [alsa-devel] [PATCH 3/4] ASoC: SAMSUNG: Change platform driver	for
 SMDKs
Date: Fri, 10 Jun 2011 08:36:06 +0900
Message-ID: <04bd01cc26fe$0129d850$037d88f0$@com>
References: <1307606950-8310-1-git-send-email-sbkim73@samsung.com>
 <1307606950-8310-4-git-send-email-sbkim73@samsung.com>
 <20110609104648.GB12865@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:33087 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755398Ab1FIXgJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 9 Jun 2011 19:36:09 -0400
Received: from epcpsbgm1.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LMJ00C8NQW3RK20@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 10 Jun 2011 08:36:07 +0900 (KST)
Received: from DOSBKIM7301 ([12.23.119.77])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LMJ0005GQW7K4@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 10 Jun 2011 08:36:07 +0900 (KST)
In-reply-to: <20110609104648.GB12865@opensource.wolfsonmicro.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Mark Brown' <broonie@opensource.wolfsonmicro.com>
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, jassisinghbrar@gmail.com, kgene.kim@samsung.com, ben-linux@fluff.org, lrg@slimlogic.co.uk

On Thu, Jun 09, 2011 at 07:47PM +0900, Mark Brown wrote:
> 
> When you resubmit for the API change update it'd be helpful to update
> the changelog to explain why the platforms are being changed to use only
> internal DMA - what is the advantage this offers over regular DMA?  This
> will help users understand how they should configure their own systems.

OK, In the next vesion, I will add detail changelog for other users.

Thanks 
SB Kim
