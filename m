From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v9 2/2] ARM: dts: add TOPEET itop elite based board
Date: Tue, 18 Oct 2016 20:57:18 +0300
Message-ID: <CAJKOXPdBfp6ot16PCN9fmx3KYrt1DHK7Ong9OBZ_P+y4rD1bWg@mail.gmail.com>
References: <devicetree@vger.kernel.org> <1476811129-4450-1-git-send-email-ayaka@soulik.info>
 <1476811129-4450-3-git-send-email-ayaka@soulik.info> <20161018173748.GB30003@kozik-lap>
 <20161018174732.GC30003@kozik-lap>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:48282 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S965273AbcJRR5W (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 18 Oct 2016 13:57:22 -0400
In-Reply-To: <20161018174732.GC30003@kozik-lap>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Randy Li <ayaka@soulik.info>, devicetree@vger.kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, kgene@kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, robh@kernel.org

On Tue, Oct 18, 2016 at 8:47 PM, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On Tue, Oct 18, 2016 at 08:37:48PM +0300, Krzysztof Kozlowski wrote:
>> On Wed, Oct 19, 2016 at 01:18:49AM +0800, Randy Li wrote:
>> > The TOPEET itop exynos 4412 have three versions base board. The
>> > Elite version is the cheap one without too much peripheral devices
>> > on it.
>> >
>> > Currently supported are serial console, wired networking(USB),
>> > USB OTG in peripheral mode, USB host, SD storage, GPIO buttons,
>> > PWM beeper, ADC and LEDs. The WM8960 analog audio codec is also
>> > enabled.
>> >
>> > The FIMC is not used for camera currently, I enabled it just for a
>> > colorspace converter.
>> >
>> > Signed-off-by: Randy Li <ayaka@soulik.info>
>> > Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
>>
>> Thanks, applied, with missing Rob's ack, minor changes in commit msg and
>> fix in pin function (you used macro for pull up/down instead of
>> function).
>
> I also changed your name in commit message from "ayaka" to "Randy Li".
> The author of a patch (equal to "From:" in email) should match the
> Signed-off-by. For the future, please fix your gitconfig and/or mail
> transfer program.

Ahhh, it is not your fault but patchwork's. Damn it. Patchwork stores
the first username he encounters and uses it further even if From is
different.

I will send an email to kernel.org Patchwork admin about this.

Best regards,
Krzysztof
