From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH 0/4] Add support for Exynos5800 SoC
Date: Mon, 21 Apr 2014 07:07:02 -0700
Message-ID: <CAOesGMi-ewBVQEq74fwfAf8rhwJ5QZ1xDpf3yF1QsygmKiygag@mail.gmail.com>
References: <1398062712-28602-1-git-send-email-arun.kk@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qc0-f177.google.com ([209.85.216.177]:50203 "EHLO
	mail-qc0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751136AbaDUOHD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 21 Apr 2014 10:07:03 -0400
Received: by mail-qc0-f177.google.com with SMTP id w7so3991353qcr.36
        for <linux-samsung-soc@vger.kernel.org>; Mon, 21 Apr 2014 07:07:02 -0700 (PDT)
In-Reply-To: <1398062712-28602-1-git-send-email-arun.kk@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arun Kumar K <arun.kk@samsung.com>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Doug Anderson <dianders@chromium.org>, Alim Akhtar <alim.akhtar@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Olof Johansson <olofj@google.com>, Arun Kumar <arunkk.samsung@gmail.com>

[from the right account and without html formatting this time]


On Sun, Apr 20, 2014 at 11:45 PM, Arun Kumar K <arun.kk@samsung.com> wrote:
> Exynos5800 is a derivative of Exynos5420 with higher
> clock speeds and most other IP blocks remaining the same
> except for a few.
> Due to the similarities with 5420, following is done to
> achieve maximum code re-use:
> - Use the same 5420 clock file with few changes for adding
>   extra 5800 clocks.
> - Re-use the 5420 dtsi by renaming it to exynos5-octa.


Nack, this is a bad idea. You're not converting over 5410, which is
also marketed as an exynos octa chip. There's definitely no guarantee
that future octa-core chips will fit into this naming scheme either.

Just call it 5422 like you did in the Chrome OS code base. It is after
all the product name that is fused in as chip id on these parts, and
all the other naming falls out much better from that.

No more soc_is_5420 || soc_is_5800, since you can add a soc_is_542x. Etc.


-Olof
