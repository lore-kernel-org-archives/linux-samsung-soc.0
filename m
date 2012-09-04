From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH] gpio: samsung: Update documentation
Date: Tue, 04 Sep 2012 10:15:25 +0200
Message-ID: <5045B89D.50503@samsung.com>
References: <503D267A.2090406@gmail.com>
 <1346603089-14122-1-git-send-email-sylvester.nawrocki@gmail.com>
 <CACRpkdbudOv9AvS1XuyPB+BZ63+Ymu5dhkBBWFCo2qYDV+jAmw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:33631 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751000Ab2IDIP3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 4 Sep 2012 04:15:29 -0400
Received: from eusync1.samsung.com (mailout3.w1.samsung.com [210.118.77.13])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M9T005M0GAMFM40@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 04 Sep 2012 09:15:58 +0100 (BST)
Received: from [106.116.147.32] by eusync1.samsung.com
 (Oracle Communications Messaging Server 7u4-23.01(7.0.4.23.0) 64bit (built Aug
 10 2011)) with ESMTPA id <0M9T000UKG9QY580@eusync1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 04 Sep 2012 09:15:26 +0100 (BST)
In-reply-to: <CACRpkdbudOv9AvS1XuyPB+BZ63+Ymu5dhkBBWFCo2qYDV+jAmw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On 09/04/2012 09:27 AM, Linus Walleij wrote:
> On Sun, Sep 2, 2012 at 6:24 PM, Sylwester Nawrocki
> <sylvester.nawrocki@gmail.com> wrote:
> 
>> Update Samsung GPIO API documentation to reflect removal of
>> the s3c24xx specific gpio API. While at it, fix some typos.
>>
>> The notes on conversion from s3c2410_* functions to the gpiolib
>> API are left here just in case there is any out of tree code that
>> still needs to be converted.
>>
>> Signed-off-by: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
> 
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> 
> Get the Samsung maintainers to apply this patch since they carry
> the API changes.

Thanks Linus. Kgene, this is the documentation update we talked about
previously. Can you please pick this patch as well ?

--

Regards,
Sylwester
