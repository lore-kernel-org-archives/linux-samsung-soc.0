From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 2/2] ARM: dts: Document DP clock in samsung,exynos5-dp
 binding
Date: Mon, 10 Jun 2013 17:38:00 +0900
Message-ID: <0ea301ce65b5$d0c265d0$72473170$%kim@samsung.com>
References: <003101ce4e1b$4acc0050$e06400f0$@samsung.com>
 <CAD=FV=UjohPBxChbE2R4b8JWCbxZRXVx_9WuMYPgHTehMP6vvg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:47209 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751971Ab3FJIiD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 10 Jun 2013 04:38:03 -0400
In-reply-to: <CAD=FV=UjohPBxChbE2R4b8JWCbxZRXVx_9WuMYPgHTehMP6vvg@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Doug Anderson' <dianders@chromium.org>, 'Jingoo Han' <jg1.han@samsung.com>
Cc: 'linux-samsung-soc' <linux-samsung-soc@vger.kernel.org>, 'Thomas Abraham' <thomas.abraham@linaro.org>, 'Olof Johansson' <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 'Sean Paul' <seanpaul@chromium.org>, =?ISO-8859-1?Q?'St=E9phane_Marchesin'?= <marcheu@chromium.org>

Doug Anderson wrote:
> 
> Jingoo,
> 
> On Sat, May 11, 2013 at 12:43 AM, Jingoo Han <jg1.han@samsung.com> wrote:
> > The exynos5-dp node needs a clock specified using the common clock
> > framework.
> >
> > Signed-off-by: Jingoo Han <jg1.han@samsung.com>
> > ---
> > Tested on Exynos5250
> >
> >  .../devicetree/bindings/video/exynos_dp.txt        |    6 ++++++
> >  1 files changed, 6 insertions(+), 0 deletions(-)
> 
> Thanks for updating the bindings.  This looks good.
> 
> Reviewed-by: Doug Anderson <dianders@chromium.org>

Applied, thanks.

- Kukjin
