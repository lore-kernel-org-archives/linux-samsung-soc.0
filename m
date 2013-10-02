From: Dave Martin <Dave.Martin@arm.com>
Subject: Re: [PATCH 3/6] ARM: EXYNOS: add Exynos Dual Cluster Support
Date: Wed, 2 Oct 2013 14:05:50 +0100
Message-ID: <20131002130550.GB3407@localhost.localdomain>
References: <1380644227-12244-1-git-send-email-v.tyrtov@samsung.com>
 <1380644227-12244-4-git-send-email-v.tyrtov@samsung.com>
 <alpine.LFD.2.03.1310011451390.21228@syhkavp.arg>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.03.1310011451390.21228@syhkavp.arg>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, Daniel Lezcano <daniel.lezcano@linaro.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Stephen Warren <swarren@wwwdotorg.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, linux-samsung-soc@vger.kernel.org, Vyacheslav Tyrtov <v.tyrtov@samsung.com>, Ben Dooks <ben-linux@fluff.org>, Tarek Dakhran <t.dakhran@samsung.com>, Thomas Gleixner <tglx@linutronix.de>, Rob Landley <rob@landley.net>, Heiko Stuebner <heiko@sntech.de>, Mike Turquette <mturquette@linaro.org>, linux-arm-kernel@lists.infradead.org, Naour Romain <romain.naour@openwide.fr>
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, Oct 01, 2013 at 03:55:24PM -0400, Nicolas Pitre wrote:
> On Tue, 1 Oct 2013, Vyacheslav Tyrtov wrote:
> 
> > From: Tarek Dakhran <t.dakhran@samsung.com>

[...]

> > +	kfs_use_count[cpu][cluster]++;
> > +	if (kfs_use_count[cpu][cluster] == 1) {
> > +		++core_count[cluster];
> > +		if (core_count[cluster] == 1) {
> > +			ret = exynos_cluster_power_up(cluster);
> > +			if (ret) {
> > +				pr_err("%s: cluster %u power up error\n",
> > +					__func__, cluster);
> > +				return ret;
> > +			}
> > +			__cci_control_port_by_index(MAX_NR_CLUSTERS
> > +					 - cluster, true);
> 
> This is wrong and very racy.  The state machine implemented in 
> mcpm-head.S is there already to handle proper synchronization for you.  

Maybe this issue didn't make itself obvious yet due to the lack of
suspend support.

Moving the CCI maintenance to power_up_setup() is essential for suspend/
resume to work, because then CPUs can power up randomly in response to
interrupts -- exynos_lock is not sufficient protection in that case.

The TC2 code should provide a good example of what to do.

[...]

Cheers
---Dave
