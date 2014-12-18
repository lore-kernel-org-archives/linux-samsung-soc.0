From: =?UTF-8?B?S3J6eXN6dG9mIEtvesWCb3dza2k=?= <k.kozlowski@samsung.com>
Subject: Re: Weird/Unneeded call to msleep in exynos_mipi_dsi_wr_data in
 exynos_mipi_dsi_common.c
Date: Thu, 18 Dec 2014 11:26:47 +0100
Message-ID: <5492ABE7.1060900@samsung.com>
References: <54920A54.2060608@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:25808 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750983AbaLRK0w (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 18 Dec 2014 05:26:52 -0500
In-reply-to: <54920A54.2060608@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: nick <xerofoify@gmail.com>, inki.dae@samsung.com
Cc: linux-fbdev@vger.kernel.org, linux-samsung-soc@vger.kernel.org, dh09.lee@samsung.com, linux-kernel@vger.kernel.org, kyungmin.park@samsung.com, tomi.valkeinen@ti.com, kgene@kernel.org, plagnioj@jcrosoft.com, linux-arm-kernel@lists.infradead.org

On 17.12.2014 23:57, nick wrote:
> Greetings Fellow Maintainers,
> Sorry if I wasting your time but it seems there is a unneeded call to msleep

Hi,

1. Please describe exactly why do you think this is not needed.
2. Do you have Exynos-based hardware to test your changes?

Best regards,
Krzysztof

> and rather trivial fix me to fix in the file,exynos_mipi_dsi_common.c for the function,exynos_mipi_dsi_wr_data . If there is a valid reason for this call please let me known when any of you  have some free time. Otherwise I will send in a patch to remove this unneeded
> call to msleep.
> Thanks,
> Nick  
