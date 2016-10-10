From: Anand Moon <linux.amoon@gmail.com>
Subject: Re: [PATCH 1/2] host: ehci-exynos: Convert to use the SET_SYSTEM_SLEEP_PM_OPS
Date: Mon, 10 Oct 2016 19:46:10 +0530
Message-ID: <CANAwSgTfnjmyHJv+MTr1ukcwjb8cu73564kFqb2u=5xtX-r7Tw@mail.gmail.com>
References: <20161009163446.GA9672@kozik-lap> <Pine.LNX.4.44L0.1610091713490.1734-100000@netrider.rowland.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oi0-f66.google.com ([209.85.218.66]:36840 "EHLO
        mail-oi0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752789AbcJJOQb (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 10 Oct 2016 10:16:31 -0400
In-Reply-To: <Pine.LNX.4.44L0.1610091713490.1734-100000@netrider.rowland.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kukjin Kim <kgene@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Linux USB Mailing List <linux-usb@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>

hi Alan/Krzysztof,

On 10 October 2016 at 02:47, Alan Stern <stern@rowland.harvard.edu> wrote:
> On Sun, 9 Oct 2016, Krzysztof Kozlowski wrote:
>
>> On Sun, Oct 09, 2016 at 02:34:14PM +0000, Anand Moon wrote:
>> > Move the ehci-exynos system PM callbacks within #ifdef CONFIG_PM_SLEEP
>> > as to avoid them being build when not used. This also allows us to use the
>> > SET_SYSTEM_SLEEP_PM_OPS macro which simplifies the code.
>> >
>> > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
>> > ---
>> >  drivers/usb/host/ehci-exynos.c | 14 ++++++--------
>> >  1 file changed, 6 insertions(+), 8 deletions(-)
>> >
>> > diff --git a/drivers/usb/host/ehci-exynos.c b/drivers/usb/host/ehci-exynos.c
>> > index 42e5b66..1899900 100644
>> > --- a/drivers/usb/host/ehci-exynos.c
>> > +++ b/drivers/usb/host/ehci-exynos.c
>> > @@ -251,7 +251,7 @@ static int exynos_ehci_remove(struct platform_device *pdev)
>> >     return 0;
>> >  }
>> >
>> > -#ifdef CONFIG_PM
>> > +#ifdef CONFIG_PM_SLEEP
>>
>> Does not look like an equivalent change. How will it behave in a config
>> with !SUSPEND && !HIBERNATE && PM?
>
> It's hard to say what Anand originally had in mind.  To me, it looks
> like it will behave exactly the same as before, the only difference
> being that the object image will not contain unused exynos_ehci_suspend
> and exynos_ehci_resume routines.  And the compiler won't issue a
> warning at build time that the routines are unused.
>
> Alan Stern
>

Thanks for looking into this closely.

I will just send one line changes to use SET_SYSTEM_SLEEP_PM_OPS
with better commit logs, if you people agree with this.

Best Regards
-Anand Moon
