From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH 3/4] ARM: dts: Add 5800 dt files
Date: Mon, 21 Apr 2014 07:28:52 -0700
Message-ID: <CAOesGMgc3geQPZe_YB=N=WSLzss8a-5p8Mh0NsEMAjpCepwzqQ@mail.gmail.com>
References: <1398062712-28602-1-git-send-email-arun.kk@samsung.com>
	<1398062712-28602-4-git-send-email-arun.kk@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qg0-f46.google.com ([209.85.192.46]:48346 "EHLO
	mail-qg0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751073AbaDUO2x (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 21 Apr 2014 10:28:53 -0400
Received: by mail-qg0-f46.google.com with SMTP id j107so661130qga.33
        for <linux-samsung-soc@vger.kernel.org>; Mon, 21 Apr 2014 07:28:52 -0700 (PDT)
In-Reply-To: <1398062712-28602-4-git-send-email-arun.kk@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arun Kumar K <arun.kk@samsung.com>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Doug Anderson <dianders@chromium.org>, Alim Akhtar <alim.akhtar@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Olof Johansson <olofj@google.com>, Arun Kumar <arunkk.samsung@gmail.com>

On Sun, Apr 20, 2014 at 11:45 PM, Arun Kumar K <arun.kk@samsung.com> wrote:
> Most of the nodes of exynos5420 remains same for exynos5800.
> So moving the common dt nodes to exynos5-octa.dtsi.
> The pinctrl dtsi is completely re-used and is renamed to
> exynos5-octa-pinctrl.dtsi.

Again, naming here doesn't work.

Also, if all you need to revise are a few properties, then you should
just include 5420.dtsi in the 5422.dtsi file, and override, instead of
adding another layer of indireciton.

The multiple layers of includes and modifications makes it very hard
to figure out where to find a specific definition for a platform, and
I don't think we should encourage more use of it.


-Olof
