From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: RE: [GIT PULL] Samsung fixes-2 for v3.4
Date: Wed, 25 Apr 2012 07:59:21 +0200
Message-ID: <016501cd22a8$8fd16f90$af744eb0$%szyprowski@samsung.com>
References: <4F89A0A5.5030806@samsung.com>
 <CAOesGMhp48Kh+tJ1534G=ze0CEcVBpaPQxVKs8A31difVw9h9Q@mail.gmail.com>
 <4F974625.1030607@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:32601 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758066Ab2DYF7e (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 25 Apr 2012 01:59:34 -0400
Received: from euspt1 (mailout2.w1.samsung.com [210.118.77.12])
 by mailout2.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0M30006A8TZ12U@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 25 Apr 2012 06:59:25 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0M3000GQITZ78D@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 25 Apr 2012 06:59:31 +0100 (BST)
In-reply-to: <4F974625.1030607@samsung.com>
Content-language: pl
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kukjin Kim' <kgene.kim@samsung.com>, 'Olof Johansson' <olof@lixom.net>
Cc: 'Arnd Bergmann' <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Hi Kukjin,

On Wednesday, April 25, 2012 2:33 AM Kukjin Kim wrote:

> > Looking at your current fixes-3 branch, it's unclear at a quick glance
> > why the clk_type patch is a bugfix, and especially why it is a
> > regression fix -- it looks like a cleanup. We're very close to 3.4-rc3
> 
> I agree that the removing clk_type member in sdhci platform data should
> be included in cleanup stuff, it is useless in current mainline though.
> 
> Marek, is this ok to you?

Yes, this patch is not strictly needed to get SDHCI working again on v3.4-rcX.

Best regards
-- 
Marek Szyprowski
Samsung Poland R&D Center
