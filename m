From: "Steinar H. Gunderson" <sgunderson@bigfoot.com>
Subject: Re: Endless "supply vcc not found, using dummy regulator"
Date: Tue, 24 May 2016 18:44:30 +0200
Message-ID: <20160524164430.GA28115@sesse.net>
References: <20160521144308.GA13960@sesse.net>
 <20160523134737.GA21683@sesse.net>
 <20160523144047.GA36908@sesse.net>
 <20160523162455.GW8206@sirena.org.uk>
 <20160523170617.GA8997@sesse.net>
 <CAJKOXPds5PgVmcYLEOriyL-a6tp0jkg7x0GTjPZaN9YLL_gO_A@mail.gmail.com>
 <20160524152638.GA20341@sesse.net>
 <574478FE.4070800@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassarossa.samfundet.no ([193.35.52.29]:39589 "EHLO
	cassarossa.samfundet.no" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756053AbcEXQok (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 24 May 2016 12:44:40 -0400
Content-Disposition: inline
In-Reply-To: <574478FE.4070800@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Mark Brown <broonie@debian.org>, linux-samsung-soc@vger.kernel.org, 823552@bugs.debian.org

On Tue, May 24, 2016 at 05:53:34PM +0200, Krzysztof Kozlowski wrote:
>> Which devm_clk_get() error are you talking about? The one with susp_clk?
> Now I saw your original report on Debian bugzilla. Let's stick to v4.5.

I'm actually developing on 4.6, but sure. The differences are small from what
I can see.

>         exynos->clk = devm_clk_get(dev, "usbdrd30");
>         if (IS_ERR(exynos->clk)) {
> +		// On each error path since here we need to
> +		// revert work done by dwc3_exynos_register_phys()
>                 dev_err(dev, "couldn't get clock\n");
>                 return -EINVAL;
>         }
>         clk_prepare_enable(exynos->clk);

OK, sounds like these should be changed to the common goto pattern to save on
the repeated cleanup. I'll have a stab at that later today.

>> That's an interesting case because a) nothing actually uses susp_clk
>> (it's dead code, presumably waiting for further patches),
> It does not look like dead code because it is enabled.

But not a single DT seems to set such a suspend clock, from what I can see?

> Yeah, but you did not send it to appropriate people. get_maintainer.pl
> will point you (Felipe Balbi handles the patches for this driver).

Ack.

> Apparently the s2mps11 regulator driver can be built as module... but is
> not a commonly tested configuration. In our testing configs (exynos and
> multi_v7) it is built-in. Actually most of PMICs are built in.

I don't have a lot of control over how Debian chooses to build kernels --
from what I gather from previous conversations, the kernel team are unhappy
about building things into the kernel if they can be modules. And in this
case, it wasn't even about the s2mps11 module, it was just that it didn't
have an I2C bus ready for init.

/* Steinar */
-- 
Homepage: https://www.sesse.net/
