From: Chanho Park <chanho61.park@samsung.com>
Subject: RE: [PATCH v3] pinctrl: exynos: Add support for Exynos5433
Date: Thu, 12 Feb 2015 16:00:20 +0900
Message-ID: <009301d04691$90e47d40$b2ad77c0$@samsung.com>
References: <1421822591-10536-1-git-send-email-cw00.choi@samsung.com>
 <CACRpkdYq-1ztF5baHjB9aBUNspD5vRXrpnEd1zdWsADmwrhuWw@mail.gmail.com>
 <CA+Ln22E1xpdj+LZAR6uf7sCEBR_TEN=CaTVznsKM490a8AzGww@mail.gmail.com>
 <54DC4598.4010603@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:10313 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750881AbbBLHAX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 12 Feb 2015 02:00:23 -0500
In-reply-to: <54DC4598.4010603@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Chanwoo Choi' <cw00.choi@samsung.com>, 'Linus Walleij' <linus.walleij@linaro.org>
Cc: 'linux-samsung-soc' <linux-samsung-soc@vger.kernel.org>, 'Tomasz Figa' <tomasz.figa@gmail.com>, linux-kernel@vger.kernel.org, 'Inki Dae' <inki.dae@samsung.com>, 'Kukjin Kim' <kgene@kernel.org>, 'Thomas Abraham' <thomas.abraham@linaro.org>, linux-arm-kernel@lists.infradead.org

Hi Linus,

We're looking forward to merging it on the v3.20.
Could you pick this patch up before merge-window is closed?

Best Regards,
Chanho Park

> -----Original Message-----
> From: linux-arm-kernel [mailto:linux-arm-kernel-
> bounces@lists.infradead.org] On Behalf Of Chanwoo Choi
> Sent: Thursday, February 12, 2015 3:18 PM
> To: Linus Walleij
> Cc: linux-samsung-soc; Tomasz Figa; linux-kernel@vger.kernel.org; Inki
> Dae; Kukjin Kim; Thomas Abraham; Chanho Park; linux-arm-
> kernel@lists.infradead.org
> Subject: Re: [PATCH v3] pinctrl: exynos: Add support for Exynos5433
> 
> Hi Linus,
> 
> On 02/08/2015 11:59 PM, Tomasz Figa wrote:
> > Hi,
> >
> > 2015-01-29 18:48 GMT+09:00 Linus Walleij <linus.walleij@linaro.org>:
> >> On Wed, Jan 21, 2015 at 7:43 AM, Chanwoo Choi <cw00.choi@samsung.com>
> wrote:
> >>
> >>> This patch adds driver data for Exynos5433 SoC. Exynos5433 includes
> 228 multi-
> >>> functional input/output port pins and 135 memory port pins. There
> are 41 general
> >>> port groups and 2 memory port groups.
> >>>
> >>> Cc: Tomasz Figa <tomasz.figa@gmail.com>
> >>> Cc: Thomas Abraham <thomas.abraham@linaro.org>
> >>> Cc: Linus Walleij <linus.walleij@linaro.org>
> >>> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
> >>> Acked-by: Inki Dae <inki.dae@samsung.com>
> >>> ---
> >>> Changes from v2:
> >>> - Rebase it on v3.19-rc5
> >>
> >> Waiting for Tomasz to review this.
> >
> > Thanks Linus. Looks good to me.
> >
> > Acked-by: Tomasz Figa <tomasz.figa@gmail.com>
> 
> Could you please pick this patch?
> 
> Best Regards,
> Chanwoo Choi
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
