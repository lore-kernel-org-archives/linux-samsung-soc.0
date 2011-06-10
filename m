From: Sangbeom Kim <sbkim73@samsung.com>
Subject: RE: [alsa-devel] [PATCH 3/4] ASoC: SAMSUNG: Change platform driver	for
 SMDKs
Date: Fri, 10 Jun 2011 16:16:16 +0900
Message-ID: <000a01cc273e$49dc4610$dd94d230$@com>
References: <1307606950-8310-1-git-send-email-sbkim73@samsung.com>
 <1307606950-8310-4-git-send-email-sbkim73@samsung.com>
 <BANLkTinUk6CRdh8mYAk7fbd9Ga6iBRfcaA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:21149 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752106Ab1FJHQR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 10 Jun 2011 03:16:17 -0400
Received: from epcpsbgm2.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LMK00CYYC6DRKL0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 10 Jun 2011 16:16:16 +0900 (KST)
Received: from DOSBKIM7301 (unknown [12.23.119.77])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LMK0073BC73BL30@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Fri, 10 Jun 2011 16:16:15 +0900 (KST)
In-reply-to: <BANLkTinUk6CRdh8mYAk7fbd9Ga6iBRfcaA@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Jassi Brar' <jassisinghbrar@gmail.com>
Cc: alsa-devel@alsa-project.org, kgene.kim@samsung.com, broonie@opensource.wolfsonmicro.com, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, lrg@slimlogic.co.uk

On Thu, Jun 9, 2011 at 4:04 PM, Jassi Brar wrote:
> NAK.
> It will break the most common user - SMDK6410, as s3c6410 doesn't have any
> I2S internal DMA.
> Please try to test the changes before submitting. I know it's boring,
> but it's even more important :)
> 
> Thanks

I only focused on S5PV210 and S5PV310.
I didn't consider s3c and s5p series.
In the next version, I will delete it.
But I had found some problem and want to share.
Like this patch, If different platform driver is used for each channel,
1st channel is overwritten by platform driver of 2nd channel.
Have you ever experienced before like this problem?

Thanks, 
SB Kim
