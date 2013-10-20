From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH RESEND 0/3] ARM: S3C24XX: add missing dma-devices and
 warning fix
Date: Mon, 21 Oct 2013 05:27:20 +0900
Message-ID: <52643CA8.2020902@samsung.com>
References: <201310111059.19791.heiko@sntech.de> <20131013145642.GJ2954@intel.com> <201310132011.11285.heiko@sntech.de> <525DC274.8090808@samsung.com> <20131016020516.GT2954@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f44.google.com ([209.85.160.44]:54386 "EHLO
	mail-pb0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751654Ab3JTU12 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 20 Oct 2013 16:27:28 -0400
Received: by mail-pb0-f44.google.com with SMTP id xa7so6049112pbc.17
        for <linux-samsung-soc@vger.kernel.org>; Sun, 20 Oct 2013 13:27:27 -0700 (PDT)
In-Reply-To: <20131016020516.GT2954@intel.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vinod Koul <vinod.koul@intel.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>, Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org

On 10/16/13 11:05, Vinod Koul wrote:
> On Wed, Oct 16, 2013 at 07:32:20AM +0900, Kukjin Kim wrote:
>> On 10/14/13 03:11, Heiko St=FCbner wrote:
>>> Am Sonntag, 13. Oktober 2013, 16:56:42 schrieb Vinod Koul:
>>>> On Fri, Oct 11, 2013 at 10:59:19AM +0200, Heiko St=FCbner wrote:
>>>>> [I messed up the linux-arm-kernel list address yesterday, so I re=
send it
>>>>> with a fixed address, sorry for the noise]
>>>>>
>>>>> When Olof reported the warning about the unused s3c2410_dma_resou=
rce, I
>>>>> thought the best way forward would be to simply implement the mis=
sing
>>>>> pieces and so it has users :-) .
>>>>>
>>>>> Therefore this series adds the necessary platform-devices for s3c=
2410,
>>>>> s3c2440 and s3c2442. This especially also includes the
>>>>> channel-constraints of those socs.
>>>>>
>>>>> As I do not have access to any of those socs these changes are of=
 course
>>>>> compile-tested only.
>>>>
>>>> Do you want this to be applied thru dma or arm tree?
>>>
>>> hmm, the original series went into the samsung tree for 3.13, so ma=
ybe this
>>> addition should go the same way?
>>>
>> I think so, let me pick this up into Samsung tree for v3.13.
> Okay, sounds good. Ack for dmaengine patch sent
>
Applied with Vinod's ack, thanks.

- Kukjin
