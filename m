From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: Re: [PATCH V2] drm/exynos: enable fimd clocks in probe before
 accessing fimd registers
Date: Thu, 22 May 2014 18:47:21 +0530
Message-ID: <CAPdUM4PbmnKn246hysN9jvmTsD9og00TsYyiY_iLxzL87rdhaw@mail.gmail.com>
References: <1400735767-5905-1-git-send-email-rahul.sharma@samsung.com>
	<CAK9yfHz4DxG-Ey7HieMU9t32arXMDGYn1JXe0g8LNGpNYV6KaQ@mail.gmail.com>
	<CAPdUM4ODvHXQcN=Z2VN6yuWtOX-4Cb2oo89cHC0PO3Kab2UJJA@mail.gmail.com>
	<20140522080345.GA30247@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f180.google.com ([209.85.212.180]:49859 "EHLO
	mail-wi0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752457AbaEVNRW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 22 May 2014 09:17:22 -0400
Received: by mail-wi0-f180.google.com with SMTP id hi2so4327938wib.13
        for <linux-samsung-soc@vger.kernel.org>; Thu, 22 May 2014 06:17:21 -0700 (PDT)
In-Reply-To: <20140522080345.GA30247@ulmo>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Sachin Kamat <sachin.kamat@linaro.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, sunil joshi <joshi@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>

On 22 May 2014 13:33, Thierry Reding <thierry.reding@gmail.com> wrote:
> On Thu, May 22, 2014 at 12:06:16PM +0530, Rahul Sharma wrote:
>> On 22 May 2014 11:51, Sachin Kamat <sachin.kamat@linaro.org> wrote:
>> > Hi Rahul,
>> [snip]
>> >>
>> >> +       clk_prepare_enable(ctx->bus_clk);
>> >
>> > Probably a check for its success?
>> >
>> >> +       clk_prepare_enable(ctx->lcd_clk);
>> >
>>
>> Generally we don't check this in any of the driver. It will be
>> quite unnecessary.
>
> Then those drivers are all buggy. There's a reason why this function
> returns an int rather than void. Just because you've never seen it fail
> doesn't mean it can't.

Okay... I don't mind putting extra checks. V3 is coming :).

Best Regards,
Rahul Sharma

>
> Thierry
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
>
