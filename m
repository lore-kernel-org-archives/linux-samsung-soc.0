From: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH v5 01/10] ARM: dts: Fix MMC pinctrl for exynos5250-snow
Date: Mon, 18 Aug 2014 22:13:38 +0200
Message-ID: <53F25E72.4080205@suse.de>
References: <1406868897-26874-1-git-send-email-afaerber@suse.de>	<1406868897-26874-2-git-send-email-afaerber@suse.de> <CAD=FV=VBa5rs_woj0mshFFbA69Nhyi3hXK_XX7-54T3vFyKYHA@mail.gmail.com> <53F247E2.2070007@samsung.com> <53F24A80.4000607@gmail.com> <53F25C25.4070602@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53F25C25.4070602-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-samsung-soc <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephan van Schaik <stephan-zGZ7W/ttz6xN8Ch2cx6nig@public.gmane.org>, Vincent Palatin <vpalatin-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Jaehoon Chung <jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

Am 18.08.2014 22:03, schrieb Kukjin Kim:
> On 08/18/14 13:48, Tomasz Figa wrote:
>> On 18.08.2014 20:37, Kukjin Kim wrote:
>>> On 08/01/14 11:26, Doug Anderson wrote:
>>>> On Thu, Jul 31, 2014 at 9:54 PM, Andreas F=C3=A4rber<afaerber@suse=
=2Ede> =20
>>>> wrote:
>>>>> The pinctrl properties should be on the device directly and not o=
n the
>>>>> slot sub-node.
>>>>>
>>>>> Reported-by: Doug Anderson<dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>>>>> Cc: Jaehoon Chung<jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>>>>> Reviewed-by: Tomasz Figa<t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>>>>> Signed-off-by: Andreas F=C3=A4rber<afaerber-l3A5Bk7waGM@public.gmane.org>
>>>>
>>>> Let's land this one before Jaehoon's, since it was a hidden
>>>> functionality change in his patch.  It will be an easy conflict to
>>>> resolve when his patch is applied.
>>>>
>>> Sounds good to me, I've applied this before Jaehoon's change.
>>>
>>>> Reviewed-by: Doug Anderson<dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>>
>> Version 6 of this series has been already posted. However this
>> particular patch has not changed, so it's fine.
>>
> Oh, got it. Hope this and 2nd should be same with version 6 ;)

It is documented as such. :) Others did have changes, of course.

I've started looking into rebasing myself: beware that the smdk5250
cleanup has an additional conflict in the spi node (cs-gpios movement).

http://git.kernel.org/cgit/linux/kernel/git/kgene/linux-samsung.git/com=
mit/arch/arm/boot/dts/exynos5250-smdk5250.dts?h=3Dv3.18-next/dt-samsung=
&id=3De138d4333aa02a3daa12c04192bc5c842bffee74

Thanks,
Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 16746 AG N=C3=
=BCrnberg
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
