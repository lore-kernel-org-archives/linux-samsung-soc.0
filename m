From: Christopher Covington <cov@codeaurora.org>
Subject: Re: [PATCH] ARM: move firmware_ops to drivers/firmware
Date: Mon, 18 Nov 2013 14:04:50 -0500
Message-ID: <528A64D2.4020107@codeaurora.org>
References: <1384678169-28228-1-git-send-email-acourbot@nvidia.com> <CAHkRjk5LBOFx3ir49RgEsaFwvp5UCpTjYFWto+URXebAsOP0RA@mail.gmail.com> <52898417.80601@nvidia.com> <20131118115842.GE4050@arm.com> <528A4869.2020701@wwwdotorg.org> <20131118173047.GF9838@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.11.231]:56584 "EHLO
	smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752067Ab3KRTEx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 18 Nov 2013 14:04:53 -0500
In-Reply-To: <20131118173047.GF9838@arm.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, Kukjin Kim <kgene.kim@samsung.com>, Stephen Warren <swarren@nvidia.com>, Tomasz Figa <t.figa@samsung.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Alex Courbot <acourbot@nvidia.com>, Olof Johansson <olof@lixom.net>, Russell King <linux@arm.linux.org.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

Hi Catalin,

On 11/18/2013 12:30 PM, Catalin Marinas wrote:
[...]
> You can't run legacy AArch32 code at EL3 and have lower levels in AArch64
> mode (architectural constraint).

What prevents AArch32 code from running at EL3 and then requesting a reset to
AArch64 by writing to the Reset Management Register before sliding down to
lower exception levels?

Thanks,
Christopher

-- 
Employee of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by the Linux Foundation.
