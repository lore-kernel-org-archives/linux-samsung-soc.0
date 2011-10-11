From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH 5/7] ARM: EXYNOS4: Add support external GIC
Date: Tue, 11 Oct 2011 14:30:48 +0100
Message-ID: <4E944508.4050202@arm.com>
References: <1308555258-4322-1-git-send-email-chaos.youn@samsung.com> <1308555258-4322-6-git-send-email-chaos.youn@samsung.com> <4E8C61C4.9090709@arm.com> <00ec01cc83f1$81f84430$85e8cc90$%kim@samsung.com> <4E8D645D.4020601@arm.com> <4E8ECA1B.5010005@arm.com> <20111007151646.GA2398@mudshark.cambridge.arm.com> <4E92ECD1.2010303@arm.com> <00b901cc8810$8353e730$89fbb590$%youn@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from service87.mimecast.com ([91.220.42.44]:43199 "HELO
	service87.mimecast.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1752888Ab1JKNa5 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 11 Oct 2011 09:30:57 -0400
In-Reply-To: <00b901cc8810$8353e730$89fbb590$%youn@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Changhwan Youn <chaos.youn@samsung.com>
Cc: Will Deacon <Will.Deacon@arm.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, 'Arnd Bergmann' <arnd@arndb.de>, 'Kukjin Kim' <kgene.kim@samsung.com>, "ben-linux@fluff.org" <ben-linux@fluff.org>, 'Russell King' <rmk+kernel@arm.linux.org.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

Hi Changwan,

On 11/10/11 13:22, Changhwan Youn wrote:
>> Kukjin, could you please comment on the presence of a common memory
>> region for the distributor? This seem quite odd...
> 
> Some registers in Distributor are banked for PPI and SGI support (banked interrupts).
> The register for pending and enable status of these interrupts are 
> banked.

Right, that explains it then.

> Marc, I think the approach in your patch is much better than mine if it doesn't hurt
> the performance of other platforms which use the common gic code.

It probably doesn't hurt the general case too much (I expect a bit more
pressure on the d-cache because of the per-cpu stuff, but nothing to be
too worried about).

> I'll re-work the exynos4 interrupt code based on your patch though
> I'm not sure that it's possible to be merged in merge window.

My main concern at the moment is that mainline is broken as far as
EXYNOS4 is concerned (there's a race with the EOI hook), so that should
get fixed first.

Cheers,

	M.
-- 
Jazz is not dead. It just smells funny...
