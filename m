From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH CFT] ARM:S5P64X0: Enable ARM_PATCH_PHYS_VIRT and AUTO_ZRELADDR by default
Date: Thu, 12 Dec 2013 10:47:58 +0100
Message-ID: <26167386.hX5eWUjT6T@flatron>
References: <1386825152-398-1-git-send-email-panchaxari.prasannamurthy@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f52.google.com ([74.125.83.52]:53115 "EHLO
	mail-ee0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751120Ab3LLJsG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 12 Dec 2013 04:48:06 -0500
In-Reply-To: <1386825152-398-1-git-send-email-panchaxari.prasannamurthy@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: panchaxari <panchaxari.prasannamurthy@linaro.org>, kgene.kim@samsung.com
Cc: patches@linaro.org, linaro-kernel@lists.linaro.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Heiko Stuebner <heiko@sntech.de>, Russell King <linux@arm.linux.org.uk>, Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

Hi panchaxari,

On Thursday 12 of December 2013 10:42:32 panchaxari wrote:
> ARM_PATCH_PHYS_VIRT and AUTO_ZRELADDR have been enabled as default configs
> to S5P64X0 platforms.
> 
> Introduction of PHYS_VIRT config as default would enable phy-to-virt and
> virt-to-phy translation function at boot and module loading time
> and enforce dynamic reallocation of memory. AUTO_ZRELADDR config would
> enable calculation of kernel load address at run time.
> 
> PHYS_VIRT config is mutually exclusive to XIP_KERNEL, XIP_KERNEL is used in
> systems with NOR flash devices, and ZRELADDR config is mutually exclusive
> to ZBOOT_ROM.
> 
> CFT::Call For Testing
> 
> Requesting maintainers of S5P64X0 platforms to evaluate the changes on the
> board and comment, as I dont have the board for testing and also requesting
> an ACK

Could you explain the purpose of this change on S5P64x0?

This is actually quite a poor platform choice. As of today, the kernel
is stuck with supporting just SMDK6440/6450 boards, which are proprietary
development boards and it doesn't look like any further boards will show
up in future. Kukjin has actually proposed removing support for this
platform at all and I consider this reasonable.

Kukjin, should we proceed with removal?

Best regards,
Tomasz
