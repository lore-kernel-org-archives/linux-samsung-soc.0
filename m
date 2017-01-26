From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [GIT PULL] soc: samsung: Drivers for v4.11
Date: Thu, 26 Jan 2017 10:20:25 +0100
Message-ID: <4be96fae-6790-d281-61dc-f7e7cde9efb7@samsung.com>
References: <20170120181343.12570-1-krzk@kernel.org>
 <CGME20170126091313epcas3p4034ef54af813082ceb26f5213bb97a1c@epcas3p4.samsung.com>
 <CACRpkdZebsd5MfARWL2WbKkAuXfjEe6p_k5tYwPFF6kSsCXDdQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:45976 "EHLO
        mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753136AbdAZJUc (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 26 Jan 2017 04:20:32 -0500
In-reply-to: <CACRpkdZebsd5MfARWL2WbKkAuXfjEe6p_k5tYwPFF6kSsCXDdQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@kernel.org>, "arm@kernel.org" <arm@kernel.org>, Kukjin Kim <kgene@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>

Hi Linus,

On 2017-01-26 10:13, Linus Walleij wrote:
> On Fri, Jan 20, 2017 at 7:13 PM, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
>> Few changes in Exynos PMU driver including one that is needed by pinctrl
>> driver for runtime PM. We want to move forward with the RPM for our drivers
>> while keeping still DT ABI.
>>
>> This tag is also for Linus Walleij to pull - base for pinctrl changes.
> Do I need it? I.e. will my branch not compile without this, or is this
> just a runtime problem?

"[PATCH v3 11/13] pinctrl: samsung: Move retention control from 
mach-exynos to the
pinctrl driver" has compile time dependency on the changes included in 
that tag.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
