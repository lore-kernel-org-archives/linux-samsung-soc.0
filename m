From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH v4 3/7] ARM: Exynos: add device tree support for MCT controller
 driver
Date: Mon, 28 Jan 2013 13:59:22 -0700
Message-ID: <5106E6AA.3080801@wwwdotorg.org>
References: <1358762542-19008-1-git-send-email-thomas.abraham@linaro.org> <1358762542-19008-4-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:44675 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751650Ab3A1U7Z (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 28 Jan 2013 15:59:25 -0500
In-Reply-To: <1358762542-19008-4-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: devicetree-discuss@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, swarren@nvidia.com, sylvester.nawrocki@gmail.com, chaos.youn@samsung.com, linux-arm-kernel@lists.infradead.org

On 01/21/2013 03:02 AM, Thomas Abraham wrote:
> Allow the MCT controller base address and interrupts to be obtained from
> device tree and remove unused static definitions of these. The non-dt support
> for Exynos5250 is removed but retained for Exynos4210 based platforms.

Patches 3 and later in this series, fairly quickly,
Reviewed-by: Stephen Warren <swarren@nvidia.com>

Sorry for the slow review.

I'm not 100% sure if I like Mark's #global-interrupts suggestion or not,
but I'd be fine with the binding either way, so choose as you see fit.
