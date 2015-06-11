From: Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Subject: Re: [PATCH v7 0/8] mfd: cros_ec: Add multi EC and proto v3 support
Date: Thu, 11 Jun 2015 14:05:09 +0200
Message-ID: <55797975.4010108@collabora.co.uk>
References: <1433847889-7220-1-git-send-email-javier.martinez@collabora.co.uk> <24727363.WKhvMDQ6EE@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <24727363.WKhvMDQ6EE@diego>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?windows-1252?Q?Heiko_St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Bill Richardson <wfrichar-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Simon Glass <sjg-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Gwendal Grignou <gwendal-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Stephen Barber <smbarber-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Filipe Brandenburger <filbranden-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Todd Broch <tbroch-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Alexandru M Stan <amstan-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Hello Heiko,

On 06/11/2015 01:50 PM, Heiko St=FCbner wrote:
> Am Dienstag, 9. Juni 2015, 13:04:41 schrieb Javier Martinez Canillas:
>> Hello,
>>=20
>> This is a v7 of a series that adds support for multiple EC in a syst=
em
>> and also for the protocol version 3 that is used on newer ECs.
>>=20
>> Most patches were taken from the downstream ChromiumOS v3.14 tree wi=
th
>> fixes squashed, split to minimise the cross subsystem churn and chan=
ges
>> for mainline inclusion but were not modified functionality wise.
>>=20
>> This version addresses issues pointed out by Lee Jones on the v6 pos=
ted
>> before [0] and also adds the Acked-by tags of all the needed maintai=
ners.
>>=20
>> The patches are based on top of "[PATCH 0/2] mfd: cros_ec: Small cle=
anups"
>> [1] that were posted before and already picked by Lee Jones.
>>=20
>> Testing was done on some Chromebooks that have a single EC and suppo=
rt
>> protocol v2 such as the Exynos5250 Snow, Exynos5420 Peach Pit and Ex=
ynos5800
>> Peach Pi to be sure that no regressions were introduced for these ma=
chines.
>>=20
>> The series were tested using a modified ectool [2] that supports the=
 new
>> cros_ec IOCTL API. They were also tested on a x86 Pixel Chromebook 2=
 (Samus)
>> that uses the new protocol v3 and has 2 EC (cros_ec and cros_pd). Bu=
t for
>> testing on Samus, also the posted "[PATCH 0/3] platform/chrome: Chan=
ges for
>> cros_ec_lpc and cros_ec_dev" series [3] are needed.
>=20
> everything still works as expected on a rk3288-veyron-jerry
>=20
> Tested-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
> [tags are already present in the patches]
>=20
>

Thanks a lot for testing again the patches.
=20
> As the series now has Olof's Ack, can this still make it in time for =
4.2 - as=20
> there is still a bit more than a week left till the merge window?
>

I hope so, the patch series have been in the lists for months now and b=
een
tested and reviewed in extensively. I also made sure that it doesn't ca=
use
any regressions on older Chromebook so it should be safe to pick for 4.=
2

>=20
> Heiko
>

Best regards,
Javier

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
