From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [GIT PULL 5/9] ARM: EXYNOS: Drivers for v4.5
Date: Wed, 23 Dec 2015 19:54:23 +0900
Message-ID: <CA+Ln22Fk5UOgWzgOeEVb9sgPni028LMVDjgFhy3xQvnz4rwh_Q@mail.gmail.com>
References: <1449020386-20250-1-git-send-email-k.kozlowski@samsung.com>
	<1449020386-20250-6-git-send-email-k.kozlowski@samsung.com>
	<20151222045042.GF30172@localhost>
	<567A7C9F.3020907@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <567A7C9F.3020907@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Olof Johansson <olof@lixom.net>, =?UTF-8?Q?Krzysztof_Koz=C5=82owski?= <k.kozlowski.k@gmail.com>, devicetree <devicetree@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "arm@kernel.org" <arm@kernel.org>, Arnd Bergmann <arnd@arndb.de>, linux.walleij@linaro.org, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-kernel <linux-kernel@vger.kernel.org>, Kevin Hilman <khilman@linaro.org>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

2015-12-23 19:51 GMT+09:00 Krzysztof Kozlowski <k.kozlowski@samsung.com>:
> W dniu 22.12.2015 o 13:50, Olof Johansson pisze:
>> On Wed, Dec 02, 2015 at 10:39:42AM +0900, Krzysztof Kozlowski wrote:
>>> Hi Kukjin,
>>>
>>> Pinctrl for v4.5.
>>>
>>> Best regards,
>>> Krzysztof
>>>
>>>
>>> The following changes since commit 8005c49d9aea74d382f474ce11afbbc7d7130bec:
>>>
>>>   Linux 4.4-rc1 (2015-11-15 17:00:27 -0800)
>>>
>>> are available in the git repository at:
>>>
>>>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-drivers-4.5
>>>
>>> for you to fetch changes up to 023e06dfa6882f500b9c86fd61f0b1913aa07f36:
>>>
>>>   pinctrl: exynos: add exynos5410 SoC specific data (2015-11-16 10:54:43 +0900)
>>
>> Hi,
>>
>> This should either go in through the pinctrl tree, or have an acked/reviewed-by
>> one of the pinctrl maintainers.
>
> It was acked by Tomasz Figa - Samsung Pin Controller maintainer:
> https://patchwork.ozlabs.org/patch/450340/

Actually, is there any reason to send this through ARM SoC? Looks like
this pull request contains only pinctrl changes which could normally
go through pinctrl tree. Maybe Linus W. could simply pull it?

Best regards,
Tomasz
