From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCHv7 2/4] ARM: dts: exynos5422-odroidxu3: Enable TMU at Exynos5422
 base
Date: Tue, 16 Jun 2015 20:05:58 +0900
Message-ID: <55800316.9050406@samsung.com>
References: <1434336803-4132-1-git-send-email-linux.amoon@gmail.com> <1434336803-4132-2-git-send-email-linux.amoon@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f170.google.com ([209.85.192.170]:36108 "EHLO
	mail-pd0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753007AbbFPLGH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 16 Jun 2015 07:06:07 -0400
In-Reply-To: <1434336803-4132-2-git-send-email-linux.amoon@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Anand Moon <linux.amoon@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>, Markus Reichl <m.reichl@fivetechno.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

W dniu 15.06.2015 o 11:53, Anand Moon pisze:
> This changes enables TMU IP block on the Exynos5422 Odroid-XU3
> device.
> 
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> Acked-by: Lukasz Majewski <l.majewski@samsung.com>
> ---
> Changes rebase on git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung branch for-next
> Changes from v5 and v6: Use LDO7 regulator instead of LDO10 regulator to control TMU.
> 	Fixed the commit log.
> ---
>  arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi | 25 ++++++++++++++++++++++
>  1 file changed, 25 insertions(+)

Thanks Anand for working on this!

Whole patchset tested on Odroid XU3-Lite board:
Tested-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

I already acked other patches, except this one:
Acked-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

I'll apply this to my tree and send for v4.3 to Kukjin (unless he picks
it also).

Best regards,
Krzysztof
