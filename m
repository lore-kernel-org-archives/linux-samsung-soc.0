From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH 2/4] ARM: S3C24XX: trim down debug uart handling
Date: Thu, 24 Apr 2014 12:48:41 +0200
Message-ID: <24114123.4LqcQi8gAH@phil>
References: <1544889.hRy2JpKRQe@phil> <1410234.AYxfyBcLWB@phil>
 <20140424103455.GJ26756@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20140424103455.GJ26756@n2100.arm.linux.org.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: linux-samsung-soc@vger.kernel.org, t.figa@samsung.com, Kukjin Kim <kgene.kim@samsung.com>, arm@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

Am Donnerstag, 24. April 2014, 11:34:55 schrieb Russell King - ARM Linux:
> On Thu, Apr 24, 2014 at 12:24:31PM +0200, Heiko St=FCbner wrote:
> > +choice
> > +	prompt "S3C24XX low-level debugging port type"
> > +	depends on DEBUG_LL && ARCH_S3C24XX
> > +
> > +	config DEBUG_S3C24XX_UART_S3C2440
> > +		bool "S3C2440 uart type"
> > +		help
> > +		  Select this if you're debugging S3C2416, S3C2440, S3C2442,
> > +		  S3C2443 or S3C2450 SoCs.
> > +
> > +	config DEBUG_S3C24XX_UART_S3C2410
> > +		bool "S3C2410 uart type"
> > +		help
> > +		  Select this if you're debugging S3C2410 or S3C2412 SoCs.
> > +endchoice
> =

> Why does this need to be a separate choice statement?  What's special
> about S3C24XX?  Is there something wrong with the main choice statement
> just above this where everyone else lists their debugging UART?

The special case is that s3c24xx as architecture has two different uart typ=
es. =

Everything else is the same so I didn't want to duplicate the s3c_debug_uar=
tX =

entries.

The other option would have been to duplicate these, like having

- s3c_debug_uart[0-3] for the more common s3c2440 type and
- s3c2410_debug_uart[0-3] for the named type

I guess, judging from your comment this would be better?
[or I'm just overlooking the obvious third way :-) ]


Heiko
