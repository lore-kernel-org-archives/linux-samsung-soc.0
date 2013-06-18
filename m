From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH v2 00/38] Thirty eight patches big Exynos cleanup
Date: Tue, 18 Jun 2013 13:15:20 -0700
Message-ID: <CAOesGMi_M445-1Myd0Xd2b2okWxKRnvo=gAffgChMjGWVVpxzQ@mail.gmail.com>
References: <1371486863-12398-1-git-send-email-t.figa@samsung.com>
	<51C09E3C.5050108@samsung.com>
	<44244927.ekNqhkrd4q@flatron>
	<201306182029.09790.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f48.google.com ([74.125.82.48]:38542 "EHLO
	mail-wg0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933410Ab3FRUPW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 18 Jun 2013 16:15:22 -0400
Received: by mail-wg0-f48.google.com with SMTP id f11so3785335wgh.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Jun 2013 13:15:20 -0700 (PDT)
In-Reply-To: <201306182029.09790.arnd@arndb.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <t.figa@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>

On Tue, Jun 18, 2013 at 11:29 AM, Arnd Bergmann <arnd@arndb.de> wrote:
> On Tuesday 18 June 2013, Tomasz Figa wrote:
>> OK. Looking forward to it.
>>
>> Btw. This leaves us with two things broken:
>>  - sdhci-s3c checks for defined(CONFIG_SOC_EXYNOS4212), but does not check
>> for defined(CONFIG_SOC_EXYNOS4412),
>>  - exynos-thermal checks for defined(CONFIG_SOC_EXYNOS4412), but does not
>> check for defined(CONFIG_SOC_EXYNOS4212).
>>
>> I think this must be fixed, because selecting only Exynos4212 in kernel
>> config you end up without exynos-thermal, while selecting only Exynos4412
>> breaks sdhci-s3c.
>
> I wonder what we actually gain by having all these fine-grained checks
> in the kernel. Why not just reduce the compile-time checks to just
> EXYNOS4 and EXYNOS5?
>
> The drivers can easily implement code for all variants using
> run-time checks, but I think it would be easier if building an EXYNOS4
> kernel would just run on all EXYNOS4 machines.

Agreed.

These fine-grained dependencies tend to be useful on very low-end
systems where every byte of memory counts, but on modern platforms
such as Exynos the maintainability of the code trumps the last few
bytes of savings, I'd say.


-Olof
