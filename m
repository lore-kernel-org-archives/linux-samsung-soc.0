From: Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Subject: Re: [PATCH v4 0/8] mfd: cros_ec: Add multi EC and proto v3 support
Date: Wed, 03 Jun 2015 08:45:32 +0200
Message-ID: <556EA28C.2080200@collabora.co.uk>
References: <1433232671-27679-1-git-send-email-javier.martinez@collabora.co.uk> <2123062.dmIBPlf795@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2123062.dmIBPlf795@diego>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?windows-1252?Q?Heiko_St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Bill Richardson <wfrichar-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Simon Glass <sjg-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Gwendal Grignou <gwendal-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Stephen Barber <smbarber-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Filipe Brandenburger <filbranden-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Todd Broch <tbroch-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Alexandru M Stan <amstan-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Hello Heiko,

On 06/02/2015 11:15 PM, Heiko St=FCbner wrote:
> Am Dienstag, 2. Juni 2015, 10:11:03 schrieb Javier Martinez Canillas:
>> Hello,
>>=20
>> Newer Chromebooks have more than one Embedded Controller (EC) in the
>> system. These additional ECs are connected through I2C with a host E=
C
>> which is the one that is connected to the Application Processor (AP)
>> through different transports (I2C, SPI or LPC).
>>=20
>> So on these platforms, sub-processors are chained to each other:
>>=20
>> AP <--> Host EC <--> Power Delivery (PD) EC
>>=20
>> The AP sends commands to the additional EC through the host EC using
>> a set of passthru commands and the host redirects to the correct EC.
>>=20
>> This is a v4 of a series that adds support for multiple EC in a syst=
em
>> and also for the protocol version 3 that is used on newer ECs.
>>=20
>> Most patches were taken from the downstream ChromiumOS v3.14 tree wi=
th
>> fixes squashed, split to minimise the cross subsystem churn and chan=
ges
>> for mainline inclusion but were not modified functionality wise.
>>=20
>> This version addresses a lot of issues pointed out by Lee Jones on t=
he v3
>> posted before [0].
>>=20
>> The patches are based on top of "[PATCH 0/2] mfd: cros_ec: Small cle=
anups"
>> [1] that were posted before and was already picked by Lee Jones.
>>=20
>> Testing was done on some Chromebooks that have a single EC and suppo=
rt
>> protocol v2 such as the Exynos5250 Snow, Exynos5420 Peach Pit and Ex=
ynos5800
>> Peach Pi to be sure that no regressions were introduced for these ma=
chines.
>=20
> I just gave this a try on veyron and everything still works as expect=
ed.
>=20
> All patches except "[PATCH v4 6/8] mfd: cros_ec: Support multiple EC =
in a=20
> system" already have Tested-by tags, so this patch now is also
>=20
> Tested-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
>=20

Thanks a lot for testing the series again.

Now let's wait for Olof to review/ack/provide feedback on patches #1-#6
that touches drivers/platform/chrome, so Lee can merge through his tree=
=2E

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
