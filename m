From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH -next] arm: Select GPIO_GENERIC_PLATFORM for CRAGG_6410
Date: Thu, 14 Jan 2016 01:54:07 -0800
Message-ID: <5697703F.8040801@roeck-us.net>
References: <1452531649-14940-1-git-send-email-linux@roeck-us.net>
 <CACRpkdbH6jCyzJK=LM4mPpdLPrQ4KMkHuedAPfWU4tg1K6FaBQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdbH6jCyzJK=LM4mPpdLPrQ4KMkHuedAPfWU4tg1K6FaBQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Russell King <linux@arm.linux.org.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On 01/14/2016 01:02 AM, Linus Walleij wrote:
> On Mon, Jan 11, 2016 at 6:00 PM, Guenter Roeck <linux@roeck-us.net> wrote:
>
>> Since commit 0f4630f3720e ("gpio: generic: factor into gpio_chip struct"),
>> all users of struct bgpio_pdata depend on GPIO_GENERIC.
>>
>> This results in the following build error.
>>
>> arch/arm/mach-s3c64xx/mach-crag6410.c:270:3: warning:
>>          excess elements in struct initializer
>> arch/arm/mach-s3c64xx/mach-crag6410.c:270:3: warning:
>>          (near initialization for '(anonymous)')
>> arch/arm/mach-s3c64xx/mach-crag6410.c:271:2: error:
>>          invalid use of undefined type 'struct bgpio_pdata'
>>
>> Fixes: 0f4630f3720e ("gpio: generic: factor into gpio_chip struct")
>> Cc: Linus Walleij <linus.walleij@linaro.org>
>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>> ---
>> I don't know if this is the correct way to fix this problem.
>> If not, please consider this to be a bug report.
>
> I think this is fixed by Arnds patch:
> http://marc.info/?l=linux-gpio&m=145237423205247&w=2
>
> Can you verify that?
>

Correct.

Guenter
