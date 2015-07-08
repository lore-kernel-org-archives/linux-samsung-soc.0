From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 0/4] ARM: dts: Use labels instead of full paths for Exynos5
 pinctrl nodes
Date: Wed, 08 Jul 2015 17:27:06 +0900
Message-ID: <559CDEDA.50608@samsung.com>
References: <1436333790-18219-1-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:35113 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933971AbbGHI1K (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 8 Jul 2015 04:27:10 -0400
In-reply-to: <1436333790-18219-1-git-send-email-javier@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>, Kukjin Kim <kgene@kernel.org>
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

On 08.07.2015 14:36, Javier Martinez Canillas wrote:
> Hello Kukjin and Krzysztof,
> 
> This is a trivial series that changes Exynos5 pinctrl dtsi files to extend
> the pinctrl nodes using labels instead of full paths.
> 
> Using labels is less error prone since a misstyped label leads to a build
> error while full paths can lead to the creation of a new node instead of
> overriding the original which makes the mistake harder to detect.
> 
> I tested the changes by decompiling the Exynos5* dtbs and comparing before
> and after. The resulting dts were identical modulo some node ordering due
> the pinctrl include change.

Is the DTB before and after the same? It should not change by re-ordering.

Best regards,
Krzysztof
