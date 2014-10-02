From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH 0/2] ARM: dts: Add new board dts file for Exynos3250-based
 Rinato board
Date: Thu, 2 Oct 2014 15:58:41 +0900
Message-ID: <CAH9JG2WptOhTSfgn8Vz5BMHb5-ZgPKwzJsAMv0r8_Nm2JKMWSg@mail.gmail.com>
References: <1412075245-5763-1-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oi0-f49.google.com ([209.85.218.49]:55759 "EHLO
	mail-oi0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750842AbaJBG6m (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 2 Oct 2014 02:58:42 -0400
Received: by mail-oi0-f49.google.com with SMTP id e131so1438656oig.36
        for <linux-samsung-soc@vger.kernel.org>; Wed, 01 Oct 2014 23:58:41 -0700 (PDT)
In-Reply-To: <1412075245-5763-1-git-send-email-cw00.choi@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>
Cc: arm-linux <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, =?UTF-8?B?7KCV7J6s7ZuI?= <jh80.chung@samsung.com>, geunsik.lim@samsung.com, Kukjin Kim <kgene.kim@samsung.com>, =?UTF-8?B?6rmA7Iq57Jqw?= <sw0312.kim@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, =?UTF-8?B?64yA7J246riw?= <inki.dae@samsung.com>

+ ARM maintainers.

It's Gear 2 board support.

Thank you,
Kyungmin Park

On Tue, Sep 30, 2014 at 8:07 PM, Chanwoo Choi <cw00.choi@samsung.com> wrote:
> This patchset adds new board dts file for Samsung Rinato board (Gear 2) which
> is based on Exynos3250 SoC and adds sleep mode pin configuration using pinctrl
> subsystem to reduce leakage power-consumption in sleep state.
>
> This patchset is based on linux-samsung.git (for-next branch).
>
> Chanwoo Choi (2):
>   ARM: dts: Add board dts file for Exynos3250-based Rinato board
>   ARM: dts: Add sleep mode pin configuration for exynos3250-rinato
>
>  arch/arm/boot/dts/Makefile                |   3 +-
>  arch/arm/boot/dts/exynos3250-pinctrl.dtsi |  16 +
>  arch/arm/boot/dts/exynos3250-rinato.dts   | 595 ++++++++++++++++++++++++++++++
>  3 files changed, 613 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm/boot/dts/exynos3250-rinato.dts
>
> --
> 1.8.0
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
