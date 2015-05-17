From: =?UTF-8?Q?Krzysztof_Koz=C5=82owski?= <k.kozlowski.k@gmail.com>
Subject: Re: [PATCH 3/4] ARM: multi_v7_defconfig: Enable TMU for Exynos
Date: Sun, 17 May 2015 17:28:15 +0900
Message-ID: <CAJKOXPePtxjX0FQKjbN6CegX+1qOa28dZ1kjoiz4UAbNt8zwTw@mail.gmail.com>
References: <1431850195-9558-1-git-send-email-k.kozlowski.k@gmail.com>
	<1431850195-9558-7-git-send-email-k.kozlowski.k@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vn0-f44.google.com ([209.85.216.44]:42345 "EHLO
	mail-vn0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752791AbbEQI2Q (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 17 May 2015 04:28:16 -0400
In-Reply-To: <1431850195-9558-7-git-send-email-k.kozlowski.k@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>

Please ignore the patch. I sent this left-over from previous
submission by mistake.

Krzysztof

2015-05-17 17:09 GMT+09:00 Krzysztof Kozlowski <k.kozlowski.k@gmail.com>:
> Enable support for Thermal Monitoring Unit present on Exynos SoCs. This
> allows detection of overheat and handling this gracefully.
>
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
> ---
>  arch/arm/configs/multi_v7_defconfig | 1 +
>  1 file changed, 1 insertion(+)
