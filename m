From: Dylan Reid <dgreid@chromium.org>
Subject: Re: [PATCH 1/3] dmaengine: pl330: Set residue in tx_status callback.
Date: Wed, 9 Oct 2013 13:37:56 -0700
Message-ID: <CAEUnVG7Xn8+Xhnr2y5-RM6FJTQsjRrJ9g1JWf4o+6B-BtWHbPA@mail.gmail.com>
References: <1378879685-5352-1-git-send-email-padma.v@samsung.com>
 <1378879685-5352-2-git-send-email-padma.v@samsung.com> <00b401ceafac$e3a88170$aaf98450$@samsung.com>
 <CAEUnVG72uTzHrQCoVtdT8UmkPcz2ks_qWT8QMbhHjUW-u3WnNQ@mail.gmail.com>
 <026501cec2fe$1387c630$3a975290$@samsung.com> <20131007034846.GG2954@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qe0-f49.google.com ([209.85.128.49]:60991 "EHLO
	mail-qe0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753965Ab3JIUiR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 9 Oct 2013 16:38:17 -0400
Received: by mail-qe0-f49.google.com with SMTP id ff1so847949qeb.8
        for <linux-samsung-soc@vger.kernel.org>; Wed, 09 Oct 2013 13:38:16 -0700 (PDT)
In-Reply-To: <20131007034846.GG2954@intel.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vinod Koul <vinod.koul@intel.com>
Cc: Chanho Park <chanho61.park@samsung.com>, Padmavathi Venna <padma.v@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Padma Venkat <padma.kvr@gmail.com>, kgene.kim@samsung.com, Arnd Bergmann <arnd@arndb.de>, Sangbeom Kim <sbkim73@samsung.com>, Mark Brown <broonie@kernel.org>, Olof Johansson <olofj@chromium.org>

On Sun, Oct 6, 2013 at 8:48 PM, Vinod Koul <vinod.koul@intel.com> wrote:
> On Mon, Oct 07, 2013 at 10:39:34AM +0900, Chanho Park wrote:
>> > > Why didn't you use a cookie value to track the request?
>> > > The cookie is assigned when each transfer is submitted.
>> > > If you save the value in the desc, we can find the request easily.
>> >
>> > If there are several cyclic desc in the work list, is there a better way
>> > to find the "current" one?  The chan struct tracks the last completed and
>> > last submitted cookies, but these will be the first and last
>> > respectively as long as the cyclic transfer is active.  Is there an
>> > "active" cookie stored somewhere that I missed?
>>
>> Assume there are three cookies. If you want to get the second cookie not
>> latest cookie, your way can be also correct in such case?
>> I think tx_status API is to get dma status of the given cookie.
>> You are only considering a cyclic case.
> For cyclic case you would have possible same descriptor running till you
> terminate.

The cyclic case that makes this interesting is when there are multiple
cyclic descriptors in the list. The cookie and completed_cookie
markers don't help to determine which of the descriptors in the list
is currently active.  dma_cookie_complete isn't called for a cyclic
desc, the desc is just pushed to the end of the list.

>
> For non cyclic, if you have 3 descriptors submitted, the cookie value can be, say
> 7, 8 and 9. If you query the status of any descriptor and pass the last optional
> txstate arg then you will know the last cookie completed. so if txstate->last is
> 7, then 7th was completed and 8 should be running and 9 in queue!

Got it, but the correct desc for cookie 8 will still have to be
searched for, correct?

Thanks for the advise.

Dylan

>> > Looking for the first buffer with status == BUSY is an improvement I'll
>> > make.  Any way to avoid looking through the list?
> Its already there :)
>
> --
> ~Vinod
