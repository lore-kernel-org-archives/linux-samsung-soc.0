From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [RESPIN v2 6/6] ARM: dts: change SROM node compatible from generic
 to model specific
Date: Tue, 12 Apr 2016 16:35:01 +0200
Message-ID: <570D0795.3070504@samsung.com>
References: <1460360548-32127-1-git-send-email-pankaj.dubey@samsung.com>
 <1460360548-32127-7-git-send-email-pankaj.dubey@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:18873 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933780AbcDLOfG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 12 Apr 2016 10:35:06 -0400
In-reply-to: <1460360548-32127-7-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Pankaj Dubey <pankaj.dubey@samsung.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kgene.kim@samsung.com, p.fedin@samsung.com, olof@lixom.net, thomas.ab@samsung.com

On 04/11/2016 09:42 AM, Pankaj Dubey wrote:
> This patch changes SROM nodes compatible from generic to model specific
> to match with binding documentation. Also updating property
> "samsung,srom-page-mode" as it is not defined as bool instead of int
> 
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> ---
>  arch/arm/boot/dts/exynos4.dtsi            | 4 ++--
>  arch/arm/boot/dts/exynos5.dtsi            | 4 ++--
>  arch/arm/boot/dts/exynos5410-smdk5410.dts | 2 +-
>  arch/arm/boot/dts/exynos5410.dtsi         | 4 ++--
>  4 files changed, 7 insertions(+), 7 deletions(-)

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
