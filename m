From: Javier Martinez Canillas <javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v2 1/2] arm64: dts: exynos: Add USB 3.0 controller node
 for Exynos7
Date: Wed, 18 Jan 2017 01:27:14 -0300
Message-ID: <CABxcv=kFe+En+6f-xKJS5nnJLsdXViAd7KWJmJYEhvZG5DU+_w@mail.gmail.com>
References: <1484665444-23365-1-git-send-email-pankaj.dubey@samsung.com>
 <CGME20170117150121epcas1p102bd1355f780a56e14a0a7a81bd6dfaf@epcas1p1.samsung.com>
 <1484665444-23365-2-git-send-email-pankaj.dubey@samsung.com>
 <20170117182318.fvatrazvyuzmdsor@kozik-lap> <9f45a921-ebfb-c252-20bb-3a7adf508343@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <9f45a921-ebfb-c252-20bb-3a7adf508343-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "pankaj.dubey" <pankaj.dubey-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Vivek Gautam <gautamvivek1987-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, sanath-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hello Pankaj,

On Wed, Jan 18, 2017 at 12:16 AM, pankaj.dubey <pankaj.dubey-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
> On Tuesday 17 January 2017 11:53 PM, Krzysztof Kozlowski wrote:

[snip]

>>> +
>>> +                    dwc3 {
>>
>> dtc should complain here - you need:
>>       dwc3@15400000
>
> No, it didn't complain. Anyway, I will update as it's already taken care
> in other Exynos SoC DTSi files.
>

It only complains if you run dtc with warnings enabled, i.e: make W=1
exynos7-espresso.dtb

Best regards,
Javier
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
