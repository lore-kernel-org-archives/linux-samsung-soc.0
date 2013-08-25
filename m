From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH v2 0/8] Common Clock Framework support for Samsung S3C64xx
Date: Mon, 26 Aug 2013 02:19:42 +0900
Message-ID: <521A3CAE.7020903@samsung.com>
References: <1374536965-3545-1-git-send-email-tomasz.figa@gmail.com> <2956608.dyLtqySMuJ@amdc1227> <20130816210203.4443.43511@quantum> <3890424.fJfWX17mED@flatron> <158901ce9b34$c0ac8720$42059560$@org> <20130820002258.4443.34197@quantum> <18f101ce9d74$34e23450$9ea69cf0$@org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f171.google.com ([209.85.192.171]:53932 "EHLO
	mail-pd0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755241Ab3HYRTv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 25 Aug 2013 13:19:51 -0400
In-Reply-To: <18f101ce9d74$34e23450$9ea69cf0$@org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: 'Mike Turquette' <mturquette@linaro.org>, 'Tomasz Figa' <tomasz.figa@gmail.com>, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, =?ISO-8859-1?Q?=27Heiko_St=FCbner=27?= <heiko@sntech.de>, 'Arnd Bergmann' <arnd@arndb.de>, gregkh@linuxfoundation.org, 'Tomasz Figa' <t.figa@samsung.com>, linux-usb@vger.kernel.org, 'Mark Brown' <broonie@kernel.org>, stern@rowland.harvard.edu, 'Olof Johansson' <olof@lixom.net>, 'Thomas Abraham' <thomas.abraham@linaro.org>, 'Sylwester Nawrocki' <sylvester.nawrocki@gmail.com>, linux-arm-kernel@lists.infradead.org

On 08/20/13 16:09, Kukjin Kim wrote:
> Mike Turquette wrote:
>>
>
> [...]
>
>>> OK, if new branch is ready, I will replace with that or if re-merge is
>>> required, I will. Either way, I'm fine and can handle. Mike, let me know
>>> your choice :-)
>>
>> Since I have already published it let's just go with the delta patch.  I
>> can create another stable branch named clk-next-s3c64xx-delta that just
>> has this patch on top of clk-next-s3c64xx OR I can apply it on top of
>> the existing clk-next-s3c64xx and re-merge it.
>>
> Sounds good to me. If the branch for the delta is ready, let me know.
>
Mike, I'm waiting for your delta branch which includes following from 
Tomasz.

[PATCH] clk: samsung: pll: Use new registration method for PLL6552 and 
PLL6553

I couldn't send some branches to arm-soc for upcoming merge window yet 
because of build compilation breakage of common-clk-s3c64xx branch which 
has many dependencies...

- Kukjin

>> I'm trying to think on whether there are any weird git corner cases with
>> re-merging clk-next-s3c64xx. Let me know if re-merging is somehow unsafe
>> (makes history weird, or whatever).
>>
> I don't think it causes some problem.
>
>> Let me know what option is better for you. I'll publish as soon as I get
>> the delta patch. Apologies again for creating some extra work!
>>
> No problem.
