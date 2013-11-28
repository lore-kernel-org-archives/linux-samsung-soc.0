From: Alexei Colin <alexei@alexeicolin.com>
Subject: Re: [PATCH v3 0/4] Exynos 5410 Dual cluster support
Date: Thu, 28 Nov 2013 05:45:59 -0500
Message-ID: <52971EE7.7070702@alexeicolin.com>
References: <1383811969-32712-1-git-send-email-v.tyrtov@samsung.com> <1951315.Ol55YFu91h@flatron> <528CBF17.4020500@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <528CBF17.4020500@samsung.com>
Sender: linux-doc-owner@vger.kernel.org
To: Tarek Dakhran <t.dakhran@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Vyacheslav Tyrtov <v.tyrtov@samsung.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, Ben Dooks <ben-linux@fluff.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, nicolas.pitre@linaro.org, Stephen Warren <swarren@wwwdotorg.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-samsung-soc@vger.kernel.org, Rob Landley <rob@landley.net>, Mike Turquette <mturquette@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Naour Romain <romain.naour@openwide.fr>, Dave.Martin@arm.com, linux-arm-kernel@lists.infradead.org, Heiko Stuebner <heiko@sntech.de>
List-Id: linux-samsung-soc@vger.kernel.org

On 11/20/2013 08:54 AM, Tarek Dakhran wrote:
> On 20.11.2013 03:23, Tomasz Figa wrote:
>> I've applied the patches on top of today's linux-next and tried to boot
>> my ODROID-XU using exynos5410-smdk5410.dts and exynos_defconfig, but all
>> I can get is an imprecise external abort, when the kernel tries to jump
>> to init. Full boot log below. Any ideas?

>> [    5.195000] Unhandled fault: imprecise external abort (0x1406) at 0x00000000
>> [    5.210000] Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000007
>>
> Tomasz, there is CCI on/off switcher on smdk5410 board, also there is 
> XOMCCI pin on SoC.
> Looks like switcher on board controls the XOMCCI SoC pin.
> 
> When I turn switcher OFF, I getting the same problem you got.
> Please, check the cci state on Odroid-XU Board, maybe it is turned off.

I've soldered a wire to the XOMCCI pin on Odroid-XU+E. When pulled to
Vdd via 100k (original configuration), the fault is "imprecise external
abort (0x1406)" (as above). When pulled to ground, the fault is
"imprecise external abort (0x406)". This is consistently reproducible.

AFAICT, from ARM reference [1]: the 5 status bits in both cases are
"Asynchronous external abort." and the difference is bit 12 "external
abort type:" when pulled to Vdd, caused by "AXI Slave error," when
pulled to ground, caused by "AXI Decode error".

Any pointers on further differences between SMDK5410 and ODROID-XU that
are preventing the patch from booting? Thanks in advance.

[1]
http://infocenter.arm.com/help/index.jsp?topic=/com.arm.doc.ddi0344b/Bgbiaghh.html

