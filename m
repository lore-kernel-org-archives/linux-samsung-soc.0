From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v2] ARM: SAMSUNG: S5P: If detected device tree skip irq init
Date: Tue, 24 Sep 2013 21:19:42 +0200
Message-ID: <2123658.6S6hP57GRg@flatron>
References: <1380038363-487-1-git-send-email-m.krawczuk@partner.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f42.google.com ([74.125.83.42]:52405 "EHLO
	mail-ee0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754194Ab3IXTTo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 24 Sep 2013 15:19:44 -0400
In-Reply-To: <1380038363-487-1-git-send-email-m.krawczuk@partner.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Mateusz Krawczuk <m.krawczuk@partner.samsung.com>, kgene.kim@samsung.com, t.stanislaws@samsung.com, linux-samsung-soc@vger.kernel.org, linux@arm.linux.org.uk, s.nawrocki@samsung.com, b.zolnierkie@samsung.com, t.figa@samsung.com, linux-kernel@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, ben-linux@fluff.org, m.szyprowski@samsung.com

Hi Mateusz,

On Tuesday 24 of September 2013 17:59:23 Mateusz Krawczuk wrote:
> It prevents from executing things already handled by pinctrl-exynos
> driver, when device tree is available.
> 
> Signed-off-by: Mateusz Krawczuk <m.krawczuk@partner.samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  arch/arm/plat-samsung/s5p-irq-eint.c | 4 ++++
>  1 file changed, 4 insertions(+)

Acked-by: Tomasz Figa <t.figa@samsung.com>

[as a temporary solution until we move all the users of this code to 
device tree]

Best regards,
Tomasz
