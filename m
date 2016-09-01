From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 3/3] ARM: exynos: add all required FIMC-IS clocks to
 exynos4x12 dtsi
Date: Thu, 01 Sep 2016 13:04:17 +0200
Message-ID: <0cd31285-5b72-6d3d-7c4c-036aecf55f4e@samsung.com>
References: <1472649918-10371-1-git-send-email-m.szyprowski@samsung.com>
 <1472649918-10371-4-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:32768 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932240AbcIALEW (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 1 Sep 2016 07:04:22 -0400
In-reply-to: <1472649918-10371-4-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>

On 08/31/2016 03:25 PM, Marek Szyprowski wrote:
> FIMC-IS blocks must control 3 more clocks ("gicisp", "mcuctl_isp" and
> "pwm_isp") to make the hardware fully operational.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm/boot/dts/exynos4x12.dtsi | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 

Thanks, applied.

Best regards,
Krzysztof
