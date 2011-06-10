From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [alsa-devel] [PATCH 3/4] ASoC: SAMSUNG: Change platform driver
 for SMDKs
Date: Fri, 10 Jun 2011 15:42:27 +0530
Message-ID: <BANLkTinCKbPC0gTO5FJXn96wLMEUdZ+R3Q@mail.gmail.com>
References: <1307606950-8310-1-git-send-email-sbkim73@samsung.com>
	<1307606950-8310-4-git-send-email-sbkim73@samsung.com>
	<BANLkTinUk6CRdh8mYAk7fbd9Ga6iBRfcaA@mail.gmail.com>
	<000a01cc273e$49dc4610$dd94d230$@com>
	<BANLkTikswO-5LOreJq=OXutya_CzYUkh1g@mail.gmail.com>
	<20110610094920.GC26436@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:37899 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753332Ab1FJKM3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 10 Jun 2011 06:12:29 -0400
Received: by bwz15 with SMTP id 15so2053184bwz.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 10 Jun 2011 03:12:28 -0700 (PDT)
In-Reply-To: <20110610094920.GC26436@opensource.wolfsonmicro.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Sangbeom Kim <sbkim73@samsung.com>, alsa-devel@alsa-project.org, kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, lrg@slimlogic.co.uk

On Fri, Jun 10, 2011 at 3:19 PM, Mark Brown
<broonie@opensource.wolfsonmicro.com> wrote:
> On Fri, Jun 10, 2011 at 12:56:45PM +0530, Jassi Brar wrote:
>> On Fri, Jun 10, 2011 at 12:46 PM, Sangbeom Kim <sbkim73@samsung.com> wrote:
>
>> > I only focused on S5PV210 and S5PV310.
>> > I didn't consider s3c and s5p series.
>> > In the next version, I will delete it.
>
>> Though if then everything works fine with system and internal DMA,
>> maybe it is better to assign platform_name string at runtime from some
>> module parameter, and leaving the default to normal system DMA ?
>
> If iDMA is always a better choice on CPUs that support it then the
> cpu_is_() macros might be a good way to make the selection?

Actually I remembered just after I posted - iDMA wouldn't support capture.
So iDMA is a bad choice after all.
