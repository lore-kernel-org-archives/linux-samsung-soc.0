From: Felipe Balbi <balbi@kernel.org>
Subject: Re: USB 3.0 is broken on Odroid Xu4 on latest kernel
Date: Wed, 19 Jul 2017 21:13:29 +0300
Message-ID: <87zic0b8hi.fsf@linux.intel.com>
References: <CANAwSgSoo7g=RN4wQ96+NJRYZYy2WeHwPA-xJ2JY7yt25irDfA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mga05.intel.com ([192.55.52.43]:4407 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754554AbdGSSNl (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 19 Jul 2017 14:13:41 -0400
In-Reply-To: <CANAwSgSoo7g=RN4wQ96+NJRYZYy2WeHwPA-xJ2JY7yt25irDfA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Anand Moon <linux.amoon@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Linux USB Mailing List <linux-usb@vger.kernel.org>


Hi,

Anand Moon <linux.amoon@gmail.com> writes:
> Hi Krzysztof,
>
> Today I tried to compile the latest kernel for Odroid xu4.
> using exynos_defconfig I build and loaded the kernel.
> but to my surprise usb 3.0 device and missing.
>
> odroid login: root
> Password:
> Last login: Wed Jul 19 14:01:44 UTC 2017 on ttySAC2
> Welcome to Ubuntu 16.04.2 LTS (GNU/Linux 4.13.0-rc1-xu4ml-27846-g74cbd96 armv7l)

Dude, you have 27 thousand patches on top of v4.13-rc1??? Try vanilla
v4.13-rc1 and try a git bisect.

-- 
balbi
