From: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v5 3/4] regulator: max77686: Add suspend disable for some
 LDOs
Date: Wed, 29 Oct 2014 11:53:38 +0100
Message-ID: <1414580018.18868.14.camel@AMDC1943>
References: <1414411911-5539-1-git-send-email-k.kozlowski@samsung.com>
 <1414411911-5539-4-git-send-email-k.kozlowski@samsung.com>
 <20141028223121.GH18557@sirena.org.uk> <1414574413.18868.6.camel@AMDC1943>
 <20141029100142.GR18557@sirena.org.uk> <1414577934.18868.7.camel@AMDC1943>
 <20141029103140.GY18557@sirena.org.uk> <1414579442.18868.13.camel@AMDC1943>
 <5450C6C2.2050506@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <5450C6C2.2050506-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On =C5=9Bro, 2014-10-29 at 11:51 +0100, Javier Martinez Canillas wrote:
> Hello Krzysztof,
>=20
> On 10/29/2014 11:44 AM, Krzysztof Kozlowski wrote:
> > On =C5=9Bro, 2014-10-29 at 10:31 +0000, Mark Brown wrote:
> >> On Wed, Oct 29, 2014 at 11:18:54AM +0100, Krzysztof Kozlowski wrot=
e:
> >> > On =C5=9Bro, 2014-10-29 at 10:01 +0000, Mark Brown wrote:
> >>=20
> >> > > No, this isn't suspend enable control - this is normal, standa=
rd enable
> >> > > control and the device has no suspend enable control.
> >>=20
> >> > You mean that for such regulator the driver shouldn't implement
> >> > suspend_enable()?
> >>=20
> >> Yes, if there is no separate control of suspend mode in hardware t=
hen of
> >> course the driver shouldn't implement operations for things it doe=
sn't
> >> have.
> >=20
> > Oh, thanks! I'll send fixed patch.
> >=20
> > This means that probably the max77802 ("mirrored" driver) should be
> > fixed...
> >=20
>=20
> Indeed, I had the same confusion that you had. Just to avoid duplicat=
ing work,
> do you want me to send a fix or are you going to include one on your =
series?

I'll send a patch for max77802 also.

Best regards,
Krzysztof


--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
