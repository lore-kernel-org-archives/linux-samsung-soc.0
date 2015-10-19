From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: Re: [4/7] arm: dts: Add syscon-{reboot,
 poweroff} nodes for exynos5410 SoC
Date: Mon, 19 Oct 2015 14:26:13 +0530
Message-ID: <5624B02D.3010709@samsung.com>
References: <1445234635-3950-5-git-send-email-alim.akhtar@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:54017 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753737AbbJSI4p (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 19 Oct 2015 04:56:45 -0400
In-reply-to: <1445234635-3950-5-git-send-email-alim.akhtar@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Alim Akhtar <alim.akhtar@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: kgene@kernel.org, k.kozlowski@samsung.com, javier@osg.samsung.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On Monday 19 October 2015 11:33 AM, Alim Akhtar wrote:
> This patch adds syscon-{reboot, poweroff} nodes to allow the
> generic syscon-{reboot, poweroff} driver to reset/poweroff exynos5410 SoC.
>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
>
> ---
> arch/arm/boot/dts/exynos5410.dtsi |   14 ++++++++++++++
>   1 file changed, 14 insertions(+)

Reviewed-by: Pankaj Dubey <pankaj.dubey@samsung.com>

Thanks,
Pankaj Dubey
