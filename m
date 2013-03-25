From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 0/2] ARM: dts: Add default pin states for client nodes on
 Exynos4/5 platforms
Date: Mon, 25 Mar 2013 19:36:10 +0900
Message-ID: <17a201ce2944$91006440$b3012cc0$%kim@samsung.com>
References: <1362573398-15126-1-git-send-email-thomas.abraham@linaro.org>
 <CACRpkdbsCpV5_P=z44CMvsgps=AS9C62oprn6To6ExhoWZkvhA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:35304 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756301Ab3CYKgM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 25 Mar 2013 06:36:12 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MK7009UTPG8AH40@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 25 Mar 2013 19:36:10 +0900 (KST)
In-reply-to: <CACRpkdbsCpV5_P=z44CMvsgps=AS9C62oprn6To6ExhoWZkvhA@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Linus Walleij' <linus.walleij@linaro.org>, 'Thomas Abraham' <thomas.abraham@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org, t.figa@samsung.com, heiko@sntech.de, patches@linaro.org

Linus Walleij wrote:
> 
> On Wed, Mar 6, 2013 at 1:36 PM, Thomas Abraham
> <thomas.abraham@linaro.org> wrote:
> 
> > This patch series populates the default pin states in client nodes
> > of Exynos4 and Exynos5 platforms. Exynos4/5 platforms are migrating
> > to use pinctrl framework and having the default pin states listed
> > in the client nodes allows the device core to setup the default
> > pin configuration for all the controllers.
> 
> The series:
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> 
Looks good to me, applied.

Thanks.

- Kukjin
