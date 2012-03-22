From: Deepak Saxena <dsaxena@linaro.org>
Subject: Re: [PATCH v2 0/5] [SCSI] ufshcd: UFS Host Controller Driver
Date: Wed, 21 Mar 2012 18:47:47 -0700
Message-ID: <CAK2p4sJ4LJGJ6moqrZ9En6SLRsw0k6EbWqJ19dUzN9BRvsz39g@mail.gmail.com>
References: <1330067945-9128-1-git-send-email-santoshsy@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lb0-f174.google.com ([209.85.217.174]:35379 "EHLO
	mail-lb0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753725Ab2CVBrt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 21 Mar 2012 21:47:49 -0400
Received: by lbbgm6 with SMTP id gm6so1373058lbb.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 21 Mar 2012 18:47:48 -0700 (PDT)
In-Reply-To: <1330067945-9128-1-git-send-email-santoshsy@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Santosh Y <santoshsy@gmail.com>
Cc: James.Bottomley@hansenpartnership.com, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, patches@linaro.org, linux-samsung-soc@vger.kernel.org, arnd@linaro.org, girish.shivananjappa@linaro.org, saugata.das@linaro.org, vishak.g@samsung.com, venkat@linaro.org, k.rajesh@samsung.com, yejin.moon@samsung.com, ilho215.lee@samsung.com, nala.la@samsung.com, stephen.doel@linaro.org, sreekumar.c@samsung.com

On 23 February 2012 23:19, Santosh Y <santoshsy@gmail.com> wrote:
> From: Santosh Yaraganavi <santoshsy@gmail.com>
>
> UFS:
> Universal Flash Storage is a storage specification for flash devices.
> It is aimed to provide a universal storage interface for both
> embedded and removable flash memory based storage in mobile
> devices such as smart phones and tablet computers. The specification
> is defined by JEDEC Solid State Technology Association. UFS is based
> on MIPI M-PHY physical layer standard. UFS uses MIPI M-PHY as the
> physical layer and MIPI Unipro as the link layer.

Hi Santosh, James et all,

I've not seen many comments on these patches. It looks like just a few minor
issues that may need to be resolved. It's probably too late to get this into
3.4, but could we get this pulled into scsi tree's for linux-next  branch once
these issue are resolved? Santosh, do you have a new version of the patches
to post with these updates?

Thanks,
~Deepak
