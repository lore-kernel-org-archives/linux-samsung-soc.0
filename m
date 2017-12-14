From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] ARM: exynos_defconfig - enable CONFIG_EXYNOS_IOMMU
Date: Thu, 14 Dec 2017 19:00:42 +0100
Message-ID: <20171214180042.5rbeqeocdfyt3xj7@kozik-lap>
References: <CGME20171212213136epcas2p45d4b1a2489e341f38362ca59b35977ec@epcas2p4.samsung.com>
 <20171212213110.20893-1-shuahkh@osg.samsung.com>
 <d7d38ca9-ca53-8cb1-6c8a-c219ec94f005@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f50.google.com ([74.125.82.50]:41129 "EHLO
        mail-wm0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753537AbdLNSAq (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 14 Dec 2017 13:00:46 -0500
Content-Disposition: inline
In-Reply-To: <d7d38ca9-ca53-8cb1-6c8a-c219ec94f005@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Shuah Khan <shuahkh@osg.samsung.com>, linux@armlinux.org.uk, kgene@kernel.org, linux.amoon@gmail.com, arnd@arndb.de, javier@dowhile0.org, robie@justgohome.co.uk, shuah@kernel.org, viresh.kumar@linaro.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Dec 13, 2017 at 10:42:33AM +0100, Marek Szyprowski wrote:
> Hi Shuah,
> 
> On 2017-12-12 22:31, Shuah Khan wrote:
> > EXYNOS_IOMMU is disabled in exynos_defconfig since it is known to cause
> > boot failures on Exynos Chrome-books. The recommendation is for IOMMU to
> > be enabled manually on systems as needed.
> > 
> > A recent exynos_drm change added a warning message when EXYNOS_IOMMU is
> > disabled. It is necessary to enable it to avoid the warning messages.
> > A few initial tests have shown that enabling EXYNOS_IOMMU might be safe
> > on Exynos Chrome-books.
> > 
> > Enable CONFIG_EXYNOS_IOMMU in exynos_defconfig.
> > 
> > Signed-off-by: Shuah Khan <shuahkh@osg.samsung.com>
> 
> Due to some other changes in the order of operations during boot process,
> power domains are initialized very early and because of the temporary
> lack of devices (which are not yet added to the system), are turned off.
> 
> This practically stops FIMD for scanning framebuffer very early during
> boot, before IOMMU gets initialized and "solves" the issue, which was
> the reason to disable Exynos IOMMU by default.
> 
> Like I've already said, I've checked Exynos Snow Chromebook boots fine
> with IOMMU support enabled, both with v4.15-rc3 and linux-next.
> 
> Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

Thanks, applied with rephrased and extended message using Marek's
explanation.

Best regards,
Krzysztof
