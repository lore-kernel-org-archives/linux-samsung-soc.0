From: Chander Kashyap <chander.kashyap@linaro.org>
Subject: Re: [RFC PATCH 2/3] clk: update users of "clk_register_mux" and "DEFINE_CLK_MUX"
Date: Thu, 22 Aug 2013 13:25:21 +0530
Message-ID: <CANuQgHE5XhHP4hgwkn+_2zdUYRGEofsyek3juj+HJk5FRMBGcw@mail.gmail.com>
References: <1375778065-21808-1-git-send-email-chander.kashyap@linaro.org>
	<1375778065-21808-3-git-send-email-chander.kashyap@linaro.org>
	<20130822061930.8231.89917@quantum>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f46.google.com ([209.85.219.46]:53700 "EHLO
	mail-oa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753843Ab3HVHzW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 22 Aug 2013 03:55:22 -0400
Received: by mail-oa0-f46.google.com with SMTP id j10so2801417oah.5
        for <linux-samsung-soc@vger.kernel.org>; Thu, 22 Aug 2013 00:55:22 -0700 (PDT)
In-Reply-To: <20130822061930.8231.89917@quantum>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mike Turquette <mturquette@linaro.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Thomas Abraham <thomas.abraham@linaro.org>

On 22 August 2013 11:49, Mike Turquette <mturquette@linaro.org> wrote:
> Quoting Chander Kashyap (2013-08-06 01:34:24)
>> As with the patch "clk-add-support-for-temporary-parent-clock-migration.patch"
>> a new field "alternate_parent_name", is added to clk structure. This field can
>> be passed using clk_register_mux API and DEFINE_CLK_MUX macro.
>
> Nitpick: it's easier to search for the patch you mentioned if you quote
> the actual patch $SUBJECT instead of the name of the patch file. In this
> case, "clk: add support for temporary parent clock migration".
>

thanks for the suggestion.

> This invasive change is not necessary if the temporary parent stuff is
> not added to the clock core and is instead left to the .set_parent
> callbacks of custom clock providers.
>

Yes if we decide not to add new flag.

> Regards,
> Mike



-- 
with warm regards,
Chander Kashyap
