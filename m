From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [RFC] IDLE/DEEP IDLE scheduler modification for power savings
Date: Tue, 13 Apr 2010 09:57:17 +0100
Message-ID: <20100413085716.GB22320@sirena.org.uk>
References: <000001cada24$01a5ee90$04f1cbb0$%majewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:52863 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752448Ab0DMI5S (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 13 Apr 2010 04:57:18 -0400
Content-Disposition: inline
In-Reply-To: <000001cada24$01a5ee90$04f1cbb0$%majewski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Lukasz Majewski <l.majewski@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.local>, 'Kyungmin Park' <kyungmin.park@samsung.com>, 'Ingo Molnar' <mingo@redhat.com>, Tomasz Fujak <t.fujak@samsung.local>

On Mon, Apr 12, 2010 at 11:39:05AM +0200, Lukasz Majewski wrote:

> Some SoCs allow for entering IDLE mode when they know that the system will
> be
> "inactive" for some time (to be more precise it will execute the idle task -
> which prepares system to enter IDLE state). In that mode CPU core is not
> active
> (CPU core is clock gated) and may be woken up by several interrupts. IDLE
> mode entering is already implemented in the kernel and works smoothly.

Have you looked at the cpuidle infrastructure in the kernel?  It's
mostly used on desktop systems at the minute but IIRC there was some
investigation into use in embedded environments.  There's also the work
that's been done on OMAP and SH CPUs in this area.
