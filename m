From: Doug Anderson <dianders@google.com>
Subject: Re: clk: Exynos5250: Fix HDMI clock number in documentation
Date: Tue, 21 May 2013 13:01:03 -0700
Message-ID: <CAD=FV=XdMMWmGF6aP-=7cWeGypT=pE6OGJ_nxj=Xv-4cDMWDkQ@mail.gmail.com>
References: <1369134984-16718-1-git-send-email-arun.kk@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-la0-f46.google.com ([209.85.215.46]:33232 "EHLO
	mail-la0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751827Ab3EUUBG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 21 May 2013 16:01:06 -0400
Received: by mail-la0-f46.google.com with SMTP id er20so1145931lab.5
        for <linux-samsung-soc@vger.kernel.org>; Tue, 21 May 2013 13:01:04 -0700 (PDT)
In-Reply-To: <1369134984-16718-1-git-send-email-arun.kk@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arun Kumar K <arun.kk@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, arunkk.samsung@gmail.com, prasanna.ps@samsung.com

Arun,

On Tue, May 21, 2013 at 4:16 AM, Arun Kumar K <arun.kk@samsung.com> wrote:
> This patch corrects the HDMI clock number given wrongly
> in the documentation.
>
> Signed-off-by: Arun Kumar K <arun.kk@samsung.com>
>
> ---
> Documentation/devicetree/bindings/clock/exynos5250-clock.txt |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Doug Anderson <dianders@chromium.org>
