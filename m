From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH v4 2/4] clk: exynos5410: register clocks using common clock
 framework
Date: Mon, 09 Dec 2013 17:34:44 +0100
Message-ID: <1914850.6CAa0SzDWP@amdc1227>
References: <1385456288-20398-1-git-send-email-v.tyrtov@samsung.com>
 <1385456288-20398-3-git-send-email-v.tyrtov@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-reply-to: <1385456288-20398-3-git-send-email-v.tyrtov@samsung.com>
Sender: linux-doc-owner@vger.kernel.org
To: Vyacheslav Tyrtov <v.tyrtov@samsung.com>
Cc: linux-kernel@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Landley <rob@landley.net>, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, Ben Dooks <ben-linux@fluff.org>, Mike Turquette <mturquette@linaro.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Heiko Stuebner <heiko@sntech.de>, Naour Romain <romain.naour@openwide.fr>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Tarek Dakhran <t.dakhran@samsung.com>, Dave.Martin@arm.com, nicolas.pitre@linaro.org, tomasz.figa@gmail.com
List-Id: linux-samsung-soc@vger.kernel.org

Hi Vyacheslav, Tarek,

On Tuesday 26 of November 2013 12:58:06 Vyacheslav Tyrtov wrote:
> From: Tarek Dakhran <t.dakhran@samsung.com>
> 
> The EXYNOS5410 clocks are statically listed and registered
> using the Samsung specific common clock helper functions.
> 
> Signed-off-by: Tarek Dakhran <t.dakhran@samsung.com>
> Signed-off-by: Vyacheslav Tyrtov <v.tyrtov@samsung.com>
> ---
>  .../devicetree/bindings/clock/exynos5410-clock.txt |  54 +++++
>  drivers/clk/samsung/Makefile                       |   1 +
>  drivers/clk/samsung/clk-exynos5410.c               | 239 +++++++++++++++++++++
>  include/dt-bindings/clock/exynos5410.h             |  32 +++
>  4 files changed, 326 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/exynos5410-clock.txt
>  create mode 100644 drivers/clk/samsung/clk-exynos5410.c
>  create mode 100644 include/dt-bindings/clock/exynos5410.h

Acked-by: Tomasz Figa <t.figa@samsung.com>

This should go through Samsung tree, I guess, since it's a dependency
of other patches in this series and doesn't depend on any things from
clock tree. Mike, Kukjin, are you okay with this?

Best regards,
Tomasz

