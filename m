From: jassi brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH 2/7] S3C AUDIO: Rename s3c24xx-pcm driver to generic
	s3c_audio
Date: Thu, 5 Nov 2009 09:13:04 +0900
Message-ID: <1b68c6790911041613m231a77f8t4ba72ad3a2a16b2b@mail.gmail.com>
References: <1257323349-18481-1-git-send-email-jassisinghbrar@gmail.com>
	 <1257323349-18481-2-git-send-email-jassisinghbrar@gmail.com>
	 <20091104110625.GC25044@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pw0-f42.google.com ([209.85.160.42]:41022 "EHLO
	mail-pw0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751915AbZKEAM7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 4 Nov 2009 19:12:59 -0500
Received: by pwj9 with SMTP id 9so3520940pwj.21
        for <linux-samsung-soc@vger.kernel.org>; Wed, 04 Nov 2009 16:13:05 -0800 (PST)
In-Reply-To: <20091104110625.GC25044@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: linux-samsung-soc@vger.kernel.org, Jassi Brar <jassi.brar@samsung.com>

On Wed, Nov 4, 2009 at 8:06 PM, Mark Brown
<broonie@opensource.wolfsonmicro.com> wrote:
> On Wed, Nov 04, 2009 at 05:29:04PM +0900, jassisinghbrar@gmail.com wrote:
>> From: Jassi Brar <jassi.brar@samsung.com>
>>
>> Following the s3c24xx_pcm prefix rename, the driver is also renamed.
>
> This needs to be part of the previous patch, without these changes the
> previous patch will cause the code to fail to build.
The changes in the previous patch(1/7) are all local to s3c24xx-pcm.c
besides I have verified that.
