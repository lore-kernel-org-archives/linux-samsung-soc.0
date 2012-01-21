From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH 2/2] i2c-s3c2410: Add stub runtime power management
Date: Sat, 21 Jan 2012 21:57:59 +0000
Message-ID: <20120121215758.GC8331@opensource.wolfsonmicro.com>
References: <1327152527-11364-1-git-send-email-broonie@opensource.wolfsonmicro.com>
 <20120121183155.GE10751@opensource.wolfsonmicro.com>
 <4F1B2235.4000009@gmail.com>
 <201201212223.54801.heiko@sntech.de>
 <4F1B2F38.9050708@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4F1B2F38.9050708-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sylwester Nawrocki <sylvester.nawrocki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jean Delvare <khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org>, Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, linux-samsung-soc <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Sat, Jan 21, 2012 at 10:33:44PM +0100, Sylwester Nawrocki wrote:
> On 01/21/2012 10:23 PM, Heiko St=FCbner wrote:

> > At least S3C2416/S3C2450 and S3C2412 (i.e. the ARMv5 SoCs) might pr=
ofit from
> > it, as they also support the idle modes (stop modes) that Mark is t=
argetting
> > with his patches in the long run.

> It would be much better to enable core runtime PM support on all plat=
forms
> that use particular driver, even though there is no any drivers adapt=
ed=20
> runtime PM on some of them yet.

It's just a Kconfig switch, the only issue is that users might not turn
it on and for platforms where there's not much driver support they're
more likely to not have done so.

> > Not sure about the 2410, 2440 and 2443 currently

> But would just enabling RUNTIME_PM make any harm to those platforms ?

It really shouldn't cause any issues but it seems better to not push
people towards it too much when there's not much win yet.  What I've
been doing with all these patches is leaving any PM that already exists
untouched (in so far as it's not buggy).  Where there's nothing already
and it's all new code I've been using a more modern idiom.  I hope that
this minimise any impact on existing systems.
