From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] arm64: dts: exynos: Fix i2s0 pins pull control for
 Exynos5433 SoCs
Date: Fri, 20 Jan 2017 17:00:43 +0200
Message-ID: <20170120150043.6fj7a2wsspbidjxd@kozik-lap>
References: <CGME20170119135856eucas1p149239f274848d61b9aa785e8497d957a@eucas1p1.samsung.com>
 <1484834310-21173-1-git-send-email-m.szyprowski@samsung.com>
 <20170119203509.4uoh45kwthi7o3wb@kozik-lap>
 <574663bb-0b6d-c6d0-fa03-28219eea3f1f@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:33827 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752745AbdATPA4 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 20 Jan 2017 10:00:56 -0500
Received: by mail-wm0-f68.google.com with SMTP id c85so7284503wmi.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Jan 2017 07:00:55 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <574663bb-0b6d-c6d0-fa03-28219eea3f1f@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>

On Fri, Jan 20, 2017 at 07:51:43AM +0100, Marek Szyprowski wrote:
> Hi Krzysztof,
> 
> On 2017-01-19 21:35, Krzysztof Kozlowski wrote:
> > On Thu, Jan 19, 2017 at 02:58:30PM +0100, Marek Szyprowski wrote:
> > > Common definition for I2S0 bus should not define any pull control for
> > > the individual I2S pins. Correct this by changing samsung,pin-pud property
> > > to EXYNOS_PIN_PULL_NONE like it is used for other Exynos SoCs.
> > > 
> > > Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > > ---
> > >   arch/arm64/boot/dts/exynos/exynos5433-pinctrl.dtsi | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > Makes sense. Two questions here:
> > 1. The same for pcm0_bus?
> 
> Right, and for I2S1, PMC1 and SPDIF. I will send a new patch.
> 
> > 2. This will affect the specific boards: TM2s. Do they need pull down or
> >     in fact you wanted to fix them as well? Usage of words "common
> >     definition" suggests the board might be different and in fact you are
> >     changing the board now.
> 
> I've check, audio on TM2 works fine without this pull down. I wrote 'common'
> because all other Exynos SoCs define audio pins without pull down. If pull
> down would be really needed for some reasons on TM2, I would override pull
> control in tm2.dts

OK, thanks for explanation.

Best regards,
Krzysztof
