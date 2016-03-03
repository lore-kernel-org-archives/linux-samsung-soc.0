From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: add "simple-bus" to "arm, amba-bus" compatible nodes
Date: Thu, 3 Mar 2016 14:23:29 -0600
Message-ID: <CAL_JsqLBNo2YuJGqBo1DaYgzV7=WuX-0BPutoW3f3U1k0wX3_w@mail.gmail.com>
References: <1456804620-8750-1-git-send-email-yamada.masahiro@socionext.com>
 <20160301114610.GB30602@leverpostej> <CAK7LNAQzkg5F8wUeF+p30jf9CrpNxi7UTNfqXQgybP2XbEKJag@mail.gmail.com>
 <1456999975.2856.18.camel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1456999975.2856.18.camel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Jon Medhurst (Tixy)" <tixy-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-arm-msm <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Wei Xu <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, David Brown <david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.orglin
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, Mar 3, 2016 at 4:12 AM, Jon Medhurst (Tixy) <tixy-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On Thu, 2016-03-03 at 12:07 +0900, Masahiro Yamada wrote:
> [...]
>> This patch is derived from Rob Herring' comment
>> "BTW, we should also kill off "amba-bus" which is an ambiguous term"
>> in the following thread:
>> http://lkml.iu.edu/hypermail/linux/kernel/1601.0/01822.html
>>
>>
>> So, the plan would be like this:
>>
>> [1] Make device trees not depend on "arm,amba-bus"   (this commit)
>> [2] New device trees should no longer use "arm,amba-bus" alone.
>> [3] Go though some releases until we do not care about the backward
>> compatibility
>
> Why would we stop caring about backwards compatibility? If I was a user
> of any of the platforms in question and updated my kernel, I wouldn't
> expect to have to debug why it was broken, then install a new dtb to fix
> it - which may be a tricky thing to do, depending on the firmware used
> to boot Linux.

If no one notices, then there is no ABI. Things break all the time
when nobody cares. It will be more than a few releases for sure. We
may never get to step 3, but we should do step 1 so people stop
copy-n-pasting this in step 2.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
