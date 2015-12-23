From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [GIT PULL 5/9] ARM: EXYNOS: Drivers for v4.5
Date: Wed, 23 Dec 2015 20:11:15 +0900
Message-ID: <567A8153.7080009@samsung.com>
References: <1449020386-20250-1-git-send-email-k.kozlowski@samsung.com>
 <1449020386-20250-6-git-send-email-k.kozlowski@samsung.com>
 <20151222045042.GF30172@localhost> <567A7C9F.3020907@samsung.com>
 <CA+Ln22Fk5UOgWzgOeEVb9sgPni028LMVDjgFhy3xQvnz4rwh_Q@mail.gmail.com>
 <567A7E68.2050504@samsung.com>
 <CA+Ln22HCvb1wt2o=2QcJ5FpLRBO1VB8EcRSxf4jE-19wWmp9MQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lb0-f173.google.com ([209.85.217.173]:33717 "EHLO
	mail-lb0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750710AbbLWLLT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 23 Dec 2015 06:11:19 -0500
In-Reply-To: <CA+Ln22HCvb1wt2o=2QcJ5FpLRBO1VB8EcRSxf4jE-19wWmp9MQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: k.kozlowski.k@gmail.com, Olof Johansson <olof@lixom.net>, devicetree <devicetree@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "arm@kernel.org" <arm@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linus.walleij@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-kernel <linux-kernel@vger.kernel.org>, Kevin Hilman <khilman@linaro.org>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>

W dniu 23.12.2015 o 20:06, Tomasz Figa pisze:
> 2015-12-23 19:58 GMT+09:00 Krzysztof Kozlowski <k.kozlowski@samsung.com>:
>> W dniu 23.12.2015 o 19:54, Tomasz Figa pisze:
>>> Hi,
>>>
>>> 2015-12-23 19:51 GMT+09:00 Krzysztof Kozlowski <k.kozlowski@samsung.com>:
>>>> W dniu 22.12.2015 o 13:50, Olof Johansson pisze:
>>>>> On Wed, Dec 02, 2015 at 10:39:42AM +0900, Krzysztof Kozlowski wrote:
>>>>>> Hi Kukjin,
>>>>>>
>>>>>> Pinctrl for v4.5.
>>>>>>
>>>>>> Best regards,
>>>>>> Krzysztof
>>>>>>
>>>>>>
>>>>>> The following changes since commit 8005c49d9aea74d382f474ce11afbbc7d7130bec:
>>>>>>
>>>>>>   Linux 4.4-rc1 (2015-11-15 17:00:27 -0800)
>>>>>>
>>>>>> are available in the git repository at:
>>>>>>
>>>>>>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-drivers-4.5
>>>>>>
>>>>>> for you to fetch changes up to 023e06dfa6882f500b9c86fd61f0b1913aa07f36:
>>>>>>
>>>>>>   pinctrl: exynos: add exynos5410 SoC specific data (2015-11-16 10:54:43 +0900)
>>>>>
>>>>> Hi,
>>>>>
>>>>> This should either go in through the pinctrl tree, or have an acked/reviewed-by
>>>>> one of the pinctrl maintainers.
>>>>
>>>> It was acked by Tomasz Figa - Samsung Pin Controller maintainer:
>>>> https://patchwork.ozlabs.org/patch/450340/
>>>
>>> Actually, is there any reason to send this through ARM SoC? Looks like
>>> this pull request contains only pinctrl changes which could normally
>>> go through pinctrl tree. Maybe Linus W. could simply pull it?
>>
>> Of course, I would be happy with it.
>>
>> But apparently I am the only one who continuously tracks all of these
>> patches for Exynos (also for subsystems different than arch/arm/mach*).
>> Yeah, I could ping everyone for every patch (not mine patch I mean)...
>> but it is easier just to grab it after acking and send it. I really
>> don't care about the method, just apply the damned patch ;)
> 
> My intention was by no means to belittle your effort, really thanks
> for doing this. :)
> 
> I was just wondering if Linus couldn't pull this just as is, without
> causing further commotion and unnecessarily introducing field for
> potential conflicts between trees.

That makes sense. The pinctrl driver change is not a direct dependency
for anything in this pull request so from my side:

Acked-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Linus,
The patch can be cherry-picked from:
https://git.kernel.org/cgit/linux/kernel/git/krzk/linux.git/log/?h=samsung-drivers-4.5

(the only commit in tag: samsung-drivers-4.5)

Best regards,
Krzysztof
