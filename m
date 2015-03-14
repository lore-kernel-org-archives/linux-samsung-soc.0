From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [GIT PULL 2/2] Samsung fixes-2 for v4.0
Date: Sat, 14 Mar 2015 14:17:50 +0100
Message-ID: <CABxcv=kDOavviyRC-wPBwqd81J=TYD3bKbaa0dpD-6M0tr01XA@mail.gmail.com>
References: <54F4B33E.3070803@kernel.org>
	<2064108.qlOP0oDx90@wuerfel>
	<20154650.hb5Lekq8n0@wuerfel>
	<CABxcv=nTi_+qkNhw=4NypNnR795cX4QUsWLOR4S+2w3suXvz5g@mail.gmail.com>
	<027501d057f1$f13a5090$d3aef1b0$@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f169.google.com ([209.85.212.169]:38874 "EHLO
	mail-wi0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752481AbbCNNRw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 14 Mar 2015 09:17:52 -0400
Received: by wifj2 with SMTP id j2so7739440wif.1
        for <linux-samsung-soc@vger.kernel.org>; Sat, 14 Mar 2015 06:17:50 -0700 (PDT)
In-Reply-To: <027501d057f1$f13a5090$d3aef1b0$@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Lukasz Majewski <l.majewski@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, arm@kernel.org, Kevin Hilman <khilman@linaro.org>, Olof Johansson <olof@lixom.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Marek Szyprowski <m.szyprowski@samsung.com>

Hello Kukjin,

On Fri, Mar 6, 2015 at 10:43 AM, Kukjin Kim <kgene@kernel.org> wrote:
>>
>> Yes, the problem is the Exynos DRM driver which has a lot of issues.
>> It's broken if CONFIG_DRM_EXYNOS_IOMMU is enabled which defaults to
>> yes after commit 8dcc14f82f06 ("drm/exynos: IOMMU support should not
>> be selectable by user").
>>
>> I posted a patch to disable IOMMU support on Exynos to avoid these
>> boot failures and also mentioned to Kukjin that it should be a fix for
>> 4.0 [0]. But even with IOMMU disabled, the Exynos DRM is broken in
>> some boards [1] so we may have to disable that driver until everything
>> gets sorted out and is stable again.
>>
> Yes, the fix is in my tree and it will be sent to upstream via arm-soc soon.
>

Sorry for pestering you but I see that the patch to disable
EXYNOS_IOMMU is still not in Linus' master and we are almost in
4.0-rc4 now.

A patch to the Exynos DRM driver to check for IOMMU and fail
gracefully has landed in 4.0-rc so now at least the machines boot but
with IOMMU enabled display is broken in the Exynos5 boards.

> Thanks,
> Kukjin

Best regards,
Javier
