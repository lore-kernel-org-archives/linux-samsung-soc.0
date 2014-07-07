From: Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Subject: Re: [PATCH v7 23/24] rtc: Add driver for Maxim 77802 PMIC Real-Time-Clock
Date: Mon, 07 Jul 2014 08:57:41 +0200
Message-ID: <53BA44E5.6070604@collabora.co.uk>
References: <1404505467-26526-1-git-send-email-javier.martinez@collabora.co.uk> <1404505467-26526-24-git-send-email-javier.martinez@collabora.co.uk> <1404713210.4367.0.camel@AMDC1943>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1404713210.4367.0.camel@AMDC1943>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, Yadwinder Singh Brar <yadi.brar01-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Tushar Behera <trblinux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andreas Farber <afaerber-l3A5Bk7waGM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Hello Krzysztof,

On 07/07/2014 08:06 AM, Krzysztof Kozlowski wrote:
> On pi=C4=85, 2014-07-04 at 22:24 +0200, Javier Martinez Canillas wrot=
e:
>> The MAX7802 PMIC has a Real-Time-Clock (RTC) with two alarms.
>> This patch adds support for the RTC and is based on a driver
>> added by Simon Glass to the Chrome OS kernel 3.8 tree.
>>=20
>> Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.c=
o.uk>
>> ---
>>=20
>> Changes since v6:
>>  - Remove unused code for SMPL and WTSR. Suggested by Krzysztof Kozl=
owski.
>>  - Don't spam the kernel log with unimportant info and just print fo=
r debug.
>>    Suggested by Krzysztof Kozlowski.
>>  - Use ARRAY_SIZE() instead of constant value. Suggested by Krzyszto=
f Kozlowski.
>>  - Remove duplicated register setup. Suggested by Krzysztof Kozlowsk=
i.
>>  - Don't free/unregister managed allocated resources.
>>    Suggested by Krzysztof Kozlowski.
>> ---
>>  drivers/rtc/Kconfig        |  10 +
>>  drivers/rtc/Makefile       |   1 +
>>  drivers/rtc/rtc-max77802.c | 508 ++++++++++++++++++++++++++++++++++=
+++++++++++
>>  3 files changed, 519 insertions(+)
>>  create mode 100644 drivers/rtc/rtc-max77802.c
>=20
>=20
> Reviewed-by: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>=20

Thanks a lot for the review and for all the feedback you gave me on eac=
h version
of the series.

> Best regards,
> Krzysztof
>=20
>=20

Best regards,
Javier
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
