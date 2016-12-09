From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: mainline boot: 179 boots: 1 failed, 168 passed with 10 offline
 (v4.9-rc8-78-g318c8932ddec)
Date: Fri, 9 Dec 2016 14:58:02 +0200
Message-ID: <20161209125802.GA4229@kozik-lap>
References: <5849e989.0209c20a.75a7.6441@mx.google.com>
 <m2shpyarc8.fsf@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wj0-f195.google.com ([209.85.210.195]:33643 "EHLO
        mail-wj0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752430AbcLIM6J (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 9 Dec 2016 07:58:09 -0500
Received: by mail-wj0-f195.google.com with SMTP id kp2so2403650wjc.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 09 Dec 2016 04:58:08 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <m2shpyarc8.fsf@baylibre.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kevin Hilman <khilman@baylibre.com>
Cc: "kernelci.org bot" <bot@kernelci.org>, kernel-build-reports@lists.linaro.org, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, linux-samsung-soc@vger.kernel.org

On Thu, Dec 08, 2016 at 04:17:27PM -0800, Kevin Hilman wrote:
> + Exynos maintainers (for new regresion on exynos5250-snow)
> 
> kernelci.org bot <bot@kernelci.org> writes:
> 
> > mainline boot: 179 boots: 1 failed, 168 passed with 10 offline (v4.9-rc8-78-g318c8932ddec)
> >
> > Full Boot Summary: https://kernelci.org/boot/all/job/mainline/kernel/v4.9-rc8-78-g318c8932ddec/
> > Full Build Summary: https://kernelci.org/build/mainline/kernel/v4.9-rc8-78-g318c8932ddec/
> >
> > Tree: mainline
> > Branch: local/master
> > Git Describe: v4.9-rc8-78-g318c8932ddec
> > Git Commit: 318c8932ddec5c1c26a4af0f3c053784841c598e
> > Git URL: http://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
> > Tested: 57 unique boards, 21 SoC families, 29 builds out of 207
> >
> > Boot Regressions Detected:
> >
> > arm:
> >
> >     multi_v7_defconfig+CONFIG_SMP=n:
> >         exynos5250-snow:
> >             lab-collabora: new failure (last pass: v4.9-rc8-51-gbc3913a5378c)
> >
> > Boot Failure Detected:
> >
> > arm:
> >
> >     multi_v7_defconfig+CONFIG_SMP=n
> >         exynos5250-snow: 1 failed lab

Nothing was happening recently around Exynos code (at least mach/dts).
Was the 318c8932ddec5c1c26a4af0f3c053784841c598e pointed out by bisect?

Best regads,
Krzysztof
