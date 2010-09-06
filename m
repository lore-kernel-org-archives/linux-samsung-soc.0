From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH 3/4] ARM: S5PC110: add common FIMC setup code
Date: Mon, 6 Sep 2010 20:28:50 +0900
Message-ID: <AANLkTimdpng4BysDfio96KeL2WfRCuoWbUc6G5oUS7Lh@mail.gmail.com>
References: <1283745044-15514-1-git-send-email-m.szyprowski@samsung.com>
	<1283745044-15514-4-git-send-email-m.szyprowski@samsung.com>
	<AANLkTinhbmKX5gs4TPZwVUX0WSEQ5RLN+_gHAqXsTj1b@mail.gmail.com>
	<4C84AA6D.10509@samsung.com>
	<AANLkTikakB1Y6N-UT2Hx+PHfdyticHxCFQzs=uc7KWNc@mail.gmail.com>
	<4C84C0BE.3050305@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:55448 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753012Ab0IFL2w (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 6 Sep 2010 07:28:52 -0400
Received: by wyf22 with SMTP id 22so2830214wyf.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 06 Sep 2010 04:28:50 -0700 (PDT)
In-Reply-To: <4C84C0BE.3050305@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kyungmin.park@samsung.com, kgene.kim@samsung.com, ben-linux@fluff.org

On Mon, Sep 6, 2010 at 7:21 PM, Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
> Hello,
>
> On 2010-09-06 18:17, Jassi Brar wrote:
>
>>> I'm thinking of making the parent clock an argument to the
>>> s5pv210_fimc_setup_clks().
>>
>> Yes, that's better since the relevant clock is managed by the CMU
>
> What do you mean by the CMU? This function is intended to be called from
> board startup code.
Clock-Management-Unit block of the SoC.

>>> I really don't like the idea of passing clock name through the platform
>>> data
>>> and letting driver to mess with clock's parents.
>>
>> In case of SPI the clock mux and scalar is present _within_ the SPI
>> controller and having to touch SPI regs from outside the driver isn't
>> what I prefer.
>
> I know. It is the same case as with SDHCI and UART controllers. I have an
> idea how to solve this in a bit more cleaner way. I hope to post a
> proposition soon.
I'll be waiting.


>>> Machine startup code is the
>>> last place where such things should be changed.
>>
>> Until I am enlightened, I'd like to think otherwise.
>> I think the board designer would already have thought out the clock
>> sourcing
>> hierarchy. Setting appropriate parents once at boot-time and having
>> drivers
>> not worry about it, should be better.
>
> Definitely, but in our case kernel the default fimc_sclk parent points to
> non-existing clock.
You mean the default value in mux field of some CMU register points to
absent source
of clock on the board?
Yes, that's why it's machine specific and should be setup by the board
init code.
Rather we should never count upon defaults and always set parents explicitly.
