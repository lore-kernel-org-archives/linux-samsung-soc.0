From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH] MAINTAINERS: pinctrl: Add git tree to Samsung pinctrl entry
Date: Tue, 21 Mar 2017 09:54:34 +0900
Message-ID: <CA+Ln22HW-oAtgdzrjcm2CXK4j4SURdVNV_eZsr51peg4n4AUSA@mail.gmail.com>
References: <20170320164851.5999-1-krzk@kernel.org> <20170320165841.gpbevoscf2fjvods@kozik-lap>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20170320165841.gpbevoscf2fjvods@kozik-lap>
Sender: linux-gpio-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

2017-03-21 1:58 GMT+09:00 Krzysztof Kozlowski <krzk@kernel.org>:
> On Mon, Mar 20, 2017 at 06:48:51PM +0200, Krzysztof Kozlowski wrote:
>> Add a Git tree on @kernel.org for maintaining the Samsung pinctrl
>> drivers.  The tree will be maintained in a shared model between current
>> Samsung pinctrl maintainers.  Pull requests will be going to Linus
>> Walleij.
>>
>> Also add the patchwork for linux-samsung-soc mailing list which will be
>> used for handling the patches.
>>
>> Cc: Tomasz Figa <tomasz.figa@gmail.com>
>> Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
>> Cc: Linus Walleij <linus.walleij@linaro.org>
>> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Acked-by: Tomasz Figa <tomasz.figa@gmail.com>

>>
>> ---
>>
>> As of now, only I have the access to this git tree. Tomasz is welcomed
>> to join anytime. We are also waiting for Sywlester to get account on
>> kernel.org.

I'll stay alerted. :) Please let me know whenever you both guys are
busy and I can kick in. Will keep reviewing the patches as well.

>>
>> For the Patchwork, I use it also for Exynos/Samsung ARM architecture
>> maintenance.  I will add appropriate permissions to Sylwester so we can
>> share it.
>> ---
>
> Linus,
>
> I talked with Sylwester few days ago and we agreed on a shared mainainer
> model.  Mostly because:
> 1. Only Sylwester from three of us works in Samsung,
> 2. It helps distributing the load in case of any holidays/travel etc,
> 3. It might also make easier for future transitions.
>
> For this release I can start taking the patches. Please let me know:
> 1. Can I base on Torvalds' rc-1 or you prefer basing on top of your
>    branches? In the second case your branches should not be rebased.
> 2. When do you expect pull requests (preferred time and acceptable late
>    stuff)?
>
>
> Also, I will add this tree to the linux-next + auto-builders.

Thanks Krzysztof, you're doing some really good work here! :)

Best regards,
Tomasz
