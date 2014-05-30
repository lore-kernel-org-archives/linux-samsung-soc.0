From: Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v11 0/3] Exynos 5410 support
Date: Fri, 30 May 2014 07:10:58 +0200
Message-ID: <538812E2.6070807@gmail.com>
References: <1401074613-29227-1-git-send-email-t.dakhran@samsung.com> <7hr43f9mmn.fsf@paris.lan> <538737CA.4070709@suse.de> <53874862.5080809@samsung.com> <538775AB.3000604@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <538775AB.3000604-l3A5Bk7waGM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, Tarek Dakhran <t.dakhran-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tarek Dakhran <t.dakhran-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Andreas,

On 29.05.2014 20:00, Andreas F=E4rber wrote:

[snip]

> Some of the low-hanging fruit like no heartbeat/SD LEDs, no RTC, no
> usb3503 and thus no network I'm already looking into myself. For now =
I'm
> putting everything into the SMDK .dts, but I guess we'll need to spli=
t
> off -odroidxu.dts and -pinctrl.dtsi at some point.

Odroid XU needs its own dts for sure. I think you can make a copy of
SMDK dts and name it -odroidxu straightaway and work further with it.

exynos5410-pinctrl.dtsi is used for generic SoC-wide pinctrl
definitions, such as pin banks and pin groups. There should be no
board-specific things defined in it. Instead respective board dts shoul=
d
have them.

>=20
> What about graphics? The 5410 is an oddball in using PowerVR rather t=
han
> Mali GPU - should a framebuffer on HDMI or DisplayPort work if we add=
 DT
> nodes, or will the GPU require larger code changes?

The 3D GPU is completely independent from display controllers, which ar=
e
standard Samsung IP blocks, so you should be able to get unaccelerated
output using VP+Mixer+HDMI or FIMD+DP using existing drivers.

Best regards,
Tomasz
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
