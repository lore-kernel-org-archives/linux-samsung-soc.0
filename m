From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 1/4] drm/exynos: dsim: fix to control mipi phy register
Date: Mon, 09 Feb 2015 14:46:43 +0100
Message-ID: <54D8BA43.9030609@samsung.com>
References: <1423309988-11793-1-git-send-email-inki.dae@samsung.com>
 <1423309988-11793-2-git-send-email-inki.dae@samsung.com>
 <54D8928D.9000008@samsung.com> <54D8A55F.8020001@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:54461 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932893AbbBINqx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 9 Feb 2015 08:46:53 -0500
In-reply-to: <54D8A55F.8020001@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: devicetree@vger.kernel.org, airlied@linux.ie, dri-devel@lists.freedesktop.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, a.hajda@samsung.com

On 09/02/15 13:17, Inki Dae wrote:
>> Instead I just added syscon support to the PHY layer, it's not perfect
>> > but fixes the issue for both DSI and CSI and  doesn't strip the PHY layer
>> > which could potentially be useful.
>
> Ah, Right. I didn't check your patch set. Your way is a better idea than
> my one. With this, we don't need to change device drivers, MIPI DSI and CSI.
> 
> Then, what is the meaning that it's not perfect?

What I didn't like is that there are at least 3 mutexes on the phy_power_on/
phy_power_off path (PHY core, PHY driver, regmap) and there is another level
of indirection after introducing the regmap. I guess it's nothing serious
though. And BTW the syscon could be converted to use spinlock rather than
a mutex, since in our case behind the PMU syscon is always a memory mapped
region.

-- 
Regards,
Sylwester
