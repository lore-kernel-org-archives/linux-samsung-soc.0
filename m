From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [RFC PATCH] ARM: exynos_defconfig: Enable Samsung media platform
 drivers as modules
Date: Thu, 24 Mar 2016 08:47:11 +0900
Message-ID: <56F32AFF.60102@samsung.com>
References: <1458745109-21036-1-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:18779 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751556AbcCWXrT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 23 Mar 2016 19:47:19 -0400
In-reply-to: <1458745109-21036-1-git-send-email-javier@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>, linux-kernel@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene@kernel.org>

On 23.03.2016 23:58, Javier Martinez Canillas wrote:
> There are a bunch of media platform drivers under drivers/media/platform/
> that are for Samsung SoCs but are not being built with exynos_defconfig.
> 
> This patch enables them as a module to improve build coverage for these
> drivers and also to allow people use them with proper hardware if modules
> are installed. The S5P MFC driver wasn't enabled since it fails to probe.
> 
> Only the boolean Kconfig symbols are enabled as built-in, since drivers
> are not critical and also to keep the kernel binary image size as small
> as possible.
> 
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
> 
> ---
> Hello Kukjin and Krzysztof,
> 
> I'm posting this as a RFC because I don't know if it will add too much bloat
> to a kernel built with exynos_defconfig.
> 
> I think it doesn't since the image size only increased 15 KiB which seems to
> be a small price for having these built, but you may have another opinion.

I like enabling as modules whatever look necessary or useful. I don't
see problems if it requires turning other things to built-in. Please go
ahead with the patch (and follow up after Tobias comments).

Best regards,
Krzysztof
