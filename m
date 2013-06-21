From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: Re: [PATCH v2 1/3] mfd: Add irq domain support for max8998
 interrupts
Date: Fri, 21 Jun 2013 14:12:02 +0000
Message-ID: <u0l61x7a6z1.fsf@orc04.imf.au.dk>
References: <1371818017-5215-1-git-send-email-t.figa@samsung.com>
	<1371818017-5215-2-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1371818017-5215-2-git-send-email-t.figa@samsung.com> (Tomasz
 Figa's message of "Fri, 21 Jun 2013 14:33:35 +0200")
Sender: linux-kernel-owner@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene.kim@samsung.com>, Alessandro Zummo <a.zummo@towertech.it>, Grant Likely <grant.likely@linaro.org>, Jiri Kosina <jkosina@suse.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Masanari Iida <standby24x7@gmail.com>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, rtc-linux@googlegroups.com, Russell King <linux@arm.linux.org.uk>, Samuel Ortiz <sameo@linux.intel.com>, Kyungmin Park <kyungmin.park@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Tomasz Figa <t.figa@samsung.com> writes:

> All uses of irq_base in platform data and max8997 driver private data
> are removed.
>
[...]
> +static int max8998_irq_domain_map(struct irq_domain *d, unsigned int irq,
> +					irq_hw_number_t hw)
> +{
> +	struct max8997_dev *max8998 = d->host_data;

I may be wrong, but this sure looks like a typo (or copy-pasto).

-- 
Rasmus Villemoes
<http://rasmusvillemoes.dk/>
