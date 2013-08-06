From: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH RESEND] ARM: dts: Add USB host node for Exynos4
Date: Tue, 06 Aug 2013 10:16:31 +0900
Message-ID: <000801ce9242$95848570$c08d9050$@samsung.com>
References: <1375726159-20486-1-git-send-email-tobetter@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:42662 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752190Ab3HFBQd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 5 Aug 2013 21:16:33 -0400
In-reply-to: <1375726159-20486-1-git-send-email-tobetter@gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Dongjin Kim' <tobetter@gmail.com>
Cc: 'Rob Herring' <rob.herring@calxeda.com>, 'Pawel Moll' <pawel.moll@arm.com>, 'Mark Rutland' <mark.rutland@arm.com>, 'Stephen Warren' <swarren@wwwdotorg.org>, 'Ian Campbell' <ian.campbell@citrix.com>, 'Russell King' <linux@arm.linux.org.uk>, 'Kukjin Kim' <kgene.kim@samsung.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Jingoo Han <jg1.han@samsung.com>

On Tuesday, August 06, 2013 3:09 AM, Dongjin Kim wrote:
> 
> This patch adds EHCI and OHCI host device nodes for Exynos4.
> 
> CC: Jingoo Han <jg1.han@samsung.com>

Acked-by: Jingoo Han <jg1.han@samsung.com>


> Signed-off-by: Dongjin Kim <tobetter@gmail.com>
> ---
>  arch/arm/boot/dts/exynos4.dtsi |   18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
