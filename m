From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH] ARM: move firmware_ops to drivers/firmware
Date: Mon, 18 Nov 2013 17:14:45 +0000
Message-ID: <20131118171445.GI16735@n2100.arm.linux.org.uk>
References: <1384678169-28228-1-git-send-email-acourbot@nvidia.com> <CAHkRjk5LBOFx3ir49RgEsaFwvp5UCpTjYFWto+URXebAsOP0RA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:43116 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751373Ab3KRRPE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 18 Nov 2013 12:15:04 -0500
Content-Disposition: inline
In-Reply-To: <CAHkRjk5LBOFx3ir49RgEsaFwvp5UCpTjYFWto+URXebAsOP0RA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Kukjin Kim <kgene.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Tomasz Figa <t.figa@samsung.com>, Olof Johansson <olof@lixom.net>, Alexandre Courbot <gnurou@gmail.com>, linux-samsung-soc@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Sun, Nov 17, 2013 at 03:59:04PM +0000, Catalin Marinas wrote:
> No L2x0 (L210, L220, PL310) cache on ARMv8. And here I strongly
> recommend the hardware people to make proper external caches which can
> be flushed by standard CPU instructions, not MMIO. Any such caches
> must be enabled by firmware before Linux starts.

Yea, and we've seen what a trainwreck that causes on 32-bit ARM with
the kernel exploding at boot time because of a dirty L2 cache.
