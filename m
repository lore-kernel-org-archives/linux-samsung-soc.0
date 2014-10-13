From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCHv2 0/2] ARM: dts: Add new board dts file for
 Exynos3250-based Rinato board
Date: Mon, 13 Oct 2014 14:00:23 +0900
Message-ID: <543B5C67.4080303@samsung.com>
References: <1412721939-10615-1-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:11838 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750889AbaJMFAZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 13 Oct 2014 01:00:25 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NDD001M49WN6K90@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 13 Oct 2014 14:00:23 +0900 (KST)
In-reply-to: <1412721939-10615-1-git-send-email-cw00.choi@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>, kgene.kim@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, mark.rutland@arm.com, arnd@arndb.de, olof@lixom.net, tomasz.figa@gmail.com, kyungmin.park@samsung.com, inki.dae@samsung.com, sw0312.kim@samsung.com, jh80.chung@samsung.com, geunsik.lim@samsung.com

Dear Kukjin,

Could you please review this patchset?

Best Regards,
Chanwoo Choi

On 10/08/2014 07:45 AM, Chanwoo Choi wrote:
> This patchset adds new board dts file for Samsung Rinato board (Gear 2) which
> is based on Exynos3250 SoC and adds sleep mode pin configuration using pinctrl
> subsystem to reduce leakage power-consumption in sleep state.
> 
> This patchset is based on linux-samsung.git (for-next branch).
> 
> Changes from v1:
> - Remove useless brace
> - Remove unneeded 'regulators' keyword
> - Consolidate memory information in one entry
> 
> Chanwoo Choi (2):
>   ARM: dts: Add board dts file for Exynos3250-based Rinato board
>   ARM: dts: Add sleep mode pin configuration for exynos3250-rinato
> 
>  arch/arm/boot/dts/Makefile                |   3 +-
>  arch/arm/boot/dts/exynos3250-pinctrl.dtsi |  16 +
>  arch/arm/boot/dts/exynos3250-rinato.dts   | 586 ++++++++++++++++++++++++++++++
>  3 files changed, 604 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm/boot/dts/exynos3250-rinato.dts
> 
