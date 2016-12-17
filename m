From: Chanwoo Choi <cwchoi00@gmail.com>
Subject: Re: [PATCH v8 6/8] ARM: EXYNOS: remove secondary startup
 initialization from smp_prepare_cpus
Date: Sun, 18 Dec 2016 07:06:27 +0900
Message-ID: <CAGTfZH2WiaKBrZqv6GsLiScs--A=tfer6H7PS6Ok+ADi20e9NA@mail.gmail.com>
References: <1481375323-29724-1-git-send-email-pankaj.dubey@samsung.com>
 <1481375323-29724-7-git-send-email-pankaj.dubey@samsung.com> <20161217184806.GB30265@kozik-lap>
Reply-To: cwchoi00@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qt0-f193.google.com ([209.85.216.193]:32819 "EHLO
        mail-qt0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757136AbcLQWGs (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 17 Dec 2016 17:06:48 -0500
Received: by mail-qt0-f193.google.com with SMTP id n6so14987149qtd.0
        for <linux-samsung-soc@vger.kernel.org>; Sat, 17 Dec 2016 14:06:48 -0800 (PST)
In-Reply-To: <20161217184806.GB30265@kozik-lap>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Pankaj Dubey <pankaj.dubey@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Arnd Bergmann <arnd@arndb.de>, geert+renesas@glider.be, Marek Szyprowski <m.szyprowski@samsung.com>, javier@osg.samsung.com, Kukjin Kim <kgene@kernel.org>, thomas.ab@samsung.com

Hi Krzysztof,

2016-12-18 3:48 GMT+09:00 Krzysztof Kozlowski <krzk@kernel.org>:
> On Sat, Dec 10, 2016 at 06:38:41PM +0530, Pankaj Dubey wrote:
>> We are taking care of setting secondary cpu boot address in
>> exynos_boot_secondary just before sending ipi to secondary CPUs,
>> so we can safely remove this setting from smp_prepare_cpus.
>
> Indeed setting boot address is doubled. However between them, the power
> is turned on and Exynos3250 is being restarted.
>
> It would be nice to test it on Exynos3250 (Artik5 or Gear2?) and some of
> Exynos4 family. Beside that looks good to me, I just want to see some
> tested-by.

I'll test it on Exynos3250(gear2,artik5) and Exynos4(trats2) on Monday
and send the test result.

Best Regards,
Chanwoo Choi

[snip]
