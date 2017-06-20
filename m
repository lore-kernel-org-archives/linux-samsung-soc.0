From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [GIT PULL] pinctrl: samsung: Pinctrl update for v4.13
Date: Tue, 20 Jun 2017 13:14:23 +0200
Message-ID: <CAJKOXPd0UFGGF38DB=XVH+SyW-P7r6K14ca6buYPP7j4Odx3gA@mail.gmail.com>
References: <20170609164827.2231-1-krzk@kernel.org> <CACRpkdZjZbHD4ZCQVHUyu8y0f45FnRqTRL4P6J7Wrz9dZNXGdw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CACRpkdZjZbHD4ZCQVHUyu8y0f45FnRqTRL4P6J7Wrz9dZNXGdw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, Jun 20, 2017 at 10:08 AM, Linus Walleij
<linus.walleij@linaro.org> wrote:
> On Fri, Jun 9, 2017 at 6:48 PM, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
>> The following changes since commit 2ea659a9ef488125eb46da6eb571de5eae5c43f6:
>>
>>   Linux 4.12-rc1 (2017-05-13 13:19:49 -0700)
>>
>> are available in the git repository at:
>>
>>   git://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung.git tags/samsung-pinctrl-4.13
>>
>> for you to fetch changes up to a453f3693f2aa9ebba623f8cff1e3d7c5df96ddd:
>>
>>   pinctrl: samsung: Explicitly cast pointer returned by of_iomap() to iomem (2017-06-07 20:40:48 +0200)
>
> Pulled into my "devel" branch on the pin control tree.
>
> Pushing it to the build servers hoping all works.
>
> Thanks for your efforts to maintain Samsung pin control, it is
> much appreciated!

I will have another bunch of cleanups and one important fix (broken
for some time, around v4.10, so it's not a candidate for current RC
fix). It is pretty late. Will you still have time to pull them for
v4.13?

Best regards,
Krzysztof
