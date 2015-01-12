From: Joonyoung Shim <jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH] i2c: exynos5: Move initialization code to subsys_initcall()
Date: Mon, 12 Jan 2015 17:43:50 +0900
Message-ID: <54B38946.3020406@samsung.com>
References: <1421031182-18992-1-git-send-email-jy0922.shim@samsung.com>
 <20150112075019.GB22880@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <20150112075019.GB22880-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?windows-1252?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, naveenkrishna.ch-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, tomi.valkeinen-l0cyMroinI0@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

+Cc Tomi Valkeinen,

Hi Uwe,

On 01/12/2015 04:50 PM, Uwe Kleine-K=F6nig wrote:
> Hello,
>=20
> On Mon, Jan 12, 2015 at 11:53:02AM +0900, Joonyoung Shim wrote:
>> This is required in order to ensure that core system devices such as
>> voltage regulators attached via I2C are available early in boot.
> Deferred probing isn't an option? If so I suggest adding the reasonin=
g
> in a comment to stop the next person converting it to that.
> (And if not, please fix accordingly to use deferred probing.)
>=20

I couldn't get penguin logo since the commit 92b004d ("video/logo:
prevent use of logos after they have been freed") and i just tried old
way because i missed the flow to move to deferred probing.

=46b driver probe seems to be ran between fb_logo_late_init late_initca=
ll
and the freeing of the logos.

Any ideas?

Thanks for pointing.
