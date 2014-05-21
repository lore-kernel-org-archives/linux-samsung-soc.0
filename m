From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] arm: dts: exynos5: Remove multi core timer
Date: Wed, 21 May 2014 21:47:20 +0900
Message-ID: <033a01cf74f2$d025ce80$70716b80$@samsung.com>
References: <1400188079-21832-1-git-send-email-chirantan@chromium.org>
 <53752E25.9060604@gmail.com>
 <CAD=FV=WKOtZaUyzTWNqR=vi_L=U-Q1dct2U_oCYi3ZJv6401Hg@mail.gmail.com>
 <53753443.8010303@gmail.com>
 <CAD=FV=V8UZoeOqEwfx_E015pLM+amTt51LrUa+dk7mTdn=vKgA@mail.gmail.com>
 <53753C17.1090002@gmail.com>
 <CAD=FV=WGa7j_As_NpySxU7OEd_SzuGWK6oxU6UeiJ-4HsoWvvg@mail.gmail.com>
 <CAJFHJrrgWGc4XGQB0ysLufAg3Wouz-aYXu97Sy2Kp=HzK+akVQ@mail.gmail.com>
 <CAASgrz2Nr69tpfC8ka9gbs2OvjLEGsvgAj4vBCFxhsamuFum7w@mail.gmail.com>
 <53754CE2.3000905@gmail.com>
 <CAD=FV=UMoL7i9rg_QtBAqPwisSQyRqRmk8wQhneMXAiLBjTT1A@mail.gmail.com>
 <CAPz6YkU8GDrLj8UkqEQXxxqxWF5_p427wKSDgAp+QPR7WE7Ujg@mail.gmail.com>
 <CAJFHJrrb2XFDZqJh4OuLdFP=J0aR4pGe-WLWKZ7ZpMfUSPGd4Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:44086 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752508AbaEUMr1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 21 May 2014 08:47:27 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N5X00G6SCV0VS80@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 21 May 2014 21:47:24 +0900 (KST)
In-reply-to: <CAJFHJrrb2XFDZqJh4OuLdFP=J0aR4pGe-WLWKZ7ZpMfUSPGd4Q@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Chirantan Ekbote' <chirantan@chromium.org>, 'Sonny Rao' <sonnyrao@chromium.org>
Cc: 'Doug Anderson' <dianders@chromium.org>, 'Tomasz Figa' <tomasz.figa@gmail.com>, 'David Riley' <davidriley@google.com>, 'Russell King' <linux@arm.linux.org.uk>, 'Olof Johansson' <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, 'linux-samsung-soc' <linux-samsung-soc@vger.kernel.org>

Chirantan Ekbote wrote:
> 
> >>> Anyway, I'm by no means opposed to switching to arch timers. They
> >>> provide a well designed, generic interface and drivers shared by
> >>> multiple platforms, which means more code sharing and possibly more eyes
> >>> looking at the code, which is always good. However if they don't support
> >>> low power states correctly, we can't just remove MCT.
> >>
> >> I think low power states aren't in mainline (right?).
> >>
> >> One solution that might work could be to leave the device tree entry
> >> alone but change the MCT init code to simply act as a no-op if it sees
> >> an arch timer is in the device tree and enabled.  Then when/if someone
> >> got the low power states enabled we could just change source code
> >> rather than dts files.
> >>
> Doug and I were talking about this and we think we may have a way to
> have the mct and arch timers co-exist.  The main issue is that the mct
> (and therefore arch timer) gets cleared once during boot and every
> time we do a suspend / resume.  This happens in
> exynos4_mct_frc_start() but it's not immediately clear to us why the
> counter needs to be reset at all.  If we remove the lines that clear
> the counter then there is no longer an issue with having both the mct
> and the arch timers on at the same time.
> 
Yeah, actually we don't need to reset the count value after suspend/resume.
So, how about following? I think, it should be fine to you.

diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/exynos_mct.c
index 8d64200..d24db6f 100644
--- a/drivers/clocksource/exynos_mct.c
+++ b/drivers/clocksource/exynos_mct.c
@@ -157,12 +157,15 @@ static void exynos4_mct_frc_start(u32 hi, u32 lo)
 {
 	u32 reg;
 
-	exynos4_mct_write(lo, EXYNOS4_MCT_G_CNT_L);
-	exynos4_mct_write(hi, EXYNOS4_MCT_G_CNT_U);
-
 	reg = __raw_readl(reg_base + EXYNOS4_MCT_G_TCON);
-	reg |= MCT_G_TCON_START;
-	exynos4_mct_write(reg, EXYNOS4_MCT_G_TCON);
+
+	if (!(reg & MCT_G_TCON_START)) {
+		exynos4_mct_write(lo, EXYNOS4_MCT_G_CNT_L);
+		exynos4_mct_write(hi, EXYNOS4_MCT_G_CNT_U);
+
+		reg |= MCT_G_TCON_START;
+		exynos4_mct_write(reg, EXYNOS4_MCT_G_TCON);
+	}
 }


> Alternately, if there is some code that depends on the mct being reset
> we could store an offset instead of clearing the counter and then
> subtract that offset every time something reads it.  Doug has a patch
> that does this at
> https://chromium-review.googlesource.com/#/c/200298/.  Effectively the
> visible behavior will not change.  Would either of these options work?
> 
Hmm...I cannot open the webpage :(

- Kukjin
