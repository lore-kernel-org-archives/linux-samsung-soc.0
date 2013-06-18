From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH 08/15] pwm: Add new pwm-samsung driver
Date: Wed, 19 Jun 2013 03:06:31 +0900
Message-ID: <51C0A1A7.60309@samsung.com>
References: <1370467100-10820-1-git-send-email-tomasz.figa@gmail.com> <1370467100-10820-9-git-send-email-tomasz.figa@gmail.com> <20130617202910.GB5265@mithrandir> <1430661.RSssKEDPJD@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f46.google.com ([209.85.220.46]:49788 "EHLO
	mail-pa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932812Ab3FRSGg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 18 Jun 2013 14:06:36 -0400
In-Reply-To: <1430661.RSssKEDPJD@flatron>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-pwm@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>, Mark Brown <broonie@kernel.org>, Thomas Abraham <thomas.abraham@linaro.org>

On 06/19/13 02:59, Tomasz Figa wrote:
> Hi Thierry,
>

[...]

>>> +static void pwm_samsung_set_divisor(struct samsung_pwm_chip *pwm,
>>> +					unsigned int channel, u8 divisor)
>>
>> Nit: please align arguments on subsequent lines with the first argument
>> of the first line. There's many more of these but I haven't mentioned
>> them all explicitly.
>
> Hmm, I'm addressing all your comments that aren't addressed yet in v2 at
> the moment and I'm wondering if this is really the correct way of breaking
> function headers...
>

static void pwm_samsung_set_divisor(struct samsung_pwm_chip *pwm,
				    unsigned int channel, u8 divisor)


I also would preferred to use above style :)

- Kukjin

> According to Documentation/CodingStyle:
>
> /* Quotation starts */
> Statements longer than 80 columns will be broken into sensible chunks,
> unless exceeding 80 columns significantly increases readability and does
> not hide information. Descendants are always substantially shorter than
> the parent and are placed substantially to the right. The same applies to
> function headers with a long argument list. However, never break user-
> visible strings such as printk messages, because that breaks the ability
> to grep for them.
> /* Quotation ends */
>
> Do I understand this incorrectly or does the above fragment state that
> broken lines must be aligned to the right?
>
> Best regards,
> Tomasz
