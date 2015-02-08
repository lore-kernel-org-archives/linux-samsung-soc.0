From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v3] pinctrl: exynos: Add support for Exynos5433
Date: Sun, 8 Feb 2015 23:59:56 +0900
Message-ID: <CA+Ln22E1xpdj+LZAR6uf7sCEBR_TEN=CaTVznsKM490a8AzGww@mail.gmail.com>
References: <1421822591-10536-1-git-send-email-cw00.choi@samsung.com>
	<CACRpkdYq-1ztF5baHjB9aBUNspD5vRXrpnEd1zdWsADmwrhuWw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oi0-f41.google.com ([209.85.218.41]:39409 "EHLO
	mail-oi0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751766AbbBHO74 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 8 Feb 2015 09:59:56 -0500
In-Reply-To: <CACRpkdYq-1ztF5baHjB9aBUNspD5vRXrpnEd1zdWsADmwrhuWw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Chanwoo Choi <cw00.choi@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, Kukjin Kim <kgene@kernel.org>, Inki Dae <inki.dae@samsung.com>, Chanho Park <chanho61.park@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi,

2015-01-29 18:48 GMT+09:00 Linus Walleij <linus.walleij@linaro.org>:
> On Wed, Jan 21, 2015 at 7:43 AM, Chanwoo Choi <cw00.choi@samsung.com> wrote:
>
>> This patch adds driver data for Exynos5433 SoC. Exynos5433 includes 228 multi-
>> functional input/output port pins and 135 memory port pins. There are 41 general
>> port groups and 2 memory port groups.
>>
>> Cc: Tomasz Figa <tomasz.figa@gmail.com>
>> Cc: Thomas Abraham <thomas.abraham@linaro.org>
>> Cc: Linus Walleij <linus.walleij@linaro.org>
>> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
>> Acked-by: Inki Dae <inki.dae@samsung.com>
>> ---
>> Changes from v2:
>> - Rebase it on v3.19-rc5
>
> Waiting for Tomasz to review this.

Thanks Linus. Looks good to me.

Acked-by: Tomasz Figa <tomasz.figa@gmail.com>

Best regards,
Tomasz
