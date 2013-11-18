From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH] ARM: move firmware_ops to drivers/firmware
Date: Mon, 18 Nov 2013 10:03:37 -0700
Message-ID: <528A4869.2020701@wwwdotorg.org>
References: <1384678169-28228-1-git-send-email-acourbot@nvidia.com> <CAHkRjk5LBOFx3ir49RgEsaFwvp5UCpTjYFWto+URXebAsOP0RA@mail.gmail.com> <52898417.80601@nvidia.com> <20131118115842.GE4050@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:44295 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751571Ab3KRRDl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 18 Nov 2013 12:03:41 -0500
In-Reply-To: <20131118115842.GE4050@arm.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Catalin Marinas <catalin.marinas@arm.com>, Alex Courbot <acourbot@nvidia.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Kukjin Kim <kgene.kim@samsung.com>, Stephen Warren <swarren@nvidia.com>, Tomasz Figa <t.figa@samsung.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Olof Johansson <olof@lixom.net>, Russell King <linux@arm.linux.org.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On 11/18/2013 04:58 AM, Catalin Marinas wrote:
...
> Of course, trusted foundations interface could be plugged into cpu_ops
> on arm64 but I will NAK it on the grounds of not using the PSCI API, nor
> the SMC calling convention (and it's easy to fix when porting to ARMv8).
> If a supported standard API is used, then there is no need for
> additional code in the kernel.

What happens when someone takes an existing working secure-mode SW stack
and simply re-uses it on some new ARMv8 SoC. Are you going to force
people working on upstream to re-write the secure mode firmware in
shipped hardware before allowing upstream kernel support?
