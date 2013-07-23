From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v2 6/8] usb: host: ohci-s3c2410 Use clk_prepare_enable/clk_disable_unprepare
Date: Mon, 22 Jul 2013 21:15:12 -0300
Message-ID: <CAOMZO5D4X+GT+LdUOjorJ8xgBCwv9iAP4W-RzKrbnE-93kxmUg@mail.gmail.com>
References: <1374536965-3545-1-git-send-email-tomasz.figa@gmail.com>
	<1374536965-3545-7-git-send-email-tomasz.figa@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ve0-f181.google.com ([209.85.128.181]:62901 "EHLO
	mail-ve0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751589Ab3GWAPN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 22 Jul 2013 20:15:13 -0400
In-Reply-To: <1374536965-3545-7-git-send-email-tomasz.figa@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Mark Brown <broonie@kernel.org>, Mike Turquette <mturquette@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, stern@rowland.harvard.edu, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, Thomas Abraham <thomas.abraham@linaro.org>

On Mon, Jul 22, 2013 at 8:49 PM, Tomasz Figa <tomasz.figa@gmail.com> wrote:

>         dev_dbg(&dev->dev, "s3c2410_start_hc:\n");
>
> -       clk_enable(usb_clk);
> +       clk_prepare_enable(usb_clk);

 clk_prepare_enable may fail, so you would better check its return value.
