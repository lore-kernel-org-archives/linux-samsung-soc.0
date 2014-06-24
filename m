From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: Re: [PATCH 3/3] ARM: exynos: activate the CCI on boot CPU/cluster
 with the MCPM loopback
Date: Tue, 24 Jun 2014 13:50:57 -0400 (EDT)
Message-ID: <alpine.LFD.2.11.1406241347070.16842@knanqh.ubzr>
References: <1403583071-5650-1-git-send-email-nicolas.pitre@linaro.org> <1403583071-5650-4-git-send-email-nicolas.pitre@linaro.org> <CAD=FV=W2KK1XPQiHnxzdBs8fXxsnsuggZg_hJU0zyHcvHt3Khw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qa0-f53.google.com ([209.85.216.53]:64787 "EHLO
	mail-qa0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753521AbaFXRvA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 24 Jun 2014 13:51:00 -0400
Received: by mail-qa0-f53.google.com with SMTP id j15so540951qaq.26
        for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Jun 2014 10:50:59 -0700 (PDT)
In-Reply-To: <CAD=FV=W2KK1XPQiHnxzdBs8fXxsnsuggZg_hJU0zyHcvHt3Khw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Doug Anderson <dianders@google.com>
Cc: Abhilash Kesavan <kesavan.abhilash@gmail.com>, Andrew Bresticker <abrestic@chromium.org>, Kevin Hilman <khilman@linaro.org>, Olof Johansson <olof@lixom.net>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Lists linaro-kernel <linaro-kernel@lists.linaro.org>

On Tue, 24 Jun 2014, Doug Anderson wrote:

> Thank you very much for posting!  With your series I'm able to boot
> all 8 cores on exynos5420-peach-pit and exynos5800-peach-pi sitting on
> my desk.
> 
> Tested-by: Doug Anderson <dianders@chromium.org>

Thanks to all.  I've submitted those patches, with minor nits fixed, to 
RMK's system as patches 8081 to 8083.


Nicolas
