From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: Re: [PATCH V2] drm/exynos: enable fimd clocks in probe before
 accessing fimd registers
Date: Thu, 22 May 2014 12:06:16 +0530
Message-ID: <CAPdUM4ODvHXQcN=Z2VN6yuWtOX-4Cb2oo89cHC0PO3Kab2UJJA@mail.gmail.com>
References: <1400735767-5905-1-git-send-email-rahul.sharma@samsung.com>
	<CAK9yfHz4DxG-Ey7HieMU9t32arXMDGYn1JXe0g8LNGpNYV6KaQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f175.google.com ([209.85.212.175]:40500 "EHLO
	mail-wi0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750741AbaEVGgR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 22 May 2014 02:36:17 -0400
Received: by mail-wi0-f175.google.com with SMTP id f8so8735202wiw.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 21 May 2014 23:36:16 -0700 (PDT)
In-Reply-To: <CAK9yfHz4DxG-Ey7HieMU9t32arXMDGYn1JXe0g8LNGpNYV6KaQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Inki Dae <inki.dae@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, sunil joshi <joshi@samsung.com>

On 22 May 2014 11:51, Sachin Kamat <sachin.kamat@linaro.org> wrote:
> Hi Rahul,
[snip]
>>
>> +       clk_prepare_enable(ctx->bus_clk);
>
> Probably a check for its success?
>
>> +       clk_prepare_enable(ctx->lcd_clk);
>

Generally we don't check this in any of the driver. It will be
quite unnecessary.

Regards,
Rahul Sharma

> ditto.
>
> --
> With warm regards,
> Sachin
