From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 2/3] pinctrl: dt-bindings: samsung: Add Exynos7 specific
 pinctrl macro definitions
Date: Fri, 27 Jan 2017 16:41:23 +0200
Message-ID: <20170127144123.slmwxorx7cjxwtcr@kozik-lap>
References: <1484718141-28785-1-git-send-email-pankaj.dubey@samsung.com>
 <CGME20170118054002epcas5p3b08e2f419976e17a3c584d64776810fd@epcas5p3.samsung.com>
 <1484718141-28785-3-git-send-email-pankaj.dubey@samsung.com>
 <20170118141935.eu7wmki7jnjdarkw@kozik-lap>
 <7a0d543f-37e8-98e9-15b4-7d3f808f8516@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:34804 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754814AbdA0Olf (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 27 Jan 2017 09:41:35 -0500
Content-Disposition: inline
In-Reply-To: <7a0d543f-37e8-98e9-15b4-7d3f808f8516@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: Pankaj Dubey <pankaj.dubey@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, kgene@kernel.org, robh+dt@kernel.org, sanath@samsung.com, javier@osg.samsung.com, alim.akhtar@samsung.com

On Fri, Jan 27, 2017 at 01:25:42PM +0100, Sylwester Nawrocki wrote:
> On 01/18/2017 03:19 PM, Krzysztof Kozlowski wrote:
> > On Wed, Jan 18, 2017 at 11:12:20AM +0530, Pankaj Dubey wrote:
> >> Exynos7 SoC pinctrl configurations are similar to existing Exynos4/5 except
> >> for FSYS1 pinctrl drive strengths. So adding Exynos7 specific FSYS1 blocks
> >> pinctrl driver strength related macros which will be used in Exynos7
> >> DTSi files.
> >>
> >> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> >> ---
> >>  include/dt-bindings/pinctrl/samsung.h | 8 ++++++++
> >>  1 file changed, 8 insertions(+)
> >>
> > 
> > Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
> > 
> > I will need this header, so Sylwester if it is okay with you, could you
> > provide a tag with it (or ack it)?
> 
> Acked-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> 
> I don't have pinctrl/samsung git tree, Linus applies patches directly.

Oh, my mistake.

Linus,
This is similar case as "pinctrl: dt-bindings: samsung: add drive
strength macros for Exynos5433" [1].

Best regards,
Krzysztof

[1] https://git.kernel.org/cgit/linux/kernel/git/krzk/linux.git/log/?h=for-v4.11/pinctrl-macros
