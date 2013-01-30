From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: Failure due to missing (Exynos related) pinctrl patch
Date: Tue, 29 Jan 2013 20:08:07 -0800
Message-ID: <076401cdfe9f$6a0f5fa0$3e2e1ee0$@samsung.com>
References: <CAK9yfHybC6ZgGwxa_i=LrMpU_q9M4aaMraTqK63B+fw11NBqRA@mail.gmail.com>
 <CACRpkdYj_e6+iT7iAVtA8_t=4e_2Lxo9duozXccfcbKY8fGk7A@mail.gmail.com>
 <CAK9yfHwav_u3mjVqNdX4kY=LyUW30vr6AMGUExfGKuJn2KH8qQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:60815 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753048Ab3A3EIO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 29 Jan 2013 23:08:14 -0500
In-reply-to: <CAK9yfHwav_u3mjVqNdX4kY=LyUW30vr6AMGUExfGKuJn2KH8qQ@mail.gmail.com>
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sachin Kamat' <sachin.kamat@linaro.org>, 'Linus Walleij' <linus.walleij@linaro.org>
Cc: 'LKML' <linux-kernel@vger.kernel.org>, 'linux-samsung-soc' <linux-samsung-soc@vger.kernel.org>

Sachin Kamat wrote:
> 
> >> This patch is required along with the
> >> patch "gpio: samsung: fix pinctrl condition for exynos and exynos5440"
> >> (mainline commit Id: e4a5da51) which has already made it into
> >> mainline. Without the missing patch we get the following boot up
> >> warnings and subsequent failures with dt boot on 4412 based board:
> >
> > Hm I didn't realize there was a dependency between these
> > patches, oh well, better get the pull for the pinctrl tree finished
> > off then...
> 
> Ideally those 2 patches should have been squashed together.
> 
Err, Sachin, what are you talking about? As you said, one patch has been
merged into the mainline, so how does it can be squashed? In this case, just
applying the other patch into pinctrl-fixes is enough.

Thanks.

- Kukjin
