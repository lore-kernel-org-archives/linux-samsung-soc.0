From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [PATCH 2/3] ARM: dts: Add DT changes for display on peach_pit
Date: Sat, 23 Aug 2014 01:31:07 +0200
Message-ID: <CABxcv==PJGDQ85r13OOoWdDONTHu8NYBciNeLLUHQjanoMJYyA@mail.gmail.com>
References: <1406317464-7525-1-git-send-email-ajaykumar.rs@samsung.com>
	<1406317464-7525-3-git-send-email-ajaykumar.rs@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f173.google.com ([209.85.212.173]:34117 "EHLO
	mail-wi0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752464AbaHVXbI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 22 Aug 2014 19:31:08 -0400
Received: by mail-wi0-f173.google.com with SMTP id f8so331934wiw.12
        for <linux-samsung-soc@vger.kernel.org>; Fri, 22 Aug 2014 16:31:07 -0700 (PDT)
In-Reply-To: <1406317464-7525-3-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ajay Kumar <ajaykumar.rs@samsung.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Douglas Anderson <dianders@chromium.org>, Ajay kumar <ajaynumb@gmail.com>, sunil joshi <joshi@samsung.com>, Prashanth G <prashanth.g@samsung.com>

Hello Ajay,

On Fri, Jul 25, 2014 at 9:44 PM, Ajay Kumar <ajaykumar.rs@samsung.com> wrote:
> Add DT nodes for ps8622 bridge chip and panel-simple panel.
> Add backlight power supply for pwm-backlight.
> Also add bridge phandle needed by dp to enable display on peach_pit.
>
> Note that, peach_pit doesn't support "chunghwa,claa101wb01" panel,
> but still we choose to reuse the binding since "chunghwa,claa101wb01"
> has similar LCD timings.
>
> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> ---

Tested-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>

Best regards,
Javier
