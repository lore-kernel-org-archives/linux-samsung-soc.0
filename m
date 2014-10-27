From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCHv4 0/3] ARM: dts: Add new board dts file for
 Exynos3250-based Rinato board
Date: Tue, 28 Oct 2014 08:43:49 +0900
Message-ID: <544ED8B5.3090607@samsung.com>
References: <1414156362-5752-1-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:24750 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752369AbaJ0Xnw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 27 Oct 2014 19:43:52 -0400
In-reply-to: <1414156362-5752-1-git-send-email-cw00.choi@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com
Cc: Chanwoo Choi <cw00.choi@samsung.com>, mark.rutland@arm.com, arnd@arndb.de, olof@lixom.net, tomasz.figa@gmail.com, geunsik.lim@samsung.com, inki.dae@samsung.com, sw0312.kim@samsung.com, kyungmin.park@samsung.com, k.kozlowski@samsung.com, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Dear Kukjin,

Did you please pick up this patchset on 3.19 queue?

Best Regards,
Chanwoo Choi

On 10/24/2014 10:12 PM, Chanwoo Choi wrote:
> This patchset adds new board dts file for Samsung Rinato board (Gear 2) which
> is based on Exynos3250 SoC and adds sleep mode pin configuration using pinctrl
> subsystem to reduce leakage power-consumption in sleep state.
> 
> This patchset is based on linux-samsung.git (for-next branch).
> 
> Changes from v3:
> - Fix wrong email address
> - Remove 'vemmc_reg' fixed regulator and then use 'ldo12_reg' for mshc_0 
> 
> Changes from v2:
> - Separate patch3 from patchset[1] and then this patchset includes patch3.
>   After applied patch3, the power-consumption of Rinato board is 0.6mA in suspend state.
>   [1] [PATCHv5 0/3] regulator: of: Add support for parsing regulator suspend state
>   : https://lkml.org/lkml/2014/10/10/161
> - Change PDN (Power-down mode) state for GPE0-3 (BT_UART_RTS) because Rinato
>   board uses UART1 for bluetooth device. BT_UART_RTS pin should be disabled in
>   suspend state by setting high state of GPE0-3
> - Turn on always the regulator state of VAP_VMIPI_1.0V because if VAP_VMIPI_1.0V
>   is off state or would be not controlled by DRM driver, happen imprecise external abort.
> 
> Changes from v1:
> - Remove useless brace
> - Remove unneeded 'regulators' keyword
> - Consolidate memory information in one entry
> 
> Chanwoo Choi (3):
>   ARM: dts: Add board dts file for Exynos3250-based Rinato board
>   ARM: dts: Add sleep mode pin configuration for exynos3250-rinato
>   ARM: dts: Add sleep mode of regulator for exynos3250-rinato board
> 
>  arch/arm/boot/dts/Makefile                |   3 +-
>  arch/arm/boot/dts/exynos3250-pinctrl.dtsi |  16 +
>  arch/arm/boot/dts/exynos3250-rinato.dts   | 686 ++++++++++++++++++++++++++++++
>  3 files changed, 704 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm/boot/dts/exynos3250-rinato.dts
> 
