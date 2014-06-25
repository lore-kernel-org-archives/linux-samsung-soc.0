From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 4/4 v2] ARM: DTS: Add NTC thermistor nodes to Exynos5420
 based Peach_PIT
Date: Wed, 25 Jun 2014 13:40:47 -0700
Message-ID: <CAD=FV=WeuFhGK=JNEm20CT73J=c1Zc_dZGQT6bKeob895M+kQA@mail.gmail.com>
References: <1403677773-21141-1-git-send-email-ch.naveen@samsung.com>
	<1403677773-21141-5-git-send-email-ch.naveen@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1403677773-21141-5-git-send-email-ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: linux-samsung-soc <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-iio <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Naveen Krishna <naveenkrishna.ch-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "cpgs ." <cpgs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Naveen,

On Tue, Jun 24, 2014 at 11:29 PM, Naveen Krishna Chatradhi
<ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
> Exynos5420 based Peach PIT board has 4 NTC thermistors to measure
> temperatures at various points on the board.
>
> IIO based ADC becomes the parent and NTC thermistors are the childs,
> via the HWMON interface.
>
> Signed-off-by: Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Cc: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> ---
> Changes since v1:
> 1. Arranged the ADC node alphabetical
> 2. Added "status = "okay"" to the ADC node
>
> This patch needs
> 1. MAX77802 PMIC device tree nodes (for ldo9)
>    https://www.mail-archive.com/devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org/msg31430.html
> 2. Uses the DT documentation for NTC thermistors updated with vendor-prefix
>
> This patch set is tested
> 1. On Peach PIT board via sysfs entry exposed by hwmon
> localhost ~ # cat /sys/class/hwmon/hwmon*/device/temp1_input
> 37436
> 36449
> 38560
> 38059
>
> 2. Backward compatibility is tested by replacing "murata" with "ntc"
>    in the dts nodes and running the above test.
>
>  arch/arm/boot/dts/exynos5420-peach-pit.dts |   34 ++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)

Now that Javier has spun his patch, perhaps you can fold the "pi"
version in here too?

Reviewed-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Tested-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
