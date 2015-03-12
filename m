From: Jassi Brar <jaswinder.singh@linaro.org>
Subject: Re: [PATCH] dmaengine: pl330: Set residue in tx_status callback
Date: Thu, 12 Mar 2015 14:17:25 +0530
Message-ID: <CAJe_Zhe5AXnaSvPqiEBD11EY_fkp8Rw6jBNoy8korsSnm+gVTw@mail.gmail.com>
References: <1416995095-13763-1-git-send-email-padma.v@samsung.com>
	<CAAgF-BfpU72KTJjVd8jWStD8yJ5sSmXOiQm77xQunO2QhC9ExQ@mail.gmail.com>
	<547DF61D.3010909@metafoo.de>
	<CAAgF-BfPyaOhhrA5L8vm2WDnhBYDexJFkGxqL1GsL2TMB8z=Rw@mail.gmail.com>
	<CAJe_Zhd2-vBgAoJsBt7JCOYDuTZrBCScSZ1HaNO3gNTZ-P6A9A@mail.gmail.com>
	<20141205151843.GV11285@n2100.arm.linux.org.uk>
	<CAJe_ZhfDsfehCXHB6pCuQ6672kXBYFxh687cZT1qaSCOyLy76g@mail.gmail.com>
	<20141208130727.GK16827@intel.com>
	<CAJe_ZhfKFdrV8=oMiH0hJeOmGAmPNbZ7rUXsqN+Ak7PvOnZEmA@mail.gmail.com>
	<20141211044758.GH16827@intel.com>
	<CAJe_ZhdeTp3RAm-QQu04XVF-oOppV2zx8_7G7MOTF+ziqzbvCQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qc0-f177.google.com ([209.85.216.177]:36100 "EHLO
	mail-qc0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751247AbbCLIr0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 12 Mar 2015 04:47:26 -0400
Received: by qcxm20 with SMTP id m20so16714320qcx.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 12 Mar 2015 01:47:25 -0700 (PDT)
In-Reply-To: <CAJe_ZhdeTp3RAm-QQu04XVF-oOppV2zx8_7G7MOTF+ziqzbvCQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vinod Koul <vinod.koul@intel.com>
Cc: Russell King - ARM Linux <linux@arm.linux.org.uk>, Padma Venkat <padma.kvr@gmail.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Padmavathi Venna <padma.v@samsung.com>, Mark Brown <broonie@kernel.org>, dmaengine@vger.kernel.org, Dylan Reid <dgreid@chromium.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

Hi Vinod, Hi Russell,

On 11 December 2014 at 11:42, Jassi Brar <jaswinder.singh@linaro.org> wrote:
> On 11 December 2014 at 10:17, Vinod Koul <vinod.koul@intel.com> wrote:
>> On Tue, Dec 09, 2014 at 08:48:04PM +0530, Jassi Brar wrote:
>>> As Russell pointed out, that ain't the case either.
>>> So we are yet to figure out benefits of having explicit
>>> issue_pending() after tx_submit().
>> callback ?
>>
> The callback is set after prep() and before tx_submit(), but here we
> talk after tx_submit().

Perhaps the idea dates back to async-only days, when client drivers
would prepare and queue descriptors in the controller driver rather
than having to manage the dependency queues themselves (?).

 Today ~95% clients are slave and I am yet to find one that really
can't work with submit and issue_pending tied together. Not to forget
the 100% of the controller drivers have to manage 'submitted' and
'active' queues -- only to have arguably negative side-effects.

If we agree that clubbing submit and issue_pending is the right thing
to do, I can start converting the ~90 client drivers. Please let me
know either way.

Cheers!
