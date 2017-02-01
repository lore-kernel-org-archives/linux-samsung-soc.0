From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/3] pinctrl: dt-bindings: samsung: Add Exynos7 specific
 pinctrl macro definitions
Date: Wed, 1 Feb 2017 13:51:00 +0100
Message-ID: <CACRpkdYLpQHT1ykYE1tNJpNRyUt7ezhyxznbe=dPu70mPn0OLQ@mail.gmail.com>
References: <1484718141-28785-1-git-send-email-pankaj.dubey@samsung.com>
 <CGME20170118054002epcas5p3b08e2f419976e17a3c584d64776810fd@epcas5p3.samsung.com>
 <1484718141-28785-3-git-send-email-pankaj.dubey@samsung.com>
 <20170118141935.eu7wmki7jnjdarkw@kozik-lap> <7a0d543f-37e8-98e9-15b4-7d3f808f8516@samsung.com>
 <20170127144123.slmwxorx7cjxwtcr@kozik-lap>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170127144123.slmwxorx7cjxwtcr@kozik-lap>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Pankaj Dubey <pankaj.dubey-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-samsung-soc <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, sanath-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, root <alim.akhtar-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Jan 27, 2017 at 3:41 PM, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Fri, Jan 27, 2017 at 01:25:42PM +0100, Sylwester Nawrocki wrote:
>> On 01/18/2017 03:19 PM, Krzysztof Kozlowski wrote:
>> > On Wed, Jan 18, 2017 at 11:12:20AM +0530, Pankaj Dubey wrote:
>> >> Exynos7 SoC pinctrl configurations are similar to existing Exynos4/5 except
>> >> for FSYS1 pinctrl drive strengths. So adding Exynos7 specific FSYS1 blocks
>> >> pinctrl driver strength related macros which will be used in Exynos7
>> >> DTSi files.
>> >>
>> >> Signed-off-by: Pankaj Dubey <pankaj.dubey-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> >> ---
>> >>  include/dt-bindings/pinctrl/samsung.h | 8 ++++++++
>> >>  1 file changed, 8 insertions(+)
>> >>
>> >
>> > Acked-by: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> >
>> > I will need this header, so Sylwester if it is okay with you, could you
>> > provide a tag with it (or ack it)?
>>
>> Acked-by: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>>
>> I don't have pinctrl/samsung git tree, Linus applies patches directly.
>
> Oh, my mistake.
>
> Linus,
> This is similar case as "pinctrl: dt-bindings: samsung: add drive
> strength macros for Exynos5433" [1].

OK
Acked-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

I expect that you take it through ARM SoC and/or send me a pull
request for it on an immutable branch, whatever is best.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
