From: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Subject: Re: [PATCH 1/2] i2c-s3c2410: Convert to devm_kzalloc()
Date: Sat, 21 Jan 2012 19:27:32 +0100
Message-ID: <4F1B0394.8050003@gmail.com>
References: <1327152527-11364-1-git-send-email-broonie@opensource.wolfsonmicro.com> <4F1AE36E.3070403@gmail.com> <20120121175714.GD20505@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f46.google.com ([74.125.83.46]:57680 "EHLO
	mail-ee0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750846Ab2AUS1g (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 21 Jan 2012 13:27:36 -0500
In-Reply-To: <20120121175714.GD20505@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, Ben Dooks <ben-linux@fluff.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-i2c@vger.kernel.org

On 01/21/2012 06:57 PM, Mark Brown wrote:
> On Sat, Jan 21, 2012 at 05:10:22PM +0100, Sylwester Nawrocki wrote:
>>> -	i2c = kzalloc(sizeof(struct s3c24xx_i2c), GFP_KERNEL);
>>> +	i2c = devm_kzalloc(&pdev->dev, sizeof(struct s3c24xx_i2c), GFP_KERNEL);
> 
>> Just in case you are resending the patch for any other reason, it might be worth
>> to change to sizeof(*i2c) for consistency.
> 
> Consistency with...?

Consistency with the rest of code in i2c-s3c244.c, all other occurrences
of sizeof take name of a variable, rather than its type.
 
> TBH I'd rather not change the coding style as well as presumably Ben
> likes that the way it is.

If that's Ben's will then let it stay as it is. I don't even dare to propose
any change ;) It's rather a meaningless detail. I personally like more using 
variable's name, and I had a feeling it was preferred style in the kernel.

It's even mentioned in Documentation/CodingStyle:

"The kernel provides the following general purpose memory allocators:
kmalloc(), kzalloc(), kcalloc(), vmalloc(), and vzalloc().  Please refer to
the API documentation for further information about them.

The preferred form for passing a size of a struct is the following:

	p = kmalloc(sizeof(*p), ...);

The alternative form where struct name is spelled out hurts readability and
introduces an opportunity for a bug when the pointer variable type is changed
but the corresponding sizeof that is passed to a memory allocator is not."
