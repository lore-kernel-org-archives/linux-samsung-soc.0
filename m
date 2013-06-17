From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH RESEND V2] ARM: dts: Correct the base address of
 pinctrl_3 on Exynos5250
Date: Mon, 17 Jun 2013 10:04:51 -0700
Message-ID: <20130617170451.GB28497@quad.lixom.net>
References: <1371025425-480-1-git-send-email-padma.v@samsung.com>
 <1a1601ce6b5a$6833d8a0$389b89e0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f50.google.com ([209.85.160.50]:53460 "EHLO
	mail-pb0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752397Ab3FQREp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 17 Jun 2013 13:04:45 -0400
Received: by mail-pb0-f50.google.com with SMTP id wz7so2992737pbc.37
        for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Jun 2013 10:04:45 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1a1601ce6b5a$6833d8a0$389b89e0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Padmavathi Venna' <padma.v@samsung.com>, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org, padma.kvr@gmail.com, sbkim73@samsung.com, broonie@kernel.org

On Mon, Jun 17, 2013 at 09:58:47PM +0900, Kukjin Kim wrote:
> Padmavathi Venna wrote:
> > 
> > This patch corrects the base address of pinctrl_3 on Exynos5250
> > platform.
> > 
> > Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
> 
> (+ Olof)
> 
> Olof, there is no other fixes in my tree for v3.10 yet, so would be helpful
> if you could take this into fixes in arm-soc for v3.10. Just note, the wrong
> address added during v3.10 merge window.

Huh. I guess we lucked out on snow since we're definitely using this and didn't
hit any problems from it.

I'll apply to fixes.


-Olof
