From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH RESEND 3/4] mfd: sec-core: Add cells for S5M8767-clocks
Date: Mon, 6 Jan 2014 11:22:12 +0000
Message-ID: <20140106112212.GP23772@lee--X1>
References: <1383202124-1775-1-git-send-email-tushar.behera@linaro.org>
 <1388053141-30085-1-git-send-email-tushar.behera@linaro.org>
 <1388053141-30085-4-git-send-email-tushar.behera@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f43.google.com ([74.125.82.43]:60835 "EHLO
	mail-wg0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752776AbaAFLWS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 6 Jan 2014 06:22:18 -0500
Received: by mail-wg0-f43.google.com with SMTP id k14so15730032wgh.22
        for <linux-samsung-soc@vger.kernel.org>; Mon, 06 Jan 2014 03:22:17 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1388053141-30085-4-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tushar Behera <tushar.behera@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, mturquette@linaro.org, kgene.kim@samsung.com, patches@linaro.org

On Thu, 26 Dec 2013, Tushar Behera wrote:

> S5M8767 chip has 3 crystal oscillators running at 32KHz. These are
> supported by s2mps11-clk driver.
>=20
> Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
> Reviewed-by: Tomasz Figa <t.figa@samsung.com>
> CC: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/mfd/sec-core.c |    4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Applied, thanks.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
