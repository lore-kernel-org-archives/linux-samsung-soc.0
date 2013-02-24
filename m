From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH] pinctrl: return real error codes when pinctrl is not included
Date: Mon, 25 Feb 2013 00:15:29 +0100
Message-ID: <201302250015.29899.heiko@sntech.de>
References: <201302231855.47560.heiko@sntech.de> <201302242334.42408.heiko@sntech.de> <CACRpkdbKFWcT_Oa00nd_Op5ndOEc-cEkZm6fzHRuxs0Rc+ZOeA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdbKFWcT_Oa00nd_Op5ndOEc-cEkZm6fzHRuxs0Rc+ZOeA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Prathyush K <prathyush-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Am Sonntag, 24. Februar 2013, 23:42:32 schrieb Linus Walleij:
> On Sun, Feb 24, 2013 at 11:34 PM, Heiko St=FCbner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org> w=
rote:
> > [Me]
> >=20
> >> This make me suspect that you have this ugly patch in some
> >> private repo and I will be seeing it again and again :-(
> >=20
> > All my s3c24xx work is done is my spare time, so I have to confess =
I came
> > up with this "ugly patch" all by myself when working on dt support =
for
> > my machine and stumbling upon the described problem with the pin
> > configuration.
> >=20
> > So, as it is obviously wrong, I also won't hold onto it.
> >=20
> > In any case, thanks for the thorough explanation, which I probably =
won't
> > forget anytime soon.
>=20
> Hm, maybe I have come across as too harsh and then I feel bad about
> that :-(
>
> I really want spare-time contributors, they are often more valueable
> in addition to the corporate ones since they provide an outside view
> of things.

Just to ease your mind, it didn't sound to harsh and my mail wasn't mea=
nt to=20
criticize (hopefully it didn't sound that way) - I am very much gratefu=
l for=20
the explanation.

Writing a pinctrl driver for the s3c24xx arches is still on my list, so=
 my=20
understanding of pinctrl (above knowing of its existence) is not very b=
road=20
yet. With your explanation, in retrospect I can understand the ugliness=
 of the=20
patch now :-) as it goes against a core principle.


Heiko
