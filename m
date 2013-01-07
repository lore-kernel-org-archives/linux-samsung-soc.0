From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH] ARM: dts: correct the dw-mshc timing properties as per binding
Date: Mon, 7 Jan 2013 11:04:16 -0800
Message-ID: <CAD=FV=XUpLwZCn=bpShFqiPBzFBaAbWYn5-+-_OuTqC55sKi3Q@mail.gmail.com>
References: <1357557585-30257-1-git-send-email-alim.akhtar@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-la0-f52.google.com ([209.85.215.52]:38620 "EHLO
	mail-la0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754921Ab3AGTEV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 7 Jan 2013 14:04:21 -0500
Received: by mail-la0-f52.google.com with SMTP id fq12so16632042lab.39
        for <linux-samsung-soc@vger.kernel.org>; Mon, 07 Jan 2013 11:04:19 -0800 (PST)
Received: by mail-la0-f45.google.com with SMTP id ep20so16957081lab.32
        for <linux-samsung-soc@vger.kernel.org>; Mon, 07 Jan 2013 11:04:16 -0800 (PST)
In-Reply-To: <1357557585-30257-1-git-send-email-alim.akhtar@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Alim Akhtar <alim.akhtar@samsung.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc@vger.kernel.org, Thomas P Abraham <thomas.ab@samsung.com>

Alim,

On Mon, Jan 7, 2013 at 3:19 AM, Alim Akhtar <alim.akhtar@samsung.com> wrote:
> As per the current exynos-dw-mshc bindings, dw-mshc-sdr-timing and
> dw-mshc-ddr-timing properties are having only two cells, these properties
> are wrongly set for exynos5250 based cros5250 and smdk5250 platfroms. This patch
> corrects above timing propreties for above platfroms

Thanks for catching this.  Given that this just removes a number from
the dts file that isn't read by the code, I don't expect any
functional change and I don't see any.

I also double-checked usage and compared to the current Chrome OS
tree.  The third number (that you removed) is already correctly
specified in the dts as "samsung,dw-mshc-ciu-div".  :)


> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>

Tested-by: Doug Anderson <dianders@chromium.org>
Acked-by: Doug Anderson <dianders@chromium.org>
