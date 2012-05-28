From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH V2 0/1] dmaengine/amba-pl08x: Add support for s3c64xx DMAC
Date: Mon, 28 May 2012 12:41:42 +0800
Message-ID: <CACRpkdZO=B9gWkhvgf4Ewi1GKibFxki36uF06ispQzDK7T+4sA@mail.gmail.com>
References: <1317189007-23033-1-git-send-email-alim.akhtar@samsung.com>
	<CACRpkdZC8LOOLkWbrPbXN_nKaw-WvueusYDyrX48Q1Pcdwv3Aw@mail.gmail.com>
	<CAGOxZ52w1nn8g4d_vuNAzjA9qYZ1=yEfihFvSOK+pBz=ZD=J7Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qc0-f174.google.com ([209.85.216.174]:48219 "EHLO
	mail-qc0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751135Ab2E1Eln (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 28 May 2012 00:41:43 -0400
Received: by qcro28 with SMTP id o28so1305109qcr.19
        for <linux-samsung-soc@vger.kernel.org>; Sun, 27 May 2012 21:41:42 -0700 (PDT)
In-Reply-To: <CAGOxZ52w1nn8g4d_vuNAzjA9qYZ1=yEfihFvSOK+pBz=ZD=J7Q@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Alim Akhtar <alim.akhtar@gmail.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, linux-samsung-soc@vger.kernel.org, linux@arm.linux.org.uk, vinod.koul@intel.com, linux-kernel@vger.kernel.org, kgene.kim@samsung.com, dan.j.williams@intel.com, linux-arm-kernel@lists.infradead.org

On Thu, Dec 8, 2011 at 9:03 AM, Alim Akhtar <alim.akhtar@gmail.com> wrote:

> Hello Linus,
> sorry for the delay in submitting V3 of the pl080 patches for s3c64xx.
> I am very busy with my current assignment.
> I will come back to my patch series incorporating yours and Viresh
> suggestions in v3.

Ping on this, is there something in specific that you need help on here?
We really need to get rid of this forked code, and it should be beneficial
to S3C because we have fixed a lot of bugs in the PL08x driver now,
plus it'll likely be a prerequisite to DT support for S3C.

Yours,
Linus Walleij
