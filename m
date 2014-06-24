From: Kevin Hilman <khilman@linaro.org>
Subject: Re: [PATCH 0/3] MCPM: clarify boot CPU situation wrt CCI
Date: Tue, 24 Jun 2014 08:35:51 -0700
Message-ID: <7hd2dymiaw.fsf@paris.lan>
References: <1403583071-5650-1-git-send-email-nicolas.pitre@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f178.google.com ([209.85.192.178]:41119 "EHLO
	mail-pd0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754619AbaFXPfy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 24 Jun 2014 11:35:54 -0400
Received: by mail-pd0-f178.google.com with SMTP id r10so381394pdi.37
        for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Jun 2014 08:35:53 -0700 (PDT)
In-Reply-To: <1403583071-5650-1-git-send-email-nicolas.pitre@linaro.org>
	(Nicolas Pitre's message of "Tue, 24 Jun 2014 00:11:08 -0400")
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: Abhilash Kesavan <kesavan.abhilash@gmail.com>, Doug Anderson <dianders@google.com>, Andrew Bresticker <abrestic@chromium.org>, Olof Johansson <olof@lixom.net>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linaro-kernel@lists.linaro.org

Nicolas Pitre <nicolas.pitre@linaro.org> writes:

> For the background story, please see:
>
> http://news.gmane.org/group/gmane.linux.kernel.samsung-soc/thread=32807
>
> I sat on those patches for a while but they are the best I could think of
> in terms of implementation.  To ease merging I suggest I collect all the
> ACK's and Tested-by's and submit them all at once to RMK's patch system.

Reviewed-by: Kevin Hilman <khilman@linaro.org>
Tested-by: Kevin Hilman <khilman@linaro.org>

I tested this series on Exynos5 Peach Pi (a.k.a. 13" ARM Chromebook 2)
and verified all 8 cores are booting up.

Kevin

P.S. FYI for anyone else wanting to try this on peach-pi, I still need a
couple other out of tree clock related patches in order to boot fully.
Until the final versions are merged, I'm using these:

- Doug's aclk66 clock removal for earlyprintk support
  http://lists.infradead.org/pipermail/linux-arm-kernel/2014-June/262225.html
- Leave mau_epll enabled
  http://lists.infradead.org/pipermail/linux-arm-kernel/2014-June/262259.html
