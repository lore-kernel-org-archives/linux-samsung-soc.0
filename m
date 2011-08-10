From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [RFC][PATCH 2/2] spi: s3c64xx: Use clkdev for bus clock lookup
Date: Wed, 10 Aug 2011 19:06:48 +0530
Message-ID: <CABb+yY1tCBK3Hywi_7TuBCc830BP7+C2GRoQxeKWU5OHXenjRA@mail.gmail.com>
References: <1312898301-7229-1-git-send-email-padma.v@samsung.com>
	<CABb+yY1Be3q+5QVaLYnonOUq1VtjyCZMKp0S1yryjF2HRyqoSw@mail.gmail.com>
	<CAAgF-Bf=K8M9Qp8EwFTuUY06H4SPNY5cW2Ct3K9FecMLvBHmuA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:34829 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750826Ab1HJNgu convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 10 Aug 2011 09:36:50 -0400
In-Reply-To: <CAAgF-Bf=K8M9Qp8EwFTuUY06H4SPNY5cW2Ct3K9FecMLvBHmuA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: padma venkat <padma.kvr@gmail.com>
Cc: Padmavathi Venna <padma.v@samsung.com>, kgene.kim@samsung.com, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, grant.likely@secretlab.ca

On Wed, Aug 10, 2011 at 5:33 PM, padma venkat <padma.kvr@gmail.com> wro=
te:
> Hi Jassi,
>
> On Tue, Aug 9, 2011 at 6:13 PM, Jassi Brar <jassisinghbrar@gmail.com>=
 wrote:
>> On Tue, Aug 9, 2011 at 7:28 PM, Padmavathi Venna <padma.v@samsung.co=
m> wrote:
>>> SPI driver is modified to lookup the bus clock using the
>>> alias name instead of getting clock name and clock
>>> number from platform data.
>> Cool.
>>
>>> Driver is modified to get the best source clock among the
>>> available source clocks for the required frequency.
>> I am not sure if this driver should be deciding which clock is 'best=
' for it.
>> Because ...
>> 1) Usually it's the board designer who decides which clock to run at
>> =C2=A0what speed based upon target device. So ideally, based upon us=
e-case
>> the driver should simply get the 'best' clock from board via platfor=
m in a
>> format that is compliant to the 'generic clock api'.
> As per your comment I modified the code for board designer to supply =
the
> required list of source clocks. If this list is NULL then it =C2=A0us=
es the
> all available
> clock sources. I will resubmit this patch.
No dear. Not a list of clocks (that is property of the platform - not a=
 board).
But get just one 'generic clock api' compliant clock from the board and=
 use
it.
That will keep the driver simple for sure and IIUIC, in future anyways =
DT would
specify source clock for each peripheral. Grant ?
