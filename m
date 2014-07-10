From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v6 15/23] regulator: max77686: Setup DVS-related GPIOs on
 probe
Date: Thu, 10 Jul 2014 14:25:34 +0100
Message-ID: <20140710132534.GD11948@lee--X1>
References: <1404467722-26687-1-git-send-email-javier.martinez@collabora.co.uk>
 <1404467722-26687-16-git-send-email-javier.martinez@collabora.co.uk>
 <CADGdYn4EURaHinWVksQSPzVr=CkZYcrqvWsO7mKDz_gY9XB__Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CADGdYn4EURaHinWVksQSPzVr=CkZYcrqvWsO7mKDz_gY9XB__Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: amit daniel kachhap <amit.daniel-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Yadwinder Singh Brar <yadi.brar01-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Tushar Behera <trblinux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andreas Farber <afaerber-l3A5Bk7waGM@public.gmane.org>, LAK <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, 10 Jul 2014, amit daniel kachhap wrote:

> On Fri, Jul 4, 2014 at 3:25 PM, Javier Martinez Canillas
> <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org> wrote:
> > MAX77686 PMIC support Dyamic Voltage Scaling (DVS) on a set
> > of Buck regulators. A number of GPIO are connected to these
> > lines and are requested by the mfd driver. Setup the GPIO
> > pins from the regulator driver.

> If possible merge this patch with patch 8. Both are adding DVS
> support. Put regmap_copy dependency patch in very beginning.

You want to merge two patches which deal with different subsystems?

That's the opposite of what we usually try and achieve.

> > Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.=
co.uk>
> > ---
> >  drivers/regulator/max77686.c | 34 ++++++++++++++++++++++++++++++++=
++
> >  1 file changed, 34 insertions(+)

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
