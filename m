From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH v4 06/11] ARM: EXYNOS: Add support for mapping PMU base
 address via DT
Date: Tue, 10 Jun 2014 19:10:35 +0200
Message-ID: <53973C0B.2000903@samsung.com>
References: <1399704998-13321-1-git-send-email-pankaj.dubey@samsung.com>
 <1399704998-13321-7-git-send-email-pankaj.dubey@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:48781 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751851AbaFJRKx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 10 Jun 2014 13:10:53 -0400
In-reply-to: <1399704998-13321-7-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Pankaj Dubey <pankaj.dubey@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kgene.kim@samsung.com, linux@arm.linux.org.uk, chow.kim@samsung.com, yg1004.jang@samsung.com, vikas.sajjan@samsung.com

Hi,

On 10.05.2014 08:56, Pankaj Dubey wrote:
> From: Young-Gun Jang <yg1004.jang@samsung.com>
> 
> Add support for mapping Samsung Power Management Unit (PMU)
> base address from device tree. This patch also adds helper
> function as "get_exynos_pmuregmap". This function can be used
> by other machine files such as "pm.c", "hotplug.c" for accessing
> PMU regmap handle.
> 

I don't think there is a need to use regmap to provide access to PMU to
such low level code such as pm.c or hotplug.c. Moreover, I believe that
it might be undesirable in some cases, e.g. very low level code running
at early resume or late suspend.

IMHO, based on what we now have for SYSRAM, you could simply map PMU
from device tree one time, before SMP init, and keep the address in some
globally accessible variable, like those for SYSRAM we have right now
(sysram_base_addr, sysram_ns_base_addr -> pmu_base_addr).

Then, registration of the normal syscon would happen through standard
platform driver mechanisms and no special early handling would be necessary.

Best regards,
Tomasz
