From: Naresh Kamboju <naresh.kamboju@linaro.org>
Subject: linux-next: origen build failed at drivers/pinctrl/pinctrl-exynos.c
Date: Tue, 18 Jun 2013 21:49:19 +0530
Message-ID: <CA+G9fYu3_-RZxFyRENuqJvzsM=YToT7PG+5fUytMzhsFu3=z7g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f52.google.com ([209.85.219.52]:36868 "EHLO
	mail-oa0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933136Ab3FRQTU convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 18 Jun 2013 12:19:20 -0400
Received: by mail-oa0-f52.google.com with SMTP id g12so5342629oah.11
        for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Jun 2013 09:19:19 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, Arnd Bergmann <arnd.bergmann@linaro.org>, Doug Anderson <dianders@chromium.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Milosz Wasilewski <milosz.wasilewski@linaro.org>

Hi,

linux-next branch failed to build origen build

defconfig: exynos_defconfig

full build log:
----------------
https://ci.linaro.org/jenkins/job/linux-next/hwpack=3Dorigen,label=3Dke=
rnel_cloud/72/console

build error log:
--------------------
05:02:12 /mnt/ci_build/workspace/linux-next/hwpack/origen/label/kernel_=
cloud/drivers/pinctrl/pinctrl-exynos.c:
In function =91exynos_wkup_irq_mask=92:
05:02:12 /mnt/ci_build/workspace/linux-next/hwpack/origen/label/kernel_=
cloud/drivers/pinctrl/pinctrl-exynos.c:299:3:
error: implicit declaration of function =91exynos_wkup_irq_ack=92
[-Werror=3Dimplicit-function-declaration]
05:02:12    exynos_wkup_irq_ack(irqd);
05:02:12    ^
05:02:12 /mnt/ci_build/workspace/linux-next/hwpack/origen/label/kernel_=
cloud/drivers/pinctrl/pinctrl-exynos.c:
At top level:
05:02:12 /mnt/ci_build/workspace/linux-next/hwpack/origen/label/kernel_=
cloud/drivers/pinctrl/pinctrl-exynos.c:310:13:
warning: conflicting types for =91exynos_wkup_irq_ack=92 [enabled by
default]
05:02:12  static void exynos_wkup_irq_ack(struct irq_data *irqd)
05:02:12              ^
05:02:12 /mnt/ci_build/workspace/linux-next/hwpack/origen/label/kernel_=
cloud/drivers/pinctrl/pinctrl-exynos.c:310:13:
error: static declaration of =91exynos_wkup_irq_ack=92 follows non-stat=
ic
declaration
05:02:12 /mnt/ci_build/workspace/linux-next/hwpack/origen/label/kernel_=
cloud/drivers/pinctrl/pinctrl-exynos.c:299:3:
note: previous implicit declaration of =91exynos_wkup_irq_ack=92 was he=
re
05:02:12    exynos_wkup_irq_ack(irqd);
05:02:12    ^
05:02:12 cc1: some warnings being treated as errors
05:02:12 make[3]: *** [drivers/pinctrl/pinctrl-exynos.o] Error 1
05:02:12 make[2]: *** [drivers/pinctrl] Error 2

Best regards
Naresh kamboju
