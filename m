From: Kyungmin Park <kmpark@infradead.org>
Subject: Samsung SoCs: preparation for single kernel
Date: Wed, 23 Jun 2010 08:27:40 +0900
Message-ID: <AANLkTinGwWzIAOe2tj6V2kCrMiPT7PHlYs1kFS-IsiN4@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vw0-f46.google.com ([209.85.212.46]:43137 "EHLO
	mail-vw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751315Ab0FVX1l (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 22 Jun 2010 19:27:41 -0400
Received: by vws9 with SMTP id 9so54801vws.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 22 Jun 2010 16:27:40 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ben Dooks <ben-linux@fluff.org>, arm-linux <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc@vger.kernel.org
Cc: Russell King - ARM Linux <linux@arm.linux.org.uk>, Marek Szyprowski <m.szyprowski@samsung.com>

To Ben,

I really need single kernel for s5pc110 (cortex A8) and s5pc210
(cortex A9) at least.
Fortunately arm move to these approaches recently. but current Samsung
SoCs not prepare these one.

So I wonder do you have a plan or how to address these issues?
How to assign the address at resources and use it at runtime?

Personally I want to use cpu_is_*. but you reject it to use.
Other way is that we can create the base address variables and assign
it at init time.

Please give your opinions.

Thank you,
Kyungmin Park

e.g., cpu_is_* usage at OMAP tree

static void omap_init_mcspi(void)
{
        if (cpu_is_omap44xx())
                omap4_mcspi_fixup();

        platform_device_register(&omap2_mcspi1);
        platform_device_register(&omap2_mcspi2);

        if (cpu_is_omap2430() || cpu_is_omap343x() || cpu_is_omap44xx())
                omap2_mcspi3_init();

        if (cpu_is_omap343x() || cpu_is_omap44xx())
                omap2_mcspi4_init();
}
