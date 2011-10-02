From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH 0/4] ARM: EXYNOS4: Support generic Power domain
	framework for EXYNOS4210
Date: Sun, 2 Oct 2011 12:48:11 +0100
Message-ID: <20111002114811.GU11710@n2100.arm.linux.org.uk>
References: <4E4360B2.2060508@samsung.com> <201108140139.46434.rjw@sisk.pl>
	<001701cc80d2$02ee4940$08cadbc0$%kim@samsung.com>
	<201110021347.02146.rjw@sisk.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <201110021347.02146.rjw@sisk.pl>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: Kukjin Kim <kgene.kim@samsung.com>, 'Chanwoo Choi' <cw00.choi@samsung.com>, 'Kyungmin Park' <kyungmin.park@samsung.com>, 'linux-samsung-soc' <linux-samsung-soc@vger.kernel.org>, linux-pm@lists.linux-foundation.org, 'linux-arm-kernel' <linux-arm-kernel@lists.infradead.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Sun, Oct 02, 2011 at 01:47:01PM +0200, Rafael J. Wysocki wrote:
> On Sunday, October 02, 2011, Kukjin Kim wrote:
> > Hmm... Even though each driver cannot know the given situation, the driver
> > can know each own clock should be alive or not. I think, if clock gating
> > (enable, disable clock) is required, it should be handled in each driver. In
> > addition, the clock and power are not always one-on-one match.
> 
> If the driver is to be portable and there's no guarantee that the
> clocks configuration on all systems it's supposed to be working with will
> always be the same, the driver shouldn't handle clocks directly.

How do these misconceptions start?

The clock API.  Drivers are supposed to get a clock (source) when they
initialize.  Drivers then enable and disable the clock as they _themselves_
require the use of that clock.

The clock enable is counted such that if there is at least one user of
the clock, it will be enabled.  It is not a forced 'off' when disable is
called - the number of enable calls must be balanced by the same number
of disable calls for the clock itself to be disabled.

Drivers are _expected_ to do this themselves.  Or the runtime PM stuff
if that's what they're doing.
