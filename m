From: Doug Anderson <dianders@google.com>
Subject: Re: [PATCH 0/3] MCPM: clarify boot CPU situation wrt CCI
Date: Tue, 24 Jun 2014 15:57:59 -0700
Message-ID: <CAD=FV=WHU0TDkjXVCCw6odBFSF7uvv3joCP+oW4cBS_tsSgF+Q@mail.gmail.com>
References: <1403583071-5650-1-git-send-email-nicolas.pitre@linaro.org>
	<7hd2dymiaw.fsf@paris.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f173.google.com ([209.85.220.173]:54982 "EHLO
	mail-vc0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752256AbaFXW6A (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 24 Jun 2014 18:58:00 -0400
Received: by mail-vc0-f173.google.com with SMTP id lf12so1075839vcb.32
        for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Jun 2014 15:57:59 -0700 (PDT)
In-Reply-To: <7hd2dymiaw.fsf@paris.lan>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kevin Hilman <khilman@linaro.org>
Cc: Nicolas Pitre <nicolas.pitre@linaro.org>, Abhilash Kesavan <kesavan.abhilash@gmail.com>, Andrew Bresticker <abrestic@chromium.org>, Olof Johansson <olof@lixom.net>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Lists linaro-kernel <linaro-kernel@lists.linaro.org>, Tushar Behera <tushar.b@samsung.com>

Kevin,

On Tue, Jun 24, 2014 at 8:35 AM, Kevin Hilman <khilman@linaro.org> wrote:
> - Leave mau_epll enabled
>   http://lists.infradead.org/pipermail/linux-arm-kernel/2014-June/262259.html

Can you drop your mau_epll one and instead pick just
<https://patchwork.kernel.org/patch/4333581/>?

I noticed that Tushar has only been pushing for that patch to be
applied and I'm going to guess that the "leave mau_epll enabled" isn't
needed.  I just tested myself and confirmed that things are happy.
