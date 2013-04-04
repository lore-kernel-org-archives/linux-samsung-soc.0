From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: GENERIC_GPIO considered deprecated
Date: Thu, 04 Apr 2013 09:35:58 +0900
Message-ID: <26e401ce30cc$602e45f0$208ad1d0$%kim@samsung.com>
References: <CAAVeFu+QUw1WmzwaJDfjyw75PrStd3p3PHs1MU5BC7_WXMB7kw@mail.gmail.com>
 <51576214.8010307@openwide.fr>
 <CAAVeFu++8YOOSxPbAaTudxSGcBomkGrakBjiVyD+XSee54TrWw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
In-reply-to: <CAAVeFu++8YOOSxPbAaTudxSGcBomkGrakBjiVyD+XSee54TrWw@mail.gmail.com>
Content-language: ko
Sender: linux-next-owner@vger.kernel.org
To: 'Alexandre Courbot' <gnurou@gmail.com>, 'Romain Naour' <romain.naour@openwide.fr>
Cc: 'linux-next' <linux-next@vger.kernel.org>, 'Grant Likely' <grant.likely@secretlab.ca>, 'Linus Walleij' <linus.walleij@linaro.org>, tomasz.figa@gmail.com, heiko@sntech.de, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Alexandre Courbot wrote:
> 
> Hi Romain,
> 
> On Sat, Mar 30, 2013 at 3:07 PM, Romain Naour <romain.naour@openwide.fr>
> wrote:
> > Hi Alex,
> >
> > When I read your mail, I was surprised that you were speaking about
> GPIOs, my pathes for samsung CPUs are intended for timer sub-system.
> >
> > As you can see in this thread, when I send my patches "ARM: S3C24XX: Add
> samsung-time support for s3c24xx" and "Add samsung-time support for
> s5pc100". They didn't add "select GENERIC_GPIO".
> > http://thread.gmane.org/gmane.linux.kernel.samsung-soc/13432/focus=14980
> > http://thread.gmane.org/gmane.linux.kernel.samsung-soc/13432/focus=14982
> >
> > There is something wrong with the commit, I see that "select
> GENERIC_GPIO" was added in my patches by mistake.

Oops, sorry about that.

> >
> > I recommend you to speak directly with samsung's kernel maintainer that
> I CC in this mail.
> 
Thanks...

> Indeed, it seems like these "select GENERIC_GPIO" have been added
> during the merge of your patches, since I can see the line is here in
> your patch (but not added by it). Kim, on the current next there are
> two of these "select GENERIC_GPIO" that are added from your branch,

OK, I see.

> could you amend the patches that adds them such as they get changed
> into "select ARCH_REQUIRE_GPIOLIB" instead? You can grep for "select

I can do it for my tree but the branch already included in arm-soc tree so I think, it should be fixed with another patch. And 

> GENERIC_GPIO" in arch/arm to find the offending lines. We are removing
> GENERIC_GPIO and this work cannot be merged until you do this since it
> would break ARM builds. Thanks!
> 
So how about following? If you are OK, let me take into samsung tree.

--------8<----------------8<--------
From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] ARM: SAMSUNG: change GENERIC_GPIO to ARCH_REQUIRE_GPIOLIB

When I applied regarding samsung-time patches, the "select GENERIC_GPIO"
has been added wrong, so this patch fixes that.
And since the GENERIC_GPIO in arch/arm/ will be gone away, this adds
ARCH_REQUIRE_GPIOLIB for S3C24XX and S5PC100 instead.

Reported-by: Alexandre Courbot <gnurou@gmail.com>
Cc: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/Kconfig |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 46fcfa8..a239c7e 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -770,10 +770,10 @@ config ARCH_SA1100
 config ARCH_S3C24XX
 	bool "Samsung S3C24XX SoCs"
 	select ARCH_HAS_CPUFREQ
+	select ARCH_REQUIRE_GPIOLIB
 	select CLKDEV_LOOKUP
 	select CLKSRC_MMIO
 	select GENERIC_CLOCKEVENTS
-	select GENERIC_GPIO
 	select HAVE_CLK
 	select HAVE_S3C2410_I2C if I2C
 	select HAVE_S3C2410_WATCHDOG if WATCHDOG
@@ -828,11 +828,11 @@ config ARCH_S5P64X0
 
 config ARCH_S5PC100
 	bool "Samsung S5PC100"
+	select ARCH_REQUIRE_GPIOLIB
 	select CLKDEV_LOOKUP
 	select CLKSRC_MMIO
 	select CPU_V7
 	select GENERIC_CLOCKEVENTS
-	select GENERIC_GPIO
 	select HAVE_CLK
 	select HAVE_S3C2410_I2C if I2C
 	select HAVE_S3C2410_WATCHDOG if WATCHDOG
-- 
1.7.10.4
