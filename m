From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH] ARM: dts: exynos: Remove "simple-bus" compatible from
 fimc-is node
Date: Fri, 16 Sep 2016 13:58:06 +0200
Message-ID: <6ea5a94f-fc21-d5d4-faf3-bbee9cc8160c@samsung.com>
References: <CGME20160916083407eucas1p103af8b14d09de02ea25715c495b9f8fc@eucas1p1.samsung.com>
 <1474014825-28969-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:48627 "EHLO
        mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756422AbcIPL6O (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 16 Sep 2016 07:58:14 -0400
In-reply-to: <1474014825-28969-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: kgene@kernel.org, b.zolnierkie@samsung.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On 09/16/2016 10:33 AM, Sylwester Nawrocki wrote:
> The "simple-bus" compatible was originally added for fimc-is only
> to ensure the child devices instantiation.  The child devices are
> now being created by the parent device driver so remove the
> "simple-bus" compatible.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
>  arch/arm/boot/dts/exynos4x12.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks, applied.

Best regards,
Krzysztof
