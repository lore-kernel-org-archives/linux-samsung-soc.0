From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [GIT PULL] soc: samsung: Drivers for v4.11
Date: Thu, 26 Jan 2017 10:44:25 +0100
Message-ID: <CACRpkdbKfojW-adLDL5Y7UQNps9H=5NpwWnYOzC5xBo9Bq1RJg@mail.gmail.com>
References: <20170120181343.12570-1-krzk@kernel.org> <CGME20170126091313epcas3p4034ef54af813082ceb26f5213bb97a1c@epcas3p4.samsung.com>
 <CACRpkdZebsd5MfARWL2WbKkAuXfjEe6p_k5tYwPFF6kSsCXDdQ@mail.gmail.com> <4be96fae-6790-d281-61dc-f7e7cde9efb7@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4be96fae-6790-d281-61dc-f7e7cde9efb7@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@kernel.org>, "arm@kernel.org" <arm@kernel.org>, Kukjin Kim <kgene@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, Jan 26, 2017 at 10:20 AM, Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
> Hi Linus,
>
> On 2017-01-26 10:13, Linus Walleij wrote:
>>
>> On Fri, Jan 20, 2017 at 7:13 PM, Krzysztof Kozlowski <krzk@kernel.org>
>> wrote:
>>
>>> Few changes in Exynos PMU driver including one that is needed by pinctrl
>>> driver for runtime PM. We want to move forward with the RPM for our
>>> drivers
>>> while keeping still DT ABI.
>>>
>>> This tag is also for Linus Walleij to pull - base for pinctrl changes.
>>
>> Do I need it? I.e. will my branch not compile without this, or is this
>> just a runtime problem?
>
>
> "[PATCH v3 11/13] pinctrl: samsung: Move retention control from mach-exynos
> to the
> pinctrl driver" has compile time dependency on the changes included in that
> tag.

Is that because of the custom syscon regmap lookup function?

I just complained about that in a separate mail ;)

Yours,
Linus Walleij
