From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] ARM: EXYNOS: Add ARCH_EXYNOS and reorganize arch/arm/mach-exynos
Date: Mon, 03 Oct 2011 11:33:16 +0200
Message-ID: <5785830.Sj7W4aL3qy@wuerfel>
References: <001f01cc80e5$3abd1c80$b0375580$%kim@samsung.com> <CAH9JG2UNwZxDTPnwjohxhCumKZx_mWcPUn2rROjmjmROoxF07w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.8]:53006 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753788Ab1JCJd3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 3 Oct 2011 05:33:29 -0400
In-Reply-To: <CAH9JG2UNwZxDTPnwjohxhCumKZx_mWcPUn2rROjmjmROoxF07w@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kyungmin Park <kmpark@infradead.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Russell King <rmk+kernel@arm.linux.org.uk>, =?utf-8?B?7KCV6rK97ZeML1MvVyBTb2x1dGlvbuqwnOuwnO2MgChTLkxTSSkvRTUo7LGF7J6EKS/sgrzshLHsoITsnpA=?= <kyoungheon@samsung.com>

On Monday 03 October 2011 13:02:16 Kyungmin Park wrote:
> I'm afraid to change machine directory name again. mach-s5pv310 ->
> mach-exynos4 -> mach-exynos.
> As I remember linus blamed the renaming the file names are happened
> frequently at ARM

I tend to agree with this. While the new name does make more sense,
I would first like to see the bigger plan. If you are eventually
planning to consolidate all of mach-s5p64x0, mach-s5pc100, mach-s5pv210,
mach-exynos4 and plat-s5p into one common mach-s5p or mach-exynos
directory, I'm all for that because it reduces code duplication
and work required for the overall cross-subarchitecture single zimage
work.

Simply renaming something because the name does not quite fit entirely
should be done very carefully.

	Arnd
