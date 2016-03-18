From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 7/8] ARM: dts: Add exynos3250-artik5 dtsi file for
 ARTIK5 module
Date: Fri, 18 Mar 2016 16:01:27 -0500
Message-ID: <20160318210127.GA21185@rob-hp-laptop>
References: <1458027490-13787-1-git-send-email-cw00.choi@samsung.com>
 <1458027490-13787-8-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:56614 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751200AbcCRVBd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 18 Mar 2016 17:01:33 -0400
Content-Disposition: inline
In-Reply-To: <1458027490-13787-8-git-send-email-cw00.choi@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: k.kozlowski@samsung.com, kgene@kernel.org, s.nawrocki@samsung.com, tomasz.figa@gmail.com, jh80.chung@samsung.com, andi.shyti@samsung.com, inki.dae@samsung.com, sw0312.kim@samsung.com, pankaj.dubey@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org

On Tue, Mar 15, 2016 at 04:38:09PM +0900, Chanwoo Choi wrote:
> This patch adds the support for Device Tree source for Samsung ARTIK5 module[1]
> based on Exynos3250 SoC. The ARTIK5 module includes the follwoing devices:

s/follwoing/following/

> - Application Processor (Samsung Exynos3250)
> - WiFi/BT Combo chip (Broadcom4354)
> - PMIC (Samsung S2MPS14)
> - eMMC (4GB)
> - DRAM LPDDR3 (512MB)
> - Connectors pin (60 Pins x 3 set)
> 
> Also, this patch adds the ARTIK5 evaluation board[2] dts file which includes
> the ARTIK5 module[1] and have the devices such as sound codec, sd card port,
> ethernet port, uart port and so on.
> 
> [1] https://www.artik.io/hardware/artik-5
> [2] http://www.digikey.com/product-search/en?FV=ffecca14
> 
> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
> Signed-off-by: Jaehoon Chung <jh80.chung@samsung.com>
> Signed-off-by: Andi Shyti <andi.shyti@samsung.com>
> Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> ---
>  .../bindings/arm/samsung/samsung-boards.txt        |   2 +
>  arch/arm/boot/dts/Makefile                         |   1 +
>  arch/arm/boot/dts/exynos3250-artik5-eval.dts       |  26 ++
>  arch/arm/boot/dts/exynos3250-artik5.dtsi           | 334 +++++++++++++++++++++
>  4 files changed, 363 insertions(+)
>  create mode 100644 arch/arm/boot/dts/exynos3250-artik5-eval.dts
>  create mode 100644 arch/arm/boot/dts/exynos3250-artik5.dtsi

Otherwise,

Acked-by: Rob Herring <robh@kernel.org>
