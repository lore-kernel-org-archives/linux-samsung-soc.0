From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] i2c: s3c2410: check for NULL pinctrl handle
Date: Sun, 24 Feb 2013 01:16:21 +0100
Message-ID: <CACRpkdbV-CznfnbCbKkKpndjiG32V9yNdrF1F7M=4qe1EUroGA@mail.gmail.com>
References: <201302231855.47560.heiko@sntech.de>
	<201302231857.46445.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201302231857.46445.heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Sat, Feb 23, 2013 at 6:57 PM, Heiko St=FCbner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org> wrot=
e:

> When pinctrl is not built the fallback functions fail silently
> and emit either 0 error codes or NULL pinctrl handles.
>
> Therefore it's needed to also check for this NULL-handle when
> falling back to parsing the i2c gpios from devicetree.
>
> Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>

NAK.

This is not the right solution for this driver.

It uses pinctrl in a very simplistic way, just grabbing the
default handler.

After commit
ab78029ecc347debbd737f06688d788bd9d60c1d:
"drivers/pinctrl: grab default handles from device core"

The right solution is to simply revert commit
2693ac69880a33d4d9df6f128415b65e745f00ba
"i2c: s3c2410: Add support for pinctrl"

Tomasz are you OK with this, or will you add more
fine-grained pinctrl (like runtime PM etc) to this driver?

Yours,
Linus Walleij
