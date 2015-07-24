From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [GIT PULL] Non-critical fixes for v4.3
Date: Fri, 24 Jul 2015 13:04:58 +0200
Message-ID: <359442387.iGIak59Qte@amdc1976>
References: <1437719695-22340-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:34703 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750734AbbGXLFp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 24 Jul 2015 07:05:45 -0400
In-reply-to: <1437719695-22340-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org


Hi,

On Friday, July 24, 2015 03:34:55 PM Krzysztof Kozlowski wrote:
> Dear Kukjin,
> 
> Previously you did not picked up the fix for cpufreq memory leak.
> I am sending it again with respective acks from LKML. Also another
> minor improvement in the set.
> 
> Best regards,
> Krzysztof
> 
> 
> The following changes since commit 1c4c7159ed2468f3ac4ce5a7f08d79663d381a93:
> 
>   Merge tag 'ext4_for_linus_stable' of git://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4 (2015-07-05 16:24:54 -0700)
> 
> are available in the git repository at:
> 
> 
>   https://github.com/krzk/linux.git tags/samsung-fixes-non-critical-v4.3-2
> 
> for you to fetch changes up to 434213f727c12fab8657c8db3d23da4b0463365d:
> 
>   video: fbdev: s3c-fb: Constify platform_device_id (2015-07-24 15:17:32 +0900)
> 
> ----------------------------------------------------------------
> Improvements for Exynos boards:
> 1. Fix memory leak in cpufreq error path.
> 2. Constify platform_device_id in video/fbdev/s3c-fb.
> 
> ----------------------------------------------------------------
> Krzysztof Kozlowski (1):
>       video: fbdev: s3c-fb: Constify platform_device_id
> 
> Shailendra Verma (1):
>       cpufreq: exynos: Fix for memory leak in case SOC name does not match

I would suggest merging this fix in v4.2 not v4.3:

- it is obvious and touches only error paths

- (hopefully) in v4.3 the exynos-cpufreq driver will be completely
  replaced by using cpufreq-dt for Exynos platforms (thus there will be
  no benefits of having this fix in v4.3 but there will be potential
  risk of merge conflicts due to exynos-cpufreq driver removal)

>  drivers/cpufreq/exynos-cpufreq.c | 6 ++++--
>  drivers/video/fbdev/s3c-fb.c     | 2 +-
>  2 files changed, 5 insertions(+), 3 deletions(-)

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics
