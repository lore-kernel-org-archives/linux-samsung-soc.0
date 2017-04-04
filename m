From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [GIT PULL] mfd: exynos-lpass: Pinctrl dependency
Date: Tue, 4 Apr 2017 10:23:32 +0200
Message-ID: <CAJKOXPeVOMBZxXeh7=oXbgnxSrUtHa86eAtP2BppY=G4Uygarg@mail.gmail.com>
References: <1490256207-10061-1-git-send-email-m.szyprowski@samsung.com>
 <20170328154217.5405-1-krzk@kernel.org> <20170403101824.rpvkqzyigonyi77p@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20170403101824.rpvkqzyigonyi77p@dell>
Sender: linux-gpio-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, Apr 3, 2017 at 12:18 PM, Lee Jones <lee.jones@linaro.org> wrote:
> On Tue, 28 Mar 2017, Krzysztof Kozlowski wrote:
>
>>
>> Hi Lee,
>>
>>
>> This is dependency for mfd/exynos-lpass driver changes from Marek Szyprowski.
>> That's a material for v4.12 and I will be pushing this later to Linus Walleij.
>
> This does not work, and *may* still break.
>
> The only way to guarantee the order of the patches is to have them
> *all* as part of the pull-request.  Not just some of them.

What do you mean exactly? If these two patches come through my tree
first, then everything will work fine because they do not break any
other stuff.

If you pull it and apply the rest on top, then it should also work
without problems because your history will contain everything needed
in proper order.

In both cases bisectability is preserved. Did I missed something?

Best regards,
Krzysztof
