From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH] I2C:SAMSUNG:Select I2C_S3C2410 if HAVE_S3C2410_I2C
Date: Fri, 25 Mar 2011 08:12:06 +0530
Message-ID: <AANLkTinw2uMdoy_ugKjhuVWC=cUMNgy-mv+ezUzPPkke@mail.gmail.com>
References: <1300957573-2622-1-git-send-email-tushar.behera@linaro.org>
	<20110324104751.GS15795@trinity.fluff.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vw0-f46.google.com ([209.85.212.46]:41577 "EHLO
	mail-vw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751212Ab1CYCmI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 24 Mar 2011 22:42:08 -0400
In-Reply-To: <20110324104751.GS15795@trinity.fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ben Dooks <ben-i2c@fluff.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org, kgene.kim@samsung.com, ben-linux@fluff.org

Hi Ben,

On 24 March 2011 16:17, Ben Dooks <ben-i2c@fluff.org> wrote:
> On Thu, Mar 24, 2011 at 02:36:13PM +0530, Tushar Behera wrote:
>> On Samsung Kconfig files, HAVE_S3C2410_I2C is selected if we want
>> to enable support for I2C. But the I2C controller is selected only
>> if I2C_S3C2410 is defined.
>>
>> This patch selects I2C_S3C2410 when I2C and HAVE_S3C2410 are selected.
>
> No. Do not do this, just having the device on the board does not mean
> you want it forced into the kernel. A user may want to build it as a
> module or not build it at-all.
>
Thanks for your comments.
> --
> Ben Dooks, ben@fluff.org, http://www.fluff.org/ben/
>
> Large Hadron Colada: A large Pina Colada that makes the universe disappear.
>
>



-- 
Tushar Behera
