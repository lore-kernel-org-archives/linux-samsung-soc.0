From: Tom Rini <trini@ti.com>
Subject: Re: [PATCH 3/3] ARM: dts: Add peach-pi board support
Date: Thu, 8 May 2014 18:16:52 -0400
Message-ID: <536C0254.8050108@ti.com>
References: <1399035821-25096-1-git-send-email-arun.kk@samsung.com>	<1399035821-25096-4-git-send-email-arun.kk@samsung.com>	<5363D176.80601@gmail.com>	<CAD=FV=XYjMg7V9=OzAy_ifwaM83QS0tiTrp5+nxvG236kkSjRQ@mail.gmail.com>	<53644DDB.7050503@gmail.com>	<CAD=FV=U_b_n=V_mEFYNPFZ1wyrgjjr5jEGrVb5TviP0Z33popg@mail.gmail.com>	<5367D5E1.9070709@ti.com> <CAJAp7Og6Bqnbq5b=Ki5vLaVkvSXxqsKaFaxCoqbX+fRkgouh=A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bear.ext.ti.com ([192.94.94.41]:47784 "EHLO bear.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932095AbaEHWQ7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 8 May 2014 18:16:59 -0400
In-Reply-To: <CAJAp7Og6Bqnbq5b=Ki5vLaVkvSXxqsKaFaxCoqbX+fRkgouh=A@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Bjorn Andersson <bjorn@kryo.se>
Cc: Doug Anderson <dianders@chromium.org>, Tomasz Figa <tomasz.figa@gmail.com>, Arun Kumar K <arun.kk@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Olof Johansson <olofj@google.com>, Tomasz Figa <t.figa@samsung.com>, Sachin Kamat <sachin.kamat@linaro.org>, Tushar Behera <tushar.behera@linaro.org>, Arun Kumar <arunkk.samsung@gmail.com>

On 05/08/2014 05:55 PM, Bjorn Andersson wrote:
> On Mon, May 5, 2014 at 11:18 AM, Tom Rini <trini@ti.com> wrote:
> [...]
>> The problem I was raising at the ELC BoF is that today we can't just
>> stop overwriting values in the non-zero case as many boards lie about
>> their memory size, in non-zero ways, but no one noticed as they only
>> tested with U-Boot which was performing the fixup.
> 
> So, should we conclude are we stuck being bug-compatible forever?
> 
> I was hoping to add this logic to the kernel by [1], but of course
> this won't fly
> based on the argument you highlighted (as was pointed out by Uwe).
> 
> [1] https://lkml.org/lkml/2014/5/7/28

Well, device tree should always win and once passed to the kernel, be
correct.  If you have control of the kernel but not bootloader, like Uwe
says, drop the ATAG support.

-- 
Tom
