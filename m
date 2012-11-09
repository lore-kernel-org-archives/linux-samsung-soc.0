From: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Subject: Re: [PATCH] ARM: S3C64XX: Statically define parent clock of the "camera"
 clock
Date: Fri, 09 Nov 2012 11:18:03 +0100
Message-ID: <509CD85B.6010405@gmail.com>
References: <CAA11ShAo_N5iwPmVqE27NMzhpSD6NZORqf7yvjUyZ-+kGkgYog@mail.gmail.com> <1352449929-20168-1-git-send-email-sylvester.nawrocki@gmail.com> <CAA11ShABPJhLP5dvx65=HOzSNoiY+jjiiNPAvd_x_5z7K3meVg@mail.gmail.com> <509CD574.2050909@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bk0-f46.google.com ([209.85.214.46]:57004 "EHLO
	mail-bk0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751235Ab2KIKSH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 9 Nov 2012 05:18:07 -0500
Received: by mail-bk0-f46.google.com with SMTP id jk13so1549896bkc.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 09 Nov 2012 02:18:06 -0800 (PST)
In-Reply-To: <509CD574.2050909@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Cc: Andrey Gusakov <dron0gus@gmail.com>, kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On 11/09/2012 11:05 AM, Sylwester Nawrocki wrote:
> Hi,
>
> On 11/09/2012 10:31 AM, Andrey Gusakov wrote:
>> On Fri, Nov 9, 2012 at 12:32 PM, Sylwester Nawrocki
>> <sylvester.nawrocki@gmail.com> wrote:
>>> The "camera" clock defined in arch/arm/mach-s3c64xx/clock.c has null
>>> clock source mux control register as it can have only one parent
>>> clock. In such cases there is a need to configure the parent clock
>>> statically, otherwise s3c_set_clksrc() bails out with an error message
>>> "no parent clock specified" leaving the parent clock not configured.
>>> Define statically the parent clock so it is possible to get or set
>>> rate of the "camera" clock.
>>> While at it remove the unneded null reg_src definition.
>>>
>>> Reported-by: In-Bae Jeong<kukyakya@gmail.com>
>>> Signed-off-by: Sylwester Nawrocki<sylvester.nawrocki@gmail.com>
>>> ---
>>> arch/arm/mach-s3c64xx/clock.c | 2 +-
>>> 1 files changed, 1 insertions(+), 1 deletions(-)
>>>
>>> diff --git a/arch/arm/mach-s3c64xx/clock.c
>>> b/arch/arm/mach-s3c64xx/clock.c
>>> index 28041e8..2e6d7f9 100644
>>> --- a/arch/arm/mach-s3c64xx/clock.c
>>> +++ b/arch/arm/mach-s3c64xx/clock.c
>>> @@ -744,9 +744,9 @@ static struct clksrc_clk clksrcs[] = {
>>> .name = "camera",
>>> .ctrlbit = S3C_CLKCON_SCLK_CAM,
>>> .enable = s3c64xx_sclk_ctrl,
>>> + .parent =&clk_h2,
>>> },
>>> .reg_div = { .reg = S3C_CLK_DIV0, .shift = 20, .size = 4 },
>>> - .reg_src = { .reg = NULL, .shift = 0, .size = 0 },
>>> .sources =&clkset_camif,
>> Just figure out that .sources can be removed to. And seems
>> "clkset_camif" and "clkset_camif_list" can be removed as unused.
>
> OK, you're right. I think it could be done as a separate patch,
> depending on this one to avoid conflicts.

Or feel free to make a new patch, ignoring this one.

--
Regards,
Sylwester
