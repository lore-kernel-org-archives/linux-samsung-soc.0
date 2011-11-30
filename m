From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: Re: [PATCH V3 3/6] ARM: exynos: save L2 settings during bootup
Date: Wed, 30 Nov 2011 11:06:40 +0000
Message-ID: <20111130110640.GA3018@e102568-lin.cambridge.arm.com>
References: <1321954532-18724-1-git-send-email-amit.kachhap@linaro.org>
 <1321954532-18724-4-git-send-email-amit.kachhap@linaro.org>
 <20111122094925.GV9581@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from service87.mimecast.com ([91.220.42.44]:53160 "EHLO
	service87.mimecast.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752866Ab1K3LGt convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 30 Nov 2011 06:06:49 -0500
In-Reply-To: <20111122094925.GV9581@n2100.arm.linux.org.uk>
Content-Disposition: inline
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Amit Daniel Kachhap <amit.kachhap@linaro.org>, "kgene.kim@samsung.com" <kgene.kim@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "patches@linaro.org" <patches@linaro.org>

On Tue, Nov 22, 2011 at 09:49:25AM +0000, Russell King - ARM Linux wrote:
> On Tue, Nov 22, 2011 at 03:05:29PM +0530, Amit Daniel Kachhap wrote:
> > This patch adds code to save L2 register configuration at boot, and
> > later used to resume L2 before MMU is enabled in suspend and cpuidle
> > resume paths.
> 
> Is there a reason exynos isn't using the generic l2 code?

As far as registers saving is concerned answer is no (or better, DT
support).
That code was there waiting for DT support (it should use l2x0_of_init, which 
depends on DT support for exynos).

Thanks,
Lorenzo
