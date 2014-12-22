From: Tony K Nadackal <tony.kn@samsung.com>
Subject: RE: [PATCH] clk: samsung: exynos7: Add clocks for MSCL block
Date: Mon, 22 Dec 2014 17:16:03 +0530
Message-ID: <000901d01ddc$eac0d120$c0427360$@samsung.com>
References: <1418801617-7593-1-git-send-email-tony.kn@samsung.com>
 <549450A6.9020205@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:36439 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754481AbaLVLpi (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 22 Dec 2014 06:45:38 -0500
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NGZ008PLFC050B0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 22 Dec 2014 20:45:36 +0900 (KST)
In-reply-to: <549450A6.9020205@samsung.com>
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sylwester Nawrocki' <s.nawrocki@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, tomasz.figa@gmail.com, mturquette@linaro.org, kgene@kernel.org, a.kesavan@samsung.com, bhushan.r@samsung.com, tony.kn@samsung.com

Hi Sylwester,

On  Friday, December 19, 2014 9:52 PM Sylwester Nawrocki wrote,

> Hi,
> 
> On 17/12/14 08:33, Tony K Nadackal wrote:
> > Add clock support for the MSCL block for Exynos7.
> >
> > Signed-off-by: Tony K Nadackal <tony.kn@samsung.com>
> > ---
> >  .../devicetree/bindings/clock/exynos7-clock.txt    |   1 +
> >  drivers/clk/samsung/clk-exynos7.c                  | 124
+++++++++++++++++++++
> >  include/dt-bindings/clock/exynos7-clk.h            |  40 ++++++-
> >  3 files changed, 164 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/clock/exynos7-clock.txt
> > b/Documentation/devicetree/bindings/clock/exynos7-clock.txt
> > index 6d3d5f8..d0e048c 100644
> > --- a/Documentation/devicetree/bindings/clock/exynos7-clock.txt
> > +++ b/Documentation/devicetree/bindings/clock/exynos7-clock.txt
> > @@ -34,6 +34,7 @@ Required Properties for Clock Controller:
> >  	- "samsung,exynos7-clock-peris"
> >  	- "samsung,exynos7-clock-fsys0"
> >  	- "samsung,exynos7-clock-fsys1"
> > +	- "samsung,exynos7-clock-mscl"
> 
> I can't see anything controversial in the patch, but I've got some doubts
regarding
> the compatible string. Is there a SoC named just "Exynos7"?

Yes, We have an SoC named Exynos7.
Please refer http://www.spinics.net/lists/linux-samsung-soc/msg36765.html

> If not, what are exact SoC names the "samsung,exynos7-clock-mscl" compatible
> is supposed to cover ?
> It would be good to list in this file the exact SoCs names this binding
applies to,
> unless there is indeed Exynos7 SoC.
> 
> --
> Thanks,
> Sylwester


Regards,
Tony
