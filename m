From: Kevin Hilman <khilman@linaro.org>
Subject: Re: [PATCH v2 0/4] Exynos 5410 Dual cluster support
Date: Wed, 16 Oct 2013 15:15:03 -0700
Message-ID: <87k3hc3lso.fsf@linaro.org>
References: <1381763305-7085-1-git-send-email-v.tyrtov@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1381763305-7085-1-git-send-email-v.tyrtov@samsung.com>
	(Vyacheslav Tyrtov's message of "Mon, 14 Oct 2013 19:08:21 +0400")
Sender: linux-doc-owner@vger.kernel.org
To: Vyacheslav Tyrtov <v.tyrtov@samsung.com>
Cc: linux-kernel@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Landley <rob@landley.net>, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, Ben Dooks <ben-linux@fluff.org>, Mike Turquette <mturquette@linaro.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Heiko Stuebner <heiko@sntech.de>, Naour Romain <romain.naour@openwide.fr>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Tarek Dakhran <t.dakhran@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Vyacheslav Tyrtov <v.tyrtov@samsung.com> writes:

> The series of patches represent support of Exynos 5410 SoC
>     
> The Exynos 5410 is the first Samsung SoC based on bigLITTLE architecture.
> Patches allow all 8 CPU cores (4 x A7 and 4 x A15) to run at the same time
>     
> Patches add new platform description, support of clock controller,
> dual cluster support and device tree for Exynos 5410 
>    
> Has been build on v3.12-rc5.
> Has been tested on Exynos 5410 reference board (exynos_defconfig).

Has anyone tried this on the exynos5410 based odroid-xu yet?  

I tried booting this on my recently arrived odroid-xu, but am not
getting it to boot.

I'm not yet terribly familiar with this SoC, what are the settings 
needed for DEBUG_LL on this board?

Thanks,

Kevin
