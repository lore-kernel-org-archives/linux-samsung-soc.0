From: Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Subject: Re: [PATCH v5 03/14] clk: max77686: Add DT include for MAX77686 PMIC
 clock
Date: Fri, 27 Jun 2014 10:54:04 +0200
Message-ID: <53AD312C.90005@collabora.co.uk>
References: <1403806546-31122-1-git-send-email-javier.martinez@collabora.co.uk> <1403806546-31122-4-git-send-email-javier.martinez@collabora.co.uk> <53AD21E5.1030609@suse.de> <53AD22ED.5040303@collabora.co.uk> <53AD2AB7.1090000@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53AD2AB7.1090000-l3A5Bk7waGM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Sjoerd Simons <sjoerd.simons-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Daniel Stone <daniels-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Yadwinder Singh Brar <yadi.brar01-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Hello Andreas,

On 06/27/2014 10:26 AM, Andreas F=E4rber wrote:
> Hi Javier,
>=20
> Am 27.06.2014 09:53, schrieb Javier Martinez Canillas:
>> Hello Andreas,
>>=20
>> On 06/27/2014 09:48 AM, Andreas F=E4rber wrote:
>>> Am 26.06.2014 20:15, schrieb Javier Martinez Canillas:
>>>> This patch adds a dt-binding include for Maxim 77686
>>>> PMIC clock IDs that can be to be shared between the
>>>
>>> "can be shared"?
>>>
>>=20
>> As it should be quite clear right now I'm not a native English speak=
er.
>=20
> Guessed so, me neither. But since it's v5 already and no native speak=
er
> pointed it out, I took the liberty to do so while verifying that the
> LD02 typo didn't propagate into your bindings documentation (it didn'=
t).
>=20
>> I meant
>> that the header file can be included by both Device Tree source file=
s and the
>> max77802 driver.
>=20
> AFAIU "clock IDs to be shared" and "clock IDs that can be shared" wou=
ld
> both be valid, but above a verb is missing (e.g., "can be used to").
>=20
> Thanks for your upstreaming efforts, and don't let me discourage you.
>=20

No discourage at all, your feedback is highly appreciated and sorry tha=
t I
didn't catch all these typos when working on the DT documentation.

> Best regards,
>=20
> Andreas
>=20

Best regards,
Javier
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
