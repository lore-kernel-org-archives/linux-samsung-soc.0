From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v2 4/6] ARM: dts: Remove broken-cd from eMMC node in
 exynos5800-peach-pi
Date: Mon, 19 Oct 2015 09:11:29 +0900
Message-ID: <56243531.2090307@samsung.com>
References: <1444927873-15140-1-git-send-email-javier@osg.samsung.com>
 <1444927873-15140-5-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:31201 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752499AbbJSALg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 18 Oct 2015 20:11:36 -0400
In-reply-to: <1444927873-15140-5-git-send-email-javier@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>, linux-kernel@vger.kernel.org
Cc: Kukjin Kim <kgene@kernel.org>, Douglas Anderson <dianders@chromium.org>, Alim Akhtar <alim.akhtar@samsung.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On 16.10.2015 01:51, Javier Martinez Canillas wrote:
> The eMMC is non-removable so is marked with the non-removable DT
> property to avoid having to redetect it after a suspend/resume.
> 
> But it also has the broken-cd property which is wrong since only
> one of the DT properties for card detection should be used.
> 
> Also remove the card-detect-delay property that is not needed with
> non-removable.
> 
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
> ---
> 
> Changes since v1:
> - None, new patch.
> 
>  arch/arm/boot/dts/exynos5800-peach-pi.dts | 2 --
>  1 file changed, 2 deletions(-)
> 

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
