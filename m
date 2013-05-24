From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 4/6] pinctrl: samsung: Add support for SoC-specific
 suspend/resume callbacks
Date: Fri, 24 May 2013 11:20:06 +0200
Message-ID: <22452279.DN7eJUzGA7@amdc1227>
References: <1368807872-2601-1-git-send-email-t.figa@samsung.com>
 <1368807872-2601-5-git-send-email-t.figa@samsung.com>
 <CACRpkdY-d3YYLJoWydakbT7P4wnBAK2XL7X0Fs0EcNSFakpUDw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:12090 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754557Ab3EXJUO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 24 May 2013 05:20:14 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MNA00IPUPTR2K20@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 24 May 2013 10:20:12 +0100 (BST)
In-reply-to: <CACRpkdY-d3YYLJoWydakbT7P4wnBAK2XL7X0Fs0EcNSFakpUDw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Doug Anderson <dianders@chromium.org>, Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>, Stephen Warren <swarren@wwwdotorg.org>, Thomas Abraham <thomas.abraham@linaro.org>, Prathyush K <prathyush.k@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

Hi Linus,

On Friday 24 of May 2013 11:07:41 Linus Walleij wrote:
> On Fri, May 17, 2013 at 6:24 PM, Tomasz Figa <t.figa@samsung.com> wrote:
> > SoC-specific driver might require additional save and restore of
> > registers. This patch adds pair of SoC-specific callbacks per pinctrl
> > device to account for this.
> > 
> > Signed-off-by: Tomasz Figa <t.figa@samsung.com>
> > Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> 
> Patch applied for fixes.

Thanks.

> Hm this is quite a lot of code for "fixes", can you confirm that
> the system is really unusable without all these patches?

Well, it is something that should have been already sent as a fix for 3.8, when 
this pin control driver was added, because since then suspend/resume has been 
broken on DT-enabled Exynos boards.

Without this, suspending the board and then trying to wake it up is rather 
unpredictable, leading usually to board reset, interrupt storm or at least 
some devices failing to resume.

Best regards,
-- 
Tomasz Figa
Linux Kernel Developer
Samsung R&D Institute Poland
Samsung Electronics
