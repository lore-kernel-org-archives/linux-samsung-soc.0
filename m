From: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH] ARM: s3c64xx: don't select ARM_AMBA from S3C64XX_PL080
Date: Thu, 1 Jun 2017 08:47:00 -0600
Message-ID: <CANLsYkyWcewDY33ffb0BZ7d=_CS8CYiG0EjLN0JgDUp2pDVzcQ@mail.gmail.com>
References: <20170524155845.1778223-1-arnd@arndb.de> <20170531195849.GD27796@n2100.armlinux.org.uk>
 <CAK8P3a3gxrkn1TOLWXzW4-s8H8uJWvC1vC3_fjxm-tXXkooxUA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lf0-f49.google.com ([209.85.215.49]:35027 "EHLO
        mail-lf0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751108AbdFAOrD (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 1 Jun 2017 10:47:03 -0400
Received: by mail-lf0-f49.google.com with SMTP id c184so23661509lfe.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 01 Jun 2017 07:47:02 -0700 (PDT)
In-Reply-To: <CAK8P3a3gxrkn1TOLWXzW4-s8H8uJWvC1vC3_fjxm-tXXkooxUA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Russell King - ARM Linux <linux@armlinux.org.uk>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Eric Anholt <eric@anholt.net>, "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On 31 May 2017 at 14:25, Arnd Bergmann <arnd@arndb.de> wrote:
> On Wed, May 31, 2017 at 9:58 PM, Russell King - ARM Linux
> <linux@armlinux.org.uk> wrote:
>> On Wed, May 24, 2017 at 05:58:34PM +0200, Arnd Bergmann wrote:
>> Yes, selecting ARM_AMBA from drivers is definitely not right; this
>> symbol should be selected only by platforms that want AMBA primecell
>> bus support, not by drivers, precisely because of these dependency
>> issues.
>>
>> There's another case where ARM_AMBA is selected that probably needs
>> fixing - the coresight hwtracing code.
>
> [Adding Mathieu to cc]
>
> Mathieu,
>
> do you remember how we ended up with this?

That was part of the initial driver submission that happened a couple
of years ago.  The driver depended on AMBA and as such I added the
"select", not knowing it was preferable to have a "depends".

>
> menuconfig CORESIGHT
>        bool "CoreSight Tracing Support"
>        select ARM_AMBA
>
> As Russell says, probably shouldn't select that symbol, most likely
> we want either the individual drivers that register an amba_driver to have
> a 'depends on ARM_AMBA' or alternatively replace the 'select' with 'depends
> on' for the entire subsystem.

I'm good with that.

Mathieu

>
>         Arnd
