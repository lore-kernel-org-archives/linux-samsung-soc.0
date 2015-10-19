From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: Re: [1/7] arm: dts: Add syscon-{reboot,
 poweroff} nodes for exynos3250 SoCs
Date: Mon, 19 Oct 2015 14:13:56 +0530
Message-ID: <5624AD4C.2000601@samsung.com>
References: <1445234635-3950-2-git-send-email-alim.akhtar@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:60069 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750836AbbJSIn5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 19 Oct 2015 04:43:57 -0400
In-reply-to: <1445234635-3950-2-git-send-email-alim.akhtar@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Alim Akhtar <alim.akhtar@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: kgene@kernel.org, k.kozlowski@samsung.com, javier@osg.samsung.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On Monday 19 October 2015 11:33 AM, Alim Akhtar wrote:
> This patch adds syscon-{reboot, poweroff} nodes to allow the
> generic syscon-{reboot, poweroff} driver to reset/poweroff exynos3250 SoC.
>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
>
> ---
> arch/arm/boot/dts/exynos3250.dtsi |   14 ++++++++++++++
>   1 file changed, 14 insertions(+)
>

Reviewed-by: Pankaj Dubey <pankaj.dubey@samsung.com>

Thanks,
Pankaj Dubey
