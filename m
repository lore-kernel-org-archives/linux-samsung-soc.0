From: Vivek Gautam <gautamvivek1987-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V2 1/2] pinctrl: exynos: Add BUS1 pin controller for exynos7
Date: Wed, 10 Dec 2014 13:51:55 +0530
Message-ID: <CAFp+6iHKx-donDzM0pBcdEw9RJtMxCSB6GfiMttTvhGVSSaN_A@mail.gmail.com>
References: <CAFp+6iF-N63YSsdv2a6=MYp_mD=eQY_Oi8=9JVNU5dG0BA7YGQ@mail.gmail.com>
	<1416834177-11170-1-git-send-email-gautam.vivek@samsung.com>
	<CA+Ln22GHVinmpJccYYxNjYeApj3miy_zGMnWd8e5AOt0PCjh9g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CA+Ln22GHVinmpJccYYxNjYeApj3miy_zGMnWd8e5AOt0PCjh9g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, USB list <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Alim Akhtar <alim.akhtar-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Tomasz,


On Mon, Dec 1, 2014 at 9:37 PM, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hi Vivek,
>
> Please see my comments below.
>
> 2014-11-24 22:02 GMT+09:00 Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>:
>> USB and Power regulator on Exynos7 require gpios available
>> in BUS1 pin controller block.
>> So adding the BUS1 pinctrl support.
>>
>> Signed-off-by: Naveen Krishna Ch <naveenkrishna.ch-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> Signed-off-by: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> ---
>>
>> This patch was part of series:
>> "[PATCH 00/11] Exynos7: Adding USB 3.0 support"
>>  https://lkml.org/lkml/2014/11/21/247
>>
>> Changes since V1:
>>  - Added support for all pin banks which are part of BUS1 pin controller.
>>
>>  drivers/pinctrl/samsung/pinctrl-exynos.c |   19 +++++++++++++++++++
>>  1 file changed, 19 insertions(+)
>
> I have missed this with previous patch, but DT bindings documentation
> should list all aliases for all supported compatible strings, because
> they are required for correct operation. There is a small section
> about aliases in [1] already, so please add there information about
> aliases for Exynos7 pin controllers along with their names, e.g.
>
> Aliases for controllers compatible with "samsung,exynos7-pinctrl":
>  - pinctrl0: pin controller of ALIVE block,
>  - pinctrl1: pin controller of BUS0 block,
>  [...]
>  - pinctrl8: pin controller of BUS1 block.
>
> [1] Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt
>
> I guess you can do this in separate patch or respin this one with this added.

Sure, i will add the aliases in a separate patch.
I missed to update the patch in this cycle :-(
So we can queue up the reworked version for 3.20.



-- 
Best Regards
Vivek Gautam
Samsung R&D Institute, Bangalore
India
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
