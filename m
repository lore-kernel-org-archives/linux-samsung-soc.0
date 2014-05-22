From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH V2] drm/exynos: enable fimd clocks in probe before
 accessing fimd registers
Date: Thu, 22 May 2014 12:31:28 +0530
Message-ID: <CAK9yfHzeXjOUZhbD4db5FoNnTf6262D3T07ZsAcwupACzWcksw@mail.gmail.com>
References: <1400735767-5905-1-git-send-email-rahul.sharma@samsung.com>
	<CAK9yfHz4DxG-Ey7HieMU9t32arXMDGYn1JXe0g8LNGpNYV6KaQ@mail.gmail.com>
	<CAPdUM4ODvHXQcN=Z2VN6yuWtOX-4Cb2oo89cHC0PO3Kab2UJJA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f45.google.com ([209.85.219.45]:58579 "EHLO
	mail-oa0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753146AbaEVHB3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 22 May 2014 03:01:29 -0400
Received: by mail-oa0-f45.google.com with SMTP id l6so3494697oag.4
        for <linux-samsung-soc@vger.kernel.org>; Thu, 22 May 2014 00:01:29 -0700 (PDT)
In-Reply-To: <CAPdUM4ODvHXQcN=Z2VN6yuWtOX-4Cb2oo89cHC0PO3Kab2UJJA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rahul Sharma <rahul.sharma@samsung.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Inki Dae <inki.dae@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, sunil joshi <joshi@samsung.com>

On 22 May 2014 12:06, Rahul Sharma <rahul.sharma@samsung.com> wrote:
> On 22 May 2014 11:51, Sachin Kamat <sachin.kamat@linaro.org> wrote:
>> Hi Rahul,
> [snip]
>>>
>>> +       clk_prepare_enable(ctx->bus_clk);
>>
>> Probably a check for its success?
>>
>>> +       clk_prepare_enable(ctx->lcd_clk);
>>
>
> Generally we don't check this in any of the driver. It will be
> quite unnecessary.

However in your case, since you mentioned if the clock is not enabled, it
will hang the system when fimd probe tries to read the register, this check
would ensure it doesn't happen (hang) even if clk_prepare_enable fails for
whatever reasons.

-- 
With warm regards,
Sachin
