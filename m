From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH] USB: ehci-s5p: Fix phy reset
Date: Wed, 13 Mar 2013 10:59:37 -0700
Message-ID: <CAD=FV=W331nkdJJhXrXe739o+-iBSzGAS6anu+C_mmix0MbAUg@mail.gmail.com>
References: <1363136988-3704-1-git-send-email-agraf@suse.de>
	<CAD=FV=UXaZvZJOZwAguwi=iyYO1iMSvt8fdEsDhr96pgMXDYSg@mail.gmail.com>
	<A763CC55-549D-4CCD-8EE8-2BCE17F84606@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lb0-f175.google.com ([209.85.217.175]:45017 "EHLO
	mail-lb0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933043Ab3CMR7j (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 13 Mar 2013 13:59:39 -0400
Received: by mail-lb0-f175.google.com with SMTP id n3so1182656lbo.34
        for <linux-samsung-soc@vger.kernel.org>; Wed, 13 Mar 2013 10:59:37 -0700 (PDT)
In-Reply-To: <A763CC55-549D-4CCD-8EE8-2BCE17F84606@suse.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Alexander Graf <agraf@suse.de>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org, dmueller@suse.de, Vivek Gautam <gautam.vivek@samsung.com>, Jingoo Han <jg1.han@samsung.com>, Alan Stern <stern@rowland.harvard.edu>, Kukjin Kim <kgene.kim@samsung.com>, Felipe Balbi <balbi@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Alexander,

On Wed, Mar 13, 2013 at 10:45 AM, Alexander Graf <agraf@suse.de> wrote:
>
>>> +       gpio_free(gpio);
>>
>> Freeing the gpio is a little on the iffy side since you actually care
>> about keeping the value.  Perhaps you can change this to
>> devm_gpio_request_one() and avoid the free?  I was about to submit a
>> patch to do just that (since otherwise you run into trouble if you
>> ever defer the probe) but then ran across your patch.
>
> I could also just return it when the function exits and only free it when we exit the probe function with a negative value. The reason I put it in here was that on probe deferral, the pin simply gets blocked.
>
> However, I could probably also just completely take the gpio_free() out of this patch and resubmit, as it should be pretty much unrelated. Then you can patch it properly.

Sure, if you want to resubmit without the gpio_free() I'll submit a
new patch atop yours with the change to devm and people can see if
they like it...
