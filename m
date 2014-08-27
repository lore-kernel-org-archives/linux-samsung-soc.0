From: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH 13/14] arm64: exynos7: Enable ARMv8 based Exynos7 (SoC)
 support
Date: Wed, 27 Aug 2014 15:50:21 +0100
Message-ID: <20140827145021.GC13850@arm.com>
References: <1409132660-1898-1-git-send-email-ch.naveen@samsung.com>
 <1409132660-1898-5-git-send-email-ch.naveen@samsung.com>
 <20140827110927.GC7773@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from fw-tnat.austin.arm.com ([217.140.110.23]:12408 "EHLO
	collaborate-mta1.arm.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S933630AbaH0Ouz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 27 Aug 2014 10:50:55 -0400
Content-Disposition: inline
In-Reply-To: <20140827110927.GC7773@leverpostej>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: Naveen Krishna Chatradhi <ch.naveen@samsung.com>, "naveenkrishna.ch@gmail.com" <naveenkrishna.ch@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "cpgs@samsung.com" <cpgs@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>

On Wed, Aug 27, 2014 at 12:09:28PM +0100, Mark Rutland wrote:
> On Wed, Aug 27, 2014 at 10:44:20AM +0100, Naveen Krishna Chatradhi wrote:
> > +	select HAVE_SMP
> 
> I may have missed something, but I didn't see any SMP support in this
> series.

We don't even have HAVE_SMP defined for arm64 (just SMP, which is on in
defconfig).

In theory we don't need any specific SMP support for a new SoC as long
as it uses a standard booting protocol (e.g. PSCI). But for whatever
reason, I only received about four patches in this series, so can't see
the rest.

-- 
Catalin
