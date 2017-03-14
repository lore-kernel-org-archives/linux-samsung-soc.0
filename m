From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/4] pinctrl: samsung: Fix the width of PINCFG_TYPE_DRV
 bitfields for Exynos5433
Date: Tue, 14 Mar 2017 14:47:23 +0100
Message-ID: <CACRpkda0-k7Vo9Y6yNtLNXu-gGnJW9y83t6W9p032KWjHYdMiw@mail.gmail.com>
References: <CGME20161230041426epcas1p1f827d3cee8b607d81e9921b412ddf301@epcas1p1.samsung.com>
 <20161230041421.24448-1-andi.shyti@samsung.com> <20161230041421.24448-2-andi.shyti@samsung.com>
 <CACRpkdbR3x14h38Gg7qpeWnswwD9qsS0zDUrrXCEJH-AdEB+cQ@mail.gmail.com> <58AF7CCB.5070303@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <58AF7CCB.5070303-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Andi Shyti <andi.shyti-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-samsung-soc <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, stable <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andi Shyti <andi-ahk0KpmfxKRAfugRpC6u6w@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Feb 24, 2017 at 1:22 AM, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote=
:
> On 2016=EB=85=84 12=EC=9B=94 30=EC=9D=BC 22:28, Linus Walleij wrote:
>> On Fri, Dec 30, 2016 at 5:14 AM, Andi Shyti <andi.shyti-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wro=
te:
>>
>>> From: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>>>
>>> This patch fixes the wrong width of PINCFG_TYPE_DRV bitfields for Exyno=
s5433
>>> because PINCFG_TYPE_DRV of Exynos5433 has 4bit fields in the *_DRV
>>> registers. Usually, other Exynos have 2bit field for PINCFG_TYPE_DRV.
>>>
>>> Fixes: 3c5ecc9ed353 ("pinctrl: exynos: Add support for Exynos5433")
>>> Cc: stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>>> Cc: Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>> Cc: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>>> Cc: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>>> Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>>> Cc: Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>>> Cc: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
>>> Signed-off-by: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>>
>> Nominally I think you should sign this off too Andi, as you are in the d=
elivery
>> path.
>>
>> Patch applied for fixes.
>
> This patch was already merged on your git and then merge it on tovalds's =
git[1].
> But, when I checked the latest drivers/pinctrl/samsung/pinctrl-exynos.c,
> it doesn't contain the all codes of patch[1].
> Maybe, I think that there was some merge conflict[2].

Probably. Send a patch fixing it up so I can apply it.

There are now something like 5 different people submitting Samsung pinctrl
patches without coordination so this will start to happen a lot if you keep
up this development pace.

As I just wrote in another mail: I want someone to step up and collect
Samsung patches and send them to me using a pull request.

Samsung people also need to start reviewing each other's patches
more I guess, but mainly I need help with integration.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
