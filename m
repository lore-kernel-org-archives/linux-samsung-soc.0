From: Arnaud Patard (Rtp) <arnaud.patard@rtp-net.org>
Subject: Re: [PATCH 1/2] ARM: Make consolidated PM sleep code depend on
	PM_SLEEP
Date: Sun, 03 Apr 2011 13:26:35 +0200
Message-ID: <87ipuvr2xg.fsf@lebrac.rtp-net.org>
References: <20110402091904.GH8482@n2100.arm.linux.org.uk>
	<E1Q5x0g-0001Yw-Vb@rmk-PC.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <E1Q5x0g-0001Yw-Vb@rmk-PC.arm.linux.org.uk> (Russell King's
	message of "Sat, 02 Apr 2011 10:20:46 +0100")
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

Russell King - ARM Linux <linux@arm.linux.org.uk> writes:

> CONFIG_PM is now set whenever we support either runtime PM in addition
> to suspend and hibernate.  This causes build errors when runtime PM is
> enabled on a platform, but the CPU does not have the appropriate support
> for suspend.
>
> So, switch this code to use CONFIG_PM_SLEEP rather than CONFIG_PM to
> allow runtime PM to be enabled without causing build errors.

I've build-tested on some failing platforms theses 2 patches and the
build are now succeeding. The only PM related zImage build error I found
was for s5pc100:

arch/arm/plat-samsung/pm.c:32:26: fatal error: mach/pm-core.h: No such file or directory

S5PC100 is a armv7 that's why it's still selected. I guess it will still
need some extra care unless the pm-core.h file is provided. One can try
use the same file as for s5pv210.h. I guess that it has probably not be
done because it was not working (I'm even wondering the differences
between s5pc100 and s5pv210 but this has nothing to do with our current
build troubles).


Arnaud
