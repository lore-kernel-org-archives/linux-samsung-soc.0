From: Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v5 02/10] ARM: dts: Fold exynos5250-cros-common into exynos5250-snow
Date: Mon, 18 Aug 2014 15:03:17 -0500
Message-ID: <53F25C05.5070604@samsung.com>
References: <1406868897-26874-1-git-send-email-afaerber@suse.de>	<1406868897-26874-3-git-send-email-afaerber@suse.de> <CAD=FV=USKuOxiFo=VgEB6aAQ=LdLv-7+jXQNh4VCMBQwasygxg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAD=FV=USKuOxiFo=VgEB6aAQ=LdLv-7+jXQNh4VCMBQwasygxg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber-l3A5Bk7waGM@public.gmane.org>, linux-samsung-soc <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephan van Schaik <stephan-zGZ7W/ttz6xN8Ch2cx6nig@public.gmane.org>, Vincent Palatin <vpalatin-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On 08/01/14 11:45, Doug Anderson wrote:
> Andreas,
>
> On Thu, Jul 31, 2014 at 9:54 PM, Andreas F=C3=A4rber<afaerber-l3A5Bk7waGM@public.gmane.org=
>  wrote:
>> exynos5250-cros-common.dtsi was meant for sharing common pieces acro=
ss
>> ChromeOS devices. This turned out premature, as several devices ende=
d up
>> in the common file that are not common after all. Since the remainin=
g
>> common ChromeOS pieces are fairly minor,  exynos5250-cros-common.dts=
i
>> was requested to be merged into the Snow device tree, sharing only t=
he
>> keyboard controller for now. This may be re-evaluated as both mature=
=2E
>>
>> Suggested-by: Doug Anderson<dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>> Reviewed-by: Tomasz Figa<t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> Signed-off-by: Andreas F=C3=A4rber<afaerber-l3A5Bk7waGM@public.gmane.org>
>> ---
>>   v4 ->  v5:
>>   * Extended commit message (Tomasz Figa)
>>
>>   v3 ->  v4: Unchanged
>>
>>   v2 ->  v3:
>>   * Renamed subject to match Kukjin's style
>>   * Rebased onto MMC pinctrl bug fix (Doug Anderson)
>>
>>   v2: New (Doug Anderson)
>>
>>   arch/arm/boot/dts/exynos5250-cros-common.dtsi | 164 --------------=
------------
>>   arch/arm/boot/dts/exynos5250-snow.dts         | 164 ++++++++++++++=
+++++++++---
>>   2 files changed, 145 insertions(+), 183 deletions(-)
>
> Reviewed-by: Doug Anderson<dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>
> I'd suggest that this land sooner rather than later to avoid future c=
onflicts.

Applied, thanks.

- Kukjin
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
