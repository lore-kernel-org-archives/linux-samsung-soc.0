From: Doug Anderson <dianders@google.com>
Subject: Re: [PATCH 3/3] ARM: exynos: activate the CCI on boot CPU/cluster
 with the MCPM loopback
Date: Tue, 24 Jun 2014 09:15:51 -0700
Message-ID: <CAD=FV=W2KK1XPQiHnxzdBs8fXxsnsuggZg_hJU0zyHcvHt3Khw@mail.gmail.com>
References: <1403583071-5650-1-git-send-email-nicolas.pitre@linaro.org>
	<1403583071-5650-4-git-send-email-nicolas.pitre@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f178.google.com ([209.85.220.178]:33637 "EHLO
	mail-vc0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932140AbaFXQPw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 24 Jun 2014 12:15:52 -0400
Received: by mail-vc0-f178.google.com with SMTP id ij19so557165vcb.37
        for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Jun 2014 09:15:51 -0700 (PDT)
In-Reply-To: <1403583071-5650-4-git-send-email-nicolas.pitre@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: Abhilash Kesavan <kesavan.abhilash@gmail.com>, Andrew Bresticker <abrestic@chromium.org>, Kevin Hilman <khilman@linaro.org>, Olof Johansson <olof@lixom.net>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Lists linaro-kernel <linaro-kernel@lists.linaro.org>

Nicolas,

On Mon, Jun 23, 2014 at 9:11 PM, Nicolas Pitre <nicolas.pitre@linaro.org> wrote:
> The Chromebook firmware doesn't enable the CCI for the boot cpu, and
> arguably it shouldn't have to either. Let's have the kernel handle the
> CCI on its own for the boot CPU the same way it does it for secondary CPUs
> by using the MCPM loopback.
>
> Signed-off-by: Nicolas Pitre <nico@linaro.org>
> ---
>  arch/arm/mach-exynos/mcpm-exynos.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)

Thank you very much for posting!  With your series I'm able to boot
all 8 cores on exynos5420-peach-pit and exynos5800-peach-pi sitting on
my desk.

Tested-by: Doug Anderson <dianders@chromium.org>
