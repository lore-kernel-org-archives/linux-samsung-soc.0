From: Jassi Brar <jaswinder.singh@linaro.org>
Subject: Re: [PATCH v8 04/16] DMA: PL330: Remove the start operation for
 handling DMA_TERMINATE_ALL command
Date: Tue, 6 Sep 2011 18:10:05 +0530
Message-ID: <CAJe_ZhfaYmgPFhU-KJ3Oj6jdPN0i584yzziSzQzd_6uNSXodHQ@mail.gmail.com>
References: <1314924284-25554-1-git-send-email-boojin.kim@samsung.com>
	<1314924284-25554-5-git-send-email-boojin.kim@samsung.com>
	<CABb+yY1QN9CzT=CGJ1n-pk8_QyeEK1Sx=HT2n8SMB9O-XrsXDg@mail.gmail.com>
	<20110906122718.GP6619@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:36283 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751956Ab1IFMkH convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 6 Sep 2011 08:40:07 -0400
Received: by iabu26 with SMTP id u26so7528669iab.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 06 Sep 2011 05:40:06 -0700 (PDT)
In-Reply-To: <20110906122718.GP6619@n2100.arm.linux.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Kukjin Kim <kgene.kim@samsung.com>, Boojin Kim <boojin.kim@samsung.com>, Vinod Koul <vinod.koul@intel.com>, Linus Walleij <linus.walleij@linaro.org>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Grant Likely <grant.likely@secretlab.ca>, linux-samsung-soc@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org

On 6 September 2011 17:57, Russell King - ARM Linux
<linux@arm.linux.org.uk> wrote:
> On Tue, Sep 06, 2011 at 05:52:19PM +0530, Jassi Brar wrote:
>> On Fri, Sep 2, 2011 at 6:14 AM, Boojin Kim <boojin.kim@samsung.com> =
wrote:
>> > Origianl code carries out the start operation after flush operatio=
n.
>> > But start operation is not required for DMA_TERMINATE_ALL command.
>> > So, This patch removes the unnecessary start operation and only ca=
rries out
>> > the flush oeration for handling DMA_TERMINATE_ALL command.
>>
>> Not exactly. The 'start' is impotent when called from this path beca=
use there
>> is nothing left queued after the call to 'flush'.
>> pl330_tasklet() is called because that is a common function that doe=
s the
>> house-keeping acc to what's presently in 'work' and 'done' lists.
>>
>> Though as a side-effect, your patch does avoid doing callbacks on su=
bmitted
>> xfers during DMA_TERMINATE_ALL - which may or may not be the right t=
hing
>> to do.
>
> It is defined that DMA_TERMINATE_ALL does not call the callbacks:
>
> 1. int dmaengine_terminate_all(struct dma_chan *chan)
>
> =A0 This causes all activity for the DMA channel to be stopped, and m=
ay
> =A0 discard data in the DMA FIFO which hasn't been fully transferred.
> =A0 No callback functions will be called for any incomplete transfers=
=2E
>
Ok, thanks for the info.

Boojin Kim, please re-write the changelog to state only preventing
callbacks during DMA_TERMINATE_ALL as the reason.
