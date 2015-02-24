From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [RESEND PATCH] ARM: EXYNOS: Fix failed second suspend on Exynos4
Date: Tue, 24 Feb 2015 08:59:22 +0100
Message-ID: <1424764762.2877.3.camel@AMDC1943>
References: <1424256325-16659-1-git-send-email-k.kozlowski@samsung.com>
 <54EBE43C.1020901@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <54EBE43C.1020901@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, stable@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On wto, 2015-02-24 at 11:38 +0900, Chanwoo Choi wrote:
> Hi Krzysztof,
> 
> I tested this patch for suspend-to-ram on Exynos4412-based trats2 board.
> When I tested suspend-to-ram repetitively, I faced on hang issue of
> suspend-to-ram for Exynos4 as before.
> 
> Could you send .config file for test?

I am testing on exynos_defconfig with some stuff enabled (nothing
special: regulators, chargers, PM_ADVANCED_DEBUG, extcon etc.). However
sometimes I also see hangs related to MMC. But I believe this issue is
present for some time and is not related to my DELAYED_RESET_ASSERTION
changes.

Maybe you could try to boot with "no_console_suspend loglevel=7" and see
when the suspend fails?

Best regards,
Krzysztof
