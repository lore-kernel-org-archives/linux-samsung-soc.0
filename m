From: Alim Akhtar <alim.akhtar@gmail.com>
Subject: Re: [PATCH V2 0/1] dmaengine/amba-pl08x: Add support for s3c64xx DMAC
Date: Thu, 8 Dec 2011 10:03:38 +0900
Message-ID: <CAGOxZ52w1nn8g4d_vuNAzjA9qYZ1=yEfihFvSOK+pBz=ZD=J7Q@mail.gmail.com>
References: <1317189007-23033-1-git-send-email-alim.akhtar@samsung.com> <CACRpkdZC8LOOLkWbrPbXN_nKaw-WvueusYDyrX48Q1Pcdwv3Aw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-gy0-f174.google.com ([209.85.160.174]:51141 "EHLO
	mail-gy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757238Ab1LHBEV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 7 Dec 2011 20:04:21 -0500
In-Reply-To: <CACRpkdZC8LOOLkWbrPbXN_nKaw-WvueusYDyrX48Q1Pcdwv3Aw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, linux-samsung-soc@vger.kernel.org, linux@arm.linux.org.uk, vinod.koul@intel.com, linux-kernel@vger.kernel.org, kgene.kim@samsung.com, dan.j.williams@intel.com, linux-arm-kernel@lists.infradead.org

Hello Linus,
sorry for the delay in submitting V3 of the pl080 patches for s3c64xx.
I am very busy with my current assignment.
I will come back to my patch series incorporating yours and Viresh
suggestions in v3.

Thanks!!

Regards,
Alim

On Thu, Dec 8, 2011 at 8:43 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Wed, Sep 28, 2011 at 7:50 AM, Alim Akhtar <alim.akhtar@samsung.com> wrote:
>
>> This patch modifies the amba-pl08x driver for s3c64xx.
>> The DMA controller of S3C64XX is a variant of PrimeCell pl080 DMAC.
>> S3C64xx contents extra register to hold the TransferSize.
>
> Alim what is happening with this patch series?
>
> I was really happy with the rate of progress we had and Viresh & I
> have given most feedback needed to complete this I think.
>
> Yours,
> Linus Walleij
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel



-- 
aLim akHtaR
mAin hUn nA :-)
