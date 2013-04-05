From: Lars-Peter Clausen <lars@metafoo.de>
Subject: Re: [RFC: PATCH 2/2] iio: adc: exynos_adc: Handle timeout and race
 conditions
Date: Fri, 05 Apr 2013 18:38:36 +0200
Message-ID: <515EFE0C.2030401@metafoo.de>
References: <1363364801-23684-1-git-send-email-ch.naveen@samsung.com> <51439846.9090201@metafoo.de> <CAD=FV=V+-DwCjGoookySCazazBBYOoRO+=G5Q_WXAw+SrXNc-A@mail.gmail.com> <5144849A.8050907@metafoo.de> <CAD=FV=VBYHyD6yXBrM1BV3gazDFT0oHgvJM0+5LU1w4AO16Yzg@mail.gmail.com> <515E90FD.10006@metafoo.de> <CAD=FV=XHKn_vqv7-rqpraJy_V2kyBfo98WdMsAJ5eXhADc_rmA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp-out-239.synserver.de ([212.40.185.239]:1077 "EHLO
	smtp-out-221.synserver.de" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1755664Ab3DEPjT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 5 Apr 2013 11:39:19 -0400
In-Reply-To: <CAD=FV=XHKn_vqv7-rqpraJy_V2kyBfo98WdMsAJ5eXhADc_rmA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Naveen Krishna Chatradhi <ch.naveen@samsung.com>, linux-iio <linux-iio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-samsung-soc@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Naveen Krishna <naveenkrishna.ch@gmail.com>

On 04/05/2013 04:56 PM, Doug Anderson wrote:
> Lars,
> 
> On Fri, Apr 5, 2013 at 1:53 AM, Lars-Peter Clausen <lars@metafoo.de> wrote:
>> Since we sleep inside the protected section we need to use a mutex.
> 
> Ah, good point.
> 
>> It's not the timeout case I'm worried about, but the case where the transfer
>> is interrupted by the user. Even though it is rather unlikely for the
>> problem to occur we should still try to avoid it, this is one of these
>> annoying heisenbugs that happen once in a while and nobody is able to
>> reproduce them.
> 
> Yes, of course.  Then we can also get extra confidence that the reset
> logic works well by stressing out this case...  :)
> 
> This makes me think, though.  Given how fast we expect the ADC
> transaction to finish, would there be any benefit to making the wait
> non-interruptible and then shortening the timeout a whole lot.  If we
> shortened to 1ms then we're really not "non-interruptible" for very
> long and there's less chance of subtle bugs in the way that reset
> works.

Yes, that could also work.

- Lars
