From: Sachin Kamat <spk.linux@gmail.com>
Subject: Re: [PATCH] thermal: Add missing cpumask_clear
Date: Fri, 4 Jul 2014 16:53:41 +0530
Message-ID: <CAK5sBcHDTgyj67xVWgtNH-Z7XU1Ykp6m650_mWBVp=Az2P6f=Q@mail.gmail.com>
References: <000001cf9771$e2f465c0$a8dd3140$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-la0-f51.google.com ([209.85.215.51]:39808 "EHLO
	mail-la0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754129AbaGDLXn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 4 Jul 2014 07:23:43 -0400
Received: by mail-la0-f51.google.com with SMTP id mc6so1087753lab.10
        for <linux-samsung-soc@vger.kernel.org>; Fri, 04 Jul 2014 04:23:41 -0700 (PDT)
In-Reply-To: <000001cf9771$e2f465c0$a8dd3140$@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jonghwan Choi <jhbird.choi@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Kukjin Kim <kgene.kim@samsung.com>, Eduardo Valentin <eduardo.valentin@ti.com>, Jonghwa Lee <jonghwa3.lee@samsung.com>, Lukasz Majewski <l.majewski@samsung.com>, Naveen Krishna Chatradhi <ch.naveen@samsung.com>

Hi Jonghwan,

On Fri, Jul 4, 2014 at 3:52 PM, Jonghwan Choi <jhbird.choi@samsung.com> wrote:
> Cpumasks should be cleared before using.

Please explain why and what is issue observed without this.

>
> Signed-off-by: Jonghwan Choi <jhbird.choi@samsung.com>
> ---

-- 
Regards,
Sachin.
