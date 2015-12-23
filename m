From: Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [GIT PULL 5/9] ARM: EXYNOS: Drivers for v4.5
Date: Wed, 23 Dec 2015 19:55:42 +0900
Message-ID: <CA+Ln22GsF5eMNwk3QD9UM1M1jSB5c03XxCZYPJMke8Et3tfTxQ@mail.gmail.com>
References: <1449020386-20250-1-git-send-email-k.kozlowski@samsung.com>
	<1449020386-20250-6-git-send-email-k.kozlowski@samsung.com>
	<20151222045042.GF30172@localhost>
	<567A7C9F.3020907@samsung.com>
	<CA+Ln22Fk5UOgWzgOeEVb9sgPni028LMVDjgFhy3xQvnz4rwh_Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CA+Ln22Fk5UOgWzgOeEVb9sgPni028LMVDjgFhy3xQvnz4rwh_Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, =?UTF-8?Q?Krzysztof_Koz=C5=82owski?= <k.kozlowski.k-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

2015-12-23 19:54 GMT+09:00 Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
> Hi,
>
> 2015-12-23 19:51 GMT+09:00 Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>:
>> W dniu 22.12.2015 o 13:50, Olof Johansson pisze:
>>> On Wed, Dec 02, 2015 at 10:39:42AM +0900, Krzysztof Kozlowski wrote:
>>>> Hi Kukjin,
>>>>
>>>> Pinctrl for v4.5.
>>>>
>>>> Best regards,
>>>> Krzysztof
>>>>
>>>>
>>>> The following changes since commit 8005c49d9aea74d382f474ce11afbbc7d7130bec:
>>>>
>>>>   Linux 4.4-rc1 (2015-11-15 17:00:27 -0800)
>>>>
>>>> are available in the git repository at:
>>>>
>>>>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-drivers-4.5
>>>>
>>>> for you to fetch changes up to 023e06dfa6882f500b9c86fd61f0b1913aa07f36:
>>>>
>>>>   pinctrl: exynos: add exynos5410 SoC specific data (2015-11-16 10:54:43 +0900)
>>>
>>> Hi,
>>>
>>> This should either go in through the pinctrl tree, or have an acked/reviewed-by
>>> one of the pinctrl maintainers.
>>
>> It was acked by Tomasz Figa - Samsung Pin Controller maintainer:
>> https://patchwork.ozlabs.org/patch/450340/
>
> Actually, is there any reason to send this through ARM SoC? Looks like
> this pull request contains only pinctrl changes which could normally
> go through pinctrl tree. Maybe Linus W. could simply pull it?

Except that his email address was mistyped in original message... Fixed now.

Best regards,
Tomasz
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
