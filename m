From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v5 00/12] clk: exynos4: migrate to common clock framework
Date: Sun, 30 Dec 2012 17:37:08 -0800
Message-ID: <02f701cde6f7$5abbcc60$10336520$@samsung.com>
References: <1356827621-27617-1-git-send-email-thomas.abraham@linaro.org>
 <20121230052953.GB20903@quad.lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:58296 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755265Ab2LaBhV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 30 Dec 2012 20:37:21 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MFV0047VGHRHF90@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 31 Dec 2012 10:37:19 +0900 (KST)
Received: from visitor4lab ([105.128.18.157])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MFV00GYJGI43FA0@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 31 Dec 2012 10:37:19 +0900 (KST)
In-reply-to: <20121230052953.GB20903@quad.lixom.net>
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Olof Johansson' <olof@lixom.net>, 'Thomas Abraham' <thomas.abraham@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, mturquette@linaro.org, t.figa@samsung.com, sylvester.nawrocki@gmail.com

Olof Johansson wrote:
> 
> On Sat, Dec 29, 2012 at 04:33:29PM -0800, Thomas Abraham wrote:
> > Changes since v4:
> > - Rebased to linux-3.8-rc1.
> >
> > Changes since v3:
> > - Includes changes suggested by Tomasz Figa <tomasz.figa@gmail.com>
> >
> > This patch series migrates the Samsung Exynos4 SoC clock code to adopt
> the
> > common clock framework. The use of Samsung specific clock structures has
> > been removed and all board support code has been updated. imx-style of
> > clock registration and lookup has been adopted for device tree based
> > exynos4 platforms.
> 
> I'd prefer to see if exynos4 and 5 were kept common here, and both
> transitioned
> at the same time. Especially since there are no legacy boards for exynos5,
it
> would mean you could have a very clean transition there. What's the plan
to
> follow up with 5?
> 
Yeah, I'm working on EXYNOS5250 common clk stuff and Thomas is working on
EXYNOS5440. So I think, we can move on exynos4 and 5 both common clk at the
same time. Note, EXYNOS5 common clk stuff will be submitted in the beginning
of Jan.

> What are the plans to remove legacy board files on exynos4 at this time
> and switch them to DT-only? You could do it gradually like Stephen Warren
> did on Tegra, with hooks that call out to some of the legacy code, but
> configure the board through device tree and do away with the classic
> machine descriptors, etc.
> 
I had a plan to remove non-DT support on EXYNOS4 for v3.10, but if possible,
I will try to do it for v3.9. If any updates, let you know.

Thanks.

Happy New Year!

- Kukjin
