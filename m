From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH 1/7] ARM: EXYNOS: Constify list of retention registers
Date: Mon, 12 Dec 2016 14:39:19 +0100
Message-ID: <10896763.srQzQduvXa@amdc3058>
References: <1481377658-22603-1-git-send-email-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:49358 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752357AbcLLNjY (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 12 Dec 2016 08:39:24 -0500
In-reply-to: <1481377658-22603-1-git-send-email-krzk@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Kukjin Kim <kgene@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Simtec Linux Team <linux@simtec.co.uk>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org


Hi,

On Saturday, December 10, 2016 03:47:32 PM Krzysztof Kozlowski wrote:
> The list of retention registers (release_ret_regs field of struct
> exynos_pm_data and arrays with values) are not modified and can be made
> const to improve the const safeness.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

for patches #1-7

Reviewed-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics
