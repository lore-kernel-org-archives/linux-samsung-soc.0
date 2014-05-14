From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: Re: [PATCH v6 0/5] MCPM backend for Exynos5420
Date: Wed, 14 May 2014 09:33:28 -0400 (EDT)
Message-ID: <alpine.LFD.2.11.1405140931380.980@knanqh.ubzr>
References: <1399982324-27879-1-git-send-email-a.kesavan@samsung.com> <alpine.LFD.2.11.1405131325060.980@knanqh.ubzr> <CAM4voanvVwj+FuWazTGMHMnM64Cw_qK03D3o=raS43f_zWFfog@mail.gmail.com> <alpine.LFD.2.11.1405140031490.980@knanqh.ubzr>
 <CAM4voa=6osyXYg_XF=XuGRYmxLDUO+5=-i+cMrNW92fzBZJjfA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qg0-f47.google.com ([209.85.192.47]:35191 "EHLO
	mail-qg0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755380AbaENNda (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 May 2014 09:33:30 -0400
Received: by mail-qg0-f47.google.com with SMTP id j107so2753921qga.20
        for <linux-samsung-soc@vger.kernel.org>; Wed, 14 May 2014 06:33:30 -0700 (PDT)
In-Reply-To: <CAM4voa=6osyXYg_XF=XuGRYmxLDUO+5=-i+cMrNW92fzBZJjfA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Abhilash Kesavan <kesavan.abhilash@gmail.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Kukjin Kim <kgene.kim@samsung.com>, Andrew Bresticker <abrestic@chromium.org>, Thomas P Abraham <thomas.ab@samsung.com>, "inderpal.s@samsung.com" <inderpal.s@samsung.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Dave Martin <Dave.Martin@arm.com>, Tomasz Figa <t.figa@samsung.com>

On Wed, 14 May 2014, Abhilash Kesavan wrote:

> Hi Nicolas,
> 
> [...]
> >>
> >> 1) can't create /sys/devices/system/cpu/cpu//online: nonexistent directory
> >
> > What do you get if you do:
> >
> > $ ls -d /sys/devices/system/cpu/cpu?/online
> ls: /sys/devices/system/cpu/cpu//online: No such file or directory

Somehow, you or your shell replaced the ? character into a / character.
You could try with a * instead.


Nicolas
