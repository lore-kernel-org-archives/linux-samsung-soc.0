From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] ARM: multi_v7_defconfig: Enable USB3503 driver
Date: Thu, 28 Sep 2017 14:22:03 +0200
Message-ID: <CAJKOXPeN+Rtseaz+szF6-QFqq2kRYPVEwy+t8NTqO6VyefUiJg@mail.gmail.com>
References: <20170928024022.2071-1-linus.luessing@c0d3.blue>
 <CAJKOXPfQ3nXHVYXUn0iDfzVQc+ML1sSCz3NG_bwUw=WDK0id_w@mail.gmail.com> <20170928104351.GE6726@otheros>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:42060 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752580AbdI1MWG (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 28 Sep 2017 08:22:06 -0400
In-Reply-To: <20170928104351.GE6726@otheros>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?Q?Linus_L=C3=BCssing?= <linus.luessing@c0d3.blue>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, Russell King <linux@armlinux.org.uk>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

On Thu, Sep 28, 2017 at 12:43 PM, Linus Lüssing
<linus.luessing@c0d3.blue> wrote:
> Hi Krzysztof,
>
> Thanks for your quick reply!
>
> On Thu, Sep 28, 2017 at 08:21:26AM +0200, Krzysztof Kozlowski wrote:
>> [...]
>> Anyway please define this as a module (unless it can't... but it
>> worked in my case).
>
> In that case you used an initrd, right? I see various cases of USB
> built-ins, like CONFIG_USB_STORAGE=y, CONFIG_USB_DWC2=y and so on in
> multi_v7_defconfig. So my impression was that multi_v7_defconfig was
> supposed to allow booting a rootfs from a USB storage device even
> without an initrd.

We use modules for multi_v7 as much as possible with that exception as
fair as I remember - no need of initramfs/initrd for boots. If this is
your intention, please mention this in commit message ("using usb3503
as builtin to provide boot from USB without initrd/initramfs").

Best regards,
Krzysztof
