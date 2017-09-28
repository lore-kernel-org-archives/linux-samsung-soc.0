From: Linus =?utf-8?Q?L=C3=BCssing?= <linus.luessing@c0d3.blue>
Subject: Re: [PATCH] ARM: multi_v7_defconfig: Enable USB3503 driver
Date: Thu, 28 Sep 2017 12:43:51 +0200
Message-ID: <20170928104351.GE6726@otheros>
References: <20170928024022.2071-1-linus.luessing@c0d3.blue>
 <CAJKOXPfQ3nXHVYXUn0iDfzVQc+ML1sSCz3NG_bwUw=WDK0id_w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.aperture-lab.de ([138.201.29.205]:41730 "EHLO
        mail.aperture-lab.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751946AbdI1Knz (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 28 Sep 2017 06:43:55 -0400
Content-Disposition: inline
In-Reply-To: <CAJKOXPfQ3nXHVYXUn0iDfzVQc+ML1sSCz3NG_bwUw=WDK0id_w@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, Russell King <linux@armlinux.org.uk>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

Hi Krzysztof,

Thanks for your quick reply!

On Thu, Sep 28, 2017 at 08:21:26AM +0200, Krzysztof Kozlowski wrote:
> [...]
> Anyway please define this as a module (unless it can't... but it
> worked in my case).

In that case you used an initrd, right? I see various cases of USB
built-ins, like CONFIG_USB_STORAGE=y, CONFIG_USB_DWC2=y and so on in
multi_v7_defconfig. So my impression was that multi_v7_defconfig was
supposed to allow booting a rootfs from a USB storage device even
without an initrd.

Let me know if that impression is wrong though, I'll happily resend
(and test) the patch with CONFIG_USB_HSIC_USB3503=m then :-).

Regards, Linus
