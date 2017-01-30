From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [GIT PULL 4/4] arm64: dts: exynos: for v4.11, 2nd round
Date: Mon, 30 Jan 2017 08:55:37 +0200
Message-ID: <CAJKOXPe=MjJk_63XBFMj+bE58NVmDmRvia7O72h7qvFdPio-gA@mail.gmail.com>
References: <20170129200630.22083-1-krzk@kernel.org> <20170129200630.22083-4-krzk@kernel.org>
 <20170130052329.GZ18943@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:57914 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752392AbdA3G4N (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 30 Jan 2017 01:56:13 -0500
In-Reply-To: <20170130052329.GZ18943@localhost>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@kernel.org>, arm@kernel.org, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Javier Martinez Canillas <javier@osg.samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>, Lee Jones <lee.jones@linaro.org>

On Mon, Jan 30, 2017 at 7:23 AM, Olof Johansson <olof@lixom.net> wrote:
> Hi Krzysztof,
>
> On Sun, Jan 29, 2017 at 10:06:29PM +0200, Krzysztof Kozlowski wrote:
>> Hi,
>>
>> On top of previous pull request.
>>
>> This adds proper clocks to LPASS node on Exynos5433 which is needed
>> by Marek's patchset:
>>  - [PATCH v2 0/8] Pad retentions support for Exynos5433
>>    https://lkml.kernel.org/r/1485419634-28331-1-git-send-email-m.szyprowski () samsung ! com
>>
>>
>> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
>> Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
>> Cc: Linus Walleij <linus.walleij@linaro.org>
>> Cc: Tomasz Figa <tomasz.figa@gmail.com>
>> Cc: Lee Jones <lee.jones@linaro.org>
>>
>> Best regards,
>> Krzysztof
>>
>>
>> The following changes since commit e4e381133241a27d732e78be09973b89a193eaf7:
>>
>>   arm64: dts: exynos: Enable HDMI/TV path on Exynos5433-TM2 (2017-01-11 18:20:28 +0200)
>>
>> are available in the git repository at:
>>
>>   git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt64-4.11-2
>>
>> for you to fetch changes up to 7547162ac351483df3641f64e99e10be329dd6a2:
>>
>>   arm64: dts: exynos: Add clocks to Exynos5433 LPASS module (2017-01-26 22:04:20 +0200)
>
> I think you tagged the wrong branch here. The log message shows the right hash
> at the tip, but the tag is of 95648b747071d530b5bb983735cfe0ffff1b66bf, which
> seems to be on your for-next.
>
> Care to respin, so your tag and our merged branch match up?

Ahhh, damn it. I'll fix it.

Best regards,
Krzysztof
