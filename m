From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL] Samsung SoC EXYNOS5250 arch for v3.4
Date: Fri, 16 Mar 2012 12:50:11 +0000
Message-ID: <201203161250.11353.arnd@arndb.de>
References: <4F61FA0D.1050007@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.10]:58961 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1030320Ab2CPMuS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 16 Mar 2012 08:50:18 -0400
In-Reply-To: <4F61FA0D.1050007@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Olof Johansson' <olof@lixom.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

On Thursday 15 March 2012, Kukjin Kim wrote:
> Hi Arnd, Olof,
> 
> Thank you for kindly review for EXYNOS5 and addressed comments.
> 
> Here are 'pull request' for supporting EXYNOS5250.
> 
> Please pull from:
>    git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
> next/soc-exynos5250-arch
> 
> It is based on next/devel-samsung-dma which has been pulled into arm-soc 
> to avoid merge conflicts, because they touches same files.
> And it is including additional two commits, one commit for fix 
> exynos4-dt build error which is caused by this series and one for 
> supporting lcd clkdev.
> 
> If any problems, please kindly let me know.

As you may have noticed from Stephen's notification about the merge
conflict, I have put this into the next/soc2 branch now.

I'm not too happy with the resolution of my comments, but in the
end I think it's better to have it in the tree than not have it.
While you did reply with explanations for why some of the patches
were necessary, you did not actually put the explanations into 
the changeset descriptions but only sent a reply to my emails.

I don't think that the merge conflict is problematic, especially
since Linus won't see the same thing that Stephen did, but as I
wrote in the other mail, please check that my resolution was correct.

	Arnd
