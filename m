From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 00/38] Thirty eight patches big Exynos cleanup
Date: Tue, 18 Jun 2013 20:29:09 +0200
Message-ID: <201306182029.09790.arnd@arndb.de>
References: <1371486863-12398-1-git-send-email-t.figa@samsung.com> <51C09E3C.5050108@samsung.com> <44244927.ekNqhkrd4q@flatron>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.8]:56393 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933030Ab3FRS3T (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 18 Jun 2013 14:29:19 -0400
In-Reply-To: <44244927.ekNqhkrd4q@flatron>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <t.figa@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 'Olof Johansson' <olof@lixom.net>, 'Marek Szyprowski' <m.szyprowski@samsung.com>, 'Sylwester Nawrocki' <s.nawrocki@samsung.com>, 'Thomas Abraham' <thomas.abraham@linaro.org>

On Tuesday 18 June 2013, Tomasz Figa wrote:
> OK. Looking forward to it.
> 
> Btw. This leaves us with two things broken:
>  - sdhci-s3c checks for defined(CONFIG_SOC_EXYNOS4212), but does not check 
> for defined(CONFIG_SOC_EXYNOS4412),
>  - exynos-thermal checks for defined(CONFIG_SOC_EXYNOS4412), but does not 
> check for defined(CONFIG_SOC_EXYNOS4212).
> 
> I think this must be fixed, because selecting only Exynos4212 in kernel 
> config you end up without exynos-thermal, while selecting only Exynos4412 
> breaks sdhci-s3c.

I wonder what we actually gain by having all these fine-grained checks
in the kernel. Why not just reduce the compile-time checks to just
EXYNOS4 and EXYNOS5?

The drivers can easily implement code for all variants using
run-time checks, but I think it would be easier if building an EXYNOS4
kernel would just run on all EXYNOS4 machines.

	Arnd
