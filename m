From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v3 1/2] ARM: EXYNOS: Map SYSRAM through generic SRAM
 bindings
Date: Wed, 14 May 2014 13:08:52 +0900
Message-ID: <01c101cf6f2a$3970d840$ac5288c0$@samsung.com>
References: <1399522592-23618-1-git-send-email-sachin.kamat@linaro.org>
 <536BAE39.70504@samsung.com> <034b01cf6b2c$5b5d06b0$12171410$@samsung.com>
 <536C5E40.90405@gmail.com> <029b01cf6e59$35a452e0$a0ecf8a0$@samsung.com>
 <1399975674.24871.19.camel@x220> <5372DF9B.4000700@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:19346 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751109AbaENEI6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 May 2014 00:08:58 -0400
In-reply-to: <5372DF9B.4000700@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Tushar Behera' <tushar.behera@linaro.org>, 'Paul Bolle' <pebolle@tiscali.nl>
Cc: 'Tomasz Figa' <tomasz.figa@gmail.com>, 'Tomasz Figa' <t.figa@samsung.com>, 'Sachin Kamat' <sachin.kamat@linaro.org>, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, arnd@arndb.de, heiko@sntech.de, linux-arm-kernel@lists.infradead.org

Tushar Behera wrote:
> 
> On 05/13/2014 03:37 PM, Paul Bolle wrote:
> > Kukjin,
> >
> > On Tue, 2014-05-13 at 12:12 +0900, Kukjin Kim wrote:
> >> Tomasz Figa wrote:
> >>> You mean s/sram/sysram/ in compatible strings of Exynos-specific
> >>> reserved areas? If yes, I'm fine, it might be even better. Just
> remember
> >>> to update documentation in patch 2/2 as well.
> >>>
> >> Done. If any problems in my tree, please let me know.
> >
> > It seems this one just hit linux-next (in next-20140513) as "ARM:
> > EXYNOS: Map SYSRAM through generic DT bindings". Its commit now contains
> > this hunk:
> >     --- a/arch/arm/Kconfig
> >     +++ b/arch/arm/Kconfig
> >     @@ -843,6 +843,7 @@ config ARCH_EXYNOS
> >             select HAVE_S3C_RTC if RTC_CLASS
> >             select NEED_MACH_MEMORY_H
> >             select SPARSE_IRQ
> >     +       select SYSRAM
> >             select USE_OF
> >             help
> >               Support for SAMSUNG's EXYNOS SoCs (EXYNOS4/5)
> >
> > But there's no Kconfig symbol SYSRAM. However, there is a Kconfig symbol
> > SRAM. Did you perhaps do one s/sram/sysram/ too many on the original
> > patch?
> >
> 
> Also the compatible string name should be 'mmio-sram' on the DTS files.
> 
Paul and Tushar,

Thanks for the pointing out.
Let me fix them, config name and compatible string.

- Kukjin
