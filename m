From: Padma Venkat <padma.kvr@gmail.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: samsung: i2s: Add missing assignment
 of variant_regs
Date: Tue, 9 Dec 2014 08:53:34 +0530
Message-ID: <CAAgF-BfGXi6PZQxGEUdXjTh-NBzj2T2SmZ=2oBOXV2XUYEGrQw@mail.gmail.com>
References: <1418060754-7064-1-git-send-email-s.nawrocki@samsung.com>
	<20141208204711.GF11764@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yh0-f47.google.com ([209.85.213.47]:52940 "EHLO
	mail-yh0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755069AbaLIDXf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 8 Dec 2014 22:23:35 -0500
Received: by mail-yh0-f47.google.com with SMTP id f73so2917498yha.34
        for <linux-samsung-soc@vger.kernel.org>; Mon, 08 Dec 2014 19:23:35 -0800 (PST)
In-Reply-To: <20141208204711.GF11764@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, sbkim73@samsung.com, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org, drake@endlessm.com, padma.v@samsung.com

Hi,

On 12/9/14, Mark Brown <broonie@kernel.org> wrote:
> On Mon, Dec 08, 2014 at 06:45:54PM +0100, Sylwester Nawrocki wrote:
>
>> Add assignment of the variant_regs field which is missing in commit
>> a5a56871f804edac93a53b5e871c0e9818fb9033 ("ASoC: samsung: add support
>> for exynos7 I2S controller"). Without this attempting to probe the
>> secondary DAI fails with an error like:
>
> Applied, thanks.  Broader testing of changes before sending them
> upstream would be good...
>

I am really sorry for introducing so many crashes in the driver. Next
time will take care of testing all possible cases.

Thanks for the support
Padma
