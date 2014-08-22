From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [PATCH 3/3] ARM: dts: Add DT changes for display on peach_pi
Date: Sat, 23 Aug 2014 01:32:23 +0200
Message-ID: <CABxcv=mPKkBk5tPp4Gr06_QCEmkdtcH706qDtjC5M+AZTJ5qNw@mail.gmail.com>
References: <1406317464-7525-1-git-send-email-ajaykumar.rs@samsung.com>
	<1406317464-7525-4-git-send-email-ajaykumar.rs@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f182.google.com ([74.125.82.182]:60677 "EHLO
	mail-we0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752083AbaHVXcY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 22 Aug 2014 19:32:24 -0400
Received: by mail-we0-f182.google.com with SMTP id k48so11304218wev.27
        for <linux-samsung-soc@vger.kernel.org>; Fri, 22 Aug 2014 16:32:23 -0700 (PDT)
In-Reply-To: <1406317464-7525-4-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ajay Kumar <ajaykumar.rs@samsung.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Douglas Anderson <dianders@chromium.org>, Ajay kumar <ajaynumb@gmail.com>, sunil joshi <joshi@samsung.com>, Prashanth G <prashanth.g@samsung.com>

Hello Ajay,

On Fri, Jul 25, 2014 at 9:44 PM, Ajay Kumar <ajaykumar.rs@samsung.com> wrote:
> Add DT nodes for panel-simple "auo,b133htn01" panel.
> Add backlight enable pin and backlight power supply for pwm-backlight.
> Also add panel phandle needed by dp to enable display on peach_pi.
>
> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> ---

Looks good to me.

Reviewed-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>

Best regards,
Javier
