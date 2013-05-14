From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v3] ARM: exynos: Select PINCTRL_EXYNOS for exynos4/5 at
 chip level
Date: Tue, 14 May 2013 21:25:13 +0900
Message-ID: <093701ce509e$15ba0350$412e09f0$%kim@samsung.com>
References: <1368039168-24447-1-git-send-email-dianders@chromium.org>
 <1368123170-22906-1-git-send-email-dianders@chromium.org>
 <CACRpkdZ3grCyf3x5dEbT6hAVDkpM3mwibVO5kT0Lv=a09-zBPA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:19628 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752594Ab3ENMZP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 14 May 2013 08:25:15 -0400
In-reply-to: <CACRpkdZ3grCyf3x5dEbT6hAVDkpM3mwibVO5kT0Lv=a09-zBPA@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Linus Walleij' <linus.walleij@linaro.org>, 'Doug Anderson' <dianders@chromium.org>
Cc: 'Thomas Abraham' <thomas.abraham@linaro.org>, 'Olof Johansson' <olof@lixom.net>, 'Simon Glass' <sjg@chromium.org>, 'Alim Akhtar' <alim.akhtar@samsung.com>, 'Tomasz Figa' <tomasz.figa@gmail.com>, 'Russell King' <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, 'linux-samsung-soc' <linux-samsung-soc@vger.kernel.org>, linux-kernel@vger.kernel.org

Linus Walleij wrote:
> 
> On Thu, May 9, 2013 at 8:12 PM, Doug Anderson <dianders@chromium.org>
> wrote:
> 
> > Previously if you had MACH_EXYNOS5_DT but not MACH_EXYNOS4_DT you'd be
> > missing the pincontrol definitions.  Move PINCTRL selects to the arch
> > level since we should be enabling the code for all exynos variants.
> >
> > Update the PINCTRL descriptions to indicate that PINCTRL_EXYNOS is not
> > for exynos5440.  Also add basic dependencies for the PINCTRL_EXYNOS
> > kernel config.
> >
> > Signed-off-by: Doug Anderson <dianders@chromium.org>
> > ---
> > Changes in v3:
> > - Moved to chip level as per Tomasz.
> > - Update PINCTRL Kconfig for exynos.
> >
> > Changes in v2:
> > - Moved to the arch level as suggested by Olof.
> 
> Acked-by: Linus Walleij <linus.walleij@linaro.org> for the pinctrl
> part, I guess this will be merged through the Samsung tree?
> 
Linus, thanks for your ack.

Let me take this into samsung tree.

- Kukjin
