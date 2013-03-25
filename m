From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 0/2] ARM: dts: Add default pin states for client nodes on
 Exynos4/5 platforms
Date: Mon, 25 Mar 2013 19:40:34 +0900
Message-ID: <17a301ce2945$2dfc3a30$89f4ae90$%kim@samsung.com>
References: <1362573398-15126-1-git-send-email-thomas.abraham@linaro.org>
 <CACRpkdbsCpV5_P=z44CMvsgps=AS9C62oprn6To6ExhoWZkvhA@mail.gmail.com>
 <514FF37F.7090405@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:10564 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757175Ab3CYKkf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 25 Mar 2013 06:40:35 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MK700HC0PNMRR41@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 25 Mar 2013 19:40:34 +0900 (KST)
In-reply-to: <514FF37F.7090405@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Tushar Behera' <tushar.behera@linaro.org>
Cc: 'Linus Walleij' <linus.walleij@linaro.org>, 'Thomas Abraham' <thomas.abraham@linaro.org>, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org, t.figa@samsung.com, heiko@sntech.de, patches@linaro.org

Tushar Behera wrote:
> 
> On 03/07/2013 01:45 PM, Linus Walleij wrote:
> > On Wed, Mar 6, 2013 at 1:36 PM, Thomas Abraham
> > <thomas.abraham@linaro.org> wrote:
> >
> >> This patch series populates the default pin states in client nodes
> >> of Exynos4 and Exynos5 platforms. Exynos4/5 platforms are migrating
> >> to use pinctrl framework and having the default pin states listed
> >> in the client nodes allows the device core to setup the default
> >> pin configuration for all the controllers.
> >
> > The series:
> > Acked-by: Linus Walleij <linus.walleij@linaro.org>
> >
> > Yours,
> > Linus Walleij
> > --
> > To unsubscribe from this list: send the line "unsubscribe linux-samsung-
> soc" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> >
> 
> Kukjin,
> 
> Would you be applying this patch-set to your tree? We need that to
> rebase Arndale related patches for v3.10.
> 
Just note, you will see this series late tomorrow because I need to sort out
samsung tree.

Thanks for your reminder.

- Kukjin
