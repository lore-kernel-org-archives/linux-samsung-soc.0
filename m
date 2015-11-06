From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v6 4/4] ARM: dts: Add Ethernet chip to SMDK5410
Date: Fri, 06 Nov 2015 09:12:22 +0900
Message-ID: <563BF066.1040108@samsung.com>
References: <cover.1446724046.git.p.fedin@samsung.com>
 <27f540c1990df410bc20dcac7a35bede19fdb45b.1446724046.git.p.fedin@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:17093 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965739AbbKFAMY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 5 Nov 2015 19:12:24 -0500
In-reply-to: <27f540c1990df410bc20dcac7a35bede19fdb45b.1446724046.git.p.fedin@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Pavel Fedin <p.fedin@samsung.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Kukjin Kim <kgene@kernel.org>

On 05.11.2015 21:03, Pavel Fedin wrote:
> The chip is smsc9115, connected via SROMc bank 3. Additionally, some GPIO
> initialization is required.
> 
> Signed-off-by: Pavel Fedin <p.fedin@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5410-smdk5410.dts | 41 +++++++++++++++++++++++++++++++
>  arch/arm/boot/dts/exynos5410.dtsi         |  6 +++++
>  2 files changed, 47 insertions(+)


Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
