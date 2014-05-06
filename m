From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH v2 0/4] ARM: S3C24XX: cleanup debug macro/earlyprintk
Date: Tue, 06 May 2014 10:44:01 +0200
Message-ID: <2586347.kOddnpvo1Z@diego>
References: <1856986.kkQFKFg1L2@phil>
 <0cc401cf68e1$eb87f580$c297e080$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <0cc401cf68e1$eb87f580$c297e080$@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kukjin Kim <kgene.kim@samsung.com>, arm@kernel.org
Cc: t.figa@samsung.com, linux-samsung-soc@vger.kernel.org, 'Russell King' <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

Am Dienstag, 6. Mai 2014, 13:16:14 schrieb Kukjin Kim:
> Heiko St=FCbner wrote:
> > This series tries to simplify the s3c24xx debug macro, removing
> > dependencies
> > on mach/ includes, static mappings and finally moving it into
> > include/debug.
> =

> I think, it's good way :)
> =

> > The one slightly invasive change is the need for the developer to select
> > the uart type by himself, which gets rid of the debug macro trying to
> > determine the uart type itself.
> > =

> > But as usage of the debug-uart is not the common case - especially in a
> > multiplatform scenario - I didn't worry to much.
> =

> Yeah, I also don't want s3c24xx to support multiplatform in near future.
> =

> > Based on 3.15-rc1 and tested on a S3C2442 Openmoko Freerunner (GTA02)
> > =

> > changes since v1:
> > - do not introduce a secondary choice option, instead implement the
> > =

> >   s3c2410 debug uarts as separate options
> > =

> > Heiko Stuebner (4):
> >   ARM: compressed/head.S: remove s3c24xx special case
> >   ARM: S3C24XX: trim down debug uart handling
> >   ARM: S3C24XX: use generic DEBUG_UART_PHY/_VIRT in debug macro
> >   ARM: S3C24XX: move debug-macro.S into the common space
> >  =

> >  arch/arm/Kconfig.debug                           |  54 +++++++++++-
> >  arch/arm/boot/compressed/head.S                  |   5 --
> >  arch/arm/include/debug/s3c24xx.S                 |  46 +++++++++++
> >  arch/arm/mach-s3c24xx/Kconfig                    |  28 -------
> >  arch/arm/mach-s3c24xx/include/mach/debug-macro.S | 101 ---------------=
---
> > =

> > -----
> > =

> >  5 files changed, 98 insertions(+), 136 deletions(-)
> >  create mode 100644 arch/arm/include/debug/s3c24xx.S
> >  delete mode 100644 arch/arm/mach-s3c24xx/include/mach/debug-macro.S
> > =

> > --
> > 1.9.0
> =

> Basically I'm OK on this series but need to get review from Russell?

Russell pointed out a bad decision on my part in v1, so I guess he is aware=
 of =

this series :-) . I've also added arm@kernel.org now, so they can complain,=
 if =

anything is done wrong [should've probably done that from the beginning].


Heiko
