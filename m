From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH 0/6] Add device tree support for PL330 dma controller driver
Date: Mon, 5 Sep 2011 15:46:55 +0530
Message-ID: <CAJuYYwR65Y4V2S4Moz1rw=EJV44kky96K+Dqd7VwP_JvK9YDsg@mail.gmail.com>
References: <1314348014-2481-1-git-send-email-thomas.abraham@linaro.org>
	<1314638947.1606.157.camel@vkoul-udesk3>
	<001a01cc6b8b$21708470$64518d50$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-gy0-f174.google.com ([209.85.160.174]:37479 "EHLO
	mail-gy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751871Ab1IEKQ4 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 5 Sep 2011 06:16:56 -0400
Received: by gya6 with SMTP id 6so3081319gya.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 05 Sep 2011 03:16:56 -0700 (PDT)
In-Reply-To: <001a01cc6b8b$21708470$64518d50$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Vinod Koul <vinod.koul@linux.intel.com>, devicetree-discuss@lists.ozlabs.org, boojin.kim@samsung.com, patches@linaro.org, jassisinghbrar@gmail.com, grant.likely@secretlab.ca, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Dear Mr. Kim,

On 5 September 2011 10:47, Kukjin Kim <kgene.kim@samsung.com> wrote:
> Vinod Koul wrote:
>>
>> On Fri, 2011-08-26 at 14:10 +0530, Thomas Abraham wrote:
>> > This patchset adds device tree support for PL330 driver and uses i=
t
>> > to add device tree support for Samsung platforms, specifically Exy=
nos4.
>> The DMA patches looks good to me. Do you want this to go thru slave-=
dma
>> tree or somewhere else.
>> I will need acks on 3, 5 and 6th patch to carry them.
>>
>
> Looks good to me on 3 and 5th patch, I think, 6th patch is needed to =
update, please refer to my comments on there.
>
> Acked-by: Kukjin Kim <kgene.kim@samsung.com>
>
> As you know, Boojin Kim submitted 8th patch last Friday. So would be =
nice to me if you could rebase Thomas' patch based on her updated patch=
 set and apply all series into your slave-dma.git samsung_dma branch I =
think it=92s easy because v8 changes are small then I will merge it int=
o my -next to prevent useless conflicts.
>

I will test the pl330 device tree patches with Boonjin's pl330 driver
update patches and resubmit if there are any changes. Thank you for
your ack.

Thanks,
Thomas.

> If any problems, please let me know.
>
> Thanks.
>
> Best regards,
> Kgene.
> --
> Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
> SW Solution Development Team, Samsung Electronics Co., Ltd.
>
>
