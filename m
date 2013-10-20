From: Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: s3c64xx: mini6410: Correct card detect
	type for HSMMC1
Date: Mon, 21 Oct 2013 00:42:48 +0200
Message-ID: <1538561.RlaZEsIrlT@thinkpad>
References: <1380471121-9478-1-git-send-email-tomasz.figa@gmail.com>
	<1e2a01cecb91$f790c700$e6b25500$@org>
	<5264529C.1000601@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <oselas-bounces+gcepoc-oselas=m.gmane.org-/6JGXy0y6WNX4V3MAk3apN53zsg1cpMQ@public.gmane.org>
In-Reply-To: <5264529C.1000601-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Unsubscribe: <http://metis.pengutronix.de/cgi-bin/mailman/options/oselas>,
	<mailto:oselas-request-/6JGXy0y6WNX4V3MAk3apN53zsg1cpMQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://metis.pengutronix.de/pipermail/oselas>
List-Post: <mailto:oselas-/6JGXy0y6WNX4V3MAk3apN53zsg1cpMQ@public.gmane.org>
List-Help: <mailto:oselas-request-/6JGXy0y6WNX4V3MAk3apN53zsg1cpMQ@public.gmane.org?subject=help>
List-Subscribe: <http://metis.pengutronix.de/cgi-bin/mailman/listinfo/oselas>,
	<mailto:oselas-request-/6JGXy0y6WNX4V3MAk3apN53zsg1cpMQ@public.gmane.org?subject=subscribe>
Sender: oselas-bounces-/6JGXy0y6WNX4V3MAk3apN53zsg1cpMQ@public.gmane.org
Errors-To: oselas-bounces+gcepoc-oselas=m.gmane.org-/6JGXy0y6WNX4V3MAk3apN53zsg1cpMQ@public.gmane.org
To: Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, 'Russell King - ARM Linux' <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, oselas-/6JGXy0y6WNX4V3MAk3apN53zsg1cpMQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, 'Ben Dooks' <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, augulis.darius-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Kukjin,

On Monday 21 of October 2013 07:01:00 Kukjin Kim wrote:
> On 10/18/13 08:38, Kukjin Kim wrote:
> > Tomasz Figa wrote:
> >> Hi Kukjin,
> > 
> > Hi,
> > 
> >> On Sunday 29 of September 2013 18:12:01 Tomasz Figa wrote:
> >>> According to board schematics, for HSMMC1 a GPIO line is used to
> >>> detect
> >>> card presence, while currently it is being configured for internal
> >>> card
> >>> detect line, which is multiplexed with card detect line of HSMMC0 and
> >>> thus breaking it.
> >>> 
> >>> This patch adds proper sdhci platform data setting card detect type
> >>> to
> >>> external GPIO and fixing operation of HSMMC0.
> >>> 
> >>> Signed-off-by: Tomasz Figa<tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> >>> ---
> >>> 
> >>>   arch/arm/mach-s3c64xx/mach-mini6410.c | 10 ++++++++++
> >>>   1 file changed, 10 insertions(+)
> >> 
> >> Would you mind taking this patch to your tree?
> > 
> > Applied, thanks.
> > Kukjin
> 
> Uhm...just small concern...it's possible to support dt for mini6410 but
> basic. I need to hold this on...

May I ask you to explain your concern about this?

I believe this bug fix is fine, since we still support board files for 
s3c64xx and DT based support is experimental at the moment.

Best regards,
Tomasz
