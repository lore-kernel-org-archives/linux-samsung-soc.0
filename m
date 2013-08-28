From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [Patch v2] pinctrl: Add s5pv210 support to pinctrl-exynos
Date: Wed, 28 Aug 2013 14:58:41 +0200
Message-ID: <3439226.L4MiyJHvQr@amdc1227>
References: <1377608890-8528-1-git-send-email-m.krawczuk@partner.samsung.com>
 <CACRpkdYiB5OG-YPRozwEurPHECDzZjQUs2s_E8gCdeqDPyr+WA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:59552 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751791Ab3H1M6r (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 28 Aug 2013 08:58:47 -0400
In-reply-to: <CACRpkdYiB5OG-YPRozwEurPHECDzZjQUs2s_E8gCdeqDPyr+WA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Mateusz Krawczuk <m.krawczuk@partner.samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ian.campbell@citrix.com>, Rob Landley <rob@landley.net>, Thomas Abraham <thomas.abraham@linaro.org>, Leelakrishna A <l.krishna@samsung.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

On Wednesday 28 of August 2013 14:51:44 Linus Walleij wrote:
> On Tue, Aug 27, 2013 at 3:08 PM, Mateusz Krawczuk
> 
> <m.krawczuk@partner.samsung.com> wrote:
> > This patch implements pinctrl support and adds device tree bindings
> > for s5pv210.
> > 
> > Signed-off-by: Mateusz Krawczuk <m.krawczuk@partner.samsung.com>
> 
> Oh this one does add bindings, sorry for previous comment.
> 
> I want an ACK from Kukjin or Sylwester for this since it's
> something new for S5P.

Well, it does not touch anything outside drivers/pinctrl/, so my and your 
ACKs should be enough, but since this patch is just one day old, let's give 
it a bit more time for people to review it, if you don't have to hurry with 
it yet.

Best regards,
Tomasz
